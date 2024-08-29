INTERFACE zif_aff_uist_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Title on Launchpad</p>
      "! Title on SAP Fiori launchpad
      "! $required
      title         TYPE zif_aff_types_v1=>ty_description_100,
      "! <p class="shorttext">Sort Priority</p>
      "! Sort priority
      "! $minimum: -9999.99999
      "! $maximum: 9999.99999
      sort_priority TYPE p LENGTH 5 DECIMALS 5,
      "! <p class="shorttext">Merge ID</p>
      "! Merge ID
      merge_id      TYPE c LENGTH 35,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Launchpad Page Template</p>
    "! Launchpad page template
    BEGIN OF ty_page,
      "! <p class="shorttext">Name</p>
      "! Name of the page template
      "! $required
      name TYPE c LENGTH 35,
    END OF ty_page,

    ty_pages TYPE STANDARD TABLE OF ty_page WITH KEY name.

  TYPES:
    "! <p class="shorttext">Launchpad Space Template</p>
    "! Launchpad space template
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_100_cloud,

      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,

      "! <p class="shorttext">Launchpad Page Templates</p>
      "! Assigned launchpad page templates
      pages               TYPE ty_pages,
    END OF ty_main.
ENDINTERFACE.
