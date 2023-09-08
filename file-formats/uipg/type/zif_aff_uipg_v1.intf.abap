INTERFACE zif_aff_uipg_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Title</p>
      "! Title of the page template
      "! $required
      title       TYPE zif_aff_types_v1=>ty_description_100,
      "! <p class="shorttext">Description</p>
      "! Additional description
      description TYPE zif_aff_types_v1=>ty_description_100,
      "! <p class="shorttext">Merge ID</p>
      "! Merge ID
      merge_id    TYPE c LENGTH 35,
    END OF ty_general_information.

  "! <p class="shorttext">Catalog Type</p>
  "! Catalog type
  "! $values {@link zif_aff_uipg_v1.data:co_catalog_type}
  "! $default {@link zif_aff_uipg_v1.data:co_catalog_type.standard}
  TYPES ty_catalog_type TYPE c LENGTH 3.

  CONSTANTS:
    "! <p class="shorttext">Catalog Type</p>
    "! catalog type
    BEGIN OF co_catalog_type,
      "! <p class="shorttext">Standard Catalog</p>
      "! Standard catalog
      "! $enumValue 'CAT'
      standard TYPE ty_catalog_type VALUE 'CAT',
    END OF co_catalog_type.

  "! <p class="shorttext">Tile Display Format</p>
  "! Tile display format
  "! $values {@link zif_aff_uipg_v1.data:co_tile_display_format}
  "! $default {@link zif_aff_uipg_v1.data:co_tile_display_format.standard}
  TYPES ty_tile_display_format TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Tile Display Format</p>
    "! Tile display format
    BEGIN OF co_tile_display_format,
      "! <p class="shorttext">Standard Tile</p>
      "! Standard tile
      "! $enumValue 'TI'
      standard  TYPE ty_tile_display_format VALUE 'TI',
      "! <p class="shorttext">Wide Tile</p>
      "! Wide tile
      "! $enumValue 'TW'
      wide      TYPE ty_tile_display_format VALUE 'TW',
      "! <p class="shorttext">Flat Tile</p>
      "! Flat tile
      "! $enumValue 'FT'
      flat      TYPE ty_tile_display_format VALUE 'FT',
      "! <p class="shorttext">Flat Wide</p>
      "! Flat wide
      "! $enumValue 'FW'
      flat_wide TYPE ty_tile_display_format VALUE 'FW',
      "! <p class="shorttext">Link</p>
      "! link
      "! $enumValue 'LK'
      link      TYPE ty_tile_display_format VALUE 'LK',
    END OF co_tile_display_format.

  TYPES:
    "! <p class="shorttext">Page Section</p>
    "! Page Section
    BEGIN OF ty_tile_assignment,
      "! <p class="shorttext">Tile Catalog Id</p>
      "! Tile catalog id
      tile_catalog_id     TYPE c LENGTH 35,
      "! <p class="shorttext">Tile Catalog Type</p>
      "! Tile catalog type
      tile_catalog_type   TYPE ty_catalog_type,
      "! <p class="shorttext">Tile Id</p>
      "! Tile id
      tile_id             TYPE c LENGTH 50,
      "! <p class="shorttext">Tile Display Format</p>
      "! tile display format
      tile_display_format TYPE ty_tile_display_format,
      "! <p class="shorttext">Target Mapping Catalog Id</p>
      "! Target Mapping catalog id
      tm_catalog_id       TYPE c LENGTH 35,
      "! <p class="shorttext">Target Mapping Catalog Type</p>
      "! Target Mapping catalog type
      tm_catalog_type     TYPE ty_catalog_type,
      "! <p class="shorttext">Target Mapping Id</p>
      "! Target Mapping id
      tm_id               TYPE c LENGTH 50,
    END OF ty_tile_assignment.

  "! <p class="shorttext">Item Assignment Type</p>
  "! Item assignment type
  "! $values {@link zif_aff_uipg_v1.data:co_item_type}
  "! $default {@link zif_aff_uipg_v1.data:co_item_type.tile}
  TYPES ty_item_type TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Item Assignment Type</p>
    "! Item assignment type
    BEGIN OF co_item_type,
      "! <p class="shorttext">Tile</p>
      "! Tile
      "! $enumValue 'TI'
      tile TYPE ty_item_type VALUE 'TI',
    END OF co_item_type.

  TYPES:
    "! <p class="shorttext">Page Section Item Assignment</p>
    "! Page Section Item Assignment
    BEGIN OF ty_item,
      "! <p class="shorttext">ID</p>
      "! Id of the Assignment
      id              TYPE c LENGTH 35,
      "! <p class="shorttext">Type</p>
      "! Type of the Assignment
      type            TYPE ty_item_type,
      "! <p class="shorttext">ID</p>
      "! Id of the Page Section
      tile_assignment TYPE ty_tile_assignment,
    END OF ty_item,

    ty_items TYPE STANDARD TABLE OF ty_item WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Page Section</p>
    "! Page Section
    BEGIN OF ty_section,
      "! <p class="shorttext">ID</p>
      "! Id of the Page Section
      id    TYPE c LENGTH 35,
      "! <p class="shorttext">Title</p>
      "! Section title
      title TYPE c LENGTH 100,
      "! <p class="shorttext">Items</p>
      "! Assigned Page Section Items
      items TYPE ty_items,
    END OF ty_section,

    ty_sections TYPE STANDARD TABLE OF ty_section WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Fiori Launchpad Page Template</p>
    "! Fiori launchpad page template
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

      "! <p class="shorttext">Page Sections</p>
      "! Sections of the Page Template
      sections            TYPE ty_sections,
    END OF ty_main.

ENDINTERFACE.
