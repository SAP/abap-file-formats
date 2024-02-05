INTERFACE zif_aff_uipg_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,

      "! <p class="shorttext">Title</p>
      "! Title visible to the enduser
      "! $required
      title    TYPE zif_aff_types_v1=>ty_description_100,

      "! <p class="shorttext">Merge ID</p>
      "! At runtime page templates are merged based on the merge ID
      merge_id TYPE c LENGTH 35,

    END OF ty_general_information.


  "! <p class="shorttext">Catalog Type</p>
  "! Launchpad catalog type
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
    "! Launchpad catalog item key
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

      "! <p class="shorttext">Target Mapping Key</p>
      "! Target mapping key
      target_mapping_key  TYPE ty_catalog_item_key,

    END OF ty_tile_assignment.


  "! <p class="shorttext">LADI ID</p>
  "! Launchpad App Descriptor Item ID
  TYPES ty_ladi_id      TYPE c LENGTH 32.


  "! <p class="shorttext">LADI Tile ID</p>
  "! Launchpad App Descriptor Item Tile ID
  TYPES ty_ladi_tile_id TYPE c LENGTH 50.


  TYPES:
    "! <p class="shorttext">LADI Assignment</p>
    "! Assignment of a launchpad app descriptor item
    BEGIN OF ty_ladi_assignment,

      "! <p class="shorttext">LADI ID</p>
      "! ID of a launchpad app descriptor item
      "! $required
      ladi_id             TYPE ty_ladi_id,

      "! <p class="shorttext">Tile ID</p>
      "! Tile ID
      "! $required
      tile_id             TYPE ty_ladi_tile_id,

    END OF ty_ladi_assignment.


  "! <p class="shorttext">Item Type</p>
  "! Item type
  "! $values {@link zif_aff_uipg_v1.data:co_item_type}
  "! $default {@link zif_aff_uipg_v1.data:co_item_type.ladi_assignment}
  TYPES ty_item_type TYPE c LENGTH 2.


  CONSTANTS:
    "! <p class="shorttext">Item Type</p>
    "! Type of application assignment
    BEGIN OF co_item_type,

      "! <p class="shorttext">LADI Assignment</p>
      "! Assignment of a launchpad app descriptor item
      ladi_assignment TYPE ty_item_type VALUE 'AD',

      "! <p class="shorttext">Tile Assignment</p>
      "! Assignment of a launchpad catalog tile
      tile_assignment TYPE ty_item_type VALUE 'TI',

    END OF co_item_type.


  TYPES:
    "! <p class="shorttext">Item</p>
    "! Items represent applications on the launchpad UI
    BEGIN OF ty_item,

      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      id              TYPE c LENGTH 35,

      "! <p class="shorttext">Type</p>
      "! Type of application assignment
      type            TYPE ty_item_type,

      "! <p class="shorttext">Display Format</p>
      "! Tile format for UI rendering
      display_format TYPE ty_tile_display_format,

      "! <p class="shorttext">Tile Assignment</p>
      "! Assignment of a launchpad catalog tile
      tile_assignment TYPE ty_tile_assignment,

      "! <p class="shorttext">LADI Assignment</p>
      "! Assignment of a launchpad app descriptor item
      ladi_assignment TYPE ty_ladi_assignment,

    END OF ty_item,

    ty_items TYPE STANDARD TABLE OF ty_item WITH DEFAULT KEY.


  TYPES:
    "! <p class="shorttext">Section</p>
    "! Sections make up a grouping of applications on the launchpad UI
    BEGIN OF ty_section,

      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      id    TYPE c LENGTH 35,

      "! <p class="shorttext">Title</p>
      "! Section title on the launchpad UI
      title TYPE c LENGTH 100,

      "! <p class="shorttext">Items</p>
      "! Items represent applications on the launchpad UI
      items TYPE ty_items,

    END OF ty_section,

    ty_sections TYPE STANDARD TABLE OF ty_section WITH DEFAULT KEY.


  TYPES:
    "! <p class="shorttext">Launchpad Page Template</p>
    "! Launchpad page template
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
      "! Sections make up a grouping of applications on the launchpad UI
      sections            TYPE ty_sections,

    END OF ty_main.

ENDINTERFACE.
