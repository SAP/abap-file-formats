INTERFACE zif_aff_chko_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Parameter</p>
    "! A parameter of an ATC check object
    BEGIN OF ty_parameter,
      "! <p class="shorttext">Parameter Name</p>
      "! Name of a parameter
      name         TYPE string,
      "! <p class="shorttext">Parameter Description</p>
      "! Description of a parameter
      description  TYPE c LENGTH 255,
      "! <p class="shorttext">Is Hidden</p>
      "! The parameter is hidden
      hidden       TYPE abap_bool,
    END OF ty_parameter.

  TYPES:
    "! <p class="shorttext">Parameters</p>
    "! List of parameters
    ty_parameters TYPE HASHED TABLE OF ty_parameter WITH UNIQUE KEY name.

  "! <p class="shorttext">Check Type</p>
  "! Check type
  "! $values {@link zif_aff_chko_v1.data:co_check_type}
  "! $default {@link zif_aff_chko_v1.data:co_check_type.local}
  TYPES ty_check_type TYPE c LENGTH 1.

  TYPES:
    "! <p class="shorttext">ATC Check</p>
    "! ATC check object properties
    BEGIN OF ty_main,
      "! $required
      format_version     TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header             TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Category</p>
      "! The parent category of an ATC check object
      "! $required
      category           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Implementing Class</p>
      "! The implementing class of the ATC check object
      "! $required
      implementing_class TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Type</p>
      "! The check type of ATC check
      check_type     TYPE ty_check_type,
      "! <p class="shorttext">Parameters</p>
      "! Parameters of the ATC check object
      parameters         TYPE ty_parameters,
    END OF ty_main.

  CONSTANTS:
    "! <p class="shorttext">Check Type</p>
    "! Check type
    BEGIN OF co_check_type,
      "! <p class="shorttext">Local</p>
      "! Local
      local              TYPE ty_check_type VALUE 'L',
      "! <p class="shorttext">Remote Enabled</p>
      "! Remote enabled
      remote_enabled     TYPE ty_check_type VALUE 'R',
    END OF co_check_type.
ENDINTERFACE.
