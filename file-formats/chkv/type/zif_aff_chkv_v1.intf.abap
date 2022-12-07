INTERFACE zif_aff_chkv_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Range Value</p>
    "! A range value for an ATC check parameter
    BEGIN OF ty_range,
      "! <p class="shorttext">Sign</p>
      "! The sign type of the range
      "! $required
      sign   TYPE zif_aff_types_v1=>ty_sign,
      "! <p class="shorttext">Option</p>
      "! Sign option of the range
      "! $required
      option TYPE zif_aff_types_v1=>ty_option,
      "! <p class="shorttext">Low</p>
      "! The low value of the range
      "! $showAlways
      low    TYPE string,
      "! <p class="shorttext">High</p>
      "! The high value of the range
      high   TYPE string,
    END OF ty_range,

    ty_ranges      TYPE STANDARD TABLE OF ty_range WITH DEFAULT KEY,

    "! <p class="shorttext">Entry in Value List</p>
    "! A parameter value in the parameter value list
    ty_param_value TYPE string,

    "! <p class="shorttext">Parameter</p>
    "! Parameter of ATC check
    BEGIN OF ty_parameter,
      "! <p class="shorttext">Parameter Name</p>
      "! The parameter name
      "! $required
      name             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Parameter Value</p>
      "! The value of the parameter
      value            TYPE string,
      "! <p class="shorttext">List of Parameter Values</p>
      "! List of values for a multi-value check parameter
      value_list       TYPE STANDARD TABLE OF ty_param_value WITH DEFAULT KEY,
      "! <p class="shorttext">List of Range Values</p>
      "! List of range values for a check parameter
      value_range_list TYPE ty_ranges,
    END OF ty_parameter,

    "! <p class="shorttext">Parameters</p>
    "! Table of check parameters
    ty_parameters TYPE STANDARD TABLE OF ty_parameter WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Check</p>
    "! Check with its parameters
    BEGIN OF ty_check,
      "! <p class="shorttext">Check Name</p>
      "! The name of check
      "! $required
      check_name TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Parameters</p>
      "! Parameters of check
      parameters TYPE ty_parameters,
    END OF ty_check.

  TYPES:
      "! <p class="shorttext">Selected Checks</p>
      "! Table of selected checks of the ATC check variant
      ty_checks TYPE STANDARD TABLE OF ty_check WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">ATC Check Variant Properties</p>
    "! ATC check variant properties
    BEGIN OF ty_main,
      "! $required
      format_version     TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header             TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Remote-Enabled</p>
      "! The ATC check variant is remote-enabled
      remote_enabled     TYPE abap_bool,
      "! <p class="shorttext">Selected Checks</p>
      "! The checks selected in the ATC check variant
      selected_checks    TYPE ty_checks,
    END OF ty_main.

ENDINTERFACE.
