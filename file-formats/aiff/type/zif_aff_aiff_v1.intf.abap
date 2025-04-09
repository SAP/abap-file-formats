INTERFACE zif_aff_aiff_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      "! $required
      namespace     TYPE c LENGTH 15,
      "! <p class="shorttext">AIF Fix Value</p>
      "! AIF fix value
      "! $required
      aif_fix_value TYPE c LENGTH 20,
      "! <p class="shorttext">Field Value</p>
      "! Field value
      field_value   TYPE c LENGTH 255,
    END OF ty_general_information,

    "! <p class="shorttext">Fix Value</p>
    "! Fix value
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
    END OF ty_main.

ENDINTERFACE.
