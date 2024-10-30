INTERFACE zif_aff_intm_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Intelligent Scenario Model</p>
    "! This is an intelligent scenario model
    BEGIN OF ty_intelligent_model,
      "! <p class="shorttext">Model Name</p>
      "! This is the model name
      name                  TYPE c LENGTH 30,
      "! <p class="shorttext">Parent</p>
      "! This is the parent of the model
      parent                TYPE c LENGTH 36,
      "! <p class="shorttext">Model Type</p>
      "! This is the model type
      model_type            TYPE c LENGTH 256,
      "! <p class="shorttext">Adapter ID</p>
      "! This is the adapter ID
      adapter_id            TYPE c LENGTH 32,
      "! <p class="shorttext">Native Model Type</p>
      "! This is the native model type
      native_model_type     TYPE c LENGTH 256,
      "! <p class="shorttext">Model Content</p>
      "! This is the model content
      model_specification   TYPE string,
      "! <p class="shorttext">Model Definition</p>
      "! This is the model definition
      model_definition      TYPE string,
      "! <p class="shorttext">State of model</p>
      "! This is the state of the model
      state                 TYPE c LENGTH 10,
      "! <p class="shorttext">Signature</p>
      "! This is the model signature
      signature             TYPE string,
      "! <p class="shorttext">Bindings</p>
      "! This is the model bindings
      bindings              TYPE string,
      "! <p class="shorttext">Model flag</p>
      "! This is the flag that indicate new model or enhancement(X)
      new_model             TYPE abap_bool,
      "! <p class="shorttext">ABAP Language Version</p>
      "! This is the abap language version
      abap_language_version TYPE c LENGTH 1,
    END OF ty_intelligent_model,

    "! <p class="shorttext">Segment Fields</p>
    "! These are the model segment fields
    BEGIN OF ty_segment_fields,
      "! <p class="shorttext">Table or View Field Name</p>
      "! This is the field of a table or view
      fieldname      TYPE c LENGTH 30,
      "! <p class="shorttext">Position</p>
      "! This is the field position
      field_position TYPE i,
      "! <p class="shorttext">Key field</p>
      "! This is the flag that indicates key field or not
      is_key         TYPE abap_bool,
    END OF ty_segment_fields,

    "! <p class="shorttext">Model Prompt Templates</p>
    "! These are the model prompt templates
    BEGIN OF ty_prompt_templates,
      "! <p class="shorttext">Prompt Template Name</p>
      "! This is the prompt template name
      "! $required
      name              TYPE c LENGTH 30,
      "! <p class="shorttext">Description</p>
      "! This is the description of prompt template
      description       TYPE string,
      "! <p class="shorttext">Prompt</p>
      "! This is the prompt
      "! $required
      prompt            TYPE string,
      "! <p class="shorttext">Prompt Parameters</p>
      "! These are the prompt parameters
      prompt_parameters TYPE string,
      "! <p class="shorttext">Prompt Visibility</p>
      "! These is the flag for the prompt visibility
      visible           TYPE abap_bool,
    END OF ty_prompt_templates,

    "! <p class="shorttext">Model Details</p>
    "! Model Details
    BEGIN OF ty_model_details,
      "! <p class="shorttext">Executable ID</p>
      "! This is the executable ID
      executable_id     TYPE c LENGTH 64,
      "! <p class="shorttext">Large Language Model Name</p>
      "! This is the large language model name
      llm_name          TYPE string,
      "! <p class="shorttext">LLM Model Version</p>
      "! This is the LLM model version
      llm_model_version TYPE c LENGTH 30,
    END OF ty_model_details,

    "! <p class="shorttext">Intelligent scenario Models</p>
    "! This is an intelligent scenario model
    BEGIN OF ty_main,
      "! $required
      format_version    TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header            TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Intelligent Scenario Model</p>
      "! This is an intelligent scenario model
      "! $required
      intelligent_model TYPE ty_intelligent_model,
      "! <p class="shorttext">Model Details</p>
      "! These are the model details
      "! $required
      model_details     TYPE ty_model_details,
      "! <p class="shorttext">Model Segment Fields</p>
      "! These are the model segment fields
      segment_fields    TYPE STANDARD TABLE OF ty_segment_fields WITH DEFAULT KEY,
      "! <p class="shorttext">Model Prompt Templates</p>
      "! These are the model prompt templates
      prompt_templates  TYPE STANDARD TABLE OF ty_prompt_templates WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
