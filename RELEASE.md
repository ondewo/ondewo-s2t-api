# Release History

*****************

## Release ONDEWO S2T API 7.6.0

### New Features

* [[OND236-120]](https://ondewo.atlassian.net/browse/OND236-120) `TurnDetectionOptions.oneof_turn_detector` chooses
  the turn detector explicitly, each with only the options it reads:
  `turn_detection_chat_llm_options` (`TurnDetectionChatLlmOptions`: `openai_llm_options`, `system_prompt`,
  `user_prompt`), `turn_detection_end_of_utterance_llm_options` (`TurnDetectionEndOfUtteranceLlmOptions`, e.g.
  `livekit/turn-detector`: `openai_llm_options`, `end_of_turn_probability_threshold` (0 - 1),
  `turn_detection_hold_bands` (`TurnDetectionHoldBands`), `uncertain_min_words`, `exact_probability`),
  `turn_detection_ondewo_de_options` (`TurnDetectionOndewoDeOptions`: the ONDEWO German turn-detection model on
  vLLM, e.g. `ondewo-s2t-model-de-vad-tsd-ondewo-qwen3-0.6b`, formerly
  `ondewo-s2t-model-de-turn-detection-qwen3-0.6b-lf2-ps`), `turn_detection_ondewo_de_fusion_options`
  (`TurnDetectionOndewoDeFusionOptions`: the ONDEWO German fusion turn detector, `openai_llm_options` and
  `end_of_turn_probability_threshold`) and `turn_detection_pipecat_smart_turn_options`
  (`TurnDetectionPipecatSmartTurnOptions`: pipecat Smart Turn v3.2 on Triton, `model_name`, `triton_server_host`,
  `triton_server_port`, `max_audio_seconds` (1 - 8), `timeout_seconds`). Every option falls back to the pipeline
  config's value, then to the server's configured value; a request config that chooses a different detector than
  the pipeline config uses only its own detector's options.
* [[OND236-120]](https://ondewo.atlassian.net/browse/OND236-120) `TurnDetectionOptions.incomplete_max_silence_seconds`
  (0 - 4): seconds of silence after an utterance judged not finished before it is finished anyway, for every
  detector.
* [[OND236-120]](https://ondewo.atlassian.net/browse/OND236-120)
  `TurnDetectionOptions.turn_detection_conversation_context` (`TurnDetectionConversationContext` of
  `turn_detection_context_turns` with `ROLE_USER` / `ROLE_ASSISTANT`): the latest turns before the caller's
  utterance, handed to the end-of-utterance LLM so it can judge the utterance against what was said before (e.g. a
  bare number answering a question for a number). The assistant turns carry what the caller HEARD. The server keeps
  the context per stream: a request carrying it replaces it, an empty wrapper clears it, a request without it keeps
  it. Honoured in a request config only, not in a pipeline config.
* [[OND236-120]](https://ondewo.atlassian.net/browse/OND236-120) Per-stream processing chunk:
  `UtteranceDetectionOptions.min_audio_chunk_size` (samples at the pipeline's sampling rate, 320 - 32000) overrides
  the pipeline's `StreamingSpeechRecognition.min_audio_chunk_size` for one stream. The chunk is the cadence at which
  the voice-activity search, the sliding transcription and the turn detector run, i.e. at which an utterance can end
  (parakeet general: 8000 = 0.5 s). Read from the first request of a stream that carries it.
* [[OND236-120]](https://ondewo.atlassian.net/browse/OND236-120) Per-request partial-transcription period:
  `UtteranceDetectionOptions.transcribe_not_final_period_seconds` (seconds, (0, 5]) is the minimum new audio
  between two non-final transcriptions of an utterance, for streaming and non-streaming requests. It overrides the
  pipeline's new `StreamingSpeechRecognition.transcribe_not_final_period_seconds`, which in turn overrides the
  server setting `ONDEWO_S2T_INFERENCE_SLIDING_PERIOD_OF_TRANSCRIPT`. The effective cadence is rounded up to whole
  `min_audio_chunk_size` chunks.
* [[OND236-120]](https://ondewo.atlassian.net/browse/OND236-120) The pipeline-level
  `StreamingSpeechRecognition.transcribe_not_final` is now `optional bool` (same field number 1, wire-compatible), so
  a pipeline config can carry an explicit `false`. On both `transcribe_not_final` fields (the request-level
  `UtteranceDetectionOptions.transcribe_not_final` and the pipeline field) unset means the server default, which is
  now `true` (non-final results on); an explicit `false` opts out.
* [[OND236-120]](https://ondewo.atlassian.net/browse/OND236-120) End-of-speech candidate on a stream:
  `TranscribeStreamResponse.end_of_speech_candidate` marks the chunk where the server found the end of the caller's
  speech and its turn detector held the utterance open (not finished, an uncertain hold band, or the minimum
  endpointing delay), so a client can start work speculatively before the final. Only under server-side turn
  detection; never on a final, never when the detector judges the turn finished at once; at most once per pause,
  re-armed when the caller resumes speaking. With non-final results on it is a flag on that chunk's partial, without
  them one non-final response carrying the current text. A hint, not a commit: the final still follows (or the
  utterance continues) and may differ. Opt in with `TranscriptionReturnOptions.return_end_of_speech_candidate`,
  fixed per stream like `return_start_of_speech` (a mid-stream `return_options` block must repeat it).

### Bug Fixes

* [[OND211-2443]](https://ondewo.atlassian.net/browse/OND211-2443) The release tooling no longer puts the GitHub
  token on a process command line (world-readable `/proc/<pid>/cmdline`): `gh` reads it from stdin, `docker run`
  forwards `GITHUB_GH_TOKEN` by name, and the devops hand-off passes it in the sub-make's environment.
* The release notes generated into each client's `RELEASE.md` are markdownlint-clean and end in exactly one
  newline, so a client release no longer fails its first pre-commit run on rewritten notes.

### Backwards Compatibility

Every new field is `optional`; unset reproduces the 7.5.0 behaviour exactly (the utterance is judged alone, with the
server's configured decision values). A 7.5.0 client never sends them.
`TurnDetectionOptions.turn_detection_system_prompt`, `turn_detection_user_prompt` and
`turn_detection_llm_openai_options` are deprecated but still honoured: when `oneof_turn_detector` is not set they
choose the detector by the name in `turn_detection_llm_openai_options.model`, as before, with the server's
configured values for every detector-specific option. Field numbers 6 - 12 of `TurnDetectionOptions` were
used by never-released 7.6.0 pre-release fields with other meanings and are reused here; a server or client built
from such a pre-release must be rebuilt against this release. Making the pipeline
`transcribe_not_final` `optional` does not change the wire format; a server built against 7.6.0 treats an unset
value as its default (now `true`), so a client that wants finals only must send an explicit `false`.
`return_end_of_speech_candidate` defaults to `false`, so a client that does not opt in never receives a response
with `end_of_speech_candidate` set.

*****************

## Release ONDEWO S2T API 7.5.0

### New Features

* [[OND231-624]](https://ondewo.atlassian.net/browse/OND231-624) Add `Silero` and `WespeakerTsd`
  configuration messages to `VoiceActivityDetection`, alongside `Pyannote`, so Silero voice
  activity detection and WeSpeaker target-speaker detection pipelines can be configured the
  same way Pyannote pipelines already are.
* [[OND231-624]](https://ondewo.atlassian.net/browse/OND231-624) Add the `VadMethod` and
  `TsdMethod` enums together with the `VoiceActivityDetection.vad_method` and
  `VoiceActivityDetection.tsd_method` fields, which select the voice activity detection model
  (Pyannote or Silero) and the target-speaker detection model (Pyannote, WeSpeaker, or none)
  explicitly.

### Backwards Compatibility

Existing configurations keep working untouched. Both new fields default to `*_UNSPECIFIED`, which
reproduces the previous behaviour: the VAD falls back to the `VoiceActivityDetection.active`
string, and target-speaker detection falls back to Pyannote whenever Pyannote is the active VAD,
otherwise to WeSpeaker when `wespeaker_tsd.active` is set, otherwise to none. `active` is
deprecated in favour of `vad_method` but is still read whenever `vad_method` is unset.

*****************

## Release ONDEWO S2T API 7.4.0

### New Features

* [[OND231-606]](https://ondewo.atlassian.net/browse/OND231-606) Add Parakeet model to the configurations.

*****************

## Release ONDEWO S2T API 7.3.0

### New Features

* [[OND231-604]](https://ondewo.atlassian.net/browse/OND231-604) Add missing prompt field for
  S2tLlmPostProcessingTranslationOptions and S2tLlmPostProcessingSummarizationOptions

*****************

## Release ONDEWO S2T API 7.2.0

### New Features

* [[OND231-604]](https://ondewo.atlassian.net/browse/OND231-604) Add OpenAI LLM configs as a separated message to
  have full access of LLM configurations.

*****************

## Release ONDEWO S2T API 7.1.0

### New Features

* [[OND231-604]](https://ondewo.atlassian.net/browse/OND231-604) Add `llm_model_name` and `llm_headers` fields to
  configs to support vllm hosted models

*****************

## Release ONDEWO S2T API 7.0.0

### New Features

* [[OND231-592]](https://ondewo.atlassian.net/browse/OND231-592) Add configs for LLM post-processor and list of
  normalizer pipelines.

### Breaking Changes

* [[OND231-592]](https://ondewo.atlassian.net/browse/OND231-592) Changing
  `S2TGetServiceInfoResponse` -> `S2tGetServiceInfoResponse`, `S2TDescription` -> `S2tDescription` and
  `S2TInference` -> `S2tInference`.

*****************

## Release ONDEWO S2T API 6.2.0

### New Features

* [[OND231-586]](https://ondewo.atlassian.net/browse/OND231-586) Add configs for turn-detection.

*****************

## Release ONDEWO S2T API 6.1.0

### New Features

* [[OND231-564]](https://ondewo.atlassian.net/browse/OND231-564) Add cloud services to `InferenceBackend` enum.

*****************

## Release ONDEWO S2T API 6.0.0

### New Features

* [[OND231-563]](https://ondewo.atlassian.net/browse/OND231-563) Added configurations for using s2t cloud service
  providers amazon, google, microsoft and deepgram as ondewo-s2t models.

*****************

## Release ONDEWO S2T API 5.7.0

### Improvements

* [[OND231-452]](https://ondewo.atlassian.net/browse/OND231-452) Improve normalization by adding a pipeline of
  normalization steps.

*****************

## Release ONDEWO S2T API 5.6.0

### Improvements

* [[OND231-469]](https://ondewo.atlassian.net/browse/OND231-469) Removed `start_of_utterance_threshold` and
  `end_of_utterance_threshold` from `StreamingSpeechRecognition` and `UtteranceDetectionOptions`

*****************

## Release ONDEWO S2T API 5.5.0

### Improvements

* [[OND231-500]](https://ondewo.atlassian.net/browse/OND231-500) Update `TranscriptionRequestConfig`, Whisper and
  `WhisperTriton` messages to get `language` and `task` of S2T model.

### Breaking Changes

* [[OND231-500]](https://ondewo.atlassian.net/browse/OND231-500) `Matchbox`, `Quartznet` and `QuartznetTriton` models
  are deprecated and removed from API.

*****************

## Release ONDEWO S2T API 5.4.0

### Improvements

* [[OND231-418]](https://ondewo.atlassian.net/browse/OND231-418) Update `Transcription` message to support
  alternative transcriptions and words, based on the Google speech-to-text output format.

*****************

## Release ONDEWO S2T API 5.3.0

### Improvements

* [[OND231-390]](https://ondewo.atlassian.net/browse/OND231-390) Add transcription alternative numbers and
  `InferenceBackend` config
* Improvement of the documentation

### Breaking Changes

* Grpc message sorting order of `TranscriptionReturnOptions` have changed to be more intuitive

*****************

## Release ONDEWO S2T API 5.2.0

### Breaking Changes

* [[OND231-390]](https://ondewo.atlassian.net/browse/OND231-390) Removing architecture parameter from config

*****************

## Release ONDEWO S2T API 5.1.0

### Breaking Changes

* [[OND231-390]](https://ondewo.atlassian.net/browse/OND231-390) Removing architecture parameter from config

*****************

## Release ONDEWO S2T API 5.0.0

### New Features

* [[OND231-389]](https://ondewo.atlassian.net/browse/OND231-389) - Add `Whisper` and `WhisperTriton`
* [[OND231-390]](https://ondewo.atlassian.net/browse/OND231-390) - Generalize `Decoders` for adding Seq2Seq models

### Breaking Changes

* [[OND231-390]](https://ondewo.atlassian.net/browse/OND231-390) `CTCDecoders` are now named `Decoders` only

*****************

## Release ONDEWO S2T API 4.0.0

### New Features

* Synchronize API Client Versions

*****************

## Release ONDEWO S2T API 3.3.0

### New Features

* [[OND211-2039]](https://ondewo.atlassian.net/browse/OND211-2039) - Refactor Automatic Release
* Added Endpoints for User Creation Language Models

*****************

## Release ONDEWO S2T API 3.2.0

### New Features

* [[OND211-2039]](https://ondewo.atlassian.net/browse/OND211-2039) - Automated Release Process

*****************

## Release ONDEWO S2T API 3.1.1

### New Features

* Add `bool registered_only` option in `ListS2tPipelinesRequest`.

*****************

## Release ONDEWO S2T API 3.1.0

### New Features

* [[OND231-338]](https://ondewo.atlassian.net/browse/OND231-338) - Add `mute_audio` field in `TranscribeStreamRequest`.

*****************

## Release ONDEWO S2T API 3.0.0

### Breaking Changes

* [[OND231-334]](https://ondewo.atlassian.net/browse/OND231-338) - Rename `Description`, `GetServiceInfoResponse`,
`Inference` and `Normalization` messages to include S2T

*****************

## Release ONDEWO S2T API 2.0.0

### Breaking Changes

* [[OND231-271]](https://ondewo.atlassian.net/browse/OND231-271) - Implement configuration messages for
  `TranscribeFileRequest` and `TranscribeStreamRequest` to the speech-to-text server.

*****************

## Release ONDEWO S2T API 0.2.2

### Improvements

Updated README.

*****************

## Release ONDEWO S2T API 0.2.1

### Bug Fixes

Updated licenses.

*****************

## Release ONDEWO S2T API 0.2.0

### New Features

Move to GitHub!

### Improvements

No longer closed source.

### Bug Fixes

### Breaking Changes

### Known issues not covered in this release

### Migration Guide

[Replace submodule](https://stackoverflow.com/a/1260982/7756727) in the client.

*****************

## Release ONDEWO APIS 0.1.0

### New Features

Refactored individual project APIs into seperate repos.

### Improvements

Easier to develop independently.

### Bug Fixes

### Breaking Changes

### Known issues not covered in this release

Harder to install apis under one heading-- this will be addressed at a later date.

### Migration Guide

[Replace submodule](https://stackoverflow.com/a/1260982/7756727) in the client.

*****************
