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
    - [ListS2tNormalizationPipelinesRequest](#ondewo.s2t.ListS2tNormalizationPipelinesRequest)
    - [ListS2tNormalizationPipelinesResponse](#ondewo.s2t.ListS2tNormalizationPipelinesResponse)
    - [ListS2tPipelinesRequest](#ondewo.s2t.ListS2tPipelinesRequest)
    - [ListS2tPipelinesResponse](#ondewo.s2t.ListS2tPipelinesResponse)
    - [Logging](#ondewo.s2t.Logging)
    - [PostProcessing](#ondewo.s2t.PostProcessing)
    - [PostProcessingOptions](#ondewo.s2t.PostProcessingOptions)
    - [PostProcessors](#ondewo.s2t.PostProcessors)
    - [PtFiles](#ondewo.s2t.PtFiles)
    - [Pyannote](#ondewo.s2t.Pyannote)
    - [S2tCloudProviderConfig](#ondewo.s2t.S2tCloudProviderConfig)
    - [S2tCloudProviderConfigAmazon](#ondewo.s2t.S2tCloudProviderConfigAmazon)
    - [S2tCloudProviderConfigDeepgram](#ondewo.s2t.S2tCloudProviderConfigDeepgram)
    - [S2tCloudProviderConfigGoogle](#ondewo.s2t.S2tCloudProviderConfigGoogle)
    - [S2tCloudProviderConfigMicrosoft](#ondewo.s2t.S2tCloudProviderConfigMicrosoft)
    - [S2tCloudServiceAmazon](#ondewo.s2t.S2tCloudServiceAmazon)
    - [S2tCloudServiceDeepgram](#ondewo.s2t.S2tCloudServiceDeepgram)
    - [S2tCloudServiceGoogle](#ondewo.s2t.S2tCloudServiceGoogle)
    - [S2tCloudServiceMicrosoft](#ondewo.s2t.S2tCloudServiceMicrosoft)
    - [S2tDescription](#ondewo.s2t.S2tDescription)
    - [S2tGetServiceInfoResponse](#ondewo.s2t.S2tGetServiceInfoResponse)
    - [S2tInference](#ondewo.s2t.S2tInference)
    - [S2tLlmPostProcessing](#ondewo.s2t.S2tLlmPostProcessing)
    - [S2tLlmPostProcessingCasingOptions](#ondewo.s2t.S2tLlmPostProcessingCasingOptions)
    - [S2tLlmPostProcessingInverseNormalizationOptions](#ondewo.s2t.S2tLlmPostProcessingInverseNormalizationOptions)
    - [S2tLlmPostProcessingNormalizationOptions](#ondewo.s2t.S2tLlmPostProcessingNormalizationOptions)
    - [S2tLlmPostProcessingPunctuationOptions](#ondewo.s2t.S2tLlmPostProcessingPunctuationOptions)
    - [S2tLlmPostProcessingSemanticCorrectionOptions](#ondewo.s2t.S2tLlmPostProcessingSemanticCorrectionOptions)
    - [S2tLlmPostProcessingSpellCorrectionOptions](#ondewo.s2t.S2tLlmPostProcessingSpellCorrectionOptions)
    - [S2tLlmPostProcessingSummarizationOptions](#ondewo.s2t.S2tLlmPostProcessingSummarizationOptions)
    - [S2tLlmPostProcessingTranslationOptions](#ondewo.s2t.S2tLlmPostProcessingTranslationOptions)
    - [S2tLlmPostProcessingUserPromptOptions](#ondewo.s2t.S2tLlmPostProcessingUserPromptOptions)
    - [S2tNormalization](#ondewo.s2t.S2tNormalization)
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
<p>AcousticModels contains information about different types of acoustic models.</p>


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
<p>AddDataToUserLanguageModelRequest is used to request the addition of data to a user-specific language model.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language_model_name | [string](#string) |  | Name of the language model to which to add data. Example: &quot;user_lm_1&quot; |
| zipped_data | [bytes](#bytes) |  | Zip file containing data in the form of text files. Example: A zip file with text files containing sentences or phrases in the target language. |






<a name="ondewo.s2t.CkptFile"></a>

### CkptFile
<p>CkptFile contains information about checkpoint files.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| path | [string](#string) |  | Path to the checkpoint file. |






<a name="ondewo.s2t.CreateUserLanguageModelRequest"></a>

### CreateUserLanguageModelRequest
<p>CreateUserLanguageModelRequest is used to request the creation of a new user-specific language model.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language_model_name | [string](#string) |  | Name of the language model to create. Example: &quot;user_lm_1&quot; |






<a name="ondewo.s2t.DeleteUserLanguageModelRequest"></a>

### DeleteUserLanguageModelRequest
<p>DeleteUserLanguageModelRequest is used to request the deletion of a user-specific language model.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language_model_name | [string](#string) |  | Name of the language model to delete. Example: &quot;user_lm_1&quot; |






<a name="ondewo.s2t.LanguageModelPipelineId"></a>

### LanguageModelPipelineId
<p>LanguageModelPipelineId contains information about a pipeline and its available language models.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pipeline_id | [string](#string) |  | A pipeline ID. Example: &quot;pipeline_1&quot; |
| model_names | [string](#string) | repeated | A list of all available language models for the corresponding pipeline ID. Example: [&quot;model_1&quot;, &quot;model_2&quot;] |






<a name="ondewo.s2t.LanguageModels"></a>

### LanguageModels
<p>LanguageModels contains information about language models.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| path | [string](#string) |  | Path to the directory of language models. |
| beam_size | [int64](#int64) |  | Beam size for the search algorithm. |
| default_lm | [string](#string) |  | Default language model to be selected if none is given. |
| beam_search_scorer_alpha | [float](#float) |  | Weight for the language model scorer (alpha). |
| beam_search_scorer_beta | [float](#float) |  | Weight for the word insertion penalty (beta). |






<a name="ondewo.s2t.ListS2tDomainsRequest"></a>

### ListS2tDomainsRequest
<p>Request message to list available domains. Optionally also filters can be set.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| languages | [string](#string) | repeated | Filter for languages |
| pipeline_owners | [string](#string) | repeated | Filter for pipeline owner |






<a name="ondewo.s2t.ListS2tDomainsResponse"></a>

### ListS2tDomainsResponse
<p>Response message to list available domains</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| domains | [string](#string) | repeated | domains available. Example: [&quot;medical&quot;, &quot;finance&quot;] |






<a name="ondewo.s2t.ListS2tLanguageModelsRequest"></a>

### ListS2tLanguageModelsRequest
<p>ListS2tLanguageModelsRequest is used to request a list of available language models for specified pipelines.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| ids | [string](#string) | repeated | List of pipeline IDs to retrieve their available language models. Example: [&quot;pipeline_1&quot;, &quot;pipeline_2&quot;] |






<a name="ondewo.s2t.ListS2tLanguageModelsResponse"></a>

### ListS2tLanguageModelsResponse
<p>ListS2tLanguageModelsResponse is used to return the available language models for specified pipelines.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| lm_pipeline_ids | [LanguageModelPipelineId](#ondewo.s2t.LanguageModelPipelineId) | repeated | Response is a list of <code>LanguageModelPipelineId</code>, where each element contains a pipeline ID and its associated language models. Example: [{pipeline_id: &quot;pipeline_1&quot;, model_names: [&quot;model_1&quot;, &quot;model_2&quot;]}, {pipeline_id: &quot;pipeline_2&quot;, model_names: [&quot;model_3&quot;]}] |






<a name="ondewo.s2t.ListS2tLanguagesRequest"></a>

### ListS2tLanguagesRequest
<p>ListS2tLanguagesRequest is used to request a list of available languages. Optionally, filters can be set.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| domains | [string](#string) | repeated | Filter for domains. Example: [&quot;medical&quot;, &quot;finance&quot;] |
| pipeline_owners | [string](#string) | repeated | Filter for pipeline owners. Example: [&quot;ondewo&quot;, &quot;partner_company&quot;] |






<a name="ondewo.s2t.ListS2tLanguagesResponse"></a>

### ListS2tLanguagesResponse
<p>Response message to list available languages</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| languages | [string](#string) | repeated | available languages |






<a name="ondewo.s2t.ListS2tNormalizationPipelinesRequest"></a>

### ListS2tNormalizationPipelinesRequest
<p>The request message for <code>ListS2tNormalizationPipelines</code>.</p>
<p>Filter pipelines by attributes in request.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | Optional. Define the language. |






<a name="ondewo.s2t.ListS2tNormalizationPipelinesResponse"></a>

### ListS2tNormalizationPipelinesResponse
<p>The response message for <code>ListS2tNormalizationPipelines</code>.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| s2t_normalization_pipelines | [string](#string) | repeated | Required. Representation of a list of normalization pipelines configurations. Retrieved by <code>ListS2tNormalizationPipelines</code>, containing the configurations of normalization pipelines with the specifications received in the <code>ListS2tNormalizationPipelinesRequest</code>. |






<a name="ondewo.s2t.ListS2tPipelinesRequest"></a>

### ListS2tPipelinesRequest
<p>Request to list all speech-to-text pipelines. Optionally also filter criteria can be set</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| languages | [string](#string) | repeated | Filter for languages |
| pipeline_owners | [string](#string) | repeated | Filter for pipeline owners |
| domains | [string](#string) | repeated | Filter for domains |
| registered_only | [bool](#bool) |  | If true, return only registered pipelines. Default false: return registered and persisted (from config files) configs. |






<a name="ondewo.s2t.ListS2tPipelinesResponse"></a>

### ListS2tPipelinesResponse
<p>ListS2tPipelinesResponse is used to return a list of all speech-to-text pipelines.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pipeline_configs | [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig) | repeated | A list of <code>Speech2TextConfig</code> message instances containing the configuration of each pipeline. Example: [{id: &quot;pipeline_1&quot;, description: {language: &quot;en&quot;}, active: true, ...}, {id: &quot;pipeline_2&quot;, description: {language: &quot;fr&quot;}, active: true, ...}] |






<a name="ondewo.s2t.Logging"></a>

### Logging
<p>Logging contains configuration for logging.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [string](#string) |  | Type of logging. |
| path | [string](#string) |  | Path for logging. |






<a name="ondewo.s2t.PostProcessing"></a>

### PostProcessing
<p>PostProcessing contains the configuration for post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pipeline | [string](#string) | repeated | List of names of active post-processors. |
| post_processors | [PostProcessors](#ondewo.s2t.PostProcessors) |  | Post-processor configurations. |






<a name="ondewo.s2t.PostProcessingOptions"></a>

### PostProcessingOptions
<p>Configuration of the post-processing options</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| spelling_correction | [bool](#bool) |  | Whether to use spelling correction |
| normalize | [bool](#bool) |  | Whether to disable normalization |
| config | [PostProcessing](#ondewo.s2t.PostProcessing) |  | Post-processing configuration specifying the active post-processors in the pipeline, as well as their individual configuration. If not set, all values are replaced by the ones in current pipeline. |
| llm_post_processing | [bool](#bool) |  | Whether to disable LLM post-processing |






<a name="ondewo.s2t.PostProcessors"></a>

### PostProcessors
<p>PostProcessors contains configurations for post-processors.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| sym_spell | [SymSpell](#ondewo.s2t.SymSpell) |  | Configuration of the SymSpell spelling correction. |
| normalization | [S2tNormalization](#ondewo.s2t.S2tNormalization) |  | Configuration of the normalization object. |
| llm_post_processing | [S2tLlmPostProcessing](#ondewo.s2t.S2tLlmPostProcessing) |  | Configuration of the LLM post-processing. |






<a name="ondewo.s2t.PtFiles"></a>

### PtFiles
<p>PtFiles contains information about PT files.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| path | [string](#string) |  | Path to the PT files. |
| step | [string](#string) |  | Step for the PT files. |






<a name="ondewo.s2t.Pyannote"></a>

### Pyannote
<p>Pyannote contains configuration for the Pyannote voice activity detection model.</p>
<p>Library: <a href="https://github.com/pyannote/pyannote-audio/blob/develop/tutorials/voice_activity_detection.ipynb">pyannote-audio</a></p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_name | [string](#string) |  | Full name of the Pyannote model. |
| min_audio_size | [int64](#int64) |  | Minimum audio size for processing. |
| min_duration_off | [float](#float) |  | Fill inactive regions shorter than that many seconds. Example <a href="https://github.com/pyannote/pyannote-audio/blob/develop/tutorials/voice_activity_detection.ipynb">notebook</a> |
| min_duration_on | [float](#float) |  | Remove active regions shorter than that many seconds. Example <a href="https://github.com/pyannote/pyannote-audio/blob/develop/tutorials/voice_activity_detection.ipynb">notebook</a> |
| triton_server_host | [string](#string) |  | Host name of triton inference server that serves the Pyannote model |
| triton_server_port | [int64](#int64) |  | Port number of triton inference server that serves the Pyannote model |






<a name="ondewo.s2t.S2tCloudProviderConfig"></a>

### S2tCloudProviderConfig
<p>Configuration for cloud provider settings for Speech-to-Text (S2T).</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| s2t_cloud_provider_config_amazon | [S2tCloudProviderConfigAmazon](#ondewo.s2t.S2tCloudProviderConfigAmazon) | optional | Optional. Configuration for Amazon web service speech-to-text provider. |
| s2t_cloud_provider_config_deepgram | [S2tCloudProviderConfigDeepgram](#ondewo.s2t.S2tCloudProviderConfigDeepgram) | optional | Optional. Configuration for DeepGram speech-to-text provider. |
| s2t_cloud_provider_config_google | [S2tCloudProviderConfigGoogle](#ondewo.s2t.S2tCloudProviderConfigGoogle) | optional | Optional. Configuration for Google speech-to-text provider. |
| s2t_cloud_provider_config_microsoft | [S2tCloudProviderConfigMicrosoft](#ondewo.s2t.S2tCloudProviderConfigMicrosoft) | optional | Optional. Configuration for Microsoft Azure speech-to-text provider. |






<a name="ondewo.s2t.S2tCloudProviderConfigAmazon"></a>

### S2tCloudProviderConfigAmazon
<p>Configuration details specific to the Amazon web service speech-to-text provider.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_partial_results_stabilization | [bool](#bool) | optional | Optional. Enables or disables <code>partial_results_stabilization</code> feature. More details at: <a href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming-partial-results.html#streaming-partial-result-stabilization">https://docs.aws.amazon.com/transcribe/latest/dg/streaming-partial-results.html#streaming-partial-result-stabilization</a> |
| partial_results_stability | [string](#string) | optional | Optional. You can use this field to set the stability level of the transcription results. A higher stability level means that the transcription results are less likely to change. Higher stability levels can come with lower overall transcription accuracy. Acceptable values: [&quot;low&quot;, &quot;medium&quot;, &quot;high&quot;]. Defaults to &quot;high&quot; if not set explicitly. More details at: <a href="https://aws.amazon.com/blogs/machine-learning/amazon-transcribe-now-supports-partial-results-stabilization-for-streaming-audio/">https://aws.amazon.com/blogs/machine-learning/amazon-transcribe-now-supports-partial-results-stabilization-for-streaming-audio/</a> |
| language_model_name | [string](#string) | optional | Optional. The name of your customize language model you want to use. More details at: <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html">https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html</a> |
| vocabulary_name | [string](#string) | optional | Optional. The name of your customize vocabulary you want to use. More details at: <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html</a> |






<a name="ondewo.s2t.S2tCloudProviderConfigDeepgram"></a>

### S2tCloudProviderConfigDeepgram
<p>Configuration details specific to the Deepgram speech-to-text provider.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| punctuate | [bool](#bool) | optional | Optional. Enables or disables <code>punctuate</code> feature of Deepgram to add punctuations to the resulted transcript. More details at: <a href="https://developers.deepgram.com/docs/punctuation">https://developers.deepgram.com/docs/punctuation</a> |
| smart_format | [bool](#bool) | optional | Optional. Enables or disables <code>smart_format</code> feature of Deepgram transcription result to improve readability. More details at: <a href="https://developers.deepgram.com/docs/smart-format">https://developers.deepgram.com/docs/smart-format</a> |
| numerals | [bool](#bool) | optional | Optional. Enables or disables <code>numerals</code> feature of Deepgram to convert numbers to numeric form in the resulted transcript. More details at: <a href="https://developers.deepgram.com/docs/numerals">https://developers.deepgram.com/docs/numerals</a> |
| measurements | [bool](#bool) | optional | Optional. Enables or disables <code>measurements</code> feature of Deepgram to convert measurement units (i.e. Kilogram) to abbreviated form (i.e. Kg) in the resulted transcript. More details at: <a href="https://developers.deepgram.com/docs/measurements">https://developers.deepgram.com/docs/measurements</a> |
| dictation | [bool](#bool) | optional | Optional. Enables or disables <code>dictation</code> feature of Deepgram to convert spoken dictation commands into their corresponding punctuation marks. More details at: <a href="https://developers.deepgram.com/docs/dictation">https://developers.deepgram.com/docs/dictation</a> |






<a name="ondewo.s2t.S2tCloudProviderConfigGoogle"></a>

### S2tCloudProviderConfigGoogle
<p>Configuration details specific to the Google speech-to-text provider.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_automatic_punctuation | [bool](#bool) | optional | Optional. Enables or disables <code>automatic_punctuation</code> feature of Google s2t to add punctuations to the resulted transcript. More details at: <a href="https://cloud.google.com/speech-to-text/docs/automatic-punctuation">https://cloud.google.com/speech-to-text/docs/automatic-punctuation</a> |
| enable_word_time_offsets | [bool](#bool) | optional | Optional. Enables or disables <code>word_time_offsets</code> feature of Google s2t to add word-level timestamps (time-offset) to the resulted transcript. More details at: <a href="https://cloud.google.com/speech-to-text/docs/async-time-offsets">https://cloud.google.com/speech-to-text/docs/async-time-offsets</a> |
| enable_word_confidence | [bool](#bool) | optional | Optional. Enables or disables <code>word_confidence</code> feature of Google s2t to add word-level confidence scores to the resulted transcript. More details at: <a href="https://cloud.google.com/speech-to-text/docs/word-confidence">https://cloud.google.com/speech-to-text/docs/word-confidence</a> |
| transcript_normalization | [bool](#bool) | optional | Optional. Enables or disables <code>transcript_normalization</code> feature of Google s2t to automatically replace parts of the transcript with phrases of your choosing. More details at: <a href="https://cloud.google.com/speech-to-text/v2/docs/reference/rpc/google.cloud.speech.v2#transcriptnormalization">https://cloud.google.com/speech-to-text/v2/docs/reference/rpc/google.cloud.speech.v2#transcriptnormalization</a> |
| max_alternatives | [int32](#int32) | optional | Optional. Maximum number of recognition hypotheses to be returned, may be returned fewer than <code>max_alternatives</code>. Valid values are 0-30. A value of 0 or 1 will return a maximum of one. If omitted, will return a maximum of one. |






<a name="ondewo.s2t.S2tCloudProviderConfigMicrosoft"></a>

### S2tCloudProviderConfigMicrosoft
<p>Configuration details specific to the Microsoft Azure speech-to-text provider.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| use_fast_transcription_api | [bool](#bool) | optional | Optional. Enables or disables the Microsoft Azure fast transcription API. It is faster than SDK but is in preview version. More details at: <a href="https://learn.microsoft.com/en-us/azure/ai-services/speech-service/fast-transcription-create">https://learn.microsoft.com/en-us/azure/ai-services/speech-service/fast-transcription-create</a> |
| use_detailed_output_format | [bool](#bool) | optional | Optional. Enables or disables the <code>detailed</code> format for the result of Microsoft Azure s2t service to add timestamps and confidences to the resulted transcript. |






<a name="ondewo.s2t.S2tCloudServiceAmazon"></a>

### S2tCloudServiceAmazon
<p>S2tCloudServiceAmazon message contains settings for the Amazon web service Cloud service inference.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | Language of the audio to transcribe by Amazon web service s2t cloud service. It should be 4-letter language code (BCP-47) e.g. &apos;en-US&apos; or &apos;de-DE&apos;. |
| streaming_available | [bool](#bool) |  | Specifies if streaming mode of Amazon web service speech to text is available for the selected language, otherwise batch mode transcription is used. See the list of languages and available transcription modes at: <a href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html</a> |
| enable_partial_results_stabilization | [bool](#bool) |  | Enables or disables <code>partial_results_stabilization</code> feature. More details at: <a href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming-partial-results.html#streaming-partial-result-stabilization">https://docs.aws.amazon.com/transcribe/latest/dg/streaming-partial-results.html#streaming-partial-result-stabilization</a> |
| partial_results_stability | [string](#string) |  | You can use this field to set the stability level of the transcription results. A higher stability level means that the transcription results are less likely to change. Higher stability levels can come with lower overall transcription accuracy. Defaults to &quot;high&quot; if not set explicitly. |
| language_model_name | [string](#string) |  | The name of your customize language model you want to use. More details at: <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html">https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html</a> |
| vocabulary_name | [string](#string) |  | The name of your customize vocabulary you want to use. More details at: <a href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html</a> |






<a name="ondewo.s2t.S2tCloudServiceDeepgram"></a>

### S2tCloudServiceDeepgram
<p>S2tCloudServiceDeepgram message contains settings for the Deepgram Cloud service inference.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_name | [string](#string) |  | Model name from one of the speech-to-text models provided by Deepgram for the desired use-case. Provided model names and details at: <a href="https://developers.deepgram.com/docs/model">https://developers.deepgram.com/docs/model</a> |
| language | [string](#string) |  | Language of the audio to transcribe by Deepgram s2t cloud service. It should be 4-letter language code (BCP-47) e.g. &apos;en-US&apos; or &apos;de-DE&apos;. |
| punctuate | [bool](#bool) |  | Enables or disables <code>punctuate</code> feature of Deepgram to add punctuations to the resulted transcript. More details at: <a href="https://developers.deepgram.com/docs/punctuation">https://developers.deepgram.com/docs/punctuation</a> |
| smart_format | [bool](#bool) |  | Enables or disables <code>smart_format</code> feature of Deepgram transcription result to improve readability. More details at: <a href="https://developers.deepgram.com/docs/smart-format">https://developers.deepgram.com/docs/smart-format</a> |
| numerals | [bool](#bool) |  | Enables or disables <code>numerals</code> feature of Deepgram to convert numbers to numeric form in the resulted transcript. More details at: <a href="https://developers.deepgram.com/docs/numerals">https://developers.deepgram.com/docs/numerals</a> |
| measurements | [bool](#bool) |  | Enables or disables <code>measurements</code> feature of Deepgram to convert measurement units (i.e. Kilogram) to abbreviated form (i.e. Kg) in the resulted transcript. More details at: <a href="https://developers.deepgram.com/docs/measurements">https://developers.deepgram.com/docs/measurements</a> |
| dictation | [bool](#bool) |  | Enables or disables <code>dictation</code> feature of Deepgram to convert spoken dictation commands into their corresponding punctuation marks. More details at: <a href="https://developers.deepgram.com/docs/dictation">https://developers.deepgram.com/docs/dictation</a> |






<a name="ondewo.s2t.S2tCloudServiceGoogle"></a>

### S2tCloudServiceGoogle
<p>S2tCloudServiceGoogle message contains settings for the Google Cloud service inference.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_name | [string](#string) |  | Model name from one of the speech-to-text models provided by Google for the desired use-case. Provided model names and details at: <a href="https://cloud.google.com/speech-to-text/docs/transcription-model">https://cloud.google.com/speech-to-text/docs/transcription-model</a> |
| language | [string](#string) |  | Language of the audio to transcribe by Google s2t cloud service. It should be 4-letter language code (BCP-47) e.g. &apos;en-US&apos; or &apos;de-DE&apos;. |
| enable_automatic_punctuation | [bool](#bool) |  | Enables or disables <code>automatic_punctuation</code> feature of Google s2t to add punctuations to the resulted transcript. More details at: <a href="https://cloud.google.com/speech-to-text/docs/automatic-punctuation">https://cloud.google.com/speech-to-text/docs/automatic-punctuation</a> |
| enable_word_time_offsets | [bool](#bool) |  | Enables or disables <code>word_time_offsets</code> feature of Google s2t to add word-level timestamps (time-offsets) to the resulted transcript. More details at: <a href="https://cloud.google.com/speech-to-text/docs/async-time-offsets">https://cloud.google.com/speech-to-text/docs/async-time-offsets</a> |
| enable_word_confidence | [bool](#bool) |  | Enables or disables <code>word_confidence</code> feature of Google s2t to add word-level confidence scores to the resulted transcript. More details at: <a href="https://cloud.google.com/speech-to-text/docs/word-confidence">https://cloud.google.com/speech-to-text/docs/word-confidence</a> |
| transcript_normalization | [bool](#bool) |  | Enables or disables <code>transcript_normalization</code> feature of Google s2t to automatically replace parts of the transcript with phrases of your choosing. More details at: <a href="https://cloud.google.com/speech-to-text/v2/docs/reference/rpc/google.cloud.speech.v2#transcriptnormalization">https://cloud.google.com/speech-to-text/v2/docs/reference/rpc/google.cloud.speech.v2#transcriptnormalization</a> |
| max_alternatives | [int32](#int32) |  | Maximum number of recognition hypotheses to be returned. The server may return fewer than <code>max_alternatives</code>. Valid values are 0-30. A value of 0 or 1 will return a maximum of one. If omitted, will return a maximum of one. |






<a name="ondewo.s2t.S2tCloudServiceMicrosoft"></a>

### S2tCloudServiceMicrosoft
<p>S2tCloudServiceMicrosoft message contains settings for the Microsoft Azure Cloud service inference.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | Language of the audio to transcribe by Microsoft Azure s2t cloud service. It should be 4-letter language code (BCP-47) e.g. &apos;en-US&apos; or &apos;de-DE&apos;. |
| use_fast_transcription_api | [bool](#bool) |  | Enables or disables the Microsoft Azure fast transcription API. It is faster than SDK but is in preview version. More details at: <a href="https://learn.microsoft.com/en-us/azure/ai-services/speech-service/fast-transcription-create">https://learn.microsoft.com/en-us/azure/ai-services/speech-service/fast-transcription-create</a> |
| use_detailed_output_format | [bool](#bool) |  | Enables or disables the <code>detailed</code> format for the result of Microsoft Azure s2t service to add timestamps and confidences to the resulted transcript. |






<a name="ondewo.s2t.S2tDescription"></a>

### S2tDescription
<p>S2tDescription contains descriptive information about the speech-to-text pipeline.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | Language of the speech-to-text system. |
| pipeline_owner | [string](#string) |  | Owner of the pipeline. |
| domain | [string](#string) |  | Domain of the speech-to-text system. |
| comments | [string](#string) |  | Comments about the system. |






<a name="ondewo.s2t.S2tGetServiceInfoResponse"></a>

### S2tGetServiceInfoResponse
<p>S2tGetServiceInfoResponse is used to return version information about the speech-to-text service.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| version | [string](#string) |  | Version number based on semantic versioning, e.g. &quot;4.2.0&quot;. |






<a name="ondewo.s2t.S2tInference"></a>

### S2tInference
<p>S2tInference contains information about inference models used in the speech-to-text pipeline.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| acoustic_models | [AcousticModels](#ondewo.s2t.AcousticModels) |  | Configuration for the acoustic models. |
| language_models | [LanguageModels](#ondewo.s2t.LanguageModels) |  | Configuration for the language models. |
| inference_backend | [InferenceBackend](#ondewo.s2t.InferenceBackend) |  | Configuration for the inference backend. |






<a name="ondewo.s2t.S2tLlmPostProcessing"></a>

### S2tLlmPostProcessing
<p>S2tLlmPostProcessing contains configuration for the speech-to-text postprocessing with LLM.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| llm_host | [string](#string) | optional | Optional. Host name or IP address of the server that serves the LLM for post-processing purpose. |
| llm_port | [int32](#int32) | optional | Optional. Port number of the server that serves the LLM for post-processing purpose. |
| llm_request_timeout | [float](#float) | optional | Optional. Duration of request timeout in seconds to get result of request to LLM for post-processing purpose. If the timeout occurs, result of post-processing returns the input text with no change. |
| s2t_llm_post_processing_casing_options | [S2tLlmPostProcessingCasingOptions](#ondewo.s2t.S2tLlmPostProcessingCasingOptions) | optional | Optional. Configuration of the options to casing task in LLM post-processing. |
| s2t_llm_post_processing_punctuation_options | [S2tLlmPostProcessingPunctuationOptions](#ondewo.s2t.S2tLlmPostProcessingPunctuationOptions) | optional | Optional. Configuration of the options to punctuation task in LLM post-processing. |
| s2t_llm_post_processing_spelling_correction_options | [S2tLlmPostProcessingSpellCorrectionOptions](#ondewo.s2t.S2tLlmPostProcessingSpellCorrectionOptions) | optional | Optional. Configuration of the options to spelling-correction task in LLM post-processing. |
| s2t_llm_post_processing_semantic_correction_options | [S2tLlmPostProcessingSemanticCorrectionOptions](#ondewo.s2t.S2tLlmPostProcessingSemanticCorrectionOptions) | optional | Optional. Configuration of the options to semantic-correction task in LLM post-processing. |
| s2t_llm_post_processing_translation_options | [S2tLlmPostProcessingTranslationOptions](#ondewo.s2t.S2tLlmPostProcessingTranslationOptions) | optional | Optional. Configuration of the options to translation task in LLM post-processing. |
| s2t_llm_post_processing_inverse_normalization_options | [S2tLlmPostProcessingInverseNormalizationOptions](#ondewo.s2t.S2tLlmPostProcessingInverseNormalizationOptions) | optional | Optional. Configuration of the options to inverse-normalization task in LLM post-processing. |
| s2t_llm_post_processing_normalization_options | [S2tLlmPostProcessingNormalizationOptions](#ondewo.s2t.S2tLlmPostProcessingNormalizationOptions) | optional | Optional. Configuration of the options to normalization task in LLM post-processing. |
| s2t_llm_post_processing_summarization_options | [S2tLlmPostProcessingSummarizationOptions](#ondewo.s2t.S2tLlmPostProcessingSummarizationOptions) | optional | Optional. Configuration of the options to summarization task in LLM post-processing. |
| s2t_llm_post_processing_user_prompt_options | [S2tLlmPostProcessingUserPromptOptions](#ondewo.s2t.S2tLlmPostProcessingUserPromptOptions) | optional | Optional. Configuration of the options to user-prompt task in LLM post-processing. |






<a name="ondewo.s2t.S2tLlmPostProcessingCasingOptions"></a>

### S2tLlmPostProcessingCasingOptions
<p>Configuration of the options to casing task in LLM post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the casing task of LLM post-processing is active. |






<a name="ondewo.s2t.S2tLlmPostProcessingInverseNormalizationOptions"></a>

### S2tLlmPostProcessingInverseNormalizationOptions
<p>Configuration of the options to inverse-normalization task in LLM post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the inverse-normalization task of LLM post-processing is active. |
| email | [bool](#bool) | optional | Optional. Indicates if inverse-normalization of email address sub-task of LLM post-processing is active. |
| phone_number | [bool](#bool) | optional | Optional. Indicates if inverse-normalization of phone number sub-task of LLM post-processing is active. |
| date_and_time | [bool](#bool) | optional | Optional. Indicates if inverse-normalization of date and time sub-task of LLM post-processing is active. |
| credit_card_number | [bool](#bool) | optional | Optional. Indicates if inverse-normalization of credit card number sub-task of LLM post-processing is active. |
| social_security_number | [bool](#bool) | optional | Optional. Indicates if inverse-normalization of social security number sub-task of LLM post-processing is active |
| time_zone | [bool](#bool) | optional | Optional. Indicates if inverse-normalization of time zone sub-task of LLM post-processing is active. |






<a name="ondewo.s2t.S2tLlmPostProcessingNormalizationOptions"></a>

### S2tLlmPostProcessingNormalizationOptions
<p>Configuration of the options to normalization task in LLM post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the normalization task of LLM post-processing is active. |
| email | [bool](#bool) | optional | Optional. Indicates if normalization of email address sub-task of LLM post-processing is active. |
| phone_number | [bool](#bool) | optional | Optional. Indicates if normalization of phone number sub-task of LLM post-processing is active. |
| date_and_time | [bool](#bool) | optional | Optional. Indicates if normalization of date and time sub-task of LLM post-processing is active. |
| credit_card_number | [bool](#bool) | optional | Optional. Indicates if normalization of credit card number sub-task of LLM post-processing is active. |
| social_security_number | [bool](#bool) | optional | Optional. Indicates if normalization of social security number sub-task of LLM post-processing is active |
| time_zone | [bool](#bool) | optional | Optional. Indicates if normalization of time zone sub-task of LLM post-processing is active. |






<a name="ondewo.s2t.S2tLlmPostProcessingPunctuationOptions"></a>

### S2tLlmPostProcessingPunctuationOptions
<p>Configuration of the options to punctuation task in LLM post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the punctuation task of LLM post-processing is active. |






<a name="ondewo.s2t.S2tLlmPostProcessingSemanticCorrectionOptions"></a>

### S2tLlmPostProcessingSemanticCorrectionOptions
<p>Configuration of the options to semantic-correction task in LLM post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the semantic-correction task of LLM post-processing is active. |






<a name="ondewo.s2t.S2tLlmPostProcessingSpellCorrectionOptions"></a>

### S2tLlmPostProcessingSpellCorrectionOptions
<p>Configuration of the options to spelling-correction task in LLM post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the spelling-correction task of LLM post-processing is active. |






<a name="ondewo.s2t.S2tLlmPostProcessingSummarizationOptions"></a>

### S2tLlmPostProcessingSummarizationOptions
<p>Configuration of the options to summarization task in LLM post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the summarization task of LLM post-processing is active. |
| min_chars | [int32](#int32) | optional | Optional. Minimum number of characters of the summary generated in summarization task of LLM post-processing. |
| max_chars | [int32](#int32) | optional | Optional. Maximum number of characters of the summary generated in summarization task of LLM post-processing. |






<a name="ondewo.s2t.S2tLlmPostProcessingTranslationOptions"></a>

### S2tLlmPostProcessingTranslationOptions
<p>Configuration of the options to translation task in LLM post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the translation task of LLM post-processing is active. |
| language | [string](#string) | optional | Optional. Target language of the translation task of LLM post-processing. |






<a name="ondewo.s2t.S2tLlmPostProcessingUserPromptOptions"></a>

### S2tLlmPostProcessingUserPromptOptions
<p>Configuration of the options to user-prompt task in LLM post-processing.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the user-prompt task of LLM post-processing is active. This task overwrites |
| prompt | [string](#string) | optional | Optional. The prompt to give LLM directly for post-processing purpose. |






<a name="ondewo.s2t.S2tNormalization"></a>

### S2tNormalization
<p>S2tNormalization contains configuration for the speech-to-text normalization.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | Language for normalization of transcriptions. |
| pipeline | [string](#string) | repeated | List of names of active normalizations. |






<a name="ondewo.s2t.S2tPipelineId"></a>

### S2tPipelineId
<p>The pipeline id for a specific pipeline configuration</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | id of the model that will generate audio |






<a name="ondewo.s2t.Speech2TextConfig"></a>

### Speech2TextConfig
<p>Speech2TextConfig is a configuration message for the speech-to-text pipeline</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| id | [string](#string) |  | Unique identifier for the configuration. |
| description | [S2tDescription](#ondewo.s2t.S2tDescription) |  | Description of the speech-to-text system. |
| active | [bool](#bool) |  | Indicates if the configuration is active. |
| inference | [S2tInference](#ondewo.s2t.S2tInference) |  | Configuration for inference models. |
| streaming_server | [StreamingServer](#ondewo.s2t.StreamingServer) |  | Configuration for the streaming server. |
| voice_activity_detection | [VoiceActivityDetection](#ondewo.s2t.VoiceActivityDetection) |  | Configuration for voice activity detection. |
| post_processing | [PostProcessing](#ondewo.s2t.PostProcessing) |  | Configuration for post-processing. |
| logging | [Logging](#ondewo.s2t.Logging) |  | Configuration for logging. |






<a name="ondewo.s2t.StreamingServer"></a>

### StreamingServer
<p>StreamingServer contains information about the streaming server.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| host | [string](#string) |  | Hostname of the streaming server. |
| port | [int64](#int64) |  | Port number of the streaming server. |
| output_style | [string](#string) |  | Output style for the streaming server. |
| streaming_speech_recognition | [StreamingSpeechRecognition](#ondewo.s2t.StreamingSpeechRecognition) |  | Configuration for streaming speech recognition. |






<a name="ondewo.s2t.StreamingSpeechRecognition"></a>

### StreamingSpeechRecognition
<p>StreamingSpeechRecognition contains information about streaming speech recognition settings.</p>


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
<p>SymSpell contains configuration for the SymSpell spelling correction.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| dict_path | [string](#string) |  | Path to the dictionary used by symspell |
| max_dictionary_edit_distance | [int64](#int64) |  | The maximal edit-distance to consider for spelling correction (affects performance - bigger number takes longer to process!) |
| prefix_length | [int64](#int64) |  | The length (number of characters) of the prefix to consider for filtering |






<a name="ondewo.s2t.TrainUserLanguageModelRequest"></a>

### TrainUserLanguageModelRequest
<p>TrainUserLanguageModelRequest is used to request the training of a user-specific language model.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language_model_name | [string](#string) |  | Name of the language model to train. Example: &quot;user_lm_1&quot; |
| order | [int64](#int64) |  | Order n of the ngram. Example: 3 (for trigram model) |






<a name="ondewo.s2t.TranscribeFileRequest"></a>

### TranscribeFileRequest
<p>A request to transcribe an audio file</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| audio_file | [bytes](#bytes) |  | wav file to transcribe |
| config | [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig) |  | The configuration to override the default configuration |






<a name="ondewo.s2t.TranscribeFileResponse"></a>

### TranscribeFileResponse
<p>The response message for a transcribe file request</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcriptions | [Transcription](#ondewo.s2t.Transcription) | repeated | List of transcriptions with confidence level |
| time | [float](#float) |  | The time the transcription took |
| audio_uuid | [string](#string) |  | id of the transcribed audio file |






<a name="ondewo.s2t.TranscribeRequestConfig"></a>

### TranscribeRequestConfig
<p>Configuration for a request to transcribe audio</p>


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
| task | [string](#string) | optional | Optional. Specify task of s2t model, e.g. &apos;transcribe&apos; and &apos;translate&apos; |
| s2t_service_config | [google.protobuf.Struct](#google.protobuf.Struct) | optional | Optional. <code>s2t_service_config</code> provides the configuration of the service such as API key, bearer tokens, JWT, and other header information as key value pairs, e.g., <pre><code>MY_API_KEY=&apos;LKJDIFe244LKJOI&apos;</code></pre> For Amazon S2T service, the following arguments should be passed in form of a dict: <ul> <li><code>aws_access_key_id</code> (required) Access key id to access Amazon Web Service.</li> <li><code>aws_secret_access_key</code> (required) Secret access key to access Amazon Web Service.</li> <li><code>region</code> (required) Region name of Amazon Server.</li> </ul> Example: <code>s2t_config_service={&apos;aws_access_key_id&apos;: &apos;YOUR_AWS_ACCESS_KEY_ID&apos;, &apos;aws_secret_access_key&apos;: &apos;YOUR_AWS_SECRET_ACCESS_KEY&apos;, &apos;region&apos;: &apos;YOUR_AMAZON_SERVER_REGION_NAME&apos;}</code> For Deepgram S2T service, the following argument should be passed in form of a dict: <ul> <li><code>api_key</code> (required) API key of Deepgram account to access Deepgram S2T service.</li> </ul> Example: <code>s2t_config_service={&apos;api_key&apos;: &apos;YOUR_DEEPGRAM_API_KEY&apos;}</code> <br> For Google cloud S2T service, the following arguments should be passed in form of a dict: <ul> <li><code>api_key</code> (required) API key of Google cloud to access its S2T service.</li> <li><code>api_endpoint</code> (optional) Regional API endpoint of Google cloud S2T service. (Defaults to &apos;eu-speech.googleapis.com&apos;)</li> </ul> Example: <code>s2t_config_service={&apos;api_key&apos;: &apos;YOUR_GOOGLE_CLOUD_API_KEY&apos;, &apos;api_endpoint&apos;: &apos;YOUR_GOOGLE_CLOUD_API_ENDPOINT&apos;}</code> For Microsoft Azure S2T service, the following arguments should be passed in form of a dict: <ul> <li><code>subscription_key</code> (required) Subscription key to access Microsoft Azure Service.</li> <li><code>region</code> (required) Region name of Microsoft Azure Server.</li> </ul> Example: <code>s2t_config_service={&apos;subscription_key&apos;: &apos;YOUR_MICROSOFT_AZURE_SUBSCRIPTION_KEY&apos;, &apos;region&apos;: &apos;YOUR_MICROSOFT_AZURE_SERVER_REGION_NAME&apos;}</code> Note: ondewo-s2t will raise an error if you don&apos;t pass any of the required arguments above. |
| s2t_cloud_provider_config | [S2tCloudProviderConfig](#ondewo.s2t.S2tCloudProviderConfig) | optional | Optional. Defines the cloud provider&apos;s specific configuration for using speech to text cloud services. The default value is None. |






<a name="ondewo.s2t.TranscribeStreamRequest"></a>

### TranscribeStreamRequest
<p>Request to transcribe an audio stream</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| audio_chunk | [bytes](#bytes) |  | wav file to transcribe |
| end_of_stream | [bool](#bool) |  | if it's the final chunk of the stream |
| config | [TranscribeRequestConfig](#ondewo.s2t.TranscribeRequestConfig) |  | The configuration to override the default configuration |
| mute_audio | [bool](#bool) |  | Whether or not to mute the audio signal. Defaults to false. |






<a name="ondewo.s2t.TranscribeStreamResponse"></a>

### TranscribeStreamResponse
<p>The response message of a stream transcription</p>


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
<p>The transcription message</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcription | [string](#string) |  | The transcribed text |
| confidence_score | [float](#float) |  | The corresponding confidence score. The confidence estimate between 0.0 and 1.0. A higher number indicates an estimated greater likelihood that the recognized words are correct. |
| words | [WordDetail](#ondewo.s2t.WordDetail) | repeated | List of the words of transcription with their confidence scores and probable alternatives |
| alternatives | [TranscriptionAlternative](#ondewo.s2t.TranscriptionAlternative) | repeated | List of alternative transcriptions, confidence scores, words timings and alternative words |






<a name="ondewo.s2t.TranscriptionAlternative"></a>

### TranscriptionAlternative
<p>The alternative transcription message</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcript | [string](#string) |  | The alternative transcribed text |
| confidence | [float](#float) |  | The corresponding confidence score to the alternative transcript. |
| words | [WordDetail](#ondewo.s2t.WordDetail) | repeated | A list of word-specific information for each recognized word, including word timings, confidence score of the word and alternative words. |






<a name="ondewo.s2t.TranscriptionReturnOptions"></a>

### TranscriptionReturnOptions
<p>Configuration of the return values of a transcribe request</p>


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
<p>Configuration of the options to turn-detection in utterances</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [bool](#bool) | optional | Optional. Indicates if the turn-detection feature is active. |
| full_utterance_deployment | [bool](#bool) | optional | Optional. Whether to transcribe the whole utterance when turn moment is detected. It is helpful to increase accuracy of transcriptions in cost of drop in speed. If deactivated, it just transcribe from last short silence period and concatenates the transcriptions of small audio chunks between tiny silences. |
| llm_host | [string](#string) | optional | Optional. Host name or IP address of the server that serves the LLM for turn-detection purpose. |
| llm_port | [int32](#int32) | optional | Optional. Port number of the server that serves the LLM for turn-detection purpose. |
| llm_request_timeout | [float](#float) | optional | Optional. Duration of request timeout in seconds to get result of request to LLM for turn-detection purpose. If the timeout occurs, result of turn-detection considered as False. |






<a name="ondewo.s2t.UtteranceDetectionOptions"></a>

### UtteranceDetectionOptions
<p>Configuration of the options to detect utterances</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcribe_not_final | [bool](#bool) |  | Return also immediate transcription results |
| next_chunk_timeout | [float](#float) |  | if time between audio chunks exceeds next_chunk_timeout, stream will be stopped |
| turn_detection | [TurnDetectionOptions](#ondewo.s2t.TurnDetectionOptions) |  | The turn detection options |






<a name="ondewo.s2t.VoiceActivityDetection"></a>

### VoiceActivityDetection
<p>VoiceActivityDetection contains information about voice activity detection settings.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| active | [string](#string) |  | Indicates if voice activity detection is active. |
| sampling_rate | [int64](#int64) |  | Sampling rate for voice activity detection. |
| pyannote | [Pyannote](#ondewo.s2t.Pyannote) |  | Configuration for the Pyannote model. |






<a name="ondewo.s2t.Wav2Vec"></a>

### Wav2Vec
<p>Wav2Vec contains information about the Wav2Vec model.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_path | [string](#string) |  | Path to the model. |
| use_gpu | [bool](#bool) |  | Indicates if GPU is used. |






<a name="ondewo.s2t.Wav2VecTriton"></a>

### Wav2VecTriton
<p>Wav2VecTriton contains information about the Wav2Vec model using Triton.</p>


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
<p>Whisper contains information about the Whisper model.</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| model_path | [string](#string) |  | Path to the model. |
| use_gpu | [bool](#bool) |  | Indicates if GPU is used. |
| language | [string](#string) |  | Default language of the model. |
| task | [string](#string) |  | Default task of the model. |






<a name="ondewo.s2t.WhisperTriton"></a>

### WhisperTriton
<p>WhisperTriton contains information about the Whisper model using Triton.</p>


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
<p>The word alternative message</p>


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| word | [string](#string) |  | The recognized word corresponding to this set of information. |
| confidence | [float](#float) |  | The corresponding confidence score to the alternative word. |






<a name="ondewo.s2t.WordDetail"></a>

### WordDetail
<p>WordDetail provides word-specific information for recognized words.</p>


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
The inference backend configuration

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
<p>Speech-to-text service</p>

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| TranscribeFile | [TranscribeFileRequest](#ondewo.s2t.TranscribeFileRequest) | [TranscribeFileResponse](#ondewo.s2t.TranscribeFileResponse) | <p>Transcribes an audio file</p> |
| TranscribeStream | [TranscribeStreamRequest](#ondewo.s2t.TranscribeStreamRequest) stream | [TranscribeStreamResponse](#ondewo.s2t.TranscribeStreamResponse) stream | <p>Transcribes an audio stream.</p> |
| GetS2tPipeline | [S2tPipelineId](#ondewo.s2t.S2tPipelineId) | [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig) | <p>Gets a speech to text pipeline corresponding to the id specified in <code>S2tPipelineId</code>. If no corresponding id is found, raises <code>ModuleNotFoundError</code> in server.</p> |
| CreateS2tPipeline | [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig) | [S2tPipelineId](#ondewo.s2t.S2tPipelineId) | <p>Creates a new speech to text pipeline from a <code>Speech2TextConfig</code> and registers the new pipeline in the server.</p> |
| DeleteS2tPipeline | [S2tPipelineId](#ondewo.s2t.S2tPipelineId) | [.google.protobuf.Empty](#google.protobuf.Empty) | <p>Deletes a pipeline corresponding to the id parsed in <code>S2tPipelineId</code>. If no corresponding id is found, raises <code>ModuleNotFoundError</code> in server.</p> |
| UpdateS2tPipeline | [Speech2TextConfig](#ondewo.s2t.Speech2TextConfig) | [.google.protobuf.Empty](#google.protobuf.Empty) | <p>Updates a pipeline with the id specified in <code>Speech2TextConfig</code> with the new config. If no corresponding id is found, raises <code>ModuleNotFoundError</code> in server.</p> |
| ListS2tPipelines | [ListS2tPipelinesRequest](#ondewo.s2t.ListS2tPipelinesRequest) | [ListS2tPipelinesResponse](#ondewo.s2t.ListS2tPipelinesResponse) | <p>Lists all speech to text pipelines.</p> |
| ListS2tLanguages | [ListS2tLanguagesRequest](#ondewo.s2t.ListS2tLanguagesRequest) | [ListS2tLanguagesResponse](#ondewo.s2t.ListS2tLanguagesResponse) | <p>Returns a message containing a list of all languages for which there exist pipelines.</p> |
| ListS2tDomains | [ListS2tDomainsRequest](#ondewo.s2t.ListS2tDomainsRequest) | [ListS2tDomainsResponse](#ondewo.s2t.ListS2tDomainsResponse) | <p>Returns a message containing a list of all domains for which there exist pipelines.</p> |
| GetServiceInfo | [.google.protobuf.Empty](#google.protobuf.Empty) | [S2tGetServiceInfoResponse](#ondewo.s2t.S2tGetServiceInfoResponse) | <p>Returns a message containing the version of the running speech to text server.</p> |
| ListS2tLanguageModels | [ListS2tLanguageModelsRequest](#ondewo.s2t.ListS2tLanguageModelsRequest) | [ListS2tLanguageModelsResponse](#ondewo.s2t.ListS2tLanguageModelsResponse) | <p>Given a list of pipeline ids, returns a list of <code>LanguageModelPipelineId</code> messages containing the pipeline id and a list of the language models loaded in the pipeline.</p> |
| CreateUserLanguageModel | [CreateUserLanguageModelRequest](#ondewo.s2t.CreateUserLanguageModelRequest) | [.google.protobuf.Empty](#google.protobuf.Empty) | <p>Create a user language model.</p> |
| DeleteUserLanguageModel | [DeleteUserLanguageModelRequest](#ondewo.s2t.DeleteUserLanguageModelRequest) | [.google.protobuf.Empty](#google.protobuf.Empty) | <p>Delete a user language model.</p> |
| AddDataToUserLanguageModel | [AddDataToUserLanguageModelRequest](#ondewo.s2t.AddDataToUserLanguageModelRequest) | [.google.protobuf.Empty](#google.protobuf.Empty) | <p>Add data to a user language model.</p> |
| TrainUserLanguageModel | [TrainUserLanguageModelRequest](#ondewo.s2t.TrainUserLanguageModelRequest) | [.google.protobuf.Empty](#google.protobuf.Empty) | <p>Train a user language model.</p> |
| ListS2tNormalizationPipelines | [ListS2tNormalizationPipelinesRequest](#ondewo.s2t.ListS2tNormalizationPipelinesRequest) | [ListS2tNormalizationPipelinesResponse](#ondewo.s2t.ListS2tNormalizationPipelinesResponse) | <p>Retrieves a list of normalization pipelines based on specific requirements.</p> |

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
