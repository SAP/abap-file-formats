INTERFACE zif_aff_indx_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Index Fields</p>
    "! Index fields
    BEGIN OF ty_indexfield,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      "! $required
      field_name TYPE c LENGTH 30,
    END OF ty_indexfield,
    tt_index_fields TYPE TABLE OF ty_indexfield WITH DEFAULT KEY
      WITH UNIQUE SORTED KEY name_unique COMPONENTS field_name,
    "! <p class="shorttext">FTI Properties</p>
    "! Properties of an Fulltext-Index
    BEGIN OF ty_fti_properties,
      "! <p class="shorttext">Language Column for Full-Text Index</p>
      language_column      TYPE c LENGTH 30,
      "! <p class="shorttext">Column for Mime Type</p>
      mime_type_column     TYPE c LENGTH 30,
      "! <p class="shorttext">Mime Type for Full-Text Index</p>
      mime_type         TYPE c LENGTH 127,
      "! <p class="shorttext">Languages for Automatic Language Detection</p>
      language_detection   TYPE c LENGTH 200,
      "! <p class="shorttext">Fast Preprocessing On/Off</p>
      fast_preprocess   TYPE abap_bool,
      "! <p class="shorttext">Additional Index for Fuzzy Search</p>
      fuzzy_search_index TYPE abap_bool,
      "! <p class="shorttext">Original formatting will be removed</p>
      search_only       TYPE abap_bool,
      "! <p class="shorttext">Update Mode of Full-Text Index</p>
      update_mode       TYPE c LENGTH 10,
      "! <p class="shorttext">Type of Text Analysis</p>
      configuration     TYPE c LENGTH 1,
      "! <p class="shorttext">Ratio Phrase Index to Full-Text Index</p>
      phrase_index_ratio TYPE n LENGTH 3,
      "! <p class="shorttext">Switches on the text analysis</p>
      text_analysis     TYPE abap_bool,
      "! <p class="shorttext">Token Delimiters</p>
      token_separators  TYPE c LENGTH 50,
    END OF ty_fti_properties.

  TYPES:
    "! <p class="shorttext">ABAP DDIC Secondary Index Properties</p>
    "! Object type INDX
    BEGIN OF ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Token Index</p>
      "! Token-Index
      token_index            TYPE abap_bool,
      "! <p class="shorttext">Fulltext-Index</p>
      "! Fulltext-Index
      fulltext_index         TYPE abap_bool,
      "! <p class="shorttext">Unique Index</p>
      "! Unique flag
      unique_index           TYPE abap_bool,
      "! <p class="shorttext">No DB Index</p>
      "! Index not on DB, only for ABAP table buffer
      no_db_index            TYPE abap_bool,
      "! <p class="shorttext">Fields</p>
      "! Index fields
      index_fields           TYPE tt_index_fields,
      "! <p class="shorttext">Fulltext Index</p>
      "! Fulltext Index Properties
      fti_properties         TYPE ty_fti_properties,
    END OF ty_main.

ENDINTERFACE.