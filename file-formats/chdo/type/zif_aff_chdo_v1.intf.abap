INTERFACE zif_aff_chdo_v1
  PUBLIC.


  TYPES:
    "! <p class="shorttext">Table or Structure</p>
    "! Table or structure
    BEGIN OF ty_tablestruc,
      "! <p class="shorttext">Name</p>
      "! Name of table or structure
      "! $required
      name                   TYPE c LENGTH 30,
      "! <p class="shorttext">Log Multiple Changes</p>
      "! Specifies whether multiple changes can be logged
      "! $showAlways
      multiple_changes        TYPE abap_bool,
      "! <p class="shorttext">Log Field Values for Deletions</p>
      "! Log field values for deletions.
      "! Logging of initial values depends on setting 'Log Initial Values for Deletions'
      "! $showAlways
      delete_log_values        TYPE abap_bool,
      "! <p class="shorttext">Log Initial Values for Deletions</p>
      "! Logging of initial values for deletions
      "! $showAlways
      delete_log_initial_values TYPE abap_bool,
      "! <p class="shorttext">Log Field Values for Creations</p>
      "! Log field values for creations.
      "! Logging of initial values depends on setting 'Log Initial Values for Creations'
      "! $showAlways
      insert_log_values        TYPE abap_bool,
      "! <p class="shorttext">Log Initial Values for Creations</p>
      "! Log initial values for creations
      "! $showAlways
      insert_log_initial_values TYPE abap_bool,
      "! <p class="shorttext">Reference Table</p>
      "! Reference table for currencies and units
      "! $showAlways
      reference_table         TYPE c LENGTH 30,
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
    "! <p class="shorttext">Generated Object</p>
    "! Generated object
    BEGIN OF ty_genobject,
      "! <p class="shorttext">Class or Function</p>
      "! Generated class or function module
      "! $required
      class_or_function TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_genobject.

  TYPES:
    "! <p class="shorttext">Change Documents</p>
    "! Change Documents (CHDO) v1
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Tables and Structures</p>
      "! Tables and structures
      "! $required
      tables_and_structures TYPE ty_tables,
      "! <p class="shorttext">Error Message</p>
      "! Error message
      "! $required
      error_message        TYPE ty_errormess,
      "! <p class="shorttext">Generated Object</p>
      "! Generated object
      "! $showAlways
      generated_object        TYPE ty_genobject,
    END OF ty_main.
ENDINTERFACE.
