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

    "! <p class="shorttext">Notetype</p>
    "! Notetype
    BEGIN OF tys_notetype,
      "! <p class="shorttext">Notetype</p>
      "! Notetype
      "! $required
      notetype TYPE ty_notetype,
    END OF tys_notetype,

    "! <p class="shorttext">Notetypes</p>
    "! Notetype
    tyt_notetypes TYPE SORTED TABLE OF tys_notetype WITH UNIQUE KEY notetype,

    "! <p class="shorttext">Notetype Assignments</p>
    "! Notetype Assignments
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Assigned Notetypes</p>
      "! Notetypes assigned to the SAP Object Node Type
      assigned_notetypes  TYPE tyt_notetypes,
    END OF ty_main.

ENDINTERFACE.
