INTERFACE zif_aff_doma_v2 PUBLIC.

  TYPES ty_data_type TYPE c LENGTH 10.

  CONSTANTS:
    BEGIN OF co_data_type,
      "! <p class="shorttext">Posting period YYYYMM</p>
      "! Posting period YYYYMM
      posting_period       TYPE ty_data_type VALUE 'ACCP',
      "! <p class="shorttext">Character String</p>
      "! Character String
      character_string     TYPE ty_data_type VALUE 'CHAR',
      "! <p class="shorttext">Client</p>
      "! Client
      client               TYPE ty_data_type VALUE 'CLNT',
      "! <p class="shorttext">Currency key, referenced by CURR fields</p>
      "! Currency key, referenced by CURR fields
      currency_key         TYPE ty_data_type VALUE 'CUKY',
      "! <p class="shorttext">Currency field, stored as DEC</p>
      "! Currency field, stored as DEC
      currency_field       TYPE ty_data_type VALUE 'CURR',
      "! <p class="shorttext">Decimal Floating Point, 16 Digits, DEC on Database</p>
      "! Decimal Floating Point, 16 Digits, DEC on Database
      floating_point16_dec TYPE ty_data_type VALUE 'DF16_DEC',
      "! <p class="shorttext">Decimal Floating Point, 16 Digits,  RAW on Database</p>
      "! Decimal Floating Point, 16 Digits,  RAW on Database
      floating_point16_raw TYPE ty_data_type VALUE 'DF16_RAW',
      "! <p class="shorttext">Decimal Floating Point. 16 Digits, with Scale Field</p>
      "! Decimal Floating Point. 16 Digits, with Scale Field
      floating_point16_scl TYPE ty_data_type VALUE 'DF16_SCL',
      "! <p class="shorttext">Decimal Floating Point, 34 Digits, DEC on Database</p>
      "! Decimal Floating Point, 34 Digits, DEC on Database
      floating_point34_dec TYPE ty_data_type VALUE 'DF34_DEC',
      "! <p class="shorttext">Decimal Floating Point, 34 Digits, RAW on Database</p>
      "! Decimal Floating Point, 34 Digits, RAW on Database
      floating_point34_raw TYPE ty_data_type VALUE 'DF34_RAW',
      "! <p class="shorttext">Decimal Floating Point, 34 Digits, with Scale Field</p>
      "! Decimal Floating Point, 34 Digits, with Scale Field
      floating_point34_scl TYPE ty_data_type VALUE 'DF34_SCL',
      "! <p class="shorttext">Date field (YYYYMMDD) stored as char(8)</p>
      "! Date field (YYYYMMDD) stored as char(8)
      date                 TYPE ty_data_type VALUE 'DATS',
      "! <p class="shorttext">Counter or amount field with comma and sign</p>
      "! Counter or amount field with comma and sign
      counter_or_amount    TYPE ty_data_type VALUE 'DEC',
      "! <p class="shorttext">Floating point number, accurate to 8 bytes</p>
      "! Floating point number, accurate to 8 bytes
      floating_point       TYPE ty_data_type VALUE 'FLTP',
      "! <p class="shorttext">1-byte integer, integer number <= 255</p>
      "! 1-byte integer, integer number <= 255
      integer_1            TYPE ty_data_type VALUE 'INT1',
      "! <p class="shorttext">2-byte integer, only for length field before LCHR or LRAW</p>
      "! 2-byte integer, only for length field before LCHR or LRAW
      integer_2            TYPE ty_data_type VALUE 'INT2',
      "! <p class="shorttext">4-byte integer, integer number with sign</p>
      "! 4-byte integer, integer number with sign
      integer_4            TYPE ty_data_type VALUE 'INT4',
      "! <p class="shorttext">Language key</p>
      "! Language key
      language             TYPE ty_data_type VALUE 'LANG',
      "! <p class="shorttext">Long character string, requires preceding INT2 field</p>
      "! Long character string, requires preceding INT2 field
      long_string          TYPE ty_data_type VALUE 'LCHR',
      "! <p class="shorttext">Long byte string, requires preceding INT2 field</p>
      "! Long byte string, requires preceding INT2 field
      long_byte_string     TYPE ty_data_type VALUE 'LRAW',
      "! <p class="shorttext">Character string with only digits</p>
      "! Character string with only digits
      numeric_character    TYPE ty_data_type VALUE 'NUMC',
      "! <p class="shorttext">Obsolete data type, do not use</p>
      "! Obsolete data type, do not use
      obsolete_prec        TYPE ty_data_type VALUE 'PREC',
      "! <p class="shorttext">Quantity field, points to a unit field with format UNIT</p>
      "! Quantity field, points to a unit field with format UNIT
      quantity             TYPE ty_data_type VALUE 'QUAN',
      "! <p class="shorttext">Uninterpreted sequence of bytes</p>
      "! Uninterpreted sequence of bytes
      byte_sequence        TYPE ty_data_type VALUE 'RAW',
      "! <p class="shorttext">Byte String of Variable Length</p>
      "! Byte String of Variable Length
      byte_string          TYPE ty_data_type VALUE 'RAWSTRING',
      "! <p class="shorttext">Short Character String of Variable Length</p>
      "! Short Character String of Variable Length
      short_string         TYPE ty_data_type VALUE 'SSTRING',
      "! <p class="shorttext">Character String of Variable Length</p>
      "! Character String of Variable Length
      string               TYPE ty_data_type VALUE 'STRING',
      "! <p class="shorttext">Time field (hhmmss), stored as char(6)</p>
      "! Time field (hhmmss), stored as char(6)
      time                 TYPE ty_data_type VALUE 'TIMS',
      "! <p class="shorttext">Unit key for QUAN fields</p>
      "! Unit key for QUAN fields
      unit                 TYPE ty_data_type VALUE 'UNIT',
      "! <p class="shorttext">Long character string, no longer supported from Rel. 3.0</p>
      "! Long character string, no longer supported from Rel. 3.0
      obsolete_varc        TYPE ty_data_type VALUE 'VARC',
    END OF co_data_type.

  TYPES ty_output_style TYPE n LENGTH 2.

  CONSTANTS: BEGIN OF co_output_style,
               "! <p class="shorttext">Normal</p>
               "! Normal
               normal                       TYPE ty_output_style VALUE '00',
               "! <p class="shorttext">Sign right</p>
               "! Sign right
               sign_right                   TYPE ty_output_style VALUE '01',
               "! <p class="shorttext">Scale-preserving</p>
               "! Scale-preserving
               scale_preserving             TYPE ty_output_style VALUE '02',
               "! <p class="shorttext">Scientific</p>
               "! Scientific
               scientific                   TYPE ty_output_style VALUE '03',
               "! <p class="shorttext">Scientific with leading zero</p>
               "! Scientific with leading zero
               scientific_with_leading_zero TYPE ty_output_style VALUE '04',
               "! <p class="shorttext">Scale-preserving scientific</p>
               "! Scale-preserving scientific
               scale_preserving_scientific  TYPE ty_output_style VALUE '05',
               "! <p class="shorttext">Engineering</p>
               "! Engineering
               engineering                  TYPE ty_output_style VALUE '06',
             END OF co_output_style.

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
      format_version              TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                      TYPE zif_aff_types_v1=>ty_header_60,

      "! $required
      "! $values {@link zif_aff_doma_v2.data:co_data_type}
      data_type                   TYPE ty_data_type,

      "! $required
      length                      TYPE ty_length,

      "! Set if decimal
      decimals                    TYPE ty_decimals,

      "! <p class="shorttext">Supports Negative Values</p>
      "! Supports negative values
      negative_values             TYPE abap_bool,

      "! <p class="shorttext">Case Sensitive</p>
      "! Values are case sensitive
      case_sensitive              TYPE abap_bool,

      "! <p class="shorttext">AM/PM time format supported</p>
      "! AM/PM time format supported
      am_pm_time_format_supported TYPE abap_bool,

      "! <p class="shorttext">Output style (for Releases < 71*)</p>
      "! Output style (for Releases < 71*)
      "! $values {@link zif_aff_doma_v2.data:co_output_style}
      output_style                TYPE ty_output_style,

      "! Set the output length
      output_length               TYPE ty_output_length,

      "! Conversion Routine
      conversion_routine          TYPE ty_conv_routine,

      "! Value table
      value_table                 TYPE ty_value_table,

      "! Fixed values
      fixed_values                TYPE ty_single_values,

      "! Fixed value intervals
      fixed_value_intervals       TYPE ty_intervals_values,

      "! Fixed value appends
      fixed_value_appends         TYPE STANDARD TABLE OF zif_aff_types_v1=>ty_object_name_30 WITH DEFAULT KEY,
    END OF ty_main.

ENDINTERFACE.
