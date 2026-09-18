INTERFACE zif_aff_sia5_v1
  PUBLIC.

  TYPES:

    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,

      "! <p class="shorttext">Authorization Field</p>
      "! Name of the authorization field
      authorization_field TYPE c LENGTH 10,

      "! <p class="shorttext">Is Range Supported</p>
      "! Is range supported
      is_range_supported  TYPE abap_bool,

    END OF ty_general_information.

  TYPES:

    "! <p class="shorttext">Restriction Field</p>
    "! Restriction Field
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

    END OF ty_main.

ENDINTERFACE.
