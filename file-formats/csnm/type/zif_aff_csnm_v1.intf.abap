"! ABAP File Format for CSN Model Transport Object Generic Editor
"!
"! As very first solution, one CSN file could be enough
INTERFACE zif_aff_csnm_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">CSN File</p>
    "! CSN file
    BEGIN OF ty_csn_file,
      "! <p class="shorttext">CSN File Name</p>
      "! CSN file name
      name TYPE string,
    END OF ty_csn_file.

  "! <p class="shorttext">CSN Files</p>
  "! CSN files
  TYPES ty_csn_file_names TYPE STANDARD TABLE OF ty_csn_file WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">CSN File Names</p>
      "! CSN file name
      csn_file_names TYPE ty_csn_file_names,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">CSN Model Transport Object</p>
    "! CSN model transport object
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
      "! General Information
      general_information TYPE ty_general_information,
    END OF ty_main.
ENDINTERFACE.
