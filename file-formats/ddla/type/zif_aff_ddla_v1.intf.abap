INTERFACE zif_aff_ddla_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">CDS Annotation Definition</p>
    "! Attributes of the annotation definition
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_no_abap_lv,
    END OF ty_main.

ENDINTERFACE.
