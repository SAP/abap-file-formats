INTERFACE zif_aff_dtix_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Dictionary Tuning Index</p>
    "! Dictionary Tuning Index
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
    END OF ty_main.
ENDINTERFACE.
