INTERFACE zif_aff_sfpf_v1
  PUBLIC .
  TYPES:
    "! <p class="shorttext">Object Type SFPF</p>
    "! Object type SFPF
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version  TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header          TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Name</p>
      "! Name
      "! $required
      name            TYPE c LENGTH 30,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description     TYPE c LENGTH 60,
      "! <p class="shorttext">Dataprovider</p>
      "! Dataprovider
      "! $required
      dataprovider    TYPE c LENGTH 40,
      "! <p class="shorttext">Font Embed</p>
      "! Font Embed
      embed           TYPE abap_boolean,
      "! <p class="shorttext">Mirror in RTL</p>
      "! Mirror in RTL
      mirroring       TYPE abap_boolean,
    END OF ty_main.
ENDINTERFACE.
