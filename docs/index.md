# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [ondewo/s2t/speech-to-text.proto](#ondewo/s2t/speech-to-text.proto)
    - [AcousticModels](#ondewo.s2t.AcousticModels)
    - [AddDataToUserLanguageModelRequest](#ondewo.s2t.AddDataToUserLanguageModelRequest)
    - [CkptFile](#ondewo.s2t.CkptFile)
    - [CreateUserLanguageModelRequest](#ondewo.s2t.CreateUserLanguageModelRequest)
    - [DeleteUserLanguageModelRequest](#ondewo.s2t.DeleteUserLanguageModelRequest)
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
    - [PostProcessing](#ondewo.s2t.PostProcessing)
    - [PostProcessingOptions](#ondewo.s2t.PostProcessingOptions)
    - [PostProcessors](#ondewo.s2t.PostProcessors)
    - [PtFiles](#ondewo.s2t.PtFiles)
    - [Pyannote](#ondewo.s2t.Pyannote)
    - [S2TDescription](#ondewo.s2t.S2TDescription)
    - [S2TGetServiceInfoResponse](#ondewo.s2t.S2TGetServiceInfoResponse)
    - [S2TInference](#ondewo.s2t.S2TInference)
    - [S2TNormalization](#ondewo.s2t.S2TNormalization)
    - [S2tCloudProviderConfig](#ondewo.s2t.S2tCloudProviderConfig)
    - [S2tCloudProviderConfigAmazon](#ondewo.s2t.S2tCloudProviderConfigAmazon)
    - [S2tCloudProviderConfigDeepgram](#ondewo.s2t.S2tCloudProviderConfigDeepgram)
    - [S2tCloudProviderConfigGoogle](#ondewo.s2t.S2tCloudProviderConfigGoogle)
    - [S2tCloudProviderConfigMicrosoft](#ondewo.s2t.S2tCloudProviderConfigMicrosoft)
    - [S2tCloudServiceAmazon](#ondewo.s2t.S2tCloudServiceAmazon)
    - [S2tCloudServiceDeepgram](#ondewo.s2t.S2tCloudServiceDeepgram)
    - [S2tCloudServiceGoogle](#ondewo.s2t.S2tCloudServiceGoogle)
    - [S2tCloudServiceMicrosoft](#ondewo.s2t.S2tCloudServiceMicrosoft)
    - [S2tPipelineId](#ondewo.s2t.S2tPipelineId)
    - [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig)
    - [StreamingServer](#ondewo.s2t.StreamingServer)
    - [StreamingSpeechRecognition](#ondewo.s2t.StreamingSpeechRecognition)
    - [SymSpell](#ondewo.s2t.SymSpell)
    - [TrainUserLanguageModelRequest](#ondewo.s2t.TrainUserLanguageModelRequest)
    - [TranscribeFileRequest](#ondewo.s2t.TranscribeFileRequest)
    - [TranscribeFileResponse](#ondewo.s2t.TranscribeFileResponse)
    - [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig)
    - [TranscribeStreamRequest](#ondewo.s2t.TranscribeStreamRequest)
    - [TranscribeStreamResponse](#ondewo.s2t.TranscribeStreamResponse)
    - [Transcription](#ondewo.s2t.Transcription)
    - [TranscriptionAlternative](#ondewo.s2t.TranscriptionAlternative)
    - [TranscriptionReturnOptions](#ondewo.s2t.TranscriptionReturnOptions)
    - [TurnDetectionOptions](#ondewo.s2t.TurnDetectionOptions)
    - [UtteranceDetectionOptions](#ondewo.s2t.UtteranceDetectionOptions)
    - [VoiceActivityDetection](#ondewo.s2t.VoiceActivityDetection)
    - [Wav2Vec](#ondewo.s2t.Wav2Vec)
    - [Wav2VecTriton](#ondewo.s2t.Wav2VecTriton)
    - [Whisper](#ondewo.s2t.Whisper)
    - [WhisperTriton](#ondewo.s2t.WhisperTriton)
    - [WordAlternative](#ondewo.s2t.WordAlternative)
    - [WordDetail](#ondewo.s2t.WordDetail)
  
    - [Decoding](#ondewo.s2t.Decoding)
    - [InferenceBackend](#ondewo.s2t.InferenceBackend)
  
    - [Speech2Text](#ondewo.s2t.Speech2Text)
  
- [Scalar Value Types](#scalar-value-types)



<a name="ondewo/s2t/speech-to-text.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## ondewo/s2t/speech-to-text.proto



<a name="ondewo.s2t.AcousticModels"></a>

### AcousticModels
AcousticModels contains information about different types of acoustic models.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [string](#string) |  | Type of the acoustic model. |
| wav2vec | [Wav2Vec](#ondewo.s2t.Wav2Vec) |  | Configuration for the Wav2Vec model. |
| wav2vec_triton | [Wav2VecTriton](#ondewo.s2t.Wav2VecTriton) |  | Configuration for the Wav2Vec model using Triton. |
| whisper | [Whisper](#ondewo.s2t.Whisper) |  | Configuration for the Whisper model. |
| whisper_triton | [WhisperTriton](#ondewo.s2t.WhisperTriton) |  | Configuration for the Whisper model using Triton. |
| s2t_cloud_service_amazon | [S2tCloudServiceAmazon](#ondewo.s2t.S2tCloudServiceAmazon) |  | Amazon web service cloud service inference settings. |
| s2t_cloud_service_deepgram | [S2tCloudServiceDeepgram](#ondewo.s2t.S2tCloudServiceDeepgram) |  | Deepgram cloud service inference settings. |
| s2t_cloud_service_google | [S2tCloudServiceGoogle](#ondewo.s2t.S2tCloudServiceGoogle) |  | Google cloud service inference settings. |
| s2t_cloud_service_microsoft | [S2tCloudServiceMicrosoft](#ondewo.s2t.S2tCloudServiceMicrosoft) |  | Microsoft Azure cloud service inference settings. |






<a name="ondewo.s2t.AddDataToUserLanguageModelRequest"></a>

### AddDataToUserLanguageModelRequest
AddDataToUserLanguageModelRequest is used to request the addition of data to a user-specific language model.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language_model_name | [string](#string) |  | Name of the language model to which to add data. Example: "user_lm_1" |
| zipped_data | [bytes](#bytes) |  | Zip file containing data in the form of text files. Example: A zip file with text files containing sentences or phrases in the target language. |






<a name="ondewo.s2t.CkptFile"></a>

### CkptFile
CkptFile contains information about checkpoint files.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| path | [string](#string) |  | Path to the checkpoint file. |






<a name="ondewo.s2t.CreateUserLanguageModelRequest"></a>

### CreateUserLanguageModelRequest
CreateUserLanguageModelRequest is used to request the creation of a new user-specific language model.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language_model_name | [string](#string) |  | Name of the language model to create. Example: "user_lm_1" |






<a name="ondewo.s2t.DeleteUserLanguageModelRequest"></a>

### DeleteUserLanguageModelRequest
DeleteUserLanguageModelRequest is used to request the deletion of a user-specific language model.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language_model_name | [string](#string) |  | Name of the language model to delete. Example: "user_lm_1" |






<a name="ondewo.s2t.LanguageModelPipelineId"></a>

### LanguageModelPipelineId
LanguageModelPipelineId contains information about a pipeline and its available language models.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pipeline_id | [string](#string) |  | A pipeline ID. Example: "pipeline_1" |
| model_names | [string](#string) | repeated | A list of all available language models for the corresponding pipeline ID. Example: ["model_1", "model_2"] |






<a name="ondewo.s2t.LanguageModels"></a>

### LanguageModels
LanguageModels contains information about language models.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| path | [string](#string) |  | Path to the directory of language models. |
| beam_size | [int64](#int64) |  | Beam size for the search algorithm. |
| default_lm | [string](#string) |  | Default language model to be selected if none is given. |
| beam_search_scorer_alpha | [float](#float) |  | Weight for the language model scorer (alpha). |
| beam_search_scorer_beta | [float](#float) |  | Weight for the word insertion penalty (beta). |






<a name="ondewo.s2t.ListS2tDomainsRequest"></a>

### ListS2tDomainsRequest
Request message to list available domains. Optionally also filters can be set.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| languages | [string](#string) | repeated | Filter for languages |
| pipeline_owners | [string](#string) | repeated | Filter for pipeline owner |






<a name="ondewo.s2t.ListS2tDomainsResponse"></a>

### ListS2tDomainsResponse
Response message to list available domains


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| domains | [string](#string) | repeated | domains available. Example: ["medical", "finance"] |






<a name="ondewo.s2t.ListS2tLanguageModelsRequest"></a>

### ListS2tLanguageModelsRequest
ListS2tLanguageModelsRequest is used to request a list of available language models for specified pipelines.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ids | [string](#string) | repeated | List of pipeline IDs to retrieve their available language models. Example: ["pipeline_1", "pipeline_2"] |






<a name="ondewo.s2t.ListS2tLanguageModelsResponse"></a>

### ListS2tLanguageModelsResponse
ListS2tLanguageModelsResponse is used to return the available language models for specified pipelines.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| lm_pipeline_ids | [LanguageModelPipelineId](#ondewo.s2t.LanguageModelPipelineId) | repeated | Response is a list of LanguageModelPipelineId, where each element contains a pipeline ID and its associated language models. Example: [{pipeline_id: "pipeline_1", model_names: ["model_1", "model_2"]}, {pipeline_id: "pipeline_2", model_names: ["model_3"]}] |






<a name="ondewo.s2t.ListS2tLanguagesRequest"></a>

### ListS2tLanguagesRequest
ListS2tLanguagesRequest is used to request a list of available languages. Optionally, filters can be set.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| domains | [string](#string) | repeated | Filter for domains. Example: ["medical", "finance"] |
| pipeline_owners | [string](#string) | repeated | Filter for pipeline owners. Example: ["ondewo", "partner_company"] |






<a name="ondewo.s2t.ListS2tLanguagesResponse"></a>

### ListS2tLanguagesResponse
Response message to list available languages


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| languages | [string](#string) | repeated | available languages |






<a name="ondewo.s2t.ListS2tPipelinesRequest"></a>

### ListS2tPipelinesRequest
Request to list all speech-to-text pipelines. Optionally also filter criteria can be set


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| languages | [string](#string) | repeated | Filter for languages |
| pipeline_owners | [string](#string) | repeated | Filter for pipeline owners |
| domains | [string](#string) | repeated | Filter for domains |
| registered_only | [bool](#bool) |  | If true, return only registered pipelines. Default false: return registered and persisted (from config files) configs. |






<a name="ondewo.s2t.ListS2tPipelinesResponse"></a>

### ListS2tPipelinesResponse
ListS2tPipelinesResponse is used to return a list of all speech-to-text pipelines.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pipeline_configs | [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig) | repeated | A list of Speech2TextConfig message instances containing the configuration of each pipeline. Example: [{id: "pipeline_1", description: {language: "en"}, active: true, ...}, {id: "pipeline_2", description: {language: "fr"}, active: true, ...}] |






<a name="ondewo.s2t.Logging"></a>

### Logging
Logging contains configuration for logging.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [string](#string) |  | Type of logging. |
| path | [string](#string) |  | Path for logging. |






<a name="ondewo.s2t.PostProcessing"></a>

### PostProcessing
PostProcessing contains the configuration for post-processing.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pipeline | [string](#string) | repeated | List of names of active post-processors. |
| post_processors | [PostProcessors](#ondewo.s2t.PostProcessors) |  | Post-processor configurations. |






<a name="ondewo.s2t.PostProcessingOptions"></a>

### PostProcessingOptions
Configuration of the post-processing options


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| spelling_correction | [bool](#bool) |  | Whether to use spelling correction |
| normalize | [bool](#bool) |  | Whether to disable normalization |
| config | [PostProcessing](#ondewo.s2t.PostProcessing) |  | Post-processing configuration specifying the active post-processors in the pipeline, as well as their individual configuration. If not set, all values are replaced by the ones in current pipeline. |






<a name="ondewo.s2t.PostProcessors"></a>

### PostProcessors
PostProcessors contains configurations for post-processors.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sym_spell | [SymSpell](#ondewo.s2t.SymSpell) |  | Configuration of the SymSpell spelling correction. |
| normalization | [S2TNormalization](#ondewo.s2t.S2TNormalization) |  | Configuration of the normalization object. |






<a name="ondewo.s2t.PtFiles"></a>

### PtFiles
PtFiles contains information about PT files.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| path | [string](#string) |  | Path to the PT files. |
| step | [string](#string) |  | Step for the PT files. |






<a name="ondewo.s2t.Pyannote"></a>

### Pyannote
Pyannote contains configuration for the Pyannote voice activity detection model.
Library: [pyannote-audio](https://github.com/pyannote/pyannote-audio/blob/develop/tutorials/voice_activity_detection.ipynb)


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_name | [string](#string) |  | Full name of the Pyannote model. |
| min_audio_size | [int64](#int64) |  | Minimum audio size for processing. |
| min_duration_off | [float](#float) |  | Fill inactive regions shorter than that many seconds. Example [notebook](https://github.com/pyannote/pyannote-audio/blob/develop/tutorials/voice_activity_detection.ipynb) |
| min_duration_on | [float](#float) |  | Remove active regions shorter than that many seconds Example [notebook](https://github.com/pyannote/pyannote-audio/blob/develop/tutorials/voice_activity_detection.ipynb) |
| triton_server_host | [string](#string) |  | Host name of triton inference server that serves the Pyannote model |
| triton_server_port | [int64](#int64) |  | Port number of triton inference server that serves the Pyannote model |






<a name="ondewo.s2t.S2TDescription"></a>

### S2TDescription
S2TDescription contains descriptive information about the speech-to-text pipeline.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | Language of the speech-to-text system. |
| pipeline_owner | [string](#string) |  | Owner of the pipeline. |
| domain | [string](#string) |  | Domain of the speech-to-text system. |
| comments | [string](#string) |  | Comments about the system. |






<a name="ondewo.s2t.S2TGetServiceInfoResponse"></a>

### S2TGetServiceInfoResponse
S2TGetServiceInfoResponse is used to return version information about the speech-to-text service.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| version | [string](#string) |  | Version number based on semantic versioning, e.g. "4.2.0". |






<a name="ondewo.s2t.S2TInference"></a>

### S2TInference
S2TInference contains information about inference models used in the speech-to-text pipeline.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| acoustic_models | [AcousticModels](#ondewo.s2t.AcousticModels) |  | Configuration for the acoustic models. |
| language_models | [LanguageModels](#ondewo.s2t.LanguageModels) |  | Configuration for the language models. |
| inference_backend | [InferenceBackend](#ondewo.s2t.InferenceBackend) |  | Configuration for the inference backend. |






<a name="ondewo.s2t.S2TNormalization"></a>

### S2TNormalization
S2TNormalization contains configuration for the speech-to-text normalization.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | Language for normalization of transcriptions. |
| pipeline | [string](#string) | repeated | List of names of active normalizations. |






<a name="ondewo.s2t.S2tCloudProviderConfig"></a>

### S2tCloudProviderConfig
Configuration for cloud provider settings for Speech-to-Text (S2T).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| s2t_cloud_provider_config_amazon | [S2tCloudProviderConfigAmazon](#ondewo.s2t.S2tCloudProviderConfigAmazon) | optional | Optional. Configuration for Amazon web service speech-to-text provider. |
| s2t_cloud_provider_config_deepgram | [S2tCloudProviderConfigDeepgram](#ondewo.s2t.S2tCloudProviderConfigDeepgram) | optional | Optional. Configuration for DeepGram speech-to-text provider. |
| s2t_cloud_provider_config_google | [S2tCloudProviderConfigGoogle](#ondewo.s2t.S2tCloudProviderConfigGoogle) | optional | Optional. Configuration for Google speech-to-text provider. |
| s2t_cloud_provider_config_microsoft | [S2tCloudProviderConfigMicrosoft](#ondewo.s2t.S2tCloudProviderConfigMicrosoft) | optional | Optional. Configuration for Microsoft Azure speech-to-text provider. |






<a name="ondewo.s2t.S2tCloudProviderConfigAmazon"></a>

### S2tCloudProviderConfigAmazon
Configuration details specific to the Amazon web service speech-to-text provider.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_partial_results_stabilization | [bool](#bool) | optional | Optional. Enables or disables partial_results_stabilization feature. More details at: https://docs.aws.amazon.com/transcribe/latest/dg/streaming-partial-results.html#streaming-partial-result-stabilization |
| partial_results_stability | [string](#string) | optional | Optional. You can use this field to set the stability level of the transcription results. A higher stability level means that the transcription results are less likely to change. Higher stability levels can come with lower overall transcription accuracy. Acceptable values: ["low", "medium", "high"]. Defaults to "high" if not set explicitly. More details at: https://aws.amazon.com/blogs/machine-learning/amazon-transcribe-now-supports-partial-results-stabilization-for-streaming-audio/ |
| language_model_name | [string](#string) | optional | Optional. The name of your customize language model you want to use. More details at: https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html |
| vocabulary_name | [string](#string) | optional | Optional. The name of your customize language model you want to use. More details at: https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html |






<a name="ondewo.s2t.S2tCloudProviderConfigDeepgram"></a>

### S2tCloudProviderConfigDeepgram
Configuration details specific to the Deepgram speech-to-text provider.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| punctuate | [bool](#bool) | optional | Optional. Enables or disables punctuate feature of Deepgram to add punctuations to the resulted transcript. More details at: https://developers.deepgram.com/docs/punctuation |
| smart_format | [bool](#bool) | optional | Optional. Enables or disables smart_format feature of Deepgram transcription result to improve readability. More details at: https://developers.deepgram.com/docs/smart-format |
| numerals | [bool](#bool) | optional | Optional. Enables or disables numerals feature of Deepgram to convert numbers to numeric form in the resulted transcript. More details at: https://developers.deepgram.com/docs/numerals |
| measurements | [bool](#bool) | optional | Optional. Enables or disables measurements feature of Deepgram to convert measurement units (i.e. Kilogram) to abbreviated form (i.e. Kg) in the resulted transcript. More details at: https://developers.deepgram.com/docs/measurements |
| dictation | [bool](#bool) | optional | Optional. Enables or disables dictation feature of Deepgram to convert spoken dictation commands into their corresponding punctuation marks. More details at: https://developers.deepgram.com/docs/dictation |






<a name="ondewo.s2t.S2tCloudProviderConfigGoogle"></a>

### S2tCloudProviderConfigGoogle
Configuration details specific to the Google speech-to-text provider.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_automatic_punctuation | [bool](#bool) | optional | Optional. Enables or disables automatic_punctuation feature of Google s2t to add punctuations to the resulted transcript. More details at: https://cloud.google.com/speech-to-text/docs/automatic-punctuation |
| enable_word_time_offsets | [bool](#bool) | optional | Optional. Enables or disables word_time_offsets feature of Google s2t to add word-level timestamps (time-offset) to the resulted transcript. More details at: https://cloud.google.com/speech-to-text/docs/async-time-offsets |
| enable_word_confidence | [bool](#bool) | optional | Optional. Enables or disables word_confidence feature of Google s2t to add word-level confidence scores to the resulted transcript. More details at: https://cloud.google.com/speech-to-text/docs/word-confidence |
| transcript_normalization | [bool](#bool) | optional | Optional. Enables or disables transcript_normalization feature of Google s2t to automatically replace parts of the transcript with phrases of your choosing. More details at: https://cloud.google.com/speech-to-text/v2/docs/reference/rpc/google.cloud.speech.v2#transcriptnormalization |
| max_alternatives | [int32](#int32) | optional | Optional. Maximum number of recognition hypotheses to be returned, may be returned fewer than max_alternatives. Valid values are 0-30. A value of 0 or 1 will return a maximum of one. If omitted, will return a maximum of one. |






<a name="ondewo.s2t.S2tCloudProviderConfigMicrosoft"></a>

### S2tCloudProviderConfigMicrosoft
Configuration details specific to the Microsoft Azure speech-to-text provider.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| use_fast_transcription_api | [bool](#bool) | optional | Optional. Enables or disables the Microsoft Azure fast transcription API. It is faster than SDK but is in preview version. More details at: https://learn.microsoft.com/en-us/azure/ai-services/speech-service/fast-transcription-create |
| use_detailed_output_format | [bool](#bool) | optional | Optional. Enables or disables the `detailed` format for the result of Microsoft Azure s2t service to add timestamps and confidences to the resulted transcript. |






<a name="ondewo.s2t.S2tCloudServiceAmazon"></a>

### S2tCloudServiceAmazon
S2tCloudServiceAmazon message contains settings for the Amazon web service Cloud service inference.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | Language of the audio to transcribe by Amazon web service s2t cloud service. It should be 4-letter language code (BCP-47) e.g. 'en-US' or 'de-DE'. |
| streaming_available | [bool](#bool) |  | Specifies if streaming mode of Amazon web service speech to text is available for the selected language, otherwise batch mode transcription is used. See the list of languages and available transcription modes at: https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html |
| enable_partial_results_stabilization | [bool](#bool) |  | Enables or disables partial_results_stabilization feature. More details at: https://docs.aws.amazon.com/transcribe/latest/dg/streaming-partial-results.html#streaming-partial-result-stabilization |
| partial_results_stability | [string](#string) |  | You can use this field to set the stability level of the transcription results. A higher stability level means that the transcription results are less likely to change. Higher stability levels can come with lower overall transcription accuracy. Defaults to "high" if not set explicitly. |
| language_model_name | [string](#string) |  | The name of your customize language model you want to use. More details at: https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html |
| vocabulary_name | [string](#string) |  | The name of your customize language model you want to use. More details at: https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html |






<a name="ondewo.s2t.S2tCloudServiceDeepgram"></a>

### S2tCloudServiceDeepgram
S2tCloudServiceDeepgram message contains settings for the Deepgram Cloud service inference.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_name | [string](#string) |  | Model name from one of the speech-to-text models provided by Deepgram for the desired use-case. Provided model names and details at: https://developers.deepgram.com/docs/model |
| language | [string](#string) |  | Language of the audio to transcribe by Deepgram s2t cloud service. It should be 4-letter language code (BCP-47) e.g. 'en-US' or 'de-DE'. |
| punctuate | [bool](#bool) |  | Enables or disables punctuate feature of Deepgram to add punctuations to the resulted transcript. More details at: https://developers.deepgram.com/docs/punctuation |
| smart_format | [bool](#bool) |  | Enables or disables smart_format feature of Deepgram transcription result to improve readability. More details at: https://developers.deepgram.com/docs/smart-format |
| numerals | [bool](#bool) |  | Enables or disables numerals feature of Deepgram to convert numbers to numeric form in the resulted transcript. More details at: https://developers.deepgram.com/docs/numerals |
| measurements | [bool](#bool) |  | Enables or disables measurements feature of Deepgram to convert measurement units (i.e. Kilogram) to abbreviated form (i.e. Kg) in the resulted transcript. More details at: https://developers.deepgram.com/docs/measurements |
| dictation | [bool](#bool) |  | Enables or disables dictation feature of Deepgram to convert spoken dictation commands into their corresponding punctuation marks. More details at: https://developers.deepgram.com/docs/dictation |






<a name="ondewo.s2t.S2tCloudServiceGoogle"></a>

### S2tCloudServiceGoogle
S2tCloudServiceGoogle message contains settings for the Google Cloud service inference.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_name | [string](#string) |  | Model name from one of the speech-to-text models provided by Google for the desired use-case. Provided model names and details at: https://cloud.google.com/speech-to-text/docs/transcription-model |
| language | [string](#string) |  | Language of the audio to transcribe by Google s2t cloud service. It should be 4-letter language code (BCP-47) e.g. 'en-US' or 'de-DE'. |
| enable_automatic_punctuation | [bool](#bool) |  | Enables or disables automatic_punctuation feature of Google s2t to add punctuations to the resulted transcript. More details at: https://cloud.google.com/speech-to-text/docs/automatic-punctuation |
| enable_word_time_offsets | [bool](#bool) |  | Enables or disables word_time_offsets feature of Google s2t to add word-level timestamps (time-offsets) to the resulted transcript. More details at: https://cloud.google.com/speech-to-text/docs/async-time-offsets |
| enable_word_confidence | [bool](#bool) |  | Enables or disables word_confidence feature of Google s2t to add word-level confidence scores to the resulted transcript. More details at: https://cloud.google.com/speech-to-text/docs/word-confidence |
| transcript_normalization | [bool](#bool) |  | Enables or disables transcript_normalization feature of Google s2t to automatically replace parts of the transcript with phrases of your choosing. More details at: https://cloud.google.com/speech-to-text/v2/docs/reference/rpc/google.cloud.speech.v2#transcriptnormalization |
| max_alternatives | [int32](#int32) |  | Maximum number of recognition hypotheses to be returned. The server may return fewer than max_alternatives. Valid values are 0-30. A value of 0 or 1 will return a maximum of one. If omitted, will return a maximum of one. |






<a name="ondewo.s2t.S2tCloudServiceMicrosoft"></a>

### S2tCloudServiceMicrosoft
S2tCloudServiceMicrosoft message contains settings for the Microsoft Azure Cloud service inference.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | Language of the audio to transcribe by Microsoft Azure s2t cloud service. It should be 4-letter language code (BCP-47) e.g. 'en-US' or 'de-DE'. |
| use_fast_transcription_api | [bool](#bool) |  | Enables or disables the Microsoft Azure fast transcription API. It is faster than SDK but is in preview version. More details at: https://learn.microsoft.com/en-us/azure/ai-services/speech-service/fast-transcription-create |
| use_detailed_output_format | [bool](#bool) |  | Enables or disables the `detailed` format for the result of Microsoft Azure s2t service to add timestamps and confidences to the resulted transcript. |






<a name="ondewo.s2t.S2tPipelineId"></a>

### S2tPipelineId
The pipeline id for a specific pipeline configuration


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | id of the model that will generate audio |






<a name="ondewo.s2t.Speech2TextConfig"></a>

### Speech2TextConfig
Speech2TextConfig is a configuration message for the speech-to-text pipeline


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Unique identifier for the configuration. |
| description | [S2TDescription](#ondewo.s2t.S2TDescription) |  | Description of the speech-to-text system. |
| active | [bool](#bool) |  | Indicates if the configuration is active. |
| inference | [S2TInference](#ondewo.s2t.S2TInference) |  | Configuration for inference models. |
| streaming_server | [StreamingServer](#ondewo.s2t.StreamingServer) |  | Configuration for the streaming server. |
| voice_activity_detection | [VoiceActivityDetection](#ondewo.s2t.VoiceActivityDetection) |  | Configuration for voice activity detection. |
| post_processing | [PostProcessing](#ondewo.s2t.PostProcessing) |  | Configuration for post-processing. |
| logging | [Logging](#ondewo.s2t.Logging) |  | Configuration for logging. |






<a name="ondewo.s2t.StreamingServer"></a>

### StreamingServer
StreamingServer contains information about the streaming server.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| host | [string](#string) |  | Hostname of the streaming server. |
| port | [int64](#int64) |  | Port number of the streaming server. |
| output_style | [string](#string) |  | Output style for the streaming server. |
| streaming_speech_recognition | [StreamingSpeechRecognition](#ondewo.s2t.StreamingSpeechRecognition) |  | Configuration for streaming speech recognition. |






<a name="ondewo.s2t.StreamingSpeechRecognition"></a>

### StreamingSpeechRecognition
StreamingSpeechRecognition contains information about streaming speech recognition settings.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcribe_not_final | [bool](#bool) |  | Indicates whether to transcribe non-final results. |
| decoding_method | [string](#string) |  | Decoding method for speech recognition. |
| sampling_rate | [int64](#int64) |  | Sampling rate for audio input. |
| min_audio_chunk_size | [int64](#int64) |  | Minimum audio chunk size for processing. |
| next_chunk_timeout | [float](#float) |  | Timeout between audio chunks; if exceeded, the stream will be stopped. |
| turn_detection | [TurnDetectionOptions](#ondewo.s2t.TurnDetectionOptions) |  | Configuration of the options to turn-detection in utterances |






<a name="ondewo.s2t.SymSpell"></a>

### SymSpell
SymSpell contains configuration for the SymSpell spelling correction.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| dict_path | [string](#string) |  | Path to the dictionary used by symspell |
| max_dictionary_edit_distance | [int64](#int64) |  | The maximal edit-distance to consider for spelling correction (affects performance - bigger number takes longer to process!) |
| prefix_length | [int64](#int64) |  | The length (number of characters) of the prefix to consider for filtering |






<a name="ondewo.s2t.TrainUserLanguageModelRequest"></a>

### TrainUserLanguageModelRequest
TrainUserLanguageModelRequest is used to request the training of a user-specific language model.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language_model_name | [string](#string) |  | Name of the language model to train. Example: "user_lm_1" |
| order | [int64](#int64) |  | Order n of the ngram. Example: 3 (for trigram model) |






<a name="ondewo.s2t.TranscribeFileRequest"></a>

### TranscribeFileRequest
A request to transcribe an audio file


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| audio_file | [bytes](#bytes) |  | wav file to transcribe |
| config | [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig) |  | The configuration to override the default configuration |






<a name="ondewo.s2t.TranscribeFileResponse"></a>

### TranscribeFileResponse
The response message for a transcribe file request


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcriptions | [Transcription](#ondewo.s2t.Transcription) | repeated | List of transcriptions with confidence level |
| time | [float](#float) |  | The time the transcription took |
| audio_uuid | [string](#string) |  | id of the transcribed audio file |






<a name="ondewo.s2t.TranscribeRequestConfig"></a>

### TranscribeRequestConfig
Configuration for a request to transcribe audio


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| s2t_pipeline_id | [string](#string) |  | Required. id of the pipeline (model setup) that will generate audio |
| decoding | [Decoding](#ondewo.s2t.Decoding) |  | Optional. decoding type |
| language_model_name | [string](#string) |  | Name of the language model |
| post_processing | [PostProcessingOptions](#ondewo.s2t.PostProcessingOptions) |  | The postprocessing options |
| utterance_detection | [UtteranceDetectionOptions](#ondewo.s2t.UtteranceDetectionOptions) |  | The utterance detection options |
| pyannote | [Pyannote](#ondewo.s2t.Pyannote) |  | Voice activity detection with pyannote |
| return_options | [TranscriptionReturnOptions](#ondewo.s2t.TranscriptionReturnOptions) |  | The transcribe return options |
| language | [string](#string) | optional | Optional. Specify language of transcription to return |
| task | [string](#string) | optional | Optional. Specify task of s2t model, e.g. 'transcribe' and 'translate' |
| s2t_service_config | [google.protobuf.Struct](#google.protobuf.Struct) | optional | Optional. s2t_service_config provides the configuration of the service such as API key, bearer tokens, JWT, and other header information as key value pairs, e.g., <pre><code>MY_API_KEY='LKJDIFe244LKJOI'</code></pre> A. For Amazon S2T service, the following arguments should be passed in form of a dict: A.1 aws_access_key_id (required) Access key id to access Amazon WEb Service. A.2 aws_secret_access_key (required) Secret access key to access Amazon WEb Service. A.3 region (required) Region name of Amazon Server. Example: s2t_config_service={'aws_access_key_id': 'YOUR_AWS_ACCESS_KEY_ID', 'aws_secret_access_key': 'YOUR_AWS_SECRET_ACCESS_KEY', 'region': 'YOUR_AMAZON_SERVER_REGION_NAME'} B. For Deepgram S2T service, the following argument should be passed in form of a dict: B.1 api_key (required) API key of Deepgram account to access Deepgram S2T service. Example: s2t_config_service={'api_key': 'YOUR_DEEPGRAM_API_KEY'} C. For Google cloud S2T service, the following arguments should be passed in form of a dict: C.1- api_key (required) API key of Google cloud to access its S2T service. C.2- api_endpoint (optional) Regional API endpoint of Google cloud S2T service. (Defaults to 'eu-speech.googleapis.com') Example: s2t_config_service={'api_key': 'YOUR_GOOGLE_CLOUD_API_KEY', 'api_endpoint': 'YOUR_GOOGLE_CLOUD_API_ENDPOINT'} D. For Microsoft Azure S2T service, the following arguments should be passed in form of a dict: D.1 subscription_key (required) Subscription key to access Microsoft Azure Service. D.2 region (required) Region name of Microsoft Azure Server. Example: s2t_config_service={'subscription_key': 'YOUR_MICROSOFT_AZURE_SUBSCRIPTION_KEY', 'region': 'YOUR_MICROSOFT_AZURE_SERVER_REGION_NAME'} Note: ondewo-s2t will raise an error if you don't pass any of the required arguments above. |
| s2t_cloud_provider_config | [S2tCloudProviderConfig](#ondewo.s2t.S2tCloudProviderConfig) | optional | Optional. Defines the cloud provider's specific configuration for using speech to text cloud services The default value is None. |






<a name="ondewo.s2t.TranscribeStreamRequest"></a>

### TranscribeStreamRequest
Request to transcribe an audio stream


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| audio_chunk | [bytes](#bytes) |  | wav file to transcribe |
| end_of_stream | [bool](#bool) |  | if it's the final chunk of the stream |
| config | [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig) |  | The configuration to override the default configuration |
| mute_audio | [bool](#bool) |  | Whether or not to mute the audio signal. Defaults to false. |






<a name="ondewo.s2t.TranscribeStreamResponse"></a>

### TranscribeStreamResponse
The response message of a stream transcription


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcriptions | [Transcription](#ondewo.s2t.Transcription) | repeated | List of transcriptions with confidence level |
| time | [float](#float) |  | The time the transcription took |
| final | [bool](#bool) |  | Whether or not this transcription is final (transcribed texts might change if transcription is started before the end of an utterance). |
| return_audio | [bool](#bool) |  | is audio bytes of the utterance in response |
| audio | [bytes](#bytes) |  | audio bytes of the transcribed utterance |
| utterance_start | [bool](#bool) |  | is it a start of the utterance |
| audio_uuid | [string](#string) |  | id of the transcribed audio file |
| config | [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig) |  | The configuration for the transcription |






<a name="ondewo.s2t.Transcription"></a>

### Transcription
The transcription message


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcription | [string](#string) |  | The transcribed text |
| confidence_score | [float](#float) |  | The corresponding confidence score. The confidence estimate between 0.0 and 1.0. A higher number indicates an estimated greater likelihood that the recognized words are correct. |
| words | [WordDetail](#ondewo.s2t.WordDetail) | repeated | List of the words of transcription with their confidence scores and probable alternatives |
| alternatives | [TranscriptionAlternative](#ondewo.s2t.TranscriptionAlternative) | repeated | List of alternative transcriptions, confidence scores, words timings and alternative words |






<a name="ondewo.s2t.TranscriptionAlternative"></a>

### TranscriptionAlternative



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcript | [string](#string) |  | The alternative transcribed text |
| confidence | [float](#float) |  | The corresponding confidence score to the alternative transcript. |
| words | [WordDetail](#ondewo.s2t.WordDetail) | repeated | A list of word-specific information for each recognized word, including word timings, confidence score of the word and alternative words. |






<a name="ondewo.s2t.TranscriptionReturnOptions"></a>

### TranscriptionReturnOptions
Configuration of the return values of a transcribe request


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| return_start_of_speech | [bool](#bool) |  | should server make response indicating that the beginning of the speech was detected |
| return_audio | [bool](#bool) |  | should s2t server return audio bytes of transcribed utterance |
| return_confidence_score | [bool](#bool) |  | Whether or not to return confidence scores |
| return_alternative_transcriptions | [bool](#bool) |  | Whether or not to return alternative results from beam-search |
| return_alternative_transcriptions_nr | [int32](#int32) |  | Optional. Number of alternative transcriptions results from beam-search or greedy-search |
| return_alternative_words | [bool](#bool) |  | Whether or not to return alternative results from beam-search |
| return_alternative_words_nr | [int32](#int32) |  | Optional. Number of alternative words to results |
| return_word_timing | [bool](#bool) |  | Optional. Whether or not to return timestamps of start and end of the words. Only used in TranscribeFile. |






<a name="ondewo.s2t.TurnDetectionOptions"></a>

### TurnDetectionOptions
Configuration of the options to turn-detection in utterances


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the turn-detection feature is active. |
| full_utterance_deployment | [bool](#bool) | optional | Optional. Whether to transcribe the whole utterance when turn moment is detected. It is helpful to increase accuracy of transcriptions in cost of drop in speed. If deactivated, it just transcribe from last short silence period and concatenates the transcriptions of small audio chunks between tiny silences. |
| llm_grpc_host | [string](#string) | optional | Optional. Host name or IP address of the server that serves the LLM for turn-detection purpose. |
| llm_grpc_port | [int32](#int32) | optional | Optional. Port number of the server that serves the LLM for turn-detection purpose. |
| llm_request_timeout | [float](#float) | optional | Optional. Duration of request timeout in seconds to get result of request to LLM for turn-detection purpose. If the timeout occurs, result of turn-detection considered as False. |






<a name="ondewo.s2t.UtteranceDetectionOptions"></a>

### UtteranceDetectionOptions
Configuration of the options to detect utterances


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcribe_not_final | [bool](#bool) |  | Return also immediate transcription results |
| next_chunk_timeout | [float](#float) |  | if time between audio chunks exceeds next_chunk_timeout, stream will be stopped |
| turn_detection | [TurnDetectionOptions](#ondewo.s2t.TurnDetectionOptions) |  | The turn detection options |






<a name="ondewo.s2t.VoiceActivityDetection"></a>

### VoiceActivityDetection
VoiceActivityDetection contains information about voice activity detection settings.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [string](#string) |  | Indicates if voice activity detection is active. |
| sampling_rate | [int64](#int64) |  | Sampling rate for voice activity detection. |
| pyannote | [Pyannote](#ondewo.s2t.Pyannote) |  | Configuration for the Pyannote model. |






<a name="ondewo.s2t.Wav2Vec"></a>

### Wav2Vec
Wav2Vec contains information about the Wav2Vec model.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_path | [string](#string) |  | Path to the model. |
| use_gpu | [bool](#bool) |  | Indicates if GPU is used. |






<a name="ondewo.s2t.Wav2VecTriton"></a>

### Wav2VecTriton
Wav2VecTriton contains information about the Wav2Vec model using Triton.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| processor_path | [string](#string) |  | Path to the processor. |
| triton_model_name | [string](#string) |  | Name of the Triton model. |
| triton_model_version | [string](#string) |  | Version of the Triton model. |
| check_status_timeout | [int64](#int64) |  | Timeout for checking model status. |
| triton_server_host | [string](#string) |  | Host name of triton inference server that serves the Wav2VecTriton model |
| triton_server_port | [int64](#int64) |  | Port number of triton inference server that serves the Wav2VecTriton model |






<a name="ondewo.s2t.Whisper"></a>

### Whisper
Whisper contains information about the Whisper model.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_path | [string](#string) |  | Path to the model. |
| use_gpu | [bool](#bool) |  | Indicates if GPU is used. |
| language | [string](#string) |  | Default language of the model. |
| task | [string](#string) |  | Default task of the model. |






<a name="ondewo.s2t.WhisperTriton"></a>

### WhisperTriton
WhisperTriton contains information about the Whisper model using Triton.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| processor_path | [string](#string) |  | Path to the processor. |
| triton_model_name | [string](#string) |  | Name of the Triton model. |
| triton_model_version | [string](#string) |  | Version of the Triton model. |
| check_status_timeout | [int64](#int64) |  | Timeout for checking model status. |
| language | [string](#string) |  | Default language of the model. |
| task | [string](#string) |  | Default task of the model. E.g., transcribe, translate, etc. |
| triton_server_host | [string](#string) |  | Host name of triton inference server that serves the WhisperTriton model |
| triton_server_port | [int64](#int64) |  | Port number of triton inference server that serves the WhisperTriton model |






<a name="ondewo.s2t.WordAlternative"></a>

### WordAlternative



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| word | [string](#string) |  | The recognized word corresponding to this set of information. |
| confidence | [float](#float) |  | The corresponding confidence score to the alternative word. |






<a name="ondewo.s2t.WordDetail"></a>

### WordDetail
WordDetail provides word-specific information for recognized words.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| start_time | [float](#float) |  | The start time of the spoken word relative to the beginning of the audio. The accuracy of the time offset can vary, and this is an experimental feature. |
| end_time | [float](#float) |  | The end time of the spoken word relative to the beginning of the audio. The accuracy of the time offset can vary, and this is an experimental feature. |
| word | [string](#string) |  | The recognized word corresponding to this set of information. |
| confidence | [float](#float) |  | The corresponding confidence score to the word. |
| word_alternatives | [WordAlternative](#ondewo.s2t.WordAlternative) | repeated | List of alternative words and confidence scores of each. |





 <!-- end messages -->


<a name="ondewo.s2t.Decoding"></a>

### Decoding
The decoding configuration

| Name | Number | Description |
| ---- | ------ | ----------- |
| DEFAULT | 0 | decoding will be defined by the pipeline config |
| GREEDY | 1 | greedy decoding will be used independently on pipeline config |
| BEAM_SEARCH_WITH_LM | 2 | beam search will be used independently on pipeline config |
| BEAM_SEARCH | 3 | beam search without LM head, to configure decoding mode for seq2seq models. |



<a name="ondewo.s2t.InferenceBackend"></a>

### InferenceBackend


| Name | Number | Description |
| ---- | ------ | ----------- |
| INFERENCE_BACKEND_UNKNOWN | 0 | Not set |
| INFERENCE_BACKEND_PYTORCH | 1 | Run pytorch model |
| INFERENCE_BACKEND_FLAX | 2 | Run flax model |
| INFERENCE_BACKEND_CLOUD_SERVICE_AMAZON | 3 | Run Amazon S2T cloud service |
| INFERENCE_BACKEND_CLOUD_SERVICE_DEEPGRAM | 4 | Run Deepgram S2T cloud service |
| INFERENCE_BACKEND_CLOUD_SERVICE_GOOGLE | 5 | Run Google S2T cloud service |
| INFERENCE_BACKEND_CLOUD_SERVICE_MICROSOFT | 6 | Run Microsoft Azure S2T cloud service |


 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="ondewo.s2t.Speech2Text"></a>

### Speech2Text
Speech-to-text service

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| TranscribeFile | [TranscribeFileRequest](#ondewo.s2t.TranscribeFileRequest) | [TranscribeFileResponse](#ondewo.s2t.TranscribeFileResponse) | Transcribes an audio file |
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
| CreateUserLanguageModel | [CreateUserLanguageModelRequest](#ondewo.s2t.CreateUserLanguageModelRequest) | [.google.protobuf.Empty](#google.protobuf.Empty) | Create a user language model. |
| DeleteUserLanguageModel | [DeleteUserLanguageModelRequest](#ondewo.s2t.DeleteUserLanguageModelRequest) | [.google.protobuf.Empty](#google.protobuf.Empty) | Delete a user language model. |
| AddDataToUserLanguageModel | [AddDataToUserLanguageModelRequest](#ondewo.s2t.AddDataToUserLanguageModelRequest) | [.google.protobuf.Empty](#google.protobuf.Empty) | Add data to a user language model. |
| TrainUserLanguageModel | [TrainUserLanguageModelRequest](#ondewo.s2t.TrainUserLanguageModelRequest) | [.google.protobuf.Empty](#google.protobuf.Empty) | Train a user language model. |

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
