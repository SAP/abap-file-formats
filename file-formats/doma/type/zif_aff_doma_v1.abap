INTERFACE zif_aff_doma_v1 PUBLIC.

  "! <p class="shorttext">Plus - Minus sign for domains</p>
  "! Plus - Minus sign for domains
  TYPES ty_negative_values TYPE abap_bool.

  "! <p class="shorttext">Case sensitive flag for domains</p>
  "! Case sensiive flag for domains
  TYPES ty_case_sensitive       TYPE abap_bool.

  "! <p class="shorttext">Data type for the domain</p>
  "! Data type for the domain
  TYPES ty_data_type            TYPE c LENGTH 4.

  "! <p class="shorttext">No Characters</p>
  "! Number of Characters
 "! $minimum 0
 "! $maximum 999999
 TYPES ty_numb_char            TYPE i.

 "! <p class="shorttext">Decimals</p>
 "! Decimals
 "! $minimum 0
 "! $maximum 999999
 TYPES ty_decimals             TYPE i.

 "! <p class="shorttext">Output Length</p>
 "! Output Length
 "! $minimum 0
 "! $maximum 999999
 TYPES ty_output_length        TYPE i.

  "! <p class="shorttext">Convertion Routine</p>
  "! Convertion Routine
  TYPES ty_conv_routine         TYPE c LENGTH 5.

  "! <p class="shorttext">Value table</p>
  "! Value table
  TYPES ty_value_table          TYPE c LENGTH 30.

  "! <p class="shorttext">Single Values</p>
  "! Single Values
  TYPES:
    BEGIN OF ty_single_value,
      "! <p class="shorttext">Fixed value</p>
      "! Value
      fixed_value                 TYPE c LENGTH 10,
      "! <p class="shorttext">Description</p>
      "! Description
      description                 TYPE zif_aff_types_v1=>ty_description_60,
    END OF ty_single_value,

    ty_single_values        TYPE STANDARD TABLE OF ty_single_value WITH DEFAULT KEY.

  "! <p class="shorttext">Interval values</p>
  "! Interval values
  TYPES:
    BEGIN OF ty_intervals_value,
      "! <p class="shorttext">Low limit of the interval</p>
      "! Low value for the interval
      low_limit                   TYPE c LENGTH 10,
      "! <p class="shorttext">High limit of the interval</p>
      "! High value for the interval
      "! $required
      high_limit                  TYPE c LENGTH 10,
      "! <p class="shorttext">Description</p>
      "! Description
      description                 TYPE zif_aff_types_v1=>ty_description_60,
    END OF ty_intervals_value,

    ty_intervals_values     TYPE STANDARD TABLE OF ty_intervals_value WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Domain Properties</p>
    "! Domain properties
    BEGIN OF ty_main,
      "! $required
      format_version            TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! header
      "! $required
      header                    TYPE zif_aff_types_v1=>ty_header_60,

      "! Plus, minus sign
      negative_values                      TYPE ty_negative_values,

      "! Set if case sensitive
      case_sensitive            TYPE ty_case_sensitive,

      "! $required
      data_type                 TYPE ty_data_type,

      "! $required
      num_chars                 TYPE ty_numb_char,

      "! Set if decimal
      decimals                  TYPE ty_decimals,

      "! Set the oputput length
      output_length             TYPE ty_output_length,

      "! Convertion Routine
      conv_rout                 TYPE ty_conv_routine,

      "! Value table
      value_table               TYPE ty_value_table,

      "! Fixed values
      fixed_values                TYPE ty_single_values,

      "! Fixed value intervals
      fixed_value_intervals             TYPE ty_intervals_values,
    END OF ty_main.

ENDINTERFACE.
