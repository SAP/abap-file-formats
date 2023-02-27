INTERFACE zif_aff_uist_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">SAP Fiori Page Template</p>
    "! SAP Fiori Page Template
    BEGIN OF ty_page,
      "! <p class="shorttext">ID</p>
      "! ID
      page_template_id          TYPE c LENGTH 35,

      "! <p class="shorttext">Title</p>
      "! Title
      page_template_title       TYPE zif_aff_types_v1=>ty_description_100,

      "! <p class="shorttext">Description</p>
      "! Description
      page_template_description TYPE zif_aff_types_v1=>ty_description_100,
    END OF ty_page,

    ty_pages TYPE TABLE OF ty_page WITH KEY page_template_id.

  TYPES:
    "! <p class="shorttext">Fiori Launchpad Space Template</p>
    "! Fiori Launchpad Space Template
    BEGIN OF ty_main,
      "! <p class="shorttext">Format version</p>
      "! Format version
      "! $required
      format_version               TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                       TYPE zif_aff_types_v1=>ty_header_100,

      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      space_template_id            TYPE c LENGTH 35,

      "! <p class="shorttext">Title</p>
      "! Title
      "! $required
      space_template_title         TYPE zif_aff_types_v1=>ty_description_100,

      "! <p class="shorttext">Description </p>
      "! Description
      "! $required
      space_template_description   TYPE zif_aff_types_v1=>ty_description_100,

      "! <p class="shorttext">Sort Priority</p>
      "! Sort priority
      "! $minimum: 0.001
      "! $maximum: 999.999
      "! $multipleOf: 0.001
      space_template_sort_priority TYPE p LENGTH 7 DECIMALS 3,

      "! <p class="shorttext">Base Space ID</p>
      "! Base Space Template ID
      base_space_template_id       TYPE c LENGTH 35,

      "! <p class="shorttext">Assigned SAP Fiori Launchpad Page Templates</p>
      "! Assigned SAP Fiori launchpad page templates
      pages                        TYPE ty_pages,
    END OF ty_main.
ENDINTERFACE.
