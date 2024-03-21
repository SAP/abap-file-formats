INTERFACE zif_aff_bgqc_v1
  PUBLIC.

  TYPES:

    "! <p class="shorttext">Background Processing Context</p>
    "! Background Processing Context
    BEGIN OF ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,

    END OF ty_main.

ENDINTERFACE.
