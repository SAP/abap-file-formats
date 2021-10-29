INTERFACE zif_aff_chkc_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">ATC Check Category</p>
    "! ATC check category properties
    BEGIN OF ty_main,
      "! <p class="shorttext">ABAP File Format Version</p>
      "! The ABAP file format version
      "! $required
      format_version  TYPE string,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header          TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Parent Category</p>
      "! Name of the parent category
      parent_category TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_main.

ENDINTERFACE.
