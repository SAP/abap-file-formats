interface ZIF_AFF_EDCR_V1
  public .
 TYPES:
    "! <p class="shorttext">Representation Type</p>
    "! Representation Type (EDCR) v1
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
    END OF ty_main.
endinterface.
