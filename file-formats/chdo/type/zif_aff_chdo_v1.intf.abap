INTERFACE zif_aff_chdo_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Database Insertions</p>
    "! Database insertions
    BEGIN OF ty_insert,
      "! <p class="shorttext">Log Field Values</p>
      "! Log field values for insertions.
      "! $showAlways
      log_values         TYPE abap_bool,
      "! <p class="shorttext">Log Initial Values</p>
      "! Log initial values for insertions
      "! Logging of initial values depends on setting 'Log Field Values for Database Insertions'
      "! $showAlways
      log_initial_values TYPE abap_bool,
    END OF ty_insert.

  TYPES:
    "! <p class="shorttext">Database Deletions</p>
    "! Database deletions
    BEGIN OF ty_delete,
      "! <p class="shorttext">Log Field Values</p>
      "! Log field values for deletions.
      "! $showAlways
      log_values         TYPE abap_bool,
      "! <p class="shorttext">Log Initial Values</p>
      "! Log initial values for deletions
      "! Logging of initial values depends on setting 'Log Field Values for Database Deletions'
      "! $showAlways
      log_initial_values TYPE abap_bool,
    END OF ty_delete.

  TYPES:
    "! <p class="shorttext">Table or Structure Details</p>
    "! Table or structure
    BEGIN OF ty_tablestruc,
      "! <p class="shorttext">Name</p>
      "! Name of table or structure
      "! $required
      name                TYPE c LENGTH 30,
      "! <p class="shorttext">Reference Table</p>
      "! Reference table for currencies and units
      "! $showAlways
      reference_table     TYPE c LENGTH 30,
      "! <p class="shorttext">Log Multiple Changes</p>
      "! Specifies whether multiple changes can be logged
      "! $showAlways
      multiple_changes    TYPE abap_bool,
      "! <p class="shorttext">Database Insertions</p>
      "! Log field values for insertions.
      "! $showAlways
      database_insertions TYPE ty_insert,
      "! <p class="shorttext">Database Deletions</p>
      "! Log field values for deletions.
      "! $showAlways
      database_deletions  TYPE ty_delete,
    END OF ty_tablestruc.

  "! <p class="shorttext">Tables and Structures</p>
  "! Tables and structures
  TYPES ty_tables TYPE SORTED TABLE OF ty_tablestruc WITH UNIQUE KEY name.


  TYPES:
    "! <p class="shorttext">Error Message</p>
    "! Error message
    BEGIN OF ty_errormess,
      "! <p class="shorttext">Message ID</p>
      "! Error message identifier
      "! $required
      id     TYPE c LENGTH 20,
      "! <p class="shorttext">Message Number</p>
      "! Error message number
      "! $minLength 3
      "! $required
      number TYPE n LENGTH 3,
    END OF ty_errormess.

  TYPES:
  "! <p class="shorttext">Category</p>
  "! Change Document Category
  "! $values {@link zif_aff_chdo_v1.data:co_category}
  "! $default {@link zif_aff_chdo_v1.data:co_category.standard }
    ty_category TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Category Values</p>
    BEGIN OF co_category,
      "! <p class="shorttext">Standard</p>
      "! Standard change document
      standard           TYPE ty_category VALUE space,
      "! <p class="shorttext">Behavior Definition</p>
      "! Change document for behavior definitions
      behavior_definiton TYPE ty_category VALUE 'X',
    END OF co_category.


  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Category</p>
      "! Change document category
      category         TYPE ty_category,
      "! <p class="shorttext">Generated Object</p>
      "! Generated object
      "! $showAlways
      generated_object TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Change Documents</p>
    "! Change Documents (CHDO) v1
    BEGIN OF ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information   TYPE ty_general_information,
      "! <p class="shorttext">Tables and Structures</p>
      "! Tables and structures
      "! $required
      tables_and_structures TYPE ty_tables,
      "! <p class="shorttext">Error Message</p>
      "! Error message
      "! $required
      error_message         TYPE ty_errormess,
    END OF ty_main.


ENDINTERFACE.
