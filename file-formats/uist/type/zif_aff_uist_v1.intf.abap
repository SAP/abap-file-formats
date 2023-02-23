INTERFACE zif_aff_uist_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">SAP Fiori Page Template</p>
    "! SAP Fiori Page Template
    BEGIN OF ty_page,
      "! <p class="shorttext">ID</p>
      "! ID
      page_template_id          TYPE /ui2/page_entity_id,

      "! <p class="shorttext">Title</p>
      "! Title
      page_template_title       TYPE /ui2/page_title_,

      "! <p class="shorttext">Description</p>
      "! Description
      page_template_description TYPE /ui2/page_description,
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
      space_template_id            TYPE /ui2/space_entity_id,

      "! <p class="shorttext">Title</p>
      "! Title
      "! $required
      space_template_title         TYPE /ui2/space_title,

      "! <p class="shorttext">Description </p>
      "! Description
      "! $required
      space_template_description   TYPE /ui2/space_description,

      "! <p class="shorttext">Sort Priority</p>
      "! Sort priority
      space_template_sort_priority TYPE /ui2/space_sort_priority,

      "! <p class="shorttext">Base Space ID</p>
      "! Base Space Template ID
      base_space_template_id       TYPE /ui2/base_space_entity_id,

      "! <p class="shorttext">Assigned SAP Fiori Launchpad Page Templates</p>
      "! Assigned SAP Fiori launchpad page templates
      pages                        TYPE ty_pages,
    END OF ty_main.
ENDINTERFACE.
