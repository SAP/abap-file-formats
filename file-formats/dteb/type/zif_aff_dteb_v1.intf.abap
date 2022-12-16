INTERFACE zif_aff_dteb_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">CDS Entity Buffer</p>
    "! CDS entity buffer
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
    END OF ty_main.

ENDINTERFACE.
