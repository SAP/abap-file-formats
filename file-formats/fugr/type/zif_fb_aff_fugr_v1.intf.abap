INTERFACE zif_fb_aff_fugr_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Object Type FUGR</p>
    "! FUGR object type
    BEGIN OF ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema               TYPE string,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">Fix Point Arithmetic</p>
      "! Fix point arithmetic
      "! $required
      fix_point_arithmetic TYPE abap_bool,
      "! <p class="shorttext">Status</p>
      "! Status
      status               TYPE zif_aff_types_v1=>ty_status,
    END OF ty_main.

ENDINTERFACE.
