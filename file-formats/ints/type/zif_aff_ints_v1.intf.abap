INTERFACE zif_aff_ints_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Scenario Objects</p>
    "! Objects based on scenario
    BEGIN OF ty_scenario_ddl_objects,
      "! <p class="shorttext">Object Name</p>
      "! Object name
      object_name         TYPE c LENGTH 40,
      "! <p class="shorttext">Object Type</p>
      "! Type of the object
      object_type         TYPE c LENGTH 4,
      "! <p class="shorttext">Object Status</p>
      "! Status of the object
      object_status       TYPE c LENGTH 1,
      "! <p class="shorttext">Logical Object Type</p>
      "! Logical object type of a BOM object
      logical_object_type TYPE c LENGTH 1,
    END OF ty_scenario_ddl_objects,

    "! <p class="shorttext">Intelligent Scenario</p>
    "! Intelligent scenario
    BEGIN OF ty_intelligent_scenario,
      "! <p class="shorttext">Intelligent Scenario Type</p>
      "! Intelligent scenario type
      "! $required
      scenario_type             TYPE c LENGTH 256,
      "! <p class="shorttext">Extensible</p>
      "! Extensibility flag
      is_extensible             TYPE abap_bool,
      "! <p class="shorttext">Multiple Active Model</p>
      "! Multiple active model enablement flag
      is_multi_active_model     TYPE abap_bool,
      "! <p class="shorttext">Data Management</p>
      "! Data management enablement flag
      is_dm_enabled             TYPE abap_bool,
      "! <p class="shorttext">Turnkey Auto Switch</p>
      "! Turnkey auto switch on enablement flag
      is_turnkey_auto_switch_on TYPE abap_bool,
      "! <p class="shorttext">Turnkey Implementation Type</p>
      "! Type of turnkey implementation
      turnkey_type              TYPE c LENGTH 10,
      "! <p class="shorttext">Scenario Technology</p>
      "! Scenario technology
      scenario_technology       TYPE c LENGTH 20,
      "! <p class="shorttext">Prediction Class</p>
      "! Prediction class
      prediction_class          TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Prerequisite Check Class</p>
      "! Prerequisite check class
      prerequisite_check_class  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Scenario Technical ID</p>
      "! Scenario technical ID
      scenario_technical_id     TYPE c LENGTH 64,
      "! <p class="shorttext">State</p>
      "! State of an intelligent scenario
      state                     TYPE c LENGTH 10,
      "! <p class="shorttext">ISLM Framework Version</p>
      "! ISLM framework version
      islm_version              TYPE p LENGTH 4 DECIMALS 2,
      "! <p class="shorttext">Turnkey Class</p>
      "! Turnkey class
      turnkey_class             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Usage Type</p>
      "! Usage type of an intelligent scenario
      usage_type                TYPE c LENGTH 10,
      "! <p class="shorttext">OAuth Profile</p>
      "! OAuth 2.0 client profile
      oauth_profile             TYPE c LENGTH 30,
    END OF ty_intelligent_scenario,

    "! <p class="shorttext">Dataset Bindings</p>
    "! These are scenario dataset bindings
    BEGIN OF ty_bindings,
      "! <p class="shorttext">Binding Name</p>
      "! Name of the binding
      name      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Reference</p>
      "! Reference
      reference TYPE c LENGTH 36,
    END OF ty_bindings,

    "! <p class="shorttext">Signatures</p>
    "! Scenario signatures
    BEGIN OF ty_signatures,
      "! <p class="shorttext">Signature Name</p>
      "! Signature name
      input_name           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Signature Type</p>
      "! Signature type
      signature_type       TYPE c LENGTH 32,
      "! <p class="shorttext">Description</p>
      "! Description
      description          TYPE c LENGTH 100,
      "! <p class="shorttext">Field Name</p>
      "! Table or view field name
      field_name           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Position</p>
      "! Position of the field
      field_position       TYPE i,
      "! <p class="shorttext">Storage Type</p>
      "! Storage type of the field
      storage_type         TYPE c LENGTH 100,
      "! <p class="shorttext">Role of Field</p>
      "! Role of field in an intelligent scenario (such as key, target)
      field_type           TYPE c LENGTH 30,
      "! <p class="shorttext">Data Management Type</p>
      "! Data management type
      data_management_type TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_signatures,

    "! <p class="shorttext">Modelling Context</p>
    "! Intelligent scenario Modelling context
    BEGIN OF ty_modelling_context,
      "! <p class="shorttext">Modelling Context Name</p>
      "! Modelling context name
      name                 TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Modelling Context ID</p>
      "! Modelling context ID
      modelling_context_id TYPE c LENGTH 36,
      "! <p class="shorttext">Description</p>
      "! Description
      description          TYPE c LENGTH 100,
    END OF ty_modelling_context,

    "! <p class="shorttext">Parameter Signature</p>
    "! Parameter signature
    BEGIN OF ty_parameters,
      "! <p class="shorttext">Parameter Name</p>
      "! Parameter name
      name           TYPE c LENGTH 256,
      "! <p class="shorttext">Parameter Type</p>
      "! Parameter type
      type           TYPE c LENGTH 32,
      "! <p class="shorttext">Parameter Description</p>
      "! Parameter description
      description    TYPE string,
      "! <p class="shorttext">Storage</p>
      "! Storage type
      storage        TYPE c LENGTH 100,
      "! <p class="shorttext">Context Flag</p>
      "! Parameter context flag
      has_context    TYPE c LENGTH 1,
      "! <p class="shorttext">Parameter Size</p>
      "! Parameter size
      parameter_size TYPE i,
      "! <p class="shorttext">Parameter ID</p>
      "! Parameter ID
      parameter_id   TYPE c LENGTH 36,
      "! <p class="shorttext">Parameter Context</p>
      "! Parameter context
      context        TYPE c LENGTH 1000,
      "! <p class="shorttext">Parameter Value</p>
      "! Parameter value
      value          TYPE string,
    END OF ty_parameters,

    "! <p class="shorttext">Additional Information</p>
    "! Additional information
    BEGIN OF ty_additional_info,
      "! <p class="shorttext">Key</p>
      "! Additional information key
      additional_info_key TYPE c LENGTH 50,
      "! <p class="shorttext">Value ID</p>
      "! Additional information value ID
      value_id            TYPE i,
      "! <p class="shorttext">Value</p>
      "! Additional information value
      value               TYPE c LENGTH 1024,
      "! <p class="shorttext">Position ID</p>
      "! Additional information position ID
      position_id         TYPE i,
      "! <p class="shorttext">Key Text Label</p>
      "! Additional information key text label
      key_label           TYPE c LENGTH 255,
      "! <p class="shorttext">Value Text Label</p>
      "! Additional information value text label
      value_label         TYPE c LENGTH 255,
    END OF ty_additional_info,

    "! <p class="shorttext">SBS Segment Fields</p>
    "! SBS scenario segment fields
    BEGIN OF ty_sbs_segment_fields,
      "! <p class="shorttext">Field Name</p>
      "! Table or view field name
      field_name     TYPE c LENGTH 30,
      "! <p class="shorttext">Position</p>
      "! Position
      field_position TYPE i,
      "! <p class="shorttext">Key Field</p>
      "! Key field or not
      is_key         TYPE abap_bool,
    END OF ty_sbs_segment_fields,

    "! <p class="shorttext">Intelligent Scenario</p>
    "! Intelligent scenario
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Intelligent Scenario</p>
      "! Intelligent scenario
      "! $required
      intelligent_scenario TYPE ty_intelligent_scenario,
      "! <p class="shorttext">Modelling Context</p>
      "! Intelligent scenario modelling context
      modelling_context    TYPE ty_modelling_context,
      "! <p class="shorttext">Scenario Objects</p>
      "! Objects based on scenario
      scenario_ddl_objects TYPE STANDARD TABLE OF ty_scenario_ddl_objects WITH DEFAULT KEY,
      "! <p class="shorttext">Dataset Bindings</p>
      "! Scenario dataset bindings
      bindings             TYPE STANDARD TABLE OF ty_bindings WITH DEFAULT KEY,
      "! <p class="shorttext">Signatures</p>
      "! Scenario signatures
      signatures           TYPE STANDARD TABLE OF ty_signatures WITH DEFAULT KEY,
      "! <p class="shorttext">Parameter Signature</p>
      "! Scenario parameters signature
      parameters           TYPE STANDARD TABLE OF ty_parameters WITH DEFAULT KEY,
      "! <p class="shorttext">Additional Information</p>
      "! Scenario additional information
      additional_info      TYPE STANDARD TABLE OF ty_additional_info WITH DEFAULT KEY,
      "! <p class="shorttext">SBS Segment Fields</p>
      "! SBS Scenario Segment Fields
      sbs_segment_fields   TYPE STANDARD TABLE OF ty_sbs_segment_fields WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
