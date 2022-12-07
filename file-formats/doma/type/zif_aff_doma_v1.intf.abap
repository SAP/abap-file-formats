INTERFACE zif_aff_doma_v1 PUBLIC.

  "! <p class="shorttext">Data Type for the Domain</p>
  "! Data type for the domain
  TYPES ty_data_type            TYPE c LENGTH 4.

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
    END OF ty_main.

ENDINTERFACE.
