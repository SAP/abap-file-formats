INTERFACE zif_aff_aplo_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Subobject</p>
    "! Attributes of the subobject
    BEGIN OF ty_subobject,
      "! <p class="shorttext">Name</p>
      "! Name of the subobject
      "! $required
      name        TYPE c LENGTH 20,
      "! <p class="shorttext">Description</p>
      "! Description text of the subobject
      description TYPE c LENGTH 60,
    END OF ty_subobject.

  TYPES:
    "! <p class="shorttext">Application Log Object</p>
    "! Attributes of the application log object
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Subobjects</p>
      "! Table of all subobjects (may be empty)
      "! $required
      subobjects    TYPE SORTED TABLE OF ty_subobject WITH NON-UNIQUE KEY name,
    END OF ty_main.
ENDINTERFACE.
