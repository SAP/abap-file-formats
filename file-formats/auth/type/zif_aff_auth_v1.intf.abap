INTERFACE zif_aff_auth_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">ABAP Dictionary</p>
    "! ABAP dictionary
    "! $required
    BEGIN OF ty_abap_dictionary,
      "! <p class="shorttext">Data Element</p>
      "! Name of the data element
      "! $required
      dtel                           TYPE c         LENGTH 30,
      "! <p class="shorttext">Domain</p>
      "! Name of the domain
      domname                        TYPE c         LENGTH 30,
      "! <p class="shorttext">Output Length</p>
      "! Length of the data element
      outputlen                      TYPE n         LENGTH 6,
      "! <p class="shorttext">Conversion Routine</p>
      "! Conversion routine
      conversion_routine             TYPE c         LENGTH 5,
      "! <p class="shorttext">Organizational Level</p>
      "! Organizational level information
      organizational_level           TYPE c         LENGTH 120,
    END OF ty_abap_dictionary,

    "! <p class="shorttext">Authorization Maintenance</p>
    "! Authorization maintenance
    BEGIN OF ty_maintenance_dialog,
      "! <p class="shorttext">Maintenance Dialog</p>
      "! Maintenance dialog
      maintenance_dialog             TYPE string,
      "! <p class="shorttext">Some Authorization Objects use an own Maintenance Dialog</p>
      "! Some authorization objects use an own maintenance dialog
      maintenance_exit_dialog_object TYPE abap_bool,
    END OF ty_maintenance_dialog,

    "! <p class="shorttext">Search Help</p>
    "! Search help
    "! $required
    BEGIN OF ty_provide_search_help,
      "! <p class="shorttext">Check Table</p>
      "! Check table
      table                          TYPE c         LENGTH 30,
      "! <p class="shorttext">Search Help Type</p>
      "! Search help type
      search_help_type               TYPE string,
      "! <p class="shorttext">Some Authorization Objects use an Object Field Search Help</p>
      "! Some authorization objects use an object field search help
      maintenance_exit_dialog_object TYPE abap_bool,
    END OF ty_provide_search_help,

    "! <p class="shorttext">Table Details</p>
    "! Table
    BEGIN OF ty_tablestruc,
      "! <p class="shorttext">Class</p>
      "! Authorization object class
      "! $showAlways
      oclss                          TYPE c         LENGTH 4,
      "! <p class="shorttext">Object</p>
      "! Authorization object
      "! $showAlways
      objct                          TYPE c         LENGTH 10,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $showAlways
      ttext                          TYPE c         LENGTH 60,
      "! <p class="shorttext">Search Help</p>
      "! Search help
      "! $showAlways
      searchhelp                     TYPE c         LENGTH 30,
      "! <p class="shorttext">Maintenance Dialog</p>
      "! Maintenance dialog
      "! $showAlways
      objexit                        TYPE abap_bool,
    END OF ty_tablestruc.

  "! <p class="shorttext">Authorization Objects with own Maintenance Dialog</p>
  "! Authorization Objects with own maintenance dialog
  TYPES ty_tables TYPE SORTED TABLE OF ty_tablestruc WITH UNIQUE KEY objct.

  TYPES:
    "! <p class="shorttext">AUTH Object Type</p>
    "! Object type AUTH
    BEGIN OF  ty_main,
      "! $required
      format_version            TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                    TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">General</p>
      "! ABAP dictionary
      "! $required
      abap_dictionary           TYPE ty_abap_dictionary,
      "! <p class="shorttext">Maintenance Dialog</p>
      "! Authorization maintenance
      "! $required
      authorization_maintenance TYPE ty_maintenance_dialog,
      "! <p class="shorttext">Search Help</p>
      "! Search help
      "! $required
      provide_search_help       TYPE ty_provide_search_help,
      "! <p class="shorttext">Authorization Objects with own Maintenance Dialog</p>
      "! Authorization objects with own maintenance dialog
      "! $required
      tables_and_structures     TYPE ty_tables,
    END OF ty_main.
ENDINTERFACE.
