INTERFACE zif_aff_ntta_v1
  PUBLIC.

  TYPES:
    ty_notetype TYPE c LENGTH 20,

    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">SAP Object Node Type</p>
      "! SAP Object Node Type
      "! $required
      object_node_type    TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Implementation Exit Class</p>
      "! Class implementing the exits for authorization and feature control
      "! $required
      implementation_exit TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information,

    "! <p class="shorttext">Note Type</p>
    "! Note type
    BEGIN OF ty_notetype_structure,
      "! <p class="shorttext">Name</p>
      "! Name
      "! $required
      name TYPE ty_notetype,
    END OF ty_notetype_structure,

    "! <p class="shorttext">Note Types</p>
    "! Note types
    ty_notetypes TYPE SORTED TABLE OF ty_notetype_structure WITH UNIQUE KEY name,

    "! <p class="shorttext">ABAP file format for Note Type Assignment objects</p>
    "! ABAP file format for note type assignment objects
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Note Types</p>
      "! Note types assigned to the SAP Object Node Type
      note_types  TYPE ty_notetypes,
    END OF ty_main.

ENDINTERFACE.
