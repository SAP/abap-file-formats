INTERFACE zif_aff_aobj_v1

  PUBLIC.

  TYPES: ty_write_class TYPE c LENGTH 40.
  TYPES: ty_delete_class TYPE c LENGTH 40.
  TYPES: ty_reload_class TYPE c LENGTH 40.


  TYPES:
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Name of executable class which writes the data to the archive</p>
      "! Name of executable class which writes the data to the archive
      "! $required
      write_class  TYPE ty_write_class,
      "! <p class="shorttext">Name of executable class which deletes the data from the tables</p>
      "! Name of executable class which deletes the data from the tables
      "! $required
      delete_class TYPE ty_delete_class,
      "! <p class="shorttext">Name of executable class which reloads the data to the tables</p>
      "! Name of executable class which reloads the data to the the tables (may be empty)
      reload_class TYPE ty_reload_class,
    END OF ty_attributes.

  TYPES:
    "! <p class="shorttext">Table from which data is archived</p>
    "! Tables of business object instance from which data is archived
    BEGIN OF ty_table_to_be_archived,
      "! <p class="shorttext">Name of table or structure</p>
      "! Name of table or structure
      "! $required
      name TYPE c LENGTH 30,
    END OF ty_table_to_be_archived.

  "! <p class="shorttext">Tables from which data is archived</p>
  "! Tables from which data is archived
  TYPES ty_tables_to_be_archived TYPE SORTED TABLE OF ty_table_to_be_archived WITH UNIQUE KEY name.

  TYPES:
    "! <p class="shorttext">Name of archiving class</p>
    "! Archiving classes are no ABAP classes, but IDs of reuse objects, whose data should be archived
    "! together with the business object instance (for example change documents).
    BEGIN OF ty_archiving_class,
      "! <p class="shorttext">Name of archiving class</p>
      "! Name of archiving class
      name TYPE c LENGTH 10,
    END OF ty_archiving_class.
  TYPES: ty_archiving_classes TYPE SORTED TABLE OF ty_archiving_class WITH UNIQUE KEY name.
  TYPES:
    "! <p class="shorttext">Archiving Object</p>
    "! Archiving Object (AOBJ) v1
    BEGIN OF ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Attributes of an archiving object</p>
      "! Attributes of an archiving object
      "! $required
      attributes            TYPE ty_attributes,
      "! <p class="shorttext">Tables from which data is archived</p>
      "! Tables of business object instance from which data is archived
      "! $required
      tables_to_be_archived TYPE ty_tables_to_be_archived,
      "! <p class="shorttext">Names of archiving classes</p>
      "! Archiving classes are no ABAP classes, but IDs of reuse objects, whose data should be archived
      "! together with the business object instance (for example change documents).
      "! $required
      archiving_classes     TYPE ty_archiving_classes,
    END OF ty_main.

ENDINTERFACE.
