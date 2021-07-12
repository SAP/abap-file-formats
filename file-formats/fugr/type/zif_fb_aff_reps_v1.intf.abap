INTERFACE zif_fb_aff_reps_v1
  PUBLIC.
  "! <p class="shorttext">Include Type</p>
  "! Include type
  "! $values {@link zif_fb_aff_reps_v1.data:co_include_type}
  TYPES ty_include_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Include Type</p>
    "! Include type
    BEGIN OF co_include_type,
      "! <p class="shorttext">Include</p>
      "! Include
      include        TYPE ty_include_type VALUE 'I',
      "! <p class="shorttext">Function Group</p>
      "! Function group
      function_group TYPE ty_include_type VALUE 'F',
    END OF co_include_type.

  TYPES:
    "! <p class="shorttext">Object Type REPS</p>
    "! REPS object type
    BEGIN OF ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema       TYPE string,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description  TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Edit-Locked</p>
      "! Edit-locked
      edit_locked  TYPE abap_bool,
      "! <p class="shorttext">Include Type</p>
      "! Include type
      "! $required
      include_type TYPE ty_include_type,
    END OF ty_main.

ENDINTERFACE.
