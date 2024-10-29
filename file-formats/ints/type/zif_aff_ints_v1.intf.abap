INTERFACE zif_aff_ints_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Objects based on Scenario</p>
    "! Objects based on Scenario
    BEGIN OF ty_islm_psddlobj,
      "! <p class="shorttext">Object Name in Object Directory</p>
      "! Object Name
      object_name         TYPE c LENGTH 40,
      "! <p class="shorttext">Object Type in Object Directory</p>
      "! Object Type
      object_type         TYPE c LENGTH 4,
      "! <p class="shorttext">Object Status</p>
      "! Object Status
      object_status       TYPE c LENGTH 1,
      "! <p class="shorttext">Logical object type of a BOM object</p>
      "! Logical object type
      logical_object_type TYPE c LENGTH 1,
    END OF ty_islm_psddlobj,

    "! <p class="shorttext">Intelligent Scenario</p>
    "! Intelligent Scenario
    BEGIN OF ty_islm_ps,
      "! <p class="shorttext">Intelligent Scenario Description</p>
      "! Intelligent Scenario Description
      description           TYPE c LENGTH 100,
      "! <p class="shorttext">Intelligent Scenario Type</p>
      "! Intelligent Scenario Type
      "! $required
      scenario_type         TYPE c LENGTH 256,
      "! <p class="shorttext">Extensible</p>
      "! Extensible
      extensible            TYPE abap_bool,
      "! <p class="shorttext">Multiple active model</p>
      "! Multiple active model
      multi_active_model    TYPE abap_bool,
      "! <p class="shorttext">Data Management</p>
      "! Data Management
      dm_enabled            TYPE abap_bool,
      "! <p class="shorttext">Turnkey auto switch on enablement</p>
      "! Turnkey auto switch on enablement ('X' = true, '' = false )
      tkey_auto_switch_on   TYPE abap_bool,
      "! <p class="shorttext">Turnkey Implementation Type</p>
      "! Turnkey Implementation Type
      "! $required
      tkey_type             TYPE c LENGTH 10,
      "! <p class="shorttext">Scenario Technology</p>
      "! Scenario Technology
      scenario_tech         TYPE c LENGTH 20,
      "! <p class="shorttext">Prediction class</p>
      "! Prediction class
      object_name           TYPE c LENGTH 30,
      "! <p class="shorttext">Prerequisite Check Class</p>
      "! Prerequisite Check Class
      prereq_chk_class      TYPE c LENGTH 30,
      "! <p class="shorttext">Scenario Technical Id</p>
      "! Scenario Technical Id
      scenario_tech_id      TYPE c LENGTH 64,
      "! <p class="shorttext">State of Intelligent Scenario</p>
      "! State of Intelligent Scenario
      state                 TYPE c LENGTH 10,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP Language Version
      abap_language_version TYPE c LENGTH 1,
      "! <p class="shorttext">ISLM Framework Version</p>
      "! ISLM Framework Version
      ism_version           TYPE p LENGTH 4 DECIMALS 2,
      "! <p class="shorttext">Turnkey Class</p>
      "! Turnkey Class
      tkey_class            TYPE c LENGTH 30,
      "! <p class="shorttext">Intelligent Scenario Usage Type</p>
      "! Intelligent Scenario Usage Type
      usage_type            TYPE c LENGTH 10,
      "! <p class="shorttext">OAuth 2.0 Client Profile</p>
      "! OAuth 2.0 Client Profile
      oauth_profile         TYPE c LENGTH 30,
    END OF ty_islm_ps,

    "! <p class="shorttext">Scenario Binding Mappings</p>
    "! Scenario Binding Mappings
    BEGIN OF ty_islm_psbindmp,
      "! <p class="shorttext">Signature Name</p>
      "! Signature Name
      signature_name TYPE c LENGTH 30,
      "! <p class="shorttext">Table or view field name</p>
      "! Table or view field name
      from_field     TYPE c LENGTH 30,
      "! <p class="shorttext">Table or view field name</p>
      "! Table or view field name
      to_field       TYPE c LENGTH 30,
    END OF ty_islm_psbindmp,

    "! <p class="shorttext">Dataset Bindings</p>
    "! Dataset Bindings
    BEGIN OF ty_islm_psbind,
      "! <p class="shorttext">Name</p>
      "! Name
      name      TYPE c LENGTH 30,
      "! <p class="shorttext">Reference UUID</p>
      "! Reference UUID
      reference TYPE c LENGTH 36,
    END OF ty_islm_psbind,

    "! <p class="shorttext">Scenario Signatures</p>
    "! Scenario Signatures
    BEGIN OF ty_islm_pssig,
      "! <p class="shorttext">Signature Name</p>
      "! Signature Name
      name           TYPE c LENGTH 30,
      "! <p class="shorttext">Signature Type</p>
      "! Signature Type
      signature_type TYPE c LENGTH 32,
      "! <p class="shorttext">Description</p>
      "! Description
      description    TYPE c LENGTH 100,
    END OF ty_islm_pssig,

    "! <p class="shorttext">Signature Fields</p>
    "! Signature Fields
    BEGIN OF ty_islm_pssigfld,
      "! <p class="shorttext">Name</p>
      "! Name
      input_name     TYPE c LENGTH 30,
      "! <p class="shorttext">Table or view field name</p>
      "! Table or view field name
      name           TYPE c LENGTH 30,
      "! <p class="shorttext">Position</p>
      "! Position
      field_position TYPE i,
      "! <p class="shorttext">Storage</p>
      "! Storage
      storage        TYPE c LENGTH 100,
      "! <p class="shorttext">Role of field</p>
      "! Role of field in Intelligent scenario (such as key, target)
      type           TYPE c LENGTH 30,
      "! <p class="shorttext">Data managent type</p>
      "! Data managent type
      dm_type        TYPE c LENGTH 30,
    END OF ty_islm_pssigfld,

    "! <p class="shorttext">Intelligent Scenario Modelling Context</p>
    "! Intelligent Scenario Modelling Context
    BEGIN OF ty_islm_mdlctxcc,
      "! <p class="shorttext">Name</p>
      "! Name
      name        TYPE c LENGTH 30,
      "! <p class="shorttext">UUID</p>
      "! UUID
      guid        TYPE c LENGTH 36,
      "! <p class="shorttext">Description</p>
      "! Description
      description TYPE c LENGTH 100,
    END OF ty_islm_mdlctxcc,

    "! <p class="shorttext">Modeling Context Filters</p>
    "! Modeling Context Filters
    BEGIN OF ty_islm_mctxfcc,
      "! <p class="shorttext">MC Name</p>
      "! MC Name
      mc_name          TYPE c LENGTH 30,
      "! <p class="shorttext">Name</p>
      "! Name
      name             TYPE c LENGTH 30,
      "! <p class="shorttext">Index</p>
      "! Index
      filter_index     TYPE i,
      "! <p class="shorttext">UUID</p>
      "! UUID
      modeling_context TYPE c LENGTH 36,
      "! <p class="shorttext">Table or view field name</p>
      "! Table or view field name
      field            TYPE c LENGTH 30,
      "! <p class="shorttext">Operation Filter Value</p>
      "! Operation Filter Value
      operation        TYPE c LENGTH 10,
      "! <p class="shorttext">Modeling Context Filter Low Value</p>
      "! Modeling Context Filter Low Value
      value            TYPE string,
      "! <p class="shorttext">Modeling Context Filter High Value</p>
      "! Modeling Context Filter High Value
      high_value       TYPE string,
    END OF ty_islm_mctxfcc,

    "! <p class="shorttext">Modeling Context Filters</p>
    "! Modeling Context Filters
    BEGIN OF ty_islm_pspardef,
      "! <p class="shorttext">UUID</p>
      "! UUID
      guid    TYPE c LENGTH 36,
      "! <p class="shorttext">Parameter name</p>
      "! Parameter name
      name    TYPE c LENGTH 256,
      "! <p class="shorttext">ISLM parameter context</p>
      "! ISLM parameter context
      context TYPE c LENGTH 1000,
      "! <p class="shorttext">Parameter value</p>
      "! Parameter value
      value   TYPE string,
    END OF ty_islm_pspardef,

    "! <p class="shorttext">Scenario parameter signature</p>
    "! Scenario parameter signature
    BEGIN OF ty_islm_pspar,
      "! <p class="shorttext">Parameter name</p>
      "! Parameter name
      name        TYPE c LENGTH 256,
      "! <p class="shorttext">Parameter type</p>
      "! Parameter type
      type        TYPE c LENGTH 32,
      "! <p class="shorttext">Parameter description</p>
      "! Parameter description
      description TYPE string,
      "! <p class="shorttext">Storage</p>
      "! Storage
      storage     TYPE c LENGTH 100,
      "! <p class="shorttext">Flag for parameter context</p>
      "! Flag for parameter context ('X' = will have context)
      context     TYPE c LENGTH 1,
      "! <p class="shorttext">Parameter size</p>
      "! Parameter size
      param_size  TYPE i,
    END OF ty_islm_pspar,

    "! <p class="shorttext">Scenario additional information</p>
    "! Scenario additional information
    BEGIN OF ty_islm_psaddlinfo,
      "! <p class="shorttext">Additional information key</p>
      "! Additional information key
      additional_info_key TYPE c LENGTH 50,
      "! <p class="shorttext">Additional information value ID</p>
      "! Additional information value ID
      value_id            TYPE i,
      "! <p class="shorttext">Additional information value</p>
      "! Additional information value
      value               TYPE c LENGTH 1024,
      "! <p class="shorttext">Additional information position ID</p>
      "! Additional information position ID
      position_id         TYPE i,
    END OF ty_islm_psaddlinfo,

    "! <p class="shorttext">Scenario additional information texts</p>
    "! Scenario additional information texts
    BEGIN OF ty_islm_psaddlinfot,
      "! <p class="shorttext">Language Key</p>
      "! Language Key
      language            TYPE sy-langu,
      "! <p class="shorttext">Additional information key</p>
      "! Additional information key
      additional_info_key TYPE c LENGTH 50,
      "! <p class="shorttext">Additional information value ID</p>
      "! Additional information value ID
      value_id            TYPE i,
      "! <p class="shorttext">Additional information key text label</p>
      "! Additional information key text label
      key_label           TYPE c LENGTH 255,
      "! <p class="shorttext">Additional information value text label</p>
      "! Additional information value text label
      value_label         TYPE c LENGTH 255,
    END OF ty_islm_psaddlinfot,

    "! <p class="shorttext">SBS Scenario Segment Fields</p>
    "! SBS Scenario Segment Fields
    BEGIN OF ty_islm_pssgmntfld,
      "! <p class="shorttext">Table or view field name</p>
      "! Table or view field name
      fieldname      TYPE c LENGTH 30,
      "! <p class="shorttext">Position</p>
      "! Position
      field_position TYPE i,
      "! <p class="shorttext">Key field or not</p>
      "! Key field or not
      iskey          TYPE c LENGTH 1,
    END OF ty_islm_pssgmntfld,

    "! <p class="shorttext">Intelligent Scenario Models</p>
    "! Intelligent Scenario Models
    BEGIN OF ty_models,
      "! <p class="shorttext">Model ID</p>
      "! Model ID
      guid              TYPE c LENGTH 36,
      "! <p class="shorttext">Model Name</p>
      "! Model Name
      "! $required
      model_name        TYPE c LENGTH 30,
      "! <p class="shorttext">Model Description</p>
      "! Model Description
      description       TYPE string,
      "! <p class="shorttext">State of Model</p>
      "! State of Model
      state             TYPE c LENGTH 10,
      "! <p class="shorttext">Executable ID</p>
      "! Executable ID
      "! $required
      executable_id     TYPE c LENGTH 64,
      "! <p class="shorttext">Large Language Model Name</p>
      "! Large Language Model Name
      "! $required
      llm_name          TYPE string,
      "! <p class="shorttext">LLM Model Version</p>
      "! LLM Model Version
      "! $required
      llm_model_version TYPE c LENGTH 30,
    END OF ty_models,

    "! <p class="shorttext">Model Prompt Template</p>
    "! Model Prompt Template
    BEGIN OF ty_islm_mdlprmttmpl,
      "! <p class="shorttext">Model Name</p>
      "! Model Name
      "! $required
      model_name        TYPE c LENGTH 30,
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

    "! <p class="shorttext">Intelligent scenarios</p>
    "! Intelligent scenarios
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version   TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header           TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Intelligent Scenario</p>
      "! Intelligent Scenario
      "! $required
      islm_ps          TYPE ty_islm_ps,
      "! <p class="shorttext">Objects based on Scenario</p>
      "! Objects based on Scenario
      islm_psddlobj    TYPE STANDARD TABLE OF ty_islm_psddlobj WITH DEFAULT KEY,
      "! <p class="shorttext">Scenario Binding Mappings</p>
      "! Scenario Binding Mappings
      islm_psbindmp    TYPE STANDARD TABLE OF ty_islm_psbindmp WITH DEFAULT KEY,
      "! <p class="shorttext">Dataset Bindings</p>
      "! Dataset Bindings
      islm_psbind      TYPE STANDARD TABLE OF ty_islm_psbind WITH DEFAULT KEY,
      "! <p class="shorttext">Scenario Signatures</p>
      "! Scenario Signatures
      islm_pssig       TYPE STANDARD TABLE OF ty_islm_pssig WITH DEFAULT KEY,
      "! <p class="shorttext">Signature Fields</p>
      "! Signature Fields
      islm_pssigfld    TYPE STANDARD TABLE OF ty_islm_pssigfld WITH DEFAULT KEY,
      "! <p class="shorttext">Intelligent Scenario Modelling Context</p>
      "! Intelligent Scenario Modelling Context
      islm_mdlctxcc    TYPE STANDARD TABLE OF ty_islm_mdlctxcc WITH DEFAULT KEY,
      "! <p class="shorttext">Modeling Context Filters</p>
      "! Modeling Context Filters
      islm_mctxfcc     TYPE STANDARD TABLE OF ty_islm_mctxfcc WITH DEFAULT KEY,
      "! <p class="shorttext">Modeling Context Filters</p>
      "! Modeling Context Filters
      islm_pspardef    TYPE STANDARD TABLE OF ty_islm_pspardef WITH DEFAULT KEY,
      "! <p class="shorttext">Scenario parameter signature</p>
      "! Scenario parameter signature
      islm_pspar       TYPE STANDARD TABLE OF ty_islm_pspar WITH DEFAULT KEY,
      "! <p class="shorttext">Scenario additional information</p>
      "! Scenario additional information
      islm_psaddlinfo  TYPE STANDARD TABLE OF ty_islm_psaddlinfo WITH DEFAULT KEY,
      "! <p class="shorttext">Scenario additional information texts</p>
      "! Scenario additional information texts
      islm_psaddlinfot TYPE STANDARD TABLE OF ty_islm_psaddlinfot WITH DEFAULT KEY,
      "! <p class="shorttext">SBS Scenario Segment Fields</p>
      "! SBS Scenario Segment Fields
      islm_pssgmntfld  TYPE STANDARD TABLE OF ty_islm_pssgmntfld WITH DEFAULT KEY,
      "! <p class="shorttext">Intelligent Scenario Models</p>
      "! Intelligent Scenario Models
      "! $required
      islm_models      TYPE STANDARD TABLE OF ty_models WITH DEFAULT KEY,
      "! <p class="shorttext">Model Prompt Templates</p>
      "! Model Prompt Templates
      islm_mdlprmttmpl TYPE STANDARD TABLE OF ty_islm_mdlprmttmpl WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
