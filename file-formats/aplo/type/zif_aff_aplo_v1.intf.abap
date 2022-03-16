INTERFACE zif_aff_aplo_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Header for APLO Object</p>
    "! The header for an application log object
    BEGIN OF ty_header,
      "! <p class="shorttext">Description</p>
      "! Description of the application log object
      "! $required
      description           TYPE c LENGTH 60,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the application log object
      "! $required
      original_language     TYPE sy-langu,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP language version
      "! $values {@link zif_aff_types_v1.data:co_abap_language_version_cloud}
      "! $default {@link zif_aff_types_v1.data:co_abap_language_version_cloud.standard}
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.

  TYPES:
    "! <p class="shorttext">Subobject</p>
    "! Properties of a subobject
    BEGIN OF ty_subobject,
      "! <p class="shorttext">Subobject Name</p>
      "! Name of the subobject
      "! $required
      name        TYPE c LENGTH 20,
      "! <p class="shorttext">Subobject Description</p>
      "! Description text of the subobject
      description TYPE c LENGTH 60,
    END OF ty_subobject.

  TYPES:
    "! <p class="shorttext">APLO Object Type</p>
    "! Object type APLO
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE ty_header,
      "! <p class="shorttext">Array of Subobjects</p>
      "! Array of all subobjects (may be empty)
      sub_objects    TYPE SORTED TABLE OF ty_subobject WITH NON-UNIQUE KEY name,
    END OF ty_main .
ENDINTERFACE.
