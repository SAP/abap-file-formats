INTERFACE zif_aff_indx_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Index Fields</p>
    "! Index fields
    BEGIN OF ty_indexfield,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      fieldname TYPE c LENGTH 30,
      "! <p class="shorttext">Field Position</p>
      "! Position
      position  TYPE n LENGTH 4,
    END OF ty_indexfield,
    tt_index_fields TYPE SORTED TABLE OF ty_indexfield WITH UNIQUE KEY fieldname.

  TYPES:
    "! <p class="shorttext">ABAP DDIC Secondary Index Properties</p>
    "! Object type INDX
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Text Index</p>
      "! Standard- or text-Index
      "! $required
      "! $default 'abap_false'
      text_index     TYPE abap_bool,
      "! <p class="shorttext">Unique</p>
      "! Unique flag
      "! $required
      unique_index   TYPE abap_bool,
      "! <p class="shorttext">Fields</p>
      "! Index fields
      index_fields   TYPE tt_index_fields,
    END OF ty_main.

ENDINTERFACE.
