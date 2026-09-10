"! AFF type for object AUTH
INTERFACE zif_aff_auth_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Data Element</p>
      "! Name of the data element
      "! $required
      data_element TYPE c LENGTH 30,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Alternative Search Help</p>
    "! Alternative search help
    BEGIN OF ty_alternative_search_help,
      "! <p class="shorttext">Check Table</p>
      "! If no check table is maintained the search help of the data element will be used.
      "! A check table is only suitable if the first column with a data element identical to the authorization field is
      "! suitable for value selection. If no matching data element exists, the first column with a matching domain is
      "! used for the value selection.
      "! If the search help for the authorization field returns unsuitable selection results in a particular
      "! authorization object, an alternative search help can be maintained in the authorization object definition for
      "! the authorization field, in order to select suitable values for the object/field combination. This object/field
      "! search help always has priority over the search help for the field.
      check_table TYPE c LENGTH 30,
    END OF ty_alternative_search_help.

  TYPES:
    "! <p class="shorttext">Authorization Field</p>
    "! Authorization field
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version          TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                  TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information     TYPE ty_general_information,
      "! <p class="shorttext">Alternative Search Help in Standard Maintenance Dialog</p>
      "! Alternative search help in standard maintenance dialog
      alternative_search_help TYPE ty_alternative_search_help,
    END OF ty_main.
ENDINTERFACE.
