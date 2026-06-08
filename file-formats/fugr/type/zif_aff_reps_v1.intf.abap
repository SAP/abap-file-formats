INTERFACE zif_aff_reps_v1
  PUBLIC.

  "! <p class="shorttext">Include Type</p>
  "! Include type
  "! $values {@link zif_aff_reps_v1.data:co_include_type}
  "! $default {@link zif_aff_reps_v1.data:co_include_type.include}
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

  "! <p class="shorttext">Description</p>
  "! Description of the ABAP object
  TYPES ty_description TYPE c LENGTH 70.

  TYPES:
    "! <p class="shorttext">Header</p>
    "! The header for an ABAP subobject with a description of 70 characters
    BEGIN OF ty_header,
      "! $required
      description TYPE ty_description,
    END OF ty_header.

  TYPES:
    "! <p class="shorttext">Object Type REPS</p>
    "! REPS object type
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE ty_header,
      "! <p class="shorttext">Edit-Locked</p>
      "! Edit-locked
      edit_locked    TYPE abap_bool,
      "! <p class="shorttext">Include Type</p>
      "! Include type
      "! $required
      include_type   TYPE ty_include_type,
    END OF ty_main.

ENDINTERFACE.
