INTERFACE zif_aff_intm_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Model Name</p>
      "! Model name
      model_name           TYPE c LENGTH 30,
      "! <p class="shorttext">Model Type</p>
      "! Model type
      model_type           TYPE c LENGTH 256,
      "! <p class="shorttext">Intelligent Scenario</p>
      "! Intelligent scenario of the model
      intelligent_scenario TYPE c LENGTH 20,
      "! <p class="shorttext">Modelling Context ID</p>
      "! Modelling context ID which is the parent of the model
      modelling_context_id TYPE c LENGTH 36,
      "! <p class="shorttext">Adapter ID</p>
      "! Adapter ID
      adapter_id           TYPE c LENGTH 32,
      "! <p class="shorttext">Native Model Type</p>
      "! Native model type
      native_model_type    TYPE c LENGTH 256,
      "! <p class="shorttext">Model Specification</p>
      "! Model specification
      model_specification  TYPE string,
      "! <p class="shorttext">Model Definition</p>
      "! Model definition
      model_definition     TYPE string,
      "! <p class="shorttext">State</p>
      "! State of the model
      state                TYPE c LENGTH 10,
      "! <p class="shorttext">Signature</p>
      "! Model signature
      signature            TYPE string,
      "! <p class="shorttext">Bindings</p>
      "! Model bindings
      bindings             TYPE string,
      "! <p class="shorttext">Is Enhancement</p>
      "! If true, the model is an enhancement, if false the model is a new model.
      is_enhancement       TYPE abap_bool,
      "! <p class="shorttext">Executable ID</p>
      "! Executable ID
      executable_id        TYPE c LENGTH 64,
      "! <p class="shorttext">Large Language Model Name</p>
      "! Large language model name
      llm_name             TYPE string,
      "! <p class="shorttext">Large Language Model Version</p>
      "! Large language model version
      llm_version          TYPE c LENGTH 30,
    END OF ty_general_information,

    "! <p class="shorttext">Segment Field</p>
    "! Model segment field
    BEGIN OF ty_segment_field,
      "! <p class="shorttext">Field Name</p>
      "! Table or view field name
      field_name     TYPE c LENGTH 30,
      "! <p class="shorttext">Field Position</p>
      "! Field position
      field_position TYPE i,
      "! <p class="shorttext">Is Key Field</p>
      "! If true, the field is a key field
      is_key         TYPE abap_bool,
    END OF ty_segment_field,

    "! <p class="shorttext">Model Prompt Template</p>
    "! Model prompt template
    BEGIN OF ty_prompt_template,
      "! <p class="shorttext">Prompt Template Name</p>
      "! Prompt template name
      "! $required
      prompt_template_name        TYPE c LENGTH 30,
      "! <p class="shorttext">Prompt Template Description</p>
      "! Description of prompt template
      prompt_template_description TYPE string,
      "! <p class="shorttext">Prompt</p>
      "! Prompt
      "! $required
      prompt                      TYPE string,
      "! <p class="shorttext">Prompt Visibility</p>
      "! If true, the prompt is visible
      is_visible                  TYPE abap_bool,
    END OF ty_prompt_template,

    "! <p class="shorttext">Intelligent scenario Model</p>
    "! Intelligent scenario model
    BEGIN OF ty_main,
      "! $required
      format_version         TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                 TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information    TYPE ty_general_information,
      "! <p class="shorttext">Model Segment Fields</p>
      "! Model segment fields
      model_segment_fields   TYPE STANDARD TABLE OF ty_segment_field WITH DEFAULT KEY,
      "! <p class="shorttext">Model Prompt Templates</p>
      "! Model prompt templates
      model_prompt_templates TYPE STANDARD TABLE OF ty_prompt_template WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
