INTERFACE zif_aff_sktd_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Documented Object</p>
    "! Type and name of the documented object
    BEGIN OF ty_sktd_documented_object,
      "! <p class="shorttext">Object Type</p>
      "! Type of the documented object
      "! $required
      type TYPE c LENGTH 4,
      "! <p class="shorttext">Object Name</p>
      "! Name of the documented object
      "! $required
      name TYPE c LENGTH 40,
    END OF ty_sktd_documented_object.


  TYPES:
    "! <p class="shorttext">Knowledge Transfer Document Properties</p>
    "! KTD properties
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header            TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Documented Object</p>
      "! Type and name of the documented object
      documented_object   TYPE ty_sktd_documented_object,
    END OF ty_main.

ENDINTERFACE.
