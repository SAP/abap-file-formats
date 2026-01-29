INTERFACE zif_aff_dtix_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Entity index</p>
    "! Entity index
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
    END OF ty_main.
  CONSTANTS:
    co_st_name               TYPE string value 'DDIC_AFF_DTIX_PROPERTIES',
    co_format_version        TYPE zif_aff_types_v1=>ty_format_version value '1'.
ENDINTERFACE.
