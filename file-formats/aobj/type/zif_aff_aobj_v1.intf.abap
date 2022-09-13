INTERFACE zif_aff_aobj_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Write Class</p>
      "! Name of executable class or program which writes the data to the archive
      "! $required
      write_class  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Delete Class</p>
      "! Name of executable class or program which deletes the data from the tables
      "! $required
      delete_class TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Reload Class</p>
      "! Name of executable class or program which reloads the data to the tables (may be empty)
      reload_class TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Storage Class</p>
      "! Name of class which stores and retrieves archived data. The class needs to implement
      "! the interface IF_ARCH_STORAGE_MANAGER.
      "! $required
      storage_class TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_attributes.

  TYPES:
    "! <p class="shorttext">Table to Be Archived</p>
    "! Tables of business object instance from which data is archived
    BEGIN OF ty_table_to_be_archived,
      "! <p class="shorttext">Name</p>
      "! Name of table or structure
      "! $required
      name TYPE c LENGTH 30,
    END OF ty_table_to_be_archived.

  "! <p class="shorttext">Tables to Be Archived</p>
  "! Tables from which data is archived
  TYPES ty_tables_to_be_archived TYPE SORTED TABLE OF ty_table_to_be_archived WITH UNIQUE KEY name.

  TYPES:
    "! <p class="shorttext">Name of Archiving Class</p>
    "! Archiving classes are no ABAP classes, but IDs of reuse objects, whose data should be archived
    "! Together with the business object instance (for example change documents).
    BEGIN OF ty_archiving_class,
      "! <p class="shorttext">Name</p>
      "! Name of archiving class
      "! $required
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
      "! <p class="shorttext">Attributes</p>
      "! Attributes of an archiving object
      "! $required
      attributes            TYPE ty_attributes,
      "! <p class="shorttext">Tables to Be Archived</p>
      "! Tables of business object instance from which data is archived.
      "! $required
      tables_to_be_archived TYPE ty_tables_to_be_archived,
      "! <p class="shorttext">Archiving Classes</p>
      "! Archiving classes are no ABAP classes, but IDs of reuse objects, whose data should be archived
      "! Together with the business object instance (for example change documents).
      "! $required
      archiving_classes     TYPE ty_archiving_classes,
    END OF ty_main.

ENDINTERFACE.
