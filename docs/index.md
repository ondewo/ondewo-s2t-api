# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [ondewo/s2t/speech-to-text.proto](#ondewo/s2t/speech-to-text.proto)
    - [CkptFile](#ondewo.s2t.CkptFile)
    - [CtcAcousticModels](#ondewo.s2t.CtcAcousticModels)
    - [LanguageModelPipelineId](#ondewo.s2t.LanguageModelPipelineId)
    - [LanguageModels](#ondewo.s2t.LanguageModels)
    - [ListS2tDomainsRequest](#ondewo.s2t.ListS2tDomainsRequest)
    - [ListS2tDomainsResponse](#ondewo.s2t.ListS2tDomainsResponse)
    - [ListS2tLanguageModelsRequest](#ondewo.s2t.ListS2tLanguageModelsRequest)
    - [ListS2tLanguageModelsResponse](#ondewo.s2t.ListS2tLanguageModelsResponse)
    - [ListS2tLanguagesRequest](#ondewo.s2t.ListS2tLanguagesRequest)
    - [ListS2tLanguagesResponse](#ondewo.s2t.ListS2tLanguagesResponse)
    - [ListS2tPipelinesRequest](#ondewo.s2t.ListS2tPipelinesRequest)
    - [ListS2tPipelinesResponse](#ondewo.s2t.ListS2tPipelinesResponse)
    - [Logging](#ondewo.s2t.Logging)
    - [Matchbox](#ondewo.s2t.Matchbox)
    - [PostProcessing](#ondewo.s2t.PostProcessing)
    - [PostProcessingOptions](#ondewo.s2t.PostProcessingOptions)
    - [PostProcessors](#ondewo.s2t.PostProcessors)
    - [PtFiles](#ondewo.s2t.PtFiles)
    - [Pyannote](#ondewo.s2t.Pyannote)
    - [Quartznet](#ondewo.s2t.Quartznet)
    - [QuartznetTriton](#ondewo.s2t.QuartznetTriton)
    - [S2TDescription](#ondewo.s2t.S2TDescription)
    - [S2TGetServiceInfoResponse](#ondewo.s2t.S2TGetServiceInfoResponse)
    - [S2TInference](#ondewo.s2t.S2TInference)
    - [S2TNormalization](#ondewo.s2t.S2TNormalization)
    - [S2tPipelineId](#ondewo.s2t.S2tPipelineId)
    - [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig)
    - [StreamingServer](#ondewo.s2t.StreamingServer)
    - [StreamingSpeechRecognition](#ondewo.s2t.StreamingSpeechRecognition)
    - [SymSpell](#ondewo.s2t.SymSpell)
    - [TranscribeFileRequest](#ondewo.s2t.TranscribeFileRequest)
    - [TranscribeFileResponse](#ondewo.s2t.TranscribeFileResponse)
    - [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig)
    - [TranscribeStreamRequest](#ondewo.s2t.TranscribeStreamRequest)
    - [TranscribeStreamResponse](#ondewo.s2t.TranscribeStreamResponse)
    - [Transcription](#ondewo.s2t.Transcription)
    - [TranscriptionReturnOptions](#ondewo.s2t.TranscriptionReturnOptions)
    - [UtteranceDetectionOptions](#ondewo.s2t.UtteranceDetectionOptions)
    - [VoiceActivityDetection](#ondewo.s2t.VoiceActivityDetection)
    - [Wav2Vec](#ondewo.s2t.Wav2Vec)
    - [WordTiming](#ondewo.s2t.WordTiming)
  
    - [CTCDecoding](#ondewo.s2t.CTCDecoding)
  
    - [Speech2Text](#ondewo.s2t.Speech2Text)
  
- [Scalar Value Types](#scalar-value-types)



<a name="ondewo/s2t/speech-to-text.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## ondewo/s2t/speech-to-text.proto



<a name="ondewo.s2t.CkptFile"></a>

### CkptFile



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| path | [string](#string) |  |  |






<a name="ondewo.s2t.CtcAcousticModels"></a>

### CtcAcousticModels



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [string](#string) |  |  |
| quartznet | [Quartznet](#ondewo.s2t.Quartznet) |  |  |
| quartznet_triton | [QuartznetTriton](#ondewo.s2t.QuartznetTriton) |  |  |
| wav2vec | [Wav2Vec](#ondewo.s2t.Wav2Vec) |  |  |






<a name="ondewo.s2t.LanguageModelPipelineId"></a>

### LanguageModelPipelineId



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pipeline_id | [string](#string) |  | One pipeline id |
| model_names | [string](#string) | repeated | A list of all available language models for above pipeline id |






<a name="ondewo.s2t.LanguageModels"></a>

### LanguageModels



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| path | [string](#string) |  | Path to the directory of language models |
| beam_size | [int64](#int64) |  |  |
| default_lm | [string](#string) |  | this language model will be selected if none is given |
| beam_search_scorer_alpha | [float](#float) |  |  |
| beam_search_scorer_beta | [float](#float) |  |  |






<a name="ondewo.s2t.ListS2tDomainsRequest"></a>

### ListS2tDomainsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| languages | [string](#string) | repeated |  |
| pipeline_owners | [string](#string) | repeated |  |






<a name="ondewo.s2t.ListS2tDomainsResponse"></a>

### ListS2tDomainsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| domains | [string](#string) | repeated |  |






<a name="ondewo.s2t.ListS2tLanguageModelsRequest"></a>

### ListS2tLanguageModelsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ids | [string](#string) | repeated | List of pipeline id(s) to see their available language models |






<a name="ondewo.s2t.ListS2tLanguageModelsResponse"></a>

### ListS2tLanguageModelsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| lm_pipeline_ids | [LanguageModelPipelineId](#ondewo.s2t.LanguageModelPipelineId) | repeated | Response is a dictionary of type Dict[pipeline id, List of available language models] |






<a name="ondewo.s2t.ListS2tLanguagesRequest"></a>

### ListS2tLanguagesRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| domains | [string](#string) | repeated |  |
| pipeline_owners | [string](#string) | repeated |  |






<a name="ondewo.s2t.ListS2tLanguagesResponse"></a>

### ListS2tLanguagesResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| languages | [string](#string) | repeated |  |






<a name="ondewo.s2t.ListS2tPipelinesRequest"></a>

### ListS2tPipelinesRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| languages | [string](#string) | repeated |  |
| pipeline_owners | [string](#string) | repeated |  |
| domains | [string](#string) | repeated |  |






<a name="ondewo.s2t.ListS2tPipelinesResponse"></a>

### ListS2tPipelinesResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pipeline_configs | [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig) | repeated |  |






<a name="ondewo.s2t.Logging"></a>

### Logging



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [string](#string) |  |  |
| path | [string](#string) |  |  |






<a name="ondewo.s2t.Matchbox"></a>

### Matchbox



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_config | [string](#string) |  |  |
| encoder_path | [string](#string) |  |  |
| decoder_path | [string](#string) |  |  |






<a name="ondewo.s2t.PostProcessing"></a>

### PostProcessing



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pipeline | [string](#string) | repeated | List of names of active post-processors |
| post_processors | [PostProcessors](#ondewo.s2t.PostProcessors) |  | Post-processor configurations. |






<a name="ondewo.s2t.PostProcessingOptions"></a>

### PostProcessingOptions



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| spelling_correction | [bool](#bool) |  | Whether or not to use spelling correction |
| normalize | [bool](#bool) |  | Whether or not to disable normalization |
| config | [PostProcessing](#ondewo.s2t.PostProcessing) |  | Post-processing configuration specifying the active post-processors in the pipeline, as well as their individual configuration. If not set, all values are replaced by the ones in current pipeline. |






<a name="ondewo.s2t.PostProcessors"></a>

### PostProcessors



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sym_spell | [SymSpell](#ondewo.s2t.SymSpell) |  | Configuration of the sym-spell spelling correction |
| normalization | [S2TNormalization](#ondewo.s2t.S2TNormalization) |  | Configuration of the normalization object |






<a name="ondewo.s2t.PtFiles"></a>

### PtFiles



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| path | [string](#string) |  |  |
| step | [string](#string) |  |  |






<a name="ondewo.s2t.Pyannote"></a>

### Pyannote



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_path | [string](#string) |  |  |
| min_audio_size | [int64](#int64) |  |  |
| offset | [float](#float) |  |  |
| onset | [float](#float) |  |  |
| log_scale | [bool](#bool) |  |  |
| min_duration_off | [float](#float) |  |  |
| min_duration_on | [float](#float) |  |  |






<a name="ondewo.s2t.Quartznet"></a>

### Quartznet



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| config_path | [string](#string) |  |  |
| load_type | [string](#string) |  |  |
| pt_files | [PtFiles](#ondewo.s2t.PtFiles) |  |  |
| ckpt_file | [CkptFile](#ondewo.s2t.CkptFile) |  |  |
| use_gpu | [bool](#bool) |  |  |






<a name="ondewo.s2t.QuartznetTriton"></a>

### QuartznetTriton



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| config_path | [string](#string) |  |  |
| triton_url | [string](#string) |  |  |
| triton_model | [string](#string) |  |  |






<a name="ondewo.s2t.S2TDescription"></a>

### S2TDescription



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  |  |
| pipeline_owner | [string](#string) |  |  |
| domain | [string](#string) |  |  |
| comments | [string](#string) |  |  |






<a name="ondewo.s2t.S2TGetServiceInfoResponse"></a>

### S2TGetServiceInfoResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| version | [string](#string) |  |  |






<a name="ondewo.s2t.S2TInference"></a>

### S2TInference



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ctc_acoustic_models | [CtcAcousticModels](#ondewo.s2t.CtcAcousticModels) |  |  |
| language_models | [LanguageModels](#ondewo.s2t.LanguageModels) |  |  |






<a name="ondewo.s2t.S2TNormalization"></a>

### S2TNormalization



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | In which language to normalization transcription. |






<a name="ondewo.s2t.S2tPipelineId"></a>

### S2tPipelineId



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | id of the model that will generate audio |






<a name="ondewo.s2t.Speech2TextConfig"></a>

### Speech2TextConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  |  |
| description | [S2TDescription](#ondewo.s2t.S2TDescription) |  |  |
| active | [bool](#bool) |  |  |
| inference | [S2TInference](#ondewo.s2t.S2TInference) |  |  |
| streaming_server | [StreamingServer](#ondewo.s2t.StreamingServer) |  |  |
| voice_activity_detection | [VoiceActivityDetection](#ondewo.s2t.VoiceActivityDetection) |  |  |
| post_processing | [PostProcessing](#ondewo.s2t.PostProcessing) |  |  |
| logging | [Logging](#ondewo.s2t.Logging) |  |  |






<a name="ondewo.s2t.StreamingServer"></a>

### StreamingServer



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| host | [string](#string) |  |  |
| port | [int64](#int64) |  |  |
| output_style | [string](#string) |  |  |
| streaming_speech_recognition | [StreamingSpeechRecognition](#ondewo.s2t.StreamingSpeechRecognition) |  |  |






<a name="ondewo.s2t.StreamingSpeechRecognition"></a>

### StreamingSpeechRecognition



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcribe_not_final | [bool](#bool) |  |  |
| ctc_decoding_method | [string](#string) |  |  |
| sampling_rate | [int64](#int64) |  |  |
| min_audio_chunk_size | [int64](#int64) |  |  |
| start_of_utterance_threshold | [float](#float) |  |  |
| end_of_utterance_threshold | [float](#float) |  |  |
| next_chunk_timeout | [float](#float) |  | if time between audio chunks exceeds next_chunk_timeout, stream will be stopped |






<a name="ondewo.s2t.SymSpell"></a>

### SymSpell



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| dict_path | [string](#string) |  | Path to the dictionary used by symspell |
| max_dictionary_edit_distance | [int64](#int64) |  | The maximal edit-distance to consider for spelling correction (affects performance - bigger number takes longer to process!) |
| prefix_length | [int64](#int64) |  | The length (number of characters) of the prefix to consider for filtering |






<a name="ondewo.s2t.TranscribeFileRequest"></a>

### TranscribeFileRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| audio_file | [bytes](#bytes) |  | wav file to transcribe |
| config | [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig) |  | The configuration to override the default configuration |






<a name="ondewo.s2t.TranscribeFileResponse"></a>

### TranscribeFileResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcriptions | [Transcription](#ondewo.s2t.Transcription) | repeated | List of transcriptions with confidence level |
| time | [float](#float) |  | The time the transcription took |
| word_timing | [WordTiming](#ondewo.s2t.WordTiming) | repeated | List of words with timestamps for their start and end |
| audio_uuid | [string](#string) |  | id of the transcribed audio file |






<a name="ondewo.s2t.TranscribeRequestConfig"></a>

### TranscribeRequestConfig



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| s2t_pipeline_id | [string](#string) |  | Required. id of the pipeline (model setup) that will generate audio |
| ctc_decoding | [CTCDecoding](#ondewo.s2t.CTCDecoding) |  | Optional. CTC decoding type |
| language_model_name | [string](#string) |  |  |
| post_processing | [PostProcessingOptions](#ondewo.s2t.PostProcessingOptions) |  |  |
| utterance_detection | [UtteranceDetectionOptions](#ondewo.s2t.UtteranceDetectionOptions) |  |  |
| pyannote | [Pyannote](#ondewo.s2t.Pyannote) |  |  |
| matchbox | [Matchbox](#ondewo.s2t.Matchbox) |  |  |
| return_options | [TranscriptionReturnOptions](#ondewo.s2t.TranscriptionReturnOptions) |  |  |






<a name="ondewo.s2t.TranscribeStreamRequest"></a>

### TranscribeStreamRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| audio_chunk | [bytes](#bytes) |  | wav file to transcribe |
| end_of_stream | [bool](#bool) |  | if it's the final chunk of the stream |
| config | [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig) |  | The configuration to override the default configuration |






<a name="ondewo.s2t.TranscribeStreamResponse"></a>

### TranscribeStreamResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcriptions | [Transcription](#ondewo.s2t.Transcription) | repeated | List of transcriptions with confidence level |
| time | [float](#float) |  | The time the transcription took |
| final | [bool](#bool) |  | Whether or not this transcription is final (transcribed texts might change if transcription is started before the end of an utterance). |
| return_audio | [bool](#bool) |  | is audio bytes of the utterance in response |
| audio | [bytes](#bytes) |  | audio bytes of the transcribed utterance |
| utterance_start | [bool](#bool) |  | is it a start of the utterance |
| audio_uuid | [string](#string) |  | id of the transcribed audio file |
| config | [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig) |  |  |






<a name="ondewo.s2t.Transcription"></a>

### Transcription



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcription | [string](#string) |  | The transcribed text |
| confidence_score | [float](#float) |  | The corresponding confidence score |






<a name="ondewo.s2t.TranscriptionReturnOptions"></a>

### TranscriptionReturnOptions



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| return_start_of_speech | [bool](#bool) |  | should server make response indicating that the beginning of the speech was detected |
| return_audio | [bool](#bool) |  | should s2t server return audio bytes of transcribed utterance |
| return_alternative_transcriptions | [bool](#bool) |  | Whether or not to return alternative results from beam-search |
| return_confidence_score | [bool](#bool) |  | Whether or not to return confidence scores |
| return_word_timing | [bool](#bool) |  | Optional. Whether or not to return timestamps of start and end of the words. Only used in TranscribeFile. |






<a name="ondewo.s2t.UtteranceDetectionOptions"></a>

### UtteranceDetectionOptions



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcribe_not_final | [bool](#bool) |  |  |
| start_of_utterance_threshold | [float](#float) |  | Specifies the minimal duration of voice signal to indicate the start of an utterance |
| end_of_utterance_threshold | [float](#float) |  | Specifies the minimal duration of a non-voice signal to indicate the end of an utterance |
| next_chunk_timeout | [float](#float) |  | if time between audio chunks exceeds next_chunk_timeout, stream will be stopped |






<a name="ondewo.s2t.VoiceActivityDetection"></a>

### VoiceActivityDetection



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [string](#string) |  |  |
| sampling_rate | [int64](#int64) |  |  |
| pyannote | [Pyannote](#ondewo.s2t.Pyannote) |  |  |
| matchbox | [Matchbox](#ondewo.s2t.Matchbox) |  |  |






<a name="ondewo.s2t.Wav2Vec"></a>

### Wav2Vec



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_path | [string](#string) |  |  |
| use_gpu | [bool](#bool) |  |  |






<a name="ondewo.s2t.WordTiming"></a>

### WordTiming



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| word | [string](#string) |  | Transcribed word |
| begin | [int32](#int32) |  | Timestamp for start of word |
| end | [int32](#int32) |  | Timestamp for end of word |





 <!-- end messages -->


<a name="ondewo.s2t.CTCDecoding"></a>

### CTCDecoding


| Name | Number | Description |
| ---- | ------ | ----------- |
| DEFAULT | 0 | decoding will be defined by the pipeline config |
| GREEDY | 1 | greedy decoding will be used independently on pipeline config |
| BEAM_SEARCH_WITH_LM | 2 | beam search will be used independently on pipeline config |


 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="ondewo.s2t.Speech2Text"></a>

### Speech2Text
endpoints of speech-to-text service

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| TranscribeFile | [TranscribeFileRequest](#ondewo.s2t.TranscribeFileRequest) | [TranscribeFileResponse](#ondewo.s2t.TranscribeFileResponse) |  |
| TranscribeStream | [TranscribeStreamRequest](#ondewo.s2t.TranscribeStreamRequest) stream | [TranscribeStreamResponse](#ondewo.s2t.TranscribeStreamResponse) stream | Transcribes an audio stream. |
| GetS2tPipeline | [S2tPipelineId](#ondewo.s2t.S2tPipelineId) | [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig) | Gets a speech to text pipeline corresponding to the id specified in S2tPipelineId. If no corresponding id is found, raises ModuleNotFoundError in server. |
| CreateS2tPipeline | [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig) | [S2tPipelineId](#ondewo.s2t.S2tPipelineId) | Creates a new speech to text pipeline from a Speech2TextConfig and registers the new pipeline in the server. |
| DeleteS2tPipeline | [S2tPipelineId](#ondewo.s2t.S2tPipelineId) | [.google.protobuf.Empty](#google.protobuf.Empty) | Deletes a pipeline corresponding to the id parsed in S2TPipelineId. If no corresponding id is found, raises ModuleNotFoundError in server. |
| UpdateS2tPipeline | [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig) | [.google.protobuf.Empty](#google.protobuf.Empty) | Updates a pipeline with the id specified in Speech2TextConfig with the new config. If no corresponding id is found, raises ModuleNotFoundError in server. |
| ListS2tPipelines | [ListS2tPipelinesRequest](#ondewo.s2t.ListS2tPipelinesRequest) | [ListS2tPipelinesResponse](#ondewo.s2t.ListS2tPipelinesResponse) | Lists all speech to text pipelines. |
| ListS2tLanguages | [ListS2tLanguagesRequest](#ondewo.s2t.ListS2tLanguagesRequest) | [ListS2tLanguagesResponse](#ondewo.s2t.ListS2tLanguagesResponse) | Returns a message containing a list of all languages for which there exist pipelines. |
| ListS2tDomains | [ListS2tDomainsRequest](#ondewo.s2t.ListS2tDomainsRequest) | [ListS2tDomainsResponse](#ondewo.s2t.ListS2tDomainsResponse) | Returns a message containing a list of all domains for which there exist pipelines. |
| GetServiceInfo | [.google.protobuf.Empty](#google.protobuf.Empty) | [S2TGetServiceInfoResponse](#ondewo.s2t.S2TGetServiceInfoResponse) | Returns a message containing the version of the running speech to text server. |
| ListS2tLanguageModels | [ListS2tLanguageModelsRequest](#ondewo.s2t.ListS2tLanguageModelsRequest) | [ListS2tLanguageModelsResponse](#ondewo.s2t.ListS2tLanguageModelsResponse) | Given a list of pipeline ids, returns a list of LanguageModelPipelineId messages containing the pipeline id and a list of the language models loaded in the pipeline. |

 <!-- end services -->



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |
