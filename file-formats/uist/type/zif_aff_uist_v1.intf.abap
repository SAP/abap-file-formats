INTERFACE zif_aff_uist_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Title</p>
      "! Title of the space template
      "! $required
      title         TYPE zif_aff_types_v1=>ty_description_100,
      "! <p class="shorttext">Sort Priority</p>
      "! Sort priority
      "! $minimum: -999.999
      "! $maximum: 999.999
      sort_priority TYPE p LENGTH 7 DECIMALS 3,
      "! <p class="shorttext">Base Space Template Name</p>
      "! Name of the base space template
      base_space_template_name       TYPE c LENGTH 35,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">SAP Fiori Page Template</p>
    "! SAP Fiori page template
    BEGIN OF ty_page,
      "! <p class="shorttext">Name</p>
      "! Name of the page template
      name          TYPE c LENGTH 35,
    END OF ty_page,

    ty_pages TYPE STANDARD TABLE OF ty_page WITH KEY name.

  TYPES:
    "! <p class="shorttext">Fiori Launchpad Space Template</p>
    "! Fiori launchpad space template
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version  TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header          TYPE zif_aff_types_v1=>ty_header_100_cloud,

      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information   TYPE ty_general_information,

      "! <p class="shorttext">Page Templates</p>
      "! Assigned SAP Fiori launchpad page templates
      pages                        TYPE ty_pages,
    END OF ty_main.
ENDINTERFACE.
