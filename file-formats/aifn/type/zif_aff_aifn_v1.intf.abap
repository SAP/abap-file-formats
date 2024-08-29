INTERFACE zif_aff_aifn_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Namespace Details</p>
    "! Namespace details
    BEGIN OF ty_namespace_details,
      "! <p class="shorttext">AIF Namespace</p>
      "! AIF namespace
      "! $required
      aif_namespace TYPE c LENGTH 6,
    END OF ty_namespace_details,

    "! <p class="shorttext">Namespace</p>
    "! Namespace
    BEGIN OF ty_main,
      "! $required
      format_version    TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header            TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Namespace Details</p>
      "! Namespace details
      "! $required
      namespace_details TYPE ty_namespace_details,
    END OF ty_main.
ENDINTERFACE.
