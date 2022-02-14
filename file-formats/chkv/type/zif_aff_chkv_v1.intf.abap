INTERFACE zif_aff_chkv_v1
  PUBLIC.

  "! <p class="shorttext">Option</p>
  "! Option
  "! $values {@link zif_aff_chkv_v1.data:co_option}
  TYPES ty_option TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Option</p>
    "! Option
    BEGIN OF co_option,
      "! <p class="shorttext">Equals</p>
      "! Equals
      equals               TYPE ty_option VALUE 'EQ',
      "! <p class="shorttext">Between</p>
      "! Between
      between              TYPE ty_option VALUE 'BT',
      "! <p class="shorttext">Greater Than</p>
      "! Greater than
      greater_than         TYPE ty_option VALUE 'GT',
      "! <p class="shorttext">Contains Pattern</p>
      "! Contains pattern
      contains_pattern     TYPE ty_option VALUE 'CP',
      "! <p class="shorttext">Not Equal</p>
      "! Not equal
      not_equal            TYPE ty_option VALUE 'NE',
      "! <p class="shorttext">Not Between</p>
      "! Not between
      not_between          TYPE ty_option VALUE 'NB',
      "! <p class="shorttext">Not Contains Pattern</p>
      "! Not contains pattern
      not_contains_pattern TYPE ty_option VALUE 'NP',
      "! <p class="shorttext">Greater Equal</p>
      "! Greater equal
      greater_equal        TYPE ty_option VALUE 'GE',
      "! <p class="shorttext">Lower Than</p>
      "! Lower than
      lower_than           TYPE ty_option VALUE 'LT',
      "! <p class="shorttext">Lower Equal</p>
      "! Lower equal
      lower_equal          TYPE ty_option VALUE 'LE',
    END OF co_option.

  "! <p class="shorttext">Sign</p>
  "! Sign
  "! $values {@link zif_aff_chkv_v1.data:co_sign}
  TYPES ty_sign TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Sign</p>
    "! Sign
    BEGIN OF co_sign,
      "! <p class="shorttext">Exclude</p>
      "! Exclude
      exclude TYPE ty_sign VALUE 'E',
      "! <p class="shorttext">Include</p>
      "! Include
      include TYPE ty_sign VALUE 'I',
    END OF co_sign.

  TYPES:
    "! <p class="shorttext">Range Value</p>
    "! A range value for an ATC check parameter
    BEGIN OF ty_range,
      "! <p class="shorttext">Sign</p>
      "! The sign type of the range
      "! $required
      sign   TYPE ty_sign,
      "! <p class="shorttext">Option</p>
      "! Sign option of the range
      "! $required
      option TYPE ty_option,
      "! <p class="shorttext">Low</p>
      "! The low value of the range
      "! $required
      low    TYPE string,
      "! <p class="shorttext">High</p>
      "! The high value of the range
      "! $required
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
      header             TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Remote-Enabled</p>
      "! The ATC check variant is remote-enabled
      remote_enabled     TYPE abap_bool,
      "! <p class="shorttext">Selected Checks</p>
      "! The checks selected in the ATC check variant
      selected_checks    TYPE ty_checks,
    END OF ty_main.

ENDINTERFACE.
