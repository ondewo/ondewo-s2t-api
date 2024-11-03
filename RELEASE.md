# Release History

*****************

## Release ONDEWO S2T API 6.0.0

### Improvement

* [[OND231-563]](https://ondewo.atlassian.net/browse/OND231-563) Added cloud providers

*****************

## Release ONDEWO S2T API 5.7.0

### Improvement

* [[OND231-452]](https://ondewo.atlassian.net/browse/OND231-452) Improve normalization by adding a pipeline of normalization steps.

*****************

## Release ONDEWO S2T API 5.6.0

### Improvement

* [[OND231-469]](https://ondewo.atlassian.net/browse/OND231-469) Removed start_of_utterance_threshold and
  end_of_utterance_threshold from StreamingSpeechRecognition and UtteranceDetectionOptions

*****************

## Release ONDEWO S2T API 5.5.0

### Improvement

* [[OND231-500]](https://ondewo.atlassian.net/browse/OND231-500) Update TranscriptionRequestConfig, Whisper and
  WhisperTriton messages to get language and task of S2T model.

### Breaking Changes

* [[OND231-500]](https://ondewo.atlassian.net/browse/OND231-500) Matchbox, Quartznet and QuartznetTriton models are
  deprecated and removed from API.

*****************

## Release ONDEWO S2T API 5.4.0

### Improvement

* [[OND231-418]](https://ondewo.atlassian.net/browse/OND231-418) Update Transcription message to support
  alternative transcriptions and words, based on the Google speech-to-text output format.

*****************

## Release ONDEWO S2T API 5.3.0

### Improvement

* [[OND231-390]](https://ondewo.atlassian.net/browse/OND231-390) Add transcription alternative numbers and
  InferenceBackend config
* Improvement of the documentation

### Breaking Changes

* Grpc message sorting order of TranscriptionReturnOptions have changed to be more intuitive

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

* [[OND231-389]](https://ondewo.atlassian.net/browse/OND231-389) - Add Whisper and WhisperTriton
* [[OND231-390]](https://ondewo.atlassian.net/browse/OND231-390) - Generalize Decoders for adding Seq2Seq models

### Breaking Changes

* [[OND231-390]](https://ondewo.atlassian.net/browse/OND231-390) CTCDecoders are now named Decoders only

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

* Add `bool registered_only` option in ListS2tPipelinesRequest.

*****************

## Release ONDEWO S2T API 3.1.0

### New Features

* [[OND231-338]](https://ondewo.atlassian.net/browse/OND231-338) - Add mute_audio field in TranscribeStreamRequest.

*****************

## Release ONDEWO S2T API 3.0.0

### Breaking Changes

* [[OND231-334]](https://ondewo.atlassian.net/browse/OND231-338) - Rename Description, GetServiceInfoResponse, Inference
  and Normalization messages to include S2T

*****************

## Release ONDEWO S2T API 2.0.0

### Breaking Changes

* [[OND231-271]](https://ondewo.atlassian.net/browse/OND231-271) - Implement configuration messages for
  TranscribeFileRequest and TranscribeStreamRequest to the speech-to-text server.

*****************

## Release ONDEWO S2T API 0.2.2

### Improvements

Updated README.

*****************

## Release ONDEWO S2T API 0.2.1

### Bug fixes

Updated licenses.

*****************

## Release ONDEWO S2T API 0.2.0

### New Features

Move to GitHub!

### Improvements

No longer closed source.

### Bug fixes

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

### Bug fixes

### Breaking Changes

### Known issues not covered in this release

Harder to install apis under one heading-- this will be addressed at a later date.

### Migration Guide

[Replace submodule](https://stackoverflow.com/a/1260982/7756727) in the client.

*****************
