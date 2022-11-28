INTERFACE zif_aff_dobj_v1
  PUBLIC.

  TYPES :
    "! <p class="shorttext">Structure Definition</p>
    "! Structure Definition
    BEGIN OF ty_structure_definition,
      "! <p class="shorttext">Structure Definition</p>
      "! Parent Table
      "! $required
      record_no       TYPE n LENGTH 4,
      "! <p class="shorttext">Parent Table</p>
      "! Parent Table
      "! $required
      parent_table    TYPE arc_destr_parent,
      "! <p class="shorttext">Dependent table</p>
      "! Dependent table
      "! $required
      dependent_table TYPE arc_destr_dependent,

    END OF ty_structure_definition,
    tt_structure_definition TYPE SORTED TABLE OF  ty_structure_definition WITH UNIQUE KEY record_no.


  TYPES :
    "! <p class="shorttext">Data destruction object</p>
    "! $required
    BEGIN OF ty_dobj_details,
      "! <p class="shorttext">Destruction Program</p>
      "! Destruction Program
      "! $required
      destr_program        TYPE arc_destr_destr_prog,
      "! <p class="shorttext">Application Component</p>
      "! Application Component
      applic_component     TYPE uffctr,
      "! <p class="shorttext">Structure Definition</p>
      "! Structure Definition
      structure_definition TYPE tt_structure_definition,
    END OF ty_dobj_details.
  TYPES:
    "! <p class="shorttext">Data Destruction Object</p>
    "! ILM destruction object (DOBJ) v1
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description    TYPE arc_destr_obj_text,
      "! <p class="shorttext">Data destruction object</p>
      "!Data destruction object
      "! $required
      dobj_details   TYPE ty_dobj_details,
    END OF ty_main.

ENDINTERFACE.
