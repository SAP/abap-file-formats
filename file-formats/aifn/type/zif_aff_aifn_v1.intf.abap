INTERFACE zif_aff_aifn_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Namespace Details</p>
    "! Namespace details
    BEGIN OF ty_general_information,
      "! <p class="shorttext">AIF Namespace</p>
      "! AIF namespace
      aif_namespace TYPE c LENGTH 6,
    END OF ty_general_information,

    "! <p class="shorttext">Namespace</p>
    "! Namespace
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
