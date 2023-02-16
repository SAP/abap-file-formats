INTERFACE zif_aff_ntty_v1
  PUBLIC.


  TYPES:
    "! $values { @link zif_aff_ntty_v1.data:co_profile }
    "! $default { @link zif_aff_ntty_v1.data:co_profile.text }
    ty_profile TYPE c LENGTH 20,

    "! $minimum 0
    ty_max_length TYPE i,

    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Language Dependent</p>
      "! Language dependent
      language_dependent TYPE abap_bool,
      "! <p class="shorttext">Multiple Notes</p>
      "! Multiple notes possible
      multiple_notes            TYPE abap_bool,
      "! <p class="shorttext">Title Hidden</p>
      "! Title hidden
      hide_title          TYPE abap_bool,
    END OF ty_general_information,

    "! <p class="shorttext">Content Settings</p>
    "! Content settings
    BEGIN OF ty_content_settings,
      "! <p class="shorttext">Maximum Length</p>
      "! Maximum length
      maximum_length TYPE ty_max_length,
      "! <p class="shorttext">Formatting Profile</p>
      "! Formatting profile
      formatting_profile    TYPE ty_profile,
    END OF ty_content_settings,

    "! <p class="shorttext">ABAP file format for Note Type objects</p>
    "! ABAP file format for note type objects
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
      "! <p class="shorttext">Content Settings</p>
      "! Content settings
      content_settings    TYPE ty_content_settings,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_profile,
      "! <p class="shorttext">Text Only</p>
      "! Plain text content (text/plain)
      text      TYPE ty_profile VALUE 'TEXT',
      "! <p class="shorttext">Simple Formatting</p>
      "! Simple formatted content (text/html)
      simple_formatting TYPE ty_profile VALUE 'RTE_BASIC',
    END OF co_profile.

ENDINTERFACE.
