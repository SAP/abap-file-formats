INTERFACE zif_aff_tabt_v1 PUBLIC.

  "! <p class="shorttext">Data Class Category</p>
  "! Data class category
  TYPES ty_data_class_category    TYPE c LENGTH 5.

  "! $values {@link zif_aff_tabt_v1.data:co_size_category}
  "! $default {@link zif_aff_tabt_v1.data:co_size_category.cat_0}
  TYPES ty_size_category TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_size_category,
      "! <p class="shorttext">Undefined</p>
      "! Undefined - Obsolete for new tables
      undefined TYPE ty_size_category VALUE space,
      "! <p class="shorttext">Size Category 0</p>
      "! Size category 0
      "! $enumValue '0'
      cat_0 TYPE ty_size_category VALUE 0,
      "! <p class="shorttext">Size Category 1</p>
      "! Size category 1
      "! $enumValue '1'
      cat_1 TYPE ty_size_category VALUE 1,
      "! <p class="shorttext">Size Category 2</p>
      "! Size category 2
      "! $enumValue '2'
      cat_2 TYPE ty_size_category VALUE 2,
      "! <p class="shorttext">Size Category 3</p>
      "! Size category 3
      "! $enumValue '3'
      cat_3 TYPE ty_size_category VALUE 3,
      "! <p class="shorttext">Size Category 4</p>
      "! Size category 4
      "! $enumValue '4'
      cat_4 TYPE ty_size_category VALUE 4,
      "! <p class="shorttext">Size Category 5</p>
      "! Size category 5
      "! $enumValue '5'
      cat_5 TYPE ty_size_category VALUE 5,
      "! <p class="shorttext">Size Category 6</p>
      "! Size category 6
      "! $enumValue '6'
      cat_6 TYPE ty_size_category VALUE 6,
      "! <p class="shorttext">Size Category 7</p>
      "! Size category 7
      "! $enumValue '7'
      cat_7 TYPE ty_size_category VALUE 7,
      "! <p class="shorttext">Size Category 8</p>
      "! Size category 8
      "! $enumValue '8'
      cat_8 TYPE ty_size_category VALUE 8,
      "! <p class="shorttext">Size Category 9</p>
      "! Size category 9
      "! $enumValue '9'
      cat_9 TYPE ty_size_category VALUE 9,
    END OF co_size_category.

  TYPES:
    "! $values {@link zif_aff_tabt_v1.data:co_buffer_state}
    "! $default {@link zif_aff_tabt_v1.data:co_buffer_state.not_allowed}
    ty_buffer_state TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_buffer_state,
      "! <p class="shorttext">Not Allowed</p>
      "! Buffering not allowed
      not_allowed              TYPE ty_buffer_state VALUE 'N',
      "! <p class="shorttext">Switched On</p>
      "! Buffering switched on
      switched_on              TYPE ty_buffer_state VALUE 'X',
      "! <p class="shorttext">Allowed But Switched Off</p>
      "! Buffering allowed but switched off
      allowed_but_switched_off TYPE ty_buffer_state VALUE 'A',
    END OF co_buffer_state.

  TYPES:
    "! $values {@link zif_aff_tabt_v1.data:co_buffer_type}
    "! $default {@link zif_aff_tabt_v1.data:co_buffer_type.no_buffer}
    ty_buffer_type TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_buffer_type,
      "! <p class="shorttext">No Buffering</p>
      "! No buffering
      no_buffer TYPE ty_buffer_type VALUE '',
      "! <p class="shorttext">Single</p>
      "! Single-record buffering
      single    TYPE ty_buffer_type VALUE 'P',
      "! <p class="shorttext">Generic</p>
      "! Generic-area buffering
      generic   TYPE ty_buffer_type VALUE 'G',
      "! <p class="shorttext">Full</p>
      "! Full table is passed to buffer
      full      TYPE ty_buffer_type VALUE 'X',
    END OF co_buffer_type.

  TYPES:
    BEGIN OF ty_buffering,
      "! <p class="shorttext">State</p>
      "! Buffer State
      state                         TYPE ty_buffer_state,
      "! <p class="shorttext">Type</p>
      "! Buffer Type
      type                          TYPE ty_buffer_type,
      "! <p class="shorttext">Number of Key Fields for Generic Buffering</p>
      "! Number of key fields for buffering area (not counting client field)
      "! $minimum 0
      nr_of_key_flds_4_generic_buff TYPE i,
    END OF ty_buffering.

  "! <p class="shorttext">Translation Type</p>
  "! Type of table translation for multilingual tables
  "! $values {@link zif_aff_tabt_v1.data:co_translation_type}
  "! $default {@link zif_aff_tabt_v1.data:co_translation_type.no_language_key}
  TYPES ty_translation_type TYPE c LENGTH 1.

  CONSTANTS:
    " This field is only enabled if there is LANG fields, if it is visible
    " potentially a different default is applicable.
    BEGIN OF co_translation_type,
      "! <p class="shorttext">No Language Key</p>
      "! Table does not contain a language key
      no_language_key TYPE ty_translation_type VALUE '',
      "! <p class="shorttext">Standard Translation</p>
      "! Translation using standard translation procedure
      standard        TYPE ty_translation_type VALUE 'X',
      "! <p class="shorttext">Load Table</p>
      "! Load table: text and translation are created automatically
      load_table      TYPE ty_translation_type VALUE 'L',
      "! <p class="shorttext">Object-Specific Tools</p>
      "! Translation only possible with object-specific tools
      object_specific TYPE ty_translation_type VALUE 'T',
      "! <p class="shorttext">Not Translation-Relevant</p>
      "! Table is language-dependent but not translation-relevant
      not_relevant    TYPE ty_translation_type VALUE 'N',
    END OF co_translation_type.

  "! <p class="shorttext">Storage Type</p>
  "! Storage type for database table (Row Store vs Column Store)
  "! $values {@link zif_aff_tabt_v1.data:co_storage_type}
  "! $default {@link zif_aff_tabt_v1.data:co_storage_type.column_store}
  TYPES ty_storage_type TYPE c LENGTH 1.


  CONSTANTS:
    BEGIN OF co_storage_type,
      "! <p class="shorttext">Column Store</p>
      "! Column store
      column_store TYPE ty_storage_type VALUE 'C',
      "! <p class="shorttext">Row Store</p>
      "! Row store, implies loadUnit is irrelevant
      row_store    TYPE ty_storage_type VALUE 'R',
      "! <p class="shorttext">(Deprecated) Undefined</p>
      "! Undefined
      undefined    TYPE ty_storage_type VALUE ' ',
    END OF co_storage_type.

  "! <p class="shorttext">Load Unit</p>
  "! Specifies how data is loaded into memory (HANA-specific)
  "! $values {@link zif_aff_tabt_v1.data:co_load_unit}
  "! $default {@link zif_aff_tabt_v1.data:co_load_unit.column_preferred}
  TYPES ty_load_unit TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_load_unit,
      "! <p class="shorttext">Column Preferred</p>
      "! Column preferred
      column_preferred TYPE ty_load_unit VALUE '',
      "! <p class="shorttext">Page Preferred</p>
      "! Page preferred
      page_preferred   TYPE ty_load_unit VALUE 'P',
      "! <p class="shorttext">Column Enforced</p>
      "! Column enforced
      column_enforced  TYPE ty_load_unit VALUE 'A',
      "! <p class="shorttext">Page Enforced</p>
      "! Page enforced
      page_enforced    TYPE ty_load_unit VALUE 'Q',
    END OF co_load_unit.

  TYPES:
    "! <p class="shorttext">DB Specific Settings</p>
    "! DB specific settings
    BEGIN OF ty_db_specific_settings,
      "! <p class="shorttext">Storage Type</p>
      "! Storage type
      storage_type TYPE ty_storage_type,
      "! <p class="shorttext">Load Unit</p>
      "! Load unit
      load_unit    TYPE ty_load_unit,
    END OF ty_db_specific_settings.

  TYPES:
    "! <p class="shorttext">Technical Table Settings</p>
    "! Technical table settings
    BEGIN OF ty_technical_table_settings,
      "! <p class="shorttext">Data Class Category</p>
      "! Data class category
      "! $required
      data_class_category TYPE ty_data_class_category,
      "! <p class="shorttext">Size Category</p>
      "! Size category
      size_category       TYPE ty_size_category,
      "! <p class="shorttext">Log Changes</p>
      "! Log changes
      log_changes         TYPE abap_bool,
      "! <p class="shorttext">Writable by AMDP</p>
      "! Writable by AMDP
      writable_by_amdp    TYPE abap_bool,
      "! <p class="shorttext">Translation</p>
      "! Translation settings
      translation         TYPE ty_translation_type,
    END OF ty_technical_table_settings.

  TYPES:
    "! <p class="shorttext">Technical Table Settings</p>
    "! Technical table settings
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information  TYPE ty_technical_table_settings,
      "! <p class="shorttext">Buffering</p>
      "! Buffering
      buffering            TYPE ty_buffering,
      "! <p class="shorttext">Database Specific Settings</p>
      "! Database specific settings
      db_specific_settings TYPE ty_db_specific_settings,
    END OF ty_main.

ENDINTERFACE.
