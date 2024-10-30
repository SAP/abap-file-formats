INTERFACE zif_aff_ints_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Objects Based on Scenario</p>
    "! These are the objects based on scenario
    BEGIN OF ty_scenario_ddl_objects,
      "! <p class="shorttext">Object Name in Object Directory</p>
      "! This is the object name
      object_name         TYPE c LENGTH 40,
      "! <p class="shorttext">Object Type in Object Directory</p>
      "! This is the type of the object
      object_type         TYPE c LENGTH 4,
      "! <p class="shorttext">Object Status</p>
      "! This is the status of the object
      object_status       TYPE c LENGTH 1,
      "! <p class="shorttext">Logical Object Type of a BOM Object</p>
      "! This is the logical object type
      logical_object_type TYPE c LENGTH 1,
    END OF ty_scenario_ddl_objects,

    "! <p class="shorttext">Intelligent Scenario</p>
    "! This is an intelligent scenario
    BEGIN OF ty_intelligent_scenario,
      "! <p class="shorttext">Intelligent Scenario Type</p>
      "! This is intelligent scenario type
      "! $required
      scenario_type         TYPE c LENGTH 256,
      "! <p class="shorttext">Extensible</p>
      "! This is extensibility flag
      extensible            TYPE abap_bool,
      "! <p class="shorttext">Multiple Active Model</p>
      "! This is the multiple active model enablement flag
      multi_active_model    TYPE abap_bool,
      "! <p class="shorttext">Data Management</p>
      "! This is the data management enablement flag
      dm_enabled            TYPE abap_bool,
      "! <p class="shorttext">Turnkey Auto Switch On Enablement</p>
      "! This is turnkey auto switch on enablement flag
      tkey_auto_switch_on   TYPE abap_bool,
      "! <p class="shorttext">Turnkey Implementation Type</p>
      "! This is the type of turnkey implementation
      "! $required
      tkey_type             TYPE c LENGTH 10,
      "! <p class="shorttext">Scenario Technology</p>
      "! This is the scenario technology
      scenario_tech         TYPE c LENGTH 20,
      "! <p class="shorttext">Prediction Class</p>
      "! This is a prediction class
      object_name           TYPE c LENGTH 30,
      "! <p class="shorttext">Prerequisite Check Class</p>
      "! This is a prerequisite check class
      prereq_chk_class      TYPE c LENGTH 30,
      "! <p class="shorttext">Scenario Technical Id</p>
      "! This is the scenario technical ID
      scenario_tech_id      TYPE c LENGTH 64,
      "! <p class="shorttext">State of Intelligent Scenario</p>
      "! This is the state of an intelligent scenario
      state                 TYPE c LENGTH 10,
      "! <p class="shorttext">ABAP Language Version</p>
      "! This is the abap language version
      abap_language_version TYPE c LENGTH 1,
      "! <p class="shorttext">ISLM Framework Version</p>
      "! This is the version of ISLM framework
      ism_version           TYPE p LENGTH 4 DECIMALS 2,
      "! <p class="shorttext">Turnkey Class</p>
      "! This is the turnkey class
      tkey_class            TYPE c LENGTH 30,
      "! <p class="shorttext">Intelligent Scenario Usage Type</p>
      "! This is the usage type of an intelligent scenario
      usage_type            TYPE c LENGTH 10,
      "! <p class="shorttext">OAuth 2.0 Client Profile</p>
      "! This is the OAuth 2.0 client profile
      oauth_profile         TYPE c LENGTH 30,
    END OF ty_intelligent_scenario,

    "! <p class="shorttext">Binding Mappings</p>
    "! These are scenario binding mappings
    BEGIN OF ty_binding_mappings,
      "! <p class="shorttext">Signature Name</p>
      "! This is signature name
      signature_name TYPE c LENGTH 30,
      "! <p class="shorttext">Table or View Field Name</p>
      "! This is a table or view field name
      from_field     TYPE c LENGTH 30,
      "! <p class="shorttext">Table or View Field Name</p>
      "! This is a table or view field name
      to_field       TYPE c LENGTH 30,
    END OF ty_binding_mappings,

    "! <p class="shorttext">Dataset Bindings</p>
    "! These are scenario dataset bindings
    BEGIN OF ty_bindings,
      "! <p class="shorttext">Name</p>
      "! This is the name of the binding
      name      TYPE c LENGTH 30,
      "! <p class="shorttext">Reference UUID</p>
      "! This is a reference UUID
      reference TYPE c LENGTH 36,
    END OF ty_bindings,

    "! <p class="shorttext">Signatures</p>
    "! These are the scenario signatures
    BEGIN OF ty_signatures,
      "! <p class="shorttext">Signature Name</p>
      "! This is the signature name
      name           TYPE c LENGTH 30,
      "! <p class="shorttext">Signature Type</p>
      "! This is the signature type
      signature_type TYPE c LENGTH 32,
      "! <p class="shorttext">Description</p>
      "! This is the description
      description    TYPE c LENGTH 100,
    END OF ty_signatures,

    "! <p class="shorttext">Signature Fields</p>
    "! These are the fields of signature
    BEGIN OF ty_signature_fields,
      "! <p class="shorttext">Name</p>
      "! This is the signature input name
      input_name     TYPE c LENGTH 30,
      "! <p class="shorttext">Table or View Field Name</p>
      "! This is a table or view field name
      name           TYPE c LENGTH 30,
      "! <p class="shorttext">Position</p>
      "! This is the position of the field
      field_position TYPE i,
      "! <p class="shorttext">Storage</p>
      "! This is the storage type of the field
      storage        TYPE c LENGTH 100,
      "! <p class="shorttext">Role of Field</p>
      "! This is the role of field in an intelligent scenario (such as key, target)
      type           TYPE c LENGTH 30,
      "! <p class="shorttext">Data Management Type</p>
      "! This is the type of data management
      dm_type        TYPE c LENGTH 30,
    END OF ty_signature_fields,

    "! <p class="shorttext">Modelling Context</p>
    "! This is the intelligent scenario Modelling context
    BEGIN OF ty_modelling_context,
      "! <p class="shorttext">Name</p>
      "! This is the name of the modelling context
      name        TYPE c LENGTH 30,
      "! <p class="shorttext">UUID</p>
      "! This is the modelling context UUID
      guid        TYPE c LENGTH 36,
      "! <p class="shorttext">Description</p>
      "! This is the description
      description TYPE c LENGTH 100,
    END OF ty_modelling_context,

    "! <p class="shorttext">Modeling Context Filters</p>
    "! These are the modeling context filters
    BEGIN OF ty_modelling_context_filters,
      "! <p class="shorttext">MC Name</p>
      "! This is the modelling context name
      mc_name          TYPE c LENGTH 30,
      "! <p class="shorttext">Name</p>
      "! This is the name
      name             TYPE c LENGTH 30,
      "! <p class="shorttext">Index</p>
      "! This is the filter index
      filter_index     TYPE i,
      "! <p class="shorttext">UUID</p>
      "! This is the modelling context UUID
      modeling_context TYPE c LENGTH 36,
      "! <p class="shorttext">Table or View Field Name</p>
      "! This is the field name of table or view
      field            TYPE c LENGTH 30,
      "! <p class="shorttext">Operation Filter Value</p>
      "! This is the operation filter value
      operation        TYPE c LENGTH 10,
      "! <p class="shorttext">Modeling Context Filter Low Value</p>
      "! This is the low value of modeling context filter
      value            TYPE string,
      "! <p class="shorttext">Modeling Context Filter High Value</p>
      "! This is the high value of modeling context filter
      high_value       TYPE string,
    END OF ty_modelling_context_filters,

    "! <p class="shorttext">Parameter defaults</p>
    "! These are the scenario parameter defaults
    BEGIN OF ty_parameter_defaults,
      "! <p class="shorttext">UUID</p>
      "! This is the scenario UUID
      guid    TYPE c LENGTH 36,
      "! <p class="shorttext">Parameter Name</p>
      "! This is the parameter name
      name    TYPE c LENGTH 256,
      "! <p class="shorttext">Parameter Context</p>
      "! This is the parameter context
      context TYPE c LENGTH 1000,
      "! <p class="shorttext">Parameter Value</p>
      "! This is the parameter value
      value   TYPE string,
    END OF ty_parameter_defaults,

    "! <p class="shorttext">Parameter Signature</p>
    "! These are the scenario parameters signature
    BEGIN OF ty_parameters,
      "! <p class="shorttext">Parameter Name</p>
      "! This is the parameter name
      name        TYPE c LENGTH 256,
      "! <p class="shorttext">Parameter Type</p>
      "! This is the parameter type
      type        TYPE c LENGTH 32,
      "! <p class="shorttext">Parameter Description</p>
      "! This is the parameter description
      description TYPE string,
      "! <p class="shorttext">Storage</p>
      "! This is the storage type
      storage     TYPE c LENGTH 100,
      "! <p class="shorttext">Parameter Context Flag</p>
      "! This is the flag for parameter context
      context     TYPE c LENGTH 1,
      "! <p class="shorttext">Parameter Size</p>
      "! This is the size of parameter
      param_size  TYPE i,
    END OF ty_parameters,

    "! <p class="shorttext">Additional Information</p>
    "! These are the scenario additional information
    BEGIN OF ty_additional_info,
      "! <p class="shorttext">Additional Information Key</p>
      "! This is an additional information key
      additional_info_key TYPE c LENGTH 50,
      "! <p class="shorttext">Additional Information Value ID</p>
      "! This is the additional information value ID
      value_id            TYPE i,
      "! <p class="shorttext">Additional Information Value</p>
      "! This is the value of an additional information
      value               TYPE c LENGTH 1024,
      "! <p class="shorttext">Additional Information Position ID</p>
      "! This is the position of an additional information ID
      position_id         TYPE i,
    END OF ty_additional_info,

    "! <p class="shorttext">Additional Information Texts</p>
    "! These are the scenario additional information texts
    BEGIN OF ty_additional_info_text,
      "! <p class="shorttext">Language Key</p>
      "! This is the language key
      language            TYPE sy-langu,
      "! <p class="shorttext">Additional Information Key</p>
      "! This is an additional information key
      additional_info_key TYPE c LENGTH 50,
      "! <p class="shorttext">Additional Information Value ID</p>
      "! This is the additional information value ID
      value_id            TYPE i,
      "! <p class="shorttext">Additional Information Key Text Label</p>
      "! This is the additional information key text label
      key_label           TYPE c LENGTH 255,
      "! <p class="shorttext">Additional Information Value Text Label</p>
      "! This is the additional information value text label
      value_label         TYPE c LENGTH 255,
    END OF ty_additional_info_text,

    "! <p class="shorttext">SBS Segment Fields</p>
    "! These are the SBS Scenario Segment Fields
    BEGIN OF ty_sbs_segment_fields,
      "! <p class="shorttext">Table or View Field Name</p>
      "! This is the field name of a table or view
      fieldname      TYPE c LENGTH 30,
      "! <p class="shorttext">Position</p>
      "! This is the position
      field_position TYPE i,
      "! <p class="shorttext">Key Field</p>
      "! This is key field or not
      iskey          TYPE c LENGTH 1,
    END OF ty_sbs_segment_fields,

    "! <p class="shorttext">Intelligent Scenario</p>
    "! This is an intelligent scenario
    BEGIN OF ty_main,
      "! $required
      format_version            TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                    TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Intelligent Scenario</p>
      "! This is an intelligent scenario
      "! $required
      intelligent_scenario      TYPE ty_intelligent_scenario,
      "! <p class="shorttext">Objects Based on Scenario</p>
      "! These are the objects based on scenario
      scenario_ddl_objects      TYPE STANDARD TABLE OF ty_scenario_ddl_objects WITH DEFAULT KEY,
      "! <p class="shorttext">Binding Mappings</p>
      "! These are scenario binding mappings
      binding_mappings          TYPE STANDARD TABLE OF ty_binding_mappings WITH DEFAULT KEY,
      "! <p class="shorttext">Dataset Bindings</p>
      "! These are scenario dataset bindings
      bindings                  TYPE STANDARD TABLE OF ty_bindings WITH DEFAULT KEY,
      "! <p class="shorttext">Signatures</p>
      "! These are the scenario signatures
      signatures                TYPE STANDARD TABLE OF ty_signatures WITH DEFAULT KEY,
      "! <p class="shorttext">Signature Fields</p>
      "! These are the fields of signature
      signature_fields          TYPE STANDARD TABLE OF ty_signature_fields WITH DEFAULT KEY,
      "! <p class="shorttext">Modelling Context</p>
      "! This is the intelligent scenario Modelling context
      modelling_context         TYPE STANDARD TABLE OF ty_modelling_context WITH DEFAULT KEY,
      "! <p class="shorttext">Modeling Context Filters</p>
      "! These are the modeling context filters
      modelling_context_filters TYPE STANDARD TABLE OF ty_modelling_context_filters WITH DEFAULT KEY,
      "! <p class="shorttext">Parameter Defaults</p>
      "! These are the scenario parameter defaults
      parameter_defaults        TYPE STANDARD TABLE OF ty_parameter_defaults WITH DEFAULT KEY,
      "! <p class="shorttext">Parameter Signature</p>
      "! These are the scenario parameters signature
      parameters                TYPE STANDARD TABLE OF ty_parameters WITH DEFAULT KEY,
      "! <p class="shorttext">Additional Information</p>
      "! These are the scenario additional information
      additional_info           TYPE STANDARD TABLE OF ty_additional_info WITH DEFAULT KEY,
      "! <p class="shorttext">Additional Information Texts</p>
      "! These are the scenario additional information texts
      additional_info_text      TYPE STANDARD TABLE OF ty_additional_info_text WITH DEFAULT KEY,
      "! <p class="shorttext">SBS Segment Fields</p>
      "! These are the SBS Scenario Segment Fields
      sbs_segment_fields        TYPE STANDARD TABLE OF ty_sbs_segment_fields WITH DEFAULT KEY,
    END OF ty_main.
ENDINTERFACE.
