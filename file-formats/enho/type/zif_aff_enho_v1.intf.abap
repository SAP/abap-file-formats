INTERFACE zif_aff_enho_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Filter Values</p>
    "! Filter values
    BEGIN OF ty_filter_values,
      "! <p class="shorttext">Filter Value 1</p>
      "! Filter value 1
      value1 TYPE string,
      "! <p class="shorttext">Filter Value 2</p>
      "! Filter value 2
      value2 TYPE string,
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
      "! <p class="shorttext">Customizing Not Supported</p>
      "! Customizing is not supported
      not_supported              TYPE ty_customizing VALUE 'X',
      "! <p class="shorttext">Customizing Supported</p>
      "! Customizing is supported
      supported              TYPE ty_customizing VALUE ' ',
      "! <p class="shorttext">Customizing Supported (No Transport)</p>
      "! Customizing is supported (without transport)
      supported_no_transport              TYPE ty_customizing VALUE 'D',
    END OF co_customizing.

  "! <p class="shorttext">Filter Comparator</p>
  "! Filter comparator
  "! $values {@link zif_aff_enho_v1.data:co_comparator}
  TYPES ty_comparator TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Filter Comparator</p>
    "! Filter comparator
    BEGIN OF co_comparator,
      "! <p class="shorttext">Equal</p>
      "! Equal: True if the value of operand1 matches the value of operand2.
      equal              TYPE ty_comparator VALUE '=',
      "! <p class="shorttext">Less Than</p>
      "! Less Than: True if the value of operand1 is less than the value of operand2.
      less_than          TYPE ty_comparator VALUE '<',
      "! <p class="shorttext">Greater Than</p>
      "! Greater Than: True if the value of operand1 is greater than the value of operand2.
      greater_than       TYPE ty_comparator VALUE '>',
      "! <p class="shorttext">Less Equal</p>
      "! Less Equal: True if the value of operand1 is less than or equal to the value of operand2.
      less_equal         TYPE ty_comparator VALUE '<=',
      "! <p class="shorttext">Greater Equal</p>
      "! Greater Equal: True if the value of operand1 is greater than or equal to the value of operand2.
      greater_equal      TYPE ty_comparator VALUE '>=',
      "! <p class="shorttext">Not Equal</p>
      "! Not Equal: True if the value of operand1 does not match the value of operand2.
      not_equal          TYPE ty_comparator VALUE '<>',
      "! <p class="shorttext">Covers Pattern</p>
      "! Covers Pattern: True, if the content of operand1 fits the pattern in operand2.
      "! Wildcard characters can be used to create the operand2 pattern,
      "! where "*" represents any character string (including a blank string) and "+" represents any character.
      "! It is not case-sensitive.
      covers_pattern     TYPE ty_comparator VALUE 'CP',
      "! <p class="shorttext">No Pattern</p>
      "! No Pattern: True, if a logical expression with CP is false, that is, if operand1 does not fit the pattern
      "! operand2. If the comparison is false, sy-fdpos contains the offset of operand2 in operand1, whereby
      "! leading wildcard characters "*" in operand2 are ignored if operand2 also contains other characters.
      "! If the comparison is true, sy-fdpos contains the length of operand1.
      no_pattern         TYPE ty_comparator VALUE 'NP',
      "! <p class="shorttext">Contains String</p>
      "! Contains String: True, if the content of operand2 is contained in operand1. It is not case-sensitive and
      "! trailing blanks in the left operand are respected. If operand1 is of type string and initial, or of type c
      "! and contains only blank characters, the logical expression is false, unless operand2 is also of type string
      "! and initial, or of type c and only contains blank characters. In this case, the logical expression is always
      "! true. If the comparison is true, sy-fdpos contains the offset of operand2 in operand1. If the comparison is
      "! false, sy-fdpos contains the length of operand1.
      contains_string    TYPE ty_comparator VALUE 'CS',
      "! <p class="shorttext">Contains No String</p>
      "! Contains No String: True, if a logical expression with CS is false, that is if operand1 does not contain the
      "! content of operand2. If the comparison is false, sy-fdpos contains the offset of operand2 in operand1.
      "! If the comparison is true, sy-fdpos contains the length of operand1.
      contains_no_string TYPE ty_comparator VALUE 'NS',
    END OF co_comparator.

  TYPES:
    "! <p class="shorttext">Filter Comparators</p>
    "! Filter comparators
    BEGIN OF ty_filter_comparators,
      "! <p class="shorttext">Comparator 1</p>
      "! Comparator 1
      comparator1 TYPE ty_comparator,
      "! <p class="shorttext">Comparator 2</p>
      "! Comparator 2
      comparator2 TYPE ty_comparator,
    END OF ty_filter_comparators.

  "! <p class="shorttext">Filter Type</p>
  "! Filter type
  "! $values {@link zif_aff_enho_v1.data:co_filter_type}
  TYPES ty_filter_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Filter Type</p>
    "! Filter type
    BEGIN OF co_filter_type,
      "! <p class="shorttext">Integer</p>
      "! Integer
      integer        TYPE ty_filter_type VALUE 'I',
      "! <p class="shorttext">Character-Like</p>
      "! Character-like
      character_like TYPE ty_filter_type VALUE 'C',
      "! <p class="shorttext">String</p>
      "! String
      string         TYPE ty_filter_type VALUE 'S',
      "! <p class="shorttext">Numeric</p>
      "! Numeric
      numeric        TYPE ty_filter_type VALUE 'N',
      "! <p class="shorttext">Packed</p>
      "! Packed
      packed         TYPE ty_filter_type VALUE 'P',
    END OF co_filter_type.


  TYPES:
    "! This structure contains all relevant data of one BADI implementation filter:
    "! It compares one filter-name (from the BADI definition) with one or two filter-values.
    "! It corresponds to structure ENH_BADIIMPL_FILTER_VALUE.
    BEGIN OF ty_badi_impl_filter,
      "! <p class="shorttext">Filter Name</p>
      "! Filter name
      filter_name        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Filter Type</p>
      "! Filter type
      filter_type        TYPE ty_filter_type,
      "! <p class="shorttext">Comparators</p>
      "! Comparators
      comparators        TYPE ty_filter_comparators,
      "! <p class="shorttext">Filter Values</p>
      "! Filter values
      values             TYPE ty_filter_values,
      "! <p class="shorttext">Property Reference</p>
      "! Property reference
      property_reference TYPE string,
    END OF ty_badi_impl_filter.

  TYPES ty_badi_impl_filters TYPE STANDARD TABLE OF ty_badi_impl_filter WITH DEFAULT KEY.


  "! A table, which entries are combined using OR.
  "! The entries itself are BADI filters.
  TYPES ty_or_combination_of_filters TYPE ty_badi_impl_filters.


  "! A table, which entries are combined using AND.
  "! The entries itself are again combinations, which are combined using OR.
  TYPES ty_and_combination_of_or TYPE STANDARD TABLE OF ty_or_combination_of_filters WITH DEFAULT KEY.


  "! A table, which entries are combined using OR.
  "! The entries itself are again combinations, which are combined using AND.
  "! As a result this spans a conditional tree of BADI filters.
  "! This tree corresponds to the tables ENH_BADIIMPL_FILTER_ROOT_IT and ENH_BADIIMPL_FILTER_TREE_IT,
  "! but much restructured for better understandability.
  TYPES ty_or_combination_of_and TYPE STANDARD TABLE OF ty_and_combination_of_or WITH DEFAULT KEY.

  "! <p class="shorttext">Element Usage</p>
  "! Element usage
  "! $values {@link zif_aff_enho_v1.data:co_element_usage}
  TYPES ty_element_usage TYPE c LENGTH 4.

  CONSTANTS:
    "! <p class="shorttext">Element Usage</p>
    "! Element usage
    BEGIN OF co_element_usage,
      "! <p class="shorttext">Used Object</p>
      "! Used object
      used_object     TYPE ty_element_usage VALUE 'USEO',
      "! <p class="shorttext">Enhanced Object</p>
      "! Enhanced object
      enhanced_object TYPE ty_element_usage VALUE 'EXTO',
      "! <p class="shorttext">Migrated From</p>
      "! Migrated from
      migrated_from   TYPE ty_element_usage VALUE 'MIGR',
    END OF co_element_usage.

  TYPES:
    "! <p class="shorttext">A Referenced Object</p>
    "! A referenced object
    BEGIN OF ty_referenced_object,
      "! <p class="shorttext">Type of the Referenced Object</p>
      "! Type of the referenced object
      "! $required
      object_type      TYPE c LENGTH 4,
      "! <p class="shorttext">Name of the Referenced Object</p>
      "! Name of the referenced object
      "! $required
      object_name      TYPE c LENGTH 120,
      "! <p class="shorttext">Program ID of the Referenced Object</p>
      "! Program ID (R3TR or LIMU) of the referenced object
      "! $required
      program_id       TYPE c LENGTH 4,
      "! <p class="shorttext">Element Usage</p>
      "! Element usage of the referenced object
      "! $required
      element_usage    TYPE ty_element_usage,
      "! <p class="shorttext">Main Object Type</p>
      "! Main object type of the referenced object
      "! $required
      main_object_type TYPE  c LENGTH 4,
      "! <p class="shorttext">Main Object Name</p>
      "! Main object name of the referenced object
      "! $required
      main_object_name TYPE  c LENGTH 40,
    END OF ty_referenced_object,

    "! <p class="shorttext">Referenced Objects</p>
    "! Referenced objects of the enhancement implementation
    ty_referenced_objects TYPE STANDARD TABLE OF ty_referenced_object WITH DEFAULT KEY,

    "! <p class="shorttext">BAdI Implementation</p>
    "! Information about this BAdI implementation
    BEGIN OF ty_badi_impl,
      "! <p class="shorttext">Name</p>
      "! Name of the BAdI implementation
      "! $required
      name                      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description</p>
      "! Description of the BAdI implementation
      "! $required
      description               TYPE c LENGTH 255,
      "! <p class="shorttext">BAdI Definition</p>
      "! BAdI Definition of the BAdI implementation
      "! $required
      badi_definition           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Implementing Class</p>
      "! Implementing class of the BAdI implementation
      implementing_class        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Is Example Implementation</p>
      "! BAdI implementation is an example implementation
      "! $showAlways
      is_example_implementation TYPE abap_bool,
      "! <p class="shorttext">Is Default Implementation</p>
      "! BAdI implementation is the default implementation of the BAdI definition
      "! $showAlways
      is_default_implementation TYPE abap_bool,
      "! <p class="shorttext">BAdI Implementation is Active</p>
      "! BAdI implementation is active
      "! $showAlways
      is_active_implementation  TYPE abap_bool,
      "! <p class="shorttext">BAdI Implementation Customizing</p>
      "! Does the BAdI implementation support customizing
      "! $showAlways
      customizing               TYPE ty_customizing,
      "! <p class="shorttext">Filter Values</p>
      "! Filter values for this BAdI implementation
      "! $callbackClass {@link cl_seef_aff_enho_filter_st}
      filter_values             TYPE ty_or_combination_of_and,
    END OF ty_badi_impl,

    "! <p class="shorttext">BAdI Implementations of the ENHO</p>
    "! BAdI implementations of the ENHO
    ty_badi_impls TYPE STANDARD TABLE OF ty_badi_impl WITH DEFAULT KEY.


  TYPES:
    "! <p class="shorttext">ENHO Object Type</p>
    "! Object type ENHO
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_100,
      "! <p class="shorttext">Enhancement Spot Name</p>
      "! Enhancement Spot name
      "! $required
      enhancement_spot     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">BAdI Implementations of the ENHO</p>
      "! BAdI implementations of the ENHO
      badi_implementations TYPE ty_badi_impls,
      "! <p class="shorttext">Referenced Objects</p>
      "! Referenced objects of the enhancement implementation
      "! $required
      referenced_objects   TYPE ty_referenced_objects,
    END OF ty_main.

ENDINTERFACE.
