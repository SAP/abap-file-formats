INTERFACE zif_aff_dobj_v1
  PUBLIC.
  TYPES: ty_application_component TYPE c LENGTH 20.
  TYPES:
    "! <p class="shorttext">Structure Definition Details</p>
    "! Structure definition details
    BEGIN OF ty_structure_definition,
      "! <p class="shorttext">Item</p>
      "! Item
      "! $required
      item            TYPE n LENGTH 4,
      "! <p class="shorttext">Parent Table</p>
      "! Parent table
      "! $required
      parent_table    TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Dependent Table</p>
      "! Dependent table
      "! $required
      dependent_table TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_structure_definition,
    "! <p class="shorttext">Structure Definitions</p>
    "! Structure definitions
    ty_structure_definitions TYPE SORTED TABLE OF  ty_structure_definition WITH UNIQUE KEY item.


  TYPES:
    "! <p class="shorttext">Data Destruction Object Details</p>
    "! $required
    BEGIN OF ty_dobj_details,
      "! <p class="shorttext">Destruction Class</p>
      "! Destruction class
      "! $required
      destruction_class     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Application Component</p>
      "! Application component
      application_component TYPE ty_application_component,
    END OF ty_dobj_details.
  TYPES:
    "! <p class="shorttext">Data Destruction Object</p>
    "! ILM destruction object (DOBJ) v1
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Attributes</p>
      "!Attributes
      "! $required
      attributes  TYPE ty_dobj_details,
      "! <p class="shorttext">Structure Definition</p>
      "! Structure definition
      "! $required
      structure_definition TYPE ty_structure_definitions,
    END OF ty_main.

ENDINTERFACE.