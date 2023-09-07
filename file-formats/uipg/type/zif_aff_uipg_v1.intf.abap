interface zif_aff_uipg_v1
  public.

  types:
    "! <p class="shorttext">General Information</p>
    "! General information
    begin of ty_general_information,
      "! <p class="shorttext">Title</p>
      "! Title of the page template
      "! $required
      title       type zif_aff_types_v1=>ty_description_100,
      "! <p class="shorttext">Description</p>
      "! Additional description
      description type zif_aff_types_v1=>ty_description_100,
      "! <p class="shorttext">Merge ID</p>
      "! Merge ID
      merge_id    type c length 35,
    end of ty_general_information.

  "! <p class="shorttext">Catalog Type</p>
  "! Catalog type
  "! $values {@link /ui2/zif_aff_uipg_v1:co_catalog_type}
  "! $default {@link /ui2/if_afzif_aff_uipg_v1atalog_type.standard}
  types ty_catalog_type type c length 3.

  constants:
    "! <p class="shorttext">Catalog Type</p>
    "! catalog type
    begin of co_catalog_type,
      "! <p class="shorttext">Standard Catalog</p>
      "! Standard catalog
      "! $enumValue 'CAT'
      standard type ty_catalog_type value 'CAT',
    end of co_catalog_type.

  "! <p class="shorttext">Tile Display Format</p>
  "! Tile display format
  "! $values {@link /ui2/if_aff_uipzif_aff_uipg_v1isplay_format}
  "! $default {@link /ui2/if_aff_uipg_v1.zif_aff_uipg_v1y_format.standard}
  types ty_tile_display_format type c length 2.

  constants:
    "! <p class="shorttext">Tile Display Format</p>
    "! Tile display format
    begin of co_tile_display_format,
      "! <p class="shorttext">Standard Tile</p>
      "! Standard tile
      "! $enumValue 'TI'
      standard  type ty_tile_display_format value 'TI',
      "! <p class="shorttext">Wide Tile</p>
      "! Wide tile
      "! $enumValue 'TW'
      wide      type ty_tile_display_format value 'TW',
      "! <p class="shorttext">Flat Tile</p>
      "! Flat tile
      "! $enumValue 'FT'
      flat      type ty_tile_display_format value 'FT',
      "! <p class="shorttext">Flat Wide</p>
      "! Flat wide
      "! $enumValue 'FW'
      flat_wide type ty_tile_display_format value 'FW',
      "! <p class="shorttext">Link</p>
      "! link
      "! $enumValue 'LK'
      link      type ty_tile_display_format value 'LK',
    end of co_tile_display_format.

  types:
    "! <p class="shorttext">Page Section</p>
    "! Page Section
    begin of ty_tile_assignment,
      "! <p class="shorttext">Tile Catalog Id</p>
      "! Tile catalog id
      tile_catalog_id     type c length 35,
      "! <p class="shorttext">Tile Catalog Type</p>
      "! Tile catalog type
      tile_catalog_type   type ty_catalog_type,
      "! <p class="shorttext">Tile Id</p>
      "! Tile id
      tile_id             type c length 50,
      "! <p class="shorttext">Tile Display Format</p>
      "! tile display format
      tile_display_format type ty_tile_display_format,
      "! <p class="shorttext">Target Mapping Catalog Id</p>
      "! Target Mapping catalog id
      tm_catalog_id       type c length 35,
      "! <p class="shorttext">Target Mapping Catalog Type</p>
      "! Target Mapping catalog type
      tm_catalog_type     type ty_catalog_type,
      "! <p class="shorttext">Target Mapping Id</p>
      "! Target Mapping id
      tm_id               type c length 50,
    end of ty_tile_assignment.

  "! <p class="shorttext">Item Assignment Type</p>
  "! Item assignment type
  "! $values {@link /ui2/if_aff_uipg_v1.data:zif_aff_uipg_v1$default {@link /ui2/if_aff_uipg_v1.data:co_itzif_aff_uipg_v1es ty_item_type type c length 2.

  constants:
    "! <p class="shorttext">Item Assignment Type</p>
    "! Item assignment type
    begin of co_item_type,
      "! <p class="shorttext">Tile</p>
      "! Tile
      "! $enumValue 'TI'
      tile type ty_item_type value 'TI',
    end of co_item_type.

  types:
    "! <p class="shorttext">Page Section Item Assignment</p>
    "! Page Section Item Assignment
    begin of ty_item,
      "! <p class="shorttext">ID</p>
      "! Id of the Assignment
      id              type c length 35,
      "! <p class="shorttext">Type</p>
      "! Type of the Assignment
      type            type ty_item_type,
      "! <p class="shorttext">ID</p>
      "! Id of the Page Section
      tile_assignment type ty_tile_assignment,
    end of ty_item,

    ty_items type standard table of ty_item with default key. " TODO do we need an index property or can we rely on the order of the table?

  types:
    "! <p class="shorttext">Page Section</p>
    "! Page Section
    begin of ty_section,
      "! <p class="shorttext">ID</p>
      "! Id of the Page Section
      id    type c length 35,
      "! <p class="shorttext">Title</p>
      "! Section title
      title type c length 100,
      "! <p class="shorttext">Items</p>
      "! Assigned Page Section Items
      items type ty_items,
    end of ty_section,

    ty_sections type standard table of ty_section with default key. " TODO do we need an index property or can we rely on the order of the table?

  types:
    "! <p class="shorttext">Fiori Launchpad Page Template</p>
    "! Fiori launchpad page template
    begin of ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      type zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              type zif_aff_types_v1=>ty_header_100_cloud,

      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information type ty_general_information,

      "! <p class="shorttext">Page Templates</p>
      "! Assigned SAP Fiori launchpad page templates
      sections            type ty_sections,
    end of ty_main.

endinterface.
