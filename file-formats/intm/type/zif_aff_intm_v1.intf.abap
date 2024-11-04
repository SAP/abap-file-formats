INTERFACE zif_aff_intm_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Intelligent Scenario Model</p>
    "! Intelligent scenario model
    BEGIN OF ty_intelligent_model,
      "! <p class="shorttext">Model Name</p>
      "! Model name
      name                    TYPE c LENGTH 30,
      "! <p class="shorttext">Intelligent Scenario</p>
      "! Intelligent scenario of the model
      intelligent_scenario    TYPE c LENGTH 20,
      "! <p class="shorttext">Modelling Context ID</p>
      "! Modelling context ID which is the parent of the model
      modelling_context_id    TYPE c LENGTH 36,
      "! <p class="shorttext">Model Type</p>
      "! Model type
      model_type              TYPE c LENGTH 256,
      "! <p class="shorttext">Adapter ID</p>
      "! Adapter ID
      adapter_id              TYPE c LENGTH 32,
      "! <p class="shorttext">Native Model Type</p>
      "! Native model type
      native_model_type       TYPE c LENGTH 256,
      "! <p class="shorttext">Model Content</p>
      "! Model content
      model_specification     TYPE string,
      "! <p class="shorttext">Model Definition</p>
      "! Model definition
      model_definition        TYPE string,
      "! <p class="shorttext">State</p>
      "! State of the model
      state                   TYPE c LENGTH 10,
      "! <p class="shorttext">Signature</p>
      "! Model signature
      signature               TYPE string,
      "! <p class="shorttext">Bindings</p>
      "! Model bindings
      bindings                TYPE string,
      "! <p class="shorttext">Model flag</p>
      "! Model flag that indicate new model or enhancement(X)
      new_model               TYPE abap_bool,
      "! <p class="shorttext">Executable ID</p>
      "! Executable ID
      executable_id           TYPE c LENGTH 64,
      "! <p class="shorttext">Large Language Model Name</p>
      "! Large language model name
      llm_name                TYPE string,
      "! <p class="shorttext">LLM Model Version</p>
      "! LLM model version
      llm_model_version       TYPE c LENGTH 30,
    END OF ty_intelligent_model,

    "! <p class="shorttext">Segment Fields</p>
    "! Model segment fields
    BEGIN OF ty_segment_fields,
      "! <p class="shorttext">Field Name</p>
      "! Table or view field name
      fieldname      TYPE c LENGTH 30,
      "! <p class="shorttext">Position</p>
      "! Field position
      field_position TYPE i,
      "! <p class="shorttext">Key Field</p>
      "! Key field or not
      is_key         TYPE abap_bool,
    END OF ty_segment_fields,

    "! <p class="shorttext">Model Prompt Templates</p>
    "! Model prompt templates
    BEGIN OF ty_prompt_templates,
      "! <p class="shorttext">Prompt Template Name</p>
      "! Prompt template name
      "! $required
      name              TYPE c LENGTH 30,
      "! <p class="shorttext">Description</p>
      "! Description of prompt template
      description       TYPE string,
      "! <p class="shorttext">Prompt</p>
      "! Prompt
      "! $required
      prompt            TYPE string,
      "! <p class="shorttext">Prompt Parameters</p>
      "! Prompt parameters
      prompt_parameters TYPE string,
      "! <p class="shorttext">Prompt Visibility</p>
      "! Prompt visibility
      visible           TYPE abap_bool,
    END OF ty_prompt_templates,

    "! <p class="shorttext">Intelligent scenario Models</p>
    "! Intelligent scenario model
    BEGIN OF ty_main,
      "! $required
      format_version    TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header            TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Intelligent Scenario Model</p>
      "! Intelligent scenario model
      "! $required
      intelligent_model TYPE ty_intelligent_model,
      "! <p class="shorttext">Model Segment Fields</p>
      "! Model segment fields
      segment_fields    TYPE STANDARD TABLE OF ty_segment_fields WITH DEFAULT KEY,
      "! <p class="shorttext">Model Prompt Templates</p>
      "! Model prompt templates
      prompt_templates  TYPE STANDARD TABLE OF ty_prompt_templates WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
