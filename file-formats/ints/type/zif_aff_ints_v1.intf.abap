INTERFACE zif_aff_ints_v1
  PUBLIC.

  "! $values { @link zif_aff_ints_v1.data:co_object_status }
  "! $default { @link zif_aff_ints_v1.data:co_object_status.success }
  TYPES ty_object_status TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_object_status,
      "! <p class="shorttext">Error</p>
      "! Error
      error       TYPE ty_object_status VALUE 'E',
      "! <p class="shorttext">Termination</p>
      "! Termination
      termination TYPE ty_object_status VALUE 'A',
      "! <p class="shorttext">Information</p>
      "! Information
      information TYPE ty_object_status VALUE 'I',
      "! <p class="shorttext">Warning</p>
      "! Warning
      warning     TYPE ty_object_status VALUE 'W',
      "! <p class="shorttext">Success</p>
      "! Success message
      success     TYPE ty_object_status VALUE 'S',
    END OF co_object_status.

  "! $values { @link zif_aff_ints_v1.data:co_logical_object_type }
  "! $default { @link zif_aff_ints_v1.data:co_logical_object_type.cds_view }
  TYPES ty_logical_object_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_logical_object_type,
      "! <p class="shorttext">Table Function</p>
      "! Table Function
      table_function TYPE ty_logical_object_type VALUE 'F',
      "! <p class="shorttext">CDS View</p>
      "! CDS view
      cds_view       TYPE ty_logical_object_type VALUE 'V',
      "! <p class="shorttext">Class</p>
      "! Class
      class          TYPE ty_logical_object_type VALUE 'C',
      "! <p class="shorttext">DCL</p>
      "! DCL
      dcl            TYPE ty_logical_object_type VALUE 'D',
      "! <p class="shorttext">Model</p>
      "! Model
      model          TYPE ty_logical_object_type VALUE 'M',
      "! <p class="shorttext">Avas</p>
      "! Avas
      avas           TYPE ty_logical_object_type VALUE 'A',
    END OF co_logical_object_type.

  TYPES:
    "! <p class="shorttext">Scenario Object</p>
    "! Object generated based on a scenario
    BEGIN OF ty_scenario_ddl_object,
      "! <p class="shorttext">Object Name</p>
      "! Object name
      object_name         TYPE c LENGTH 40,
      "! <p class="shorttext">Object Type</p>
      "! Type of the object
      object_type         TYPE c LENGTH 4,
      "! <p class="shorttext">Object Status</p>
      "! Status of the object
      object_status       TYPE ty_object_status,
      "! <p class="shorttext">Logical Object Type</p>
      "! Logical object type of a BOM object
      logical_object_type TYPE ty_logical_object_type,
    END OF ty_scenario_ddl_object,

    "! <p class="shorttext">Intelligent Scenario</p>
    "! Intelligent scenario
    BEGIN OF ty_intelligent_scenario,
      "! <p class="shorttext">Intelligent Scenario Type</p>
      "! Intelligent scenario type
      "! $required
      scenario_type              TYPE c LENGTH 256,
      "! <p class="shorttext">Is Extensible</p>
      "! If true, the scenario is extensible
      is_extensible              TYPE abap_bool,
      "! <p class="shorttext">Is Multiple Active Model</p>
      "! If true, the scenario can have multiple active models
      is_multi_active_model      TYPE abap_bool,
      "! <p class="shorttext">Uses Data Management</p>
      "! If true, the scenario uses Data Management
      is_data_management_enabled TYPE abap_bool,
      "! <p class="shorttext">Is Turnkey Auto Switch ON</p>
      "! If true, scenario will be turnkey enabled to automate the operations
      is_turnkey_auto_switch_on  TYPE abap_bool,
      "! <p class="shorttext">Turnkey Implementation Type</p>
      "! Type of turnkey implementation
      turnkey_type               TYPE c LENGTH 10,
      "! <p class="shorttext">Scenario Technology</p>
      "! Scenario technology
      scenario_technology        TYPE c LENGTH 20,
      "! <p class="shorttext">Prediction Class</p>
      "! Prediction class
      prediction_class           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Prerequisite Check Class</p>
      "! Prerequisite check class
      prerequisite_check_class   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Scenario Technical ID</p>
      "! Scenario technical ID
      scenario_technical_id      TYPE c LENGTH 64,
      "! <p class="shorttext">State</p>
      "! State of an intelligent scenario
      state                      TYPE c LENGTH 10,
      "! <p class="shorttext">ISLM Framework Version</p>
      "! ISLM framework version
      islm_version               TYPE p LENGTH 4 DECIMALS 2,
      "! <p class="shorttext">Turnkey Class</p>
      "! Turnkey class
      turnkey_class              TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Usage Type</p>
      "! Usage type of an intelligent scenario
      usage_type                 TYPE c LENGTH 10,
      "! <p class="shorttext">OAuth Profile</p>
      "! OAuth 2.0 client profile
      oauth_profile              TYPE c LENGTH 30,
    END OF ty_intelligent_scenario,

    "! <p class="shorttext">Dataset Binding</p>
    "! Scenario dataset binding
    BEGIN OF ty_binding,
      "! <p class="shorttext">Binding Name</p>
      "! Name of the binding
      name      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Reference object</p>
      "! Reference object(for example - CDS view)
      reference TYPE c LENGTH 36,
    END OF ty_binding,

    "! <p class="shorttext">Signature</p>
    "! Scenario signature
    BEGIN OF ty_signature,
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
    END OF ty_signature,

    "! <p class="shorttext">Modelling Context</p>
    "! Intelligent scenario modelling context
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
    BEGIN OF ty_parameter,
      "! <p class="shorttext">Parameter Name</p>
      "! Parameter name
      name           TYPE c LENGTH 256,
      "! <p class="shorttext">Parameter Type</p>
      "! Parameter type
      type           TYPE c LENGTH 32,
      "! <p class="shorttext">Parameter Description</p>
      "! Parameter description
      description    TYPE string,
      "! <p class="shorttext">Storage Type</p>
      "! Storage type
      storage_type   TYPE c LENGTH 100,
      "! <p class="shorttext">Context Flag</p>
      "! If true, then input context value is available
      has_context    TYPE abap_bool,
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
    END OF ty_parameter,

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

    "! <p class="shorttext">SBS Segment Field</p>
    "! SBS scenario segment field
    BEGIN OF ty_sbs_segment_field,
      "! <p class="shorttext">Field Name</p>
      "! Table or view field name
      field_name     TYPE c LENGTH 30,
      "! <p class="shorttext">Position</p>
      "! Position
      field_position TYPE i,
      "! <p class="shorttext">Is Key Field</p>
      "! If true, the field is a key field
      is_key         TYPE abap_bool,
    END OF ty_sbs_segment_field,

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
      scenario_ddl_objects TYPE STANDARD TABLE OF ty_scenario_ddl_object WITH DEFAULT KEY,
      "! <p class="shorttext">Dataset Bindings</p>
      "! Scenario dataset bindings
      bindings             TYPE STANDARD TABLE OF ty_binding WITH DEFAULT KEY,
      "! <p class="shorttext">Signatures</p>
      "! Scenario signatures
      signatures           TYPE STANDARD TABLE OF ty_signature WITH DEFAULT KEY,
      "! <p class="shorttext">Parameter Signature</p>
      "! Scenario parameters signature
      parameters           TYPE STANDARD TABLE OF ty_parameter WITH DEFAULT KEY,
      "! <p class="shorttext">Additional Information</p>
      "! Scenario additional information
      additional_info      TYPE STANDARD TABLE OF ty_additional_info WITH DEFAULT KEY,
      "! <p class="shorttext">SBS Segment Fields</p>
      "! SBS Scenario Segment Fields
      sbs_segment_fields   TYPE STANDARD TABLE OF ty_sbs_segment_field WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
