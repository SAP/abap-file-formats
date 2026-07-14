INTERFACE zif_aff_para_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">User-specific value</p>
      "! User-specific value of the SET/GET parameter
      user_specific_value TYPE c LENGTH 40,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">SET/GET Parameter</p>
    "! SET/GET Parameter
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_no_abap_lv,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information TYPE ty_general_information,
    END OF ty_main.

ENDINTERFACE.
