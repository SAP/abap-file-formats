INTERFACE zif_aff_enho_v1
  PUBLIC.

  "! <p class="shorttext">Range Filter Comparator</p>
  "! Range filter comparator
  "! $values {@link zif_aff_enho_v1.data:co_range_filter_comparator}
  "! $required
  TYPES ty_range_filter_comparator TYPE c LENGTH 2.


  CONSTANTS:
    "! <p class="shorttext">Range Filter Comparator</p>
    "! Range filter comparator
    BEGIN OF co_range_filter_comparator,
      "! <p class="shorttext">Less Than</p>
      "! True, if the value of operand1 is less than the value of operand2.
      "! $enumValue '<'
      less_than  TYPE ty_range_filter_comparator VALUE '<',
      "! <p class="shorttext">Less Equal</p>
      "! True, if the value of operand1 is less than or equal to the value of operand2.
      "! $enumValue '<='
      less_equal TYPE ty_range_filter_comparator VALUE '<=',
    END OF co_range_filter_comparator.

  "! <p class="shorttext">Comparator</p>
  "! Filter comparator
  "! $values {@link zif_aff_enho_v1.data:co_comparator}
  "! $default {@link zif_aff_enho_v1.data:co_comparator.equal}
  TYPES ty_comparator TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Comparator</p>
    "! Filter comparator
    BEGIN OF co_comparator,
      "! <p class="shorttext">Equal</p>
      "! True, if the value of operand1 is equal to the value of operand2.
      "! $enumValue '='
      equal                       TYPE ty_comparator VALUE '=',
      "! <p class="shorttext">Less Than</p>
      "! True, if the value of operand1 is less than the value of operand2.
      "! $enumValue '<'
      less_than                   TYPE ty_comparator VALUE '<',
      "! <p class="shorttext">Greater Than</p>
      "! True, if the value of operand1 is greater than the value of operand2.
      "! $enumValue '>'
      greater_than                TYPE ty_comparator VALUE '>',
      "! <p class="shorttext">Less Equal</p>
      "! True, if the value of operand1 is less than or equal to the value of operand2.
      "! $enumValue '<='
      less_equal                  TYPE ty_comparator VALUE '<=',
      "! <p class="shorttext">Greater Equal</p>
      "! True, if the value of operand1 is greater than or equal to the value of operand2.
      "! $enumValue '>='
      greater_equal               TYPE ty_comparator VALUE '>=',
      "! <p class="shorttext">Not Equal</p>
      "! True, if the value of operand1 is not equal to the value of operand2.
      "! $enumValue '<>'
      not_equal                   TYPE ty_comparator VALUE '<>',
      "! <p class="shorttext">Conforms To Pattern</p>
      "! True, if the content of operand1 matches the pattern in operand2.
      "! Wildcard characters can be used to form the operand2 pattern, where * represents any character string,
      "! including an empty string, and + represents any character. It is not case-sensitive. Trailing blanks in
      "! the left operand are respected.
      "! $enumValue 'CP'
      conforms_to_pattern         TYPE ty_comparator VALUE 'CP',
      "! <p class="shorttext">Does Not Conform To Pattern</p>
      "! True, if a comparison expression with CP is false, that is, operand1 does not fit the pattern in
      "! operand2.
      "! $enumValue 'NP'
      does_not_conform_to_pattern TYPE ty_comparator VALUE 'NP',
      "! <p class="shorttext">Contains String</p>
      "! True, if the content of operand2 is contained in operand1.
      "! Trailing blanks in the left operand are respected. If operand1 is of type string and initial, or
      "! of type c and contains only blank characters, the comparison expression is false, unless operand2
      "! is also of type string and initial, or of type c and only contains blank characters, in which case,
      "! the comparison expression is always true.
      "! $enumValue 'CS'
      contains_string             TYPE ty_comparator VALUE 'CS',
      "! <p class="shorttext">Contains No String</p>
      "! True, if a comparison expression with CS is false, that is if operand1 does not contain the content
      "! of operand2.
      "! $enumValue 'NS'
      contains_no_string          TYPE ty_comparator VALUE 'NS',
    END OF co_comparator.


  TYPES:
    "! <p class="shorttext">Filter</p>
    "! Filter
    BEGIN OF ty_filter_details,
      comparator TYPE ty_comparator,
      "! <p class="shorttext">Filter Value</p>
      "! Filter value
      value      TYPE string,
    END OF ty_filter_details.

  TYPES:
    "! <p class="shorttext">Range Filter</p>
    "! Range filter
    BEGIN OF ty_range_filter,
      "! <p class="shorttext">Low Comparator</p>
      "! Low comparator
      "! $required
      low_comparator  TYPE ty_range_filter_comparator,
      "! <p class="shorttext">Low Filter Value</p>
      "! Low filter value
      low_value       TYPE string,
      "! <p class="shorttext">High Comparator</p>
      "! High comparator
      "! $required
      high_comparator TYPE ty_range_filter_comparator,
      "! <p class="shorttext">High Filter Value</p>
      "! High filter value
      high_value      TYPE string,
    END OF ty_range_filter.

  TYPES:
    "! <p class="shorttext">Filter</p>
    "! Filter
    BEGIN OF ty_filter,
      "! <p class="shorttext">Name</p>
      "! Filter name
      name                  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Filter</p>
      "! Filter
      filter_details        TYPE ty_filter_details,
      "! <p class="shorttext">Range Filter</p>
      "! Range filter
      range_filter_details  TYPE ty_range_filter,
    END OF ty_filter.


  TYPES:
    "! <p class="shorttext">And</p>
    "! And
    BEGIN OF ty_and,
      "! <p class="shorttext">Or</p>
      "! Or
      or     TYPE STANDARD TABLE OF ty_filter WITH DEFAULT KEY,
      "! <p class="shorttext">Filter</p>
      "! Filter
      filter TYPE ty_filter,
    END OF ty_and.

  TYPES:
    "! <p class="shorttext">Outer or</p>
    "! Outer or
    BEGIN OF ty_outer_or,
      "! <p class="shorttext">And</p>
      "! And
      and    TYPE STANDARD TABLE OF ty_and WITH DEFAULT KEY,
      "! <p class="shorttext">Filter</p>
      "! Filter
      filter TYPE ty_filter,
    END OF ty_outer_or.

  TYPES:
    "! <p class="shorttext">Filter Values</p>
    "! Filter values
    BEGIN OF ty_filter_values,
      "! <p class="shorttext">Or</p>
      "! Or
      or     TYPE STANDARD TABLE OF ty_outer_or WITH DEFAULT KEY,
      "! <p class="shorttext">And</p>
      "! And
      and    TYPE STANDARD TABLE OF ty_and WITH DEFAULT KEY,
      "! <p class="shorttext">Filter</p>
      "! Filter
      filter TYPE ty_filter,
    END OF ty_filter_values.

  "! <p class="shorttext">Customizing</p>
  "! Customizing
  "! $values {@link zif_aff_enho_v1.data:co_customizing}
  "! $default {@link zif_aff_enho_v1.data:co_customizing.not_supported}
  TYPES ty_customizing TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Customizing</p>
    "! Customizing
    BEGIN OF co_customizing,
      "! <p class="shorttext">Not Supported</p>
      "! Customizing is not supported
      not_supported          TYPE ty_customizing VALUE 'X',
      "! <p class="shorttext">Supported</p>
      "! Customizing is supported
      supported              TYPE ty_customizing VALUE ' ',
      "! <p class="shorttext">Supported (No Transport)</p>
      "! Customizing is supported (without transport)
      supported_no_transport TYPE ty_customizing VALUE 'D',
    END OF co_customizing.

  TYPES:
    "! <p class="shorttext">BAdI Implementation</p>
    "! BAdI Implementation
    BEGIN OF ty_badi_implementation,
      "! <p class="shorttext">Name</p>
      "! Name of the BAdI implementation
      "! $required
      name                      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description               TYPE c LENGTH 255,
      "! <p class="shorttext">BAdI Definition</p>
      "! BAdI Definition
      "! $required
      badi_definition           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Implementing Class</p>
      "! Implementing class
      implementing_class        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Is Example Implementation</p>
      "! BAdI implementation is an example implementation
      is_example_implementation TYPE abap_bool,
      "! <p class="shorttext">Is Default Implementation</p>
      "! Is the default implementation of the BAdI definition
      "! $showAlways
      is_default_implementation TYPE abap_bool,
      "! <p class="shorttext">BAdI Implementation is Active</p>
      "! BAdI implementation is active
      "! $showAlways
      is_active_implementation  TYPE abap_bool,
      "! <p class="shorttext">Customizing</p>
      "! Customizing
      "! $showAlways
      customizing               TYPE ty_customizing,
      "! <p class="shorttext">Filter Values</p>
      "! Filter values
      "! The filter tree has at most 3 levels: or, and, or (with filters on each level)
      filter_values             TYPE ty_filter_values,
    END OF ty_badi_implementation,

    "! <p class="shorttext">BAdI Implementations</p>
    "! BAdI implementations
    ty_badi_implementations TYPE STANDARD TABLE OF ty_badi_implementation WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Enhancement Spot</p>
      "! Enhancement Spot name
      "! $required
      enhancement_spot TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.


  TYPES:
    "! <p class="shorttext">ENHO</p>
    "! Object type ENHO
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_100,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information  TYPE ty_general_information,
      "! <p class="shorttext">BAdI Implementations</p>
      "! BAdI implementations
      badi_implementations TYPE ty_badi_implementations,
    END OF ty_main.

ENDINTERFACE.
