INTERFACE zif_aff_doma_v2 PUBLIC.

  TYPES ty_data_type TYPE c LENGTH 10.

  CONSTANTS:
    BEGIN OF co_data_type,
      "! <p class="shorttext">todo</p>
      "! todo
      posting_period       TYPE ty_data_type VALUE 'ACCP',
      "! <p class="shorttext">todo</p>
      "! todo
      character_string     TYPE ty_data_type VALUE 'CHAR',
      "! <p class="shorttext">todo</p>
      "! todo
      client               TYPE ty_data_type VALUE 'CLNT',
      "! <p class="shorttext">todo</p>
      "! todo
      currency_key         TYPE ty_data_type VALUE 'CUKY',
      "! <p class="shorttext">todo</p>
      "! todo
      currency_field       TYPE ty_data_type VALUE 'CURR',
      "! <p class="shorttext">todo</p>
      "! todo
      floating_point16_dec TYPE ty_data_type VALUE 'DF16_DEC',
      "! <p class="shorttext">todo</p>
      "! todo
      floating_point16_raw TYPE ty_data_type VALUE 'DF16_RAW',
      "! <p class="shorttext">todo</p>
      "! todo
      floating_point16_scl TYPE ty_data_type VALUE 'DF16_SCL',
      "! <p class="shorttext">todo</p>
      "! todo
      floating_point34_dec TYPE ty_data_type VALUE 'DF34_DEC',
      "! <p class="shorttext">todo</p>
      "! todo
      floating_point34_raw TYPE ty_data_type VALUE 'DF34_RAW',
      "! <p class="shorttext">todo</p>
      "! todo
      floating_point34_scl TYPE ty_data_type VALUE 'DF34_SCL',
      "! <p class="shorttext">todo</p>
      "! todo
      date                 TYPE ty_data_type VALUE 'DATS',
      "! <p class="shorttext">todo</p>
      "! todo
      counter_or_amount    TYPE ty_data_type VALUE 'DEC',
      "! <p class="shorttext">todo</p>
      "! todo
      floating_point       TYPE ty_data_type VALUE 'FLTP',
      "! <p class="shorttext">todo</p>
      "! todo
      integer_1            TYPE ty_data_type VALUE 'INT1',
      "! <p class="shorttext">todo</p>
      "! todo
      integer_2            TYPE ty_data_type VALUE 'INT2',
      "! <p class="shorttext">todo</p>
      "! todo
      integer_4            TYPE ty_data_type VALUE 'INT4',
      "! <p class="shorttext">todo</p>
      "! todo
      language             TYPE ty_data_type VALUE 'LANG',
      "! <p class="shorttext">todo</p>
      "! todo
      long_string          TYPE ty_data_type VALUE 'LCHR',
      "! <p class="shorttext">todo</p>
      "! todo
      long_byte_string     TYPE ty_data_type VALUE 'LRAW',
      "! <p class="shorttext">todo</p>
      "! todo
      numeric_character    TYPE ty_data_type VALUE 'NUMC',
      "! <p class="shorttext">todo</p>
      "! todo
      obsolete_prec        TYPE ty_data_type VALUE 'PREC',
      "! <p class="shorttext">todo</p>
      "! todo
      quantity             TYPE ty_data_type VALUE 'QUAN',
      "! <p class="shorttext">todo</p>
      "! todo
      byte_sequence        TYPE ty_data_type VALUE 'RAW',
      "! <p class="shorttext">todo</p>
      "! todo
      byte_string          TYPE ty_data_type VALUE 'RAWSTRING',
      "! <p class="shorttext">todo</p>
      "! todo
      short_string         TYPE ty_data_type VALUE 'SSTRING',
      "! <p class="shorttext">todo</p>
      "! todo
      string               TYPE ty_data_type VALUE 'STRING',
      "! <p class="shorttext">todo</p>
      "! todo
      time                 TYPE ty_data_type VALUE 'TIMS',
      "! <p class="shorttext">todo</p>
      "! todo
      unit                 TYPE ty_data_type VALUE 'UNIT',
      "! <p class="shorttext">todo</p>
      "! todo
      obsolete_varc        TYPE ty_data_type VALUE 'VARC',
    END OF co_data_type.

  "! <p class="shorttext">No Characters</p>
  "! Number of characters
  "! $minimum 0
  "! $maximum 999999
  TYPES ty_length               TYPE i.

  "! <p class="shorttext">Decimals</p>
  "! Decimals
  "! $minimum 0
  "! $maximum 999999
  TYPES ty_decimals             TYPE i.

  "! <p class="shorttext">Output Length</p>
  "! Output length
  "! $minimum 0
  "! $maximum 999999
  TYPES ty_output_length        TYPE i.

  "! <p class="shorttext">Convertion Routine</p>
  "! Convertion routine
  TYPES ty_conv_routine         TYPE c LENGTH 5.

  "! <p class="shorttext">Value Table</p>
  "! Value table
  TYPES ty_value_table          TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">Single Values</p>
    "! Single values
    BEGIN OF ty_single_value,
      "! <p class="shorttext">Fixed Value</p>
      "! Value
      fixed_value TYPE c LENGTH 10,
      "! <p class="shorttext">Description</p>
      "! Description
      description TYPE zif_aff_types_v1=>ty_description_60,
    END OF ty_single_value,

    ty_single_values TYPE STANDARD TABLE OF ty_single_value WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Interval Values</p>
    "! Interval values
    BEGIN OF ty_intervals_value,
      "! <p class="shorttext">Low Limit of the Interval</p>
      "! Low value for the interval
      low_limit   TYPE c LENGTH 10,
      "! <p class="shorttext">High Limit of the Interval</p>
      "! High value for the interval
      "! $required
      high_limit  TYPE c LENGTH 10,
      "! <p class="shorttext">Description</p>
      "! Description
      description TYPE zif_aff_types_v1=>ty_description_60,
    END OF ty_intervals_value,

    ty_intervals_values TYPE STANDARD TABLE OF ty_intervals_value WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Domain Properties</p>
    "! Domain properties
    BEGIN OF ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60,

      "! $required
      "! $values {@link zif_aff_doma_v2.data:co_data_type}
      data_type             TYPE ty_data_type,

      "! $required
      length                TYPE ty_length,

      "! Set if decimal
      decimals              TYPE ty_decimals,

      "! <p class="shorttext">Supports Negative Values</p>
      "! Supports negative values
      negative_values       TYPE abap_bool,

      "! <p class="shorttext">Case Sensitive</p>
      "! Values are case sensitive
      case_sensitive        TYPE abap_bool,

      "! Set the output length
      output_length         TYPE ty_output_length,

      "! Conversion Routine
      conversion_routine    TYPE ty_conv_routine,

      "! Value table
      value_table           TYPE ty_value_table,

      "! Fixed values
      fixed_values          TYPE ty_single_values,

      "! Fixed value intervals
      fixed_value_intervals TYPE ty_intervals_values,

      "! Fixed value appends
      fixed_value_appends   TYPE STANDARD TABLE OF zif_aff_types_v1=>ty_object_name_30 WITH DEFAULT KEY,
    END OF ty_main.

ENDINTERFACE.
