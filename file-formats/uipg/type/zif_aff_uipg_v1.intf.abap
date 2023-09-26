INTERFACE zif_aff_uipg_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,

      "! <p class="shorttext">Title</p>
      "! Title visible to the enduser
      "! $required
      title       TYPE zif_aff_types_v1=>ty_description_100,

      "! <p class="shorttext">Merge ID</p>
      "! Merge ID for merging during run-time
      merge_id    TYPE c LENGTH 35,

    END OF ty_general_information.


  "! <p class="shorttext">Catalog Type</p>
  "! Catalog type
  TYPES ty_catalog_type        TYPE c LENGTH 3.


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
      standard  TYPE ty_tile_display_format VALUE 'TI',

      "! <p class="shorttext">Wide Tile</p>
      "! Wide tile
      wide      TYPE ty_tile_display_format VALUE 'TW',

      "! <p class="shorttext">Flat Tile</p>
      "! Flat tile
      flat      TYPE ty_tile_display_format VALUE 'FT',

      "! <p class="shorttext">Flat Wide Tile</p>
      "! Flat wide tile
      flat_wide TYPE ty_tile_display_format VALUE 'FW',

      "! <p class="shorttext">Link</p>
      "! Link
      link      TYPE ty_tile_display_format VALUE 'LK',

    END OF co_tile_display_format.


  TYPES:
    "! <p class="shorttext">Catalog Item Key</p>
    "! Catalog item key
    BEGIN OF ty_catalog_item_key,

      "! <p class="shorttext">Catalog ID</p>
      "! Catalog ID
      "! $required
      catalog_id   TYPE c LENGTH 35,

      "! <p class="shorttext">Catalog Type</p>
      "! Catalog type
      "! $default 'CAT'
      catalog_type TYPE ty_catalog_type,

      "! <p class="shorttext">Catalog Item ID</p>
      "! Catalog Item ID
      "! $required
      id           TYPE c LENGTH 50,

    END OF   ty_catalog_item_key.


  TYPES:
    "! <p class="shorttext">Tile Assignment</p>
    "! Tile assignment
    BEGIN OF ty_tile_assignment,

      "! <p class="shorttext">Tile Key</p>
      "! Tile key
      "! $required
      tile_key            TYPE ty_catalog_item_key,

      "! <p class="shorttext">Tile Display Format</p>
      "! Describes how the tile is rendered during run-time
      tile_display_format TYPE ty_tile_display_format,

      "! <p class="shorttext">Target Mapping Key</p>
      "! Target mapping key
      target_mapping_key  TYPE ty_catalog_item_key,

    END OF ty_tile_assignment.


  "! <p class="shorttext">Item Type</p>
  "! Item type
  "! $values {@link zif_aff_uipg_v1.data:co_item_type}
  "! $default {@link zif_aff_uipg_v1.data:co_item_type.tile_assignment}
  TYPES ty_item_type TYPE c LENGTH 2.


  CONSTANTS:
    "! <p class="shorttext">Item Type</p>
    "! Item type
    BEGIN OF co_item_type,

      "! <p class="shorttext">Tile Assignment</p>
      "! Tile assignment
      tile_assignment TYPE ty_item_type VALUE 'TI',

    END OF co_item_type.


  TYPES:
    "! <p class="shorttext">Item</p>
    "! Item
    BEGIN OF ty_item,

      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      id              TYPE c LENGTH 35,

      "! <p class="shorttext">Type</p>
      "! Type
      type            TYPE ty_item_type,

      "! <p class="shorttext">Tile Assignment</p>
      "! Tile assignment
      tile_assignment TYPE ty_tile_assignment,

    END OF ty_item,

    ty_items TYPE STANDARD TABLE OF ty_item WITH DEFAULT KEY.


  TYPES:
    "! <p class="shorttext">Section</p>
    "! section
    BEGIN OF ty_section,

      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      id    TYPE c LENGTH 35,

      "! <p class="shorttext">Title</p>
      "! Title
      title TYPE c LENGTH 100,

      "! <p class="shorttext">Items</p>
      "! Items
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

      "! <p class="shorttext">Sections</p>
      "! Sections
      sections            TYPE ty_sections,

    END OF ty_main.

ENDINTERFACE.
