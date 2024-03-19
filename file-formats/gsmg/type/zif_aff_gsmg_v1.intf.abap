INTERFACE zif_aff_gsmg_v1
  PUBLIC.

  TYPES:

    "! <p class="shorttext">Category</p>
    "! Category
    "! $values {@link zif_aff_gsmg_v1.data:co_category}
    "! $default {@link zif_aff_gsmg_v1.data:co_category.usage}
    ty_category             TYPE c LENGTH 10,

    "! <p class="shorttext">Detailed Description</p>
    "! Detailed description
    ty_detailed_description TYPE c LENGTH 255,


    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Category</p>
      "! Category
      "! $required
      type                 TYPE ty_category,

      "! <p class="shorttext">Detailed Description</p>
      "! Detailed description
      "! $required
      detailed_description TYPE ty_detailed_description,

    END OF ty_general_information.


  CONSTANTS:

    "! <p class="shorttext">Category</p>
    "! Category
    BEGIN OF co_category,

      "! <p class="shorttext">Availability</p>
      "! Availability
      "! $enumValue 'AVAIL'
      availability    TYPE ty_category VALUE 'AVAIL',

      "! <p class="shorttext">Performance</p>
      "! Performance
      "! $enumValue 'PERFORM'
      performance     TYPE ty_category VALUE 'PERFORM',

      "! <p class="shorttext">Exceptions</p>
      "! Exceptions
      "! $enumValue 'EXCEPTION'
      exceptions      TYPE ty_category VALUE 'EXCEPTION',

      "! <p class="shorttext">Configuration</p>
      "! Configuration
      "! $enumValue 'CONFIGURE'
      configuration   TYPE ty_category VALUE 'CONFIGURE',

      "! <p class="shorttext">Usage</p>
      "! Usage
      "! $enumValue 'USAGE'
      usage           TYPE ty_category VALUE 'USAGE',

      "! <p class="shorttext">Self Monitoring</p>
      "! Self monitoring
      "! $enumValue 'SELFMON'
      self_monitoring TYPE ty_category VALUE 'SELFMON',

      "! <p class="shorttext">Metering</p>
      "! Metering
      "! $enumValue 'METERING'
      metering        TYPE ty_category VALUE 'METERING',

    END OF co_category.



  TYPES:

    "! <p class="shorttext">Metric Group</p>
    "! Metric Group (GSMG)
    BEGIN OF ty_main,

      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,

    END OF ty_main.

ENDINTERFACE.
