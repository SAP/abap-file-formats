INTERFACE zif_aff_aiff_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Fix Value Details.</p>
    "! Fix Value Details
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      "! $required
      namespace      TYPE c LENGTH 15,
      "! <p class="shorttext">AIF Fix Value</p>
      "! AIF Fix Value
      "! $required
      fix_value_name TYPE c LENGTH 20,
      "! <p class="shorttext">Field Value</p>
      "! Field Value
      field_value    TYPE c LENGTH 255,
    END OF ty_general_information,

    "! <p class="shorttext">Fix_Value</p>
    "! Fix_Value
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General Information
      "! $required
      general_information TYPE ty_general_information,
    END OF ty_main.

ENDINTERFACE.
