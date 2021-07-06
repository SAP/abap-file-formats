INTERFACE zif_atc_aff_chkc_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Object Type CHKC</p>
    "! CHKC object type
    BEGIN OF ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema          TYPE string,
      "! <p class="shorttext">Header</p>
      "! header
      "! $required
      header          TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Parent Category</p>
      "! Name of the parent category
      parent_category TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_main.

ENDINTERFACE.
