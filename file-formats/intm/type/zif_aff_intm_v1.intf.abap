INTERFACE zif_aff_intm_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Intelligent Scenario Model</p>
    "! Intelligent Scenario Model
    BEGIN OF ty_islm_modelcc,
      "! <p class="shorttext">Model Name</p>
      "! Model Name
      name                  TYPE c LENGTH 30,
      "! <p class="shorttext">Parent</p>
      "! Parent
      parent                TYPE c LENGTH 36,
      "! <p class="shorttext">Model Description</p>
      "! Model Description
      description           TYPE string,
      "! <p class="shorttext">Model Type</p>
      "! Model Type
      model_type            TYPE c LENGTH 256,
      "! <p class="shorttext">Adapter ID</p>
      "! Adapter ID
      adapter_id            TYPE c LENGTH 32,
      "! <p class="shorttext">Native Model Type</p>
      "! Native Model Type
      native_model_type     TYPE c LENGTH 256,
      "! <p class="shorttext">Model Content</p>
      "! Model Content
      model_specification   TYPE string,
      "! <p class="shorttext">Model definition</p>
      "! Model definition
      model_definition      TYPE string,
      "! <p class="shorttext">State of model</p>
      "! State of model
      state                 TYPE c LENGTH 10,
      "! <p class="shorttext">Signature</p>
      "! Signature
      signature             TYPE string,
      "! <p class="shorttext">Bindings</p>
      "! Bindings
      bindings              TYPE string,
      "! <p class="shorttext">Model flag: Original = ' ',  Enhancement = 'X'</p>
      "! New model?
      new_model             TYPE abap_bool,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP Language Version
      abap_language_version TYPE c LENGTH 1,
    END OF ty_islm_modelcc,

    "! <p class="shorttext">Model Segment Fields</p>
    "! Model Segment Fields
    BEGIN OF ty_islm_mdlsgmntfld,
      "! <p class="shorttext">Table or view field name</p>
      "! Table or view field name
      fieldname      TYPE c LENGTH 30,
      "! <p class="shorttext">Position</p>
      "! Position
      field_position TYPE i,
      "! <p class="shorttext">Key field Boolean flag?</p>
      "! Key field Boolean flag?
      is_key         TYPE	 abap_bool,
    END OF ty_islm_mdlsgmntfld,

    "! <p class="shorttext">Intelligent Scenario Model Prompt Template</p>
    "! Intelligent Scenario Model Prompt Template
    BEGIN OF ty_islm_mdlprmttmpl,
      "! <p class="shorttext">Prompt template name</p>
      "! Prompt template name
      "! $required
      name              TYPE c LENGTH 30,
      "! <p class="shorttext">Description</p>
      "! Description
      description       TYPE string,
      "! <p class="shorttext">Prompt</p>
      "! Prompt
      "! $required
      prompt            TYPE string,
      "! <p class="shorttext">Prompt Parameters</p>
      "! Prompt Parameters
      prompt_parameters TYPE string,
      "! <p class="shorttext">Prompt Visibility</p>
      "! Prompt Visibility
      visible           TYPE abap_bool,
    END OF ty_islm_mdlprmttmpl,

    "! <p class="shorttext">Model Details</p>
    "! Model Details
    BEGIN OF ty_model,
      "! <p class="shorttext">Executable ID</p>
      "! Executable ID
      executable_id     TYPE c LENGTH 64,
      "! <p class="shorttext">Large Language Model Name</p>
      "! Large Language Model Name
      llm_name          TYPE string,
      "! <p class="shorttext">LLM Model Version</p>
      "! LLM Model Version
      llm_model_version TYPE c LENGTH 30,
    END OF ty_model,

    "! <p class="shorttext">Intelligent scenario Models</p>
    "! Intelligent scenario Models
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version   TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header           TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Intelligent Scenario Model</p>
      "! Intelligent Scenario Model
      "! $required
      islm_modelcc     TYPE ty_islm_modelcc,
      "! <p class="shorttext">Model Details</p>
      "! Model Details
      "! $required
      islm_model       TYPE ty_model,
      "! <p class="shorttext">Model Segment Fields</p>
      "! Model Segment Fields
      islm_mdlsgmntfld TYPE STANDARD TABLE OF ty_islm_mdlsgmntfld WITH DEFAULT KEY,
      "! <p class="shorttext">Model Prompt Templates</p>
      "! Model Prompt Templates
      islm_mdlprmttmpl TYPE STANDARD TABLE OF ty_islm_mdlprmttmpl WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
