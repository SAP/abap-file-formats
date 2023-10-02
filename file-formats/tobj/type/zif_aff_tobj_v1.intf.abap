INTERFACE zif_aff_tobj_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Table</p>
    BEGIN OF ty_table,
      "! <p class="shorttext">Table Name</p>
      "! $required
      table_name    TYPE c LENGTH 30,
      "! <p class="shorttext">Primary Table</p>
      "! At least one entry within the list needs to be the primary one.
      primary_table TYPE abap_bool,
    END OF ty_table,
    "! <p class="shorttext">Tables</p>
    ty_tables TYPE SORTED TABLE OF ty_table WITH UNIQUE KEY table_name.

  TYPES:
    " This AFF is only complete with regard to ABAP Language Version 'ABAP for Cloud Development'
    "! <p class="shorttext">Transport Object Type</p>
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! $required
      tables         TYPE ty_tables,
    END OF ty_main.

ENDINTERFACE.
