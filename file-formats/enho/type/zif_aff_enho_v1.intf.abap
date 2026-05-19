INTERFACE zif_aff_enho_v1
  PUBLIC.

  "! <p class="shorttext">Filter Comparator</p>
  "! Filter comparator
  "! $values {@link zif_aff_enho_v1.data:co_comparator}
  "! $default {@link zif_aff_enho_v1.data:co_comparator.equal}
  TYPES ty_comparator TYPE c LENGTH 2.

  constants:
    "! <p class="shorttext">Filter Comparator</p>
    "! Filter comparator
    begin of co_comparator,
      "! <p class="shorttext">Equal</p>
      "! Equal: True if the value of operand1 matches the value of operand2.
      equal              type ty_comparator value '=',
      "! <p class="shorttext">Less Than</p>
      "! Less Than: True if the value of operand1 is less than the value of operand2.
      less_than          type ty_comparator value '<',
      "! <p class="shorttext">Greater Than</p>
      "! Greater Than: True if the value of operand1 is greater than the value of operand2.
      greater_than       type ty_comparator value '>',
      "! <p class="shorttext">Less Equal</p>
      "! Less Equal: True if the value of operand1 is less than or equal to the value of operand2.
      less_equal         type ty_comparator value '<=',
      "! <p class="shorttext">Greater Equal</p>
      "! Greater Equal: True if the value of operand1 is greater than or equal to the value of operand2.
      greater_equal      type ty_comparator value '>=',
      "! <p class="shorttext">Not Equal</p>
      "! Not Equal: True if the value of operand1 does not match the value of operand2.
      not_equal          type ty_comparator value '<>',
      "! <p class="shorttext">Covers Pattern</p>
      "! Covers Pattern: True, if the content of operand1 fits the pattern in operand2.
      "! It is not case-sensitive.
      covers_pattern     type ty_comparator value 'CP',
      "! <p class="shorttext">No Pattern</p>
      "! No Pattern: True, if a logical expression with CP is false, that is, if operand1 does not fit the pattern operand2.
      no_pattern         type ty_comparator value 'NP',
      "! <p class="shorttext">Contains String</p>
      "! Contains String: True, if the content of operand2 is contained in operand1. It is not case-sensitive and
      "! trailing blanks in the left operand are respected.
      contains_string    type ty_comparator value 'CS',
      "! <p class="shorttext">Contains No String</p>
      "! Contains No String: True, if a logical expression with CS is false, that is if operand1 does not contain the
      "! content of operand2.
      contains_no_string type ty_comparator value 'NS',
    end of co_comparator.

  "! <p class="shorttext">Filter Type</p>
  "! Filter type
  "! $values {@link zif_aff_enho_v1.data:co_filtertype}
  "! $default {@link zif_aff_enho_v1.data:co_filtertype.string}
  types ty_filtertype type c length 1.

  constants:
    "! <p class="shorttext">Filter Type</p>
    "! Filter type
    begin of co_filtertype,
      "! <p class="shorttext">Integer</p>
      "! Integer
      integer        type ty_filtertype value 'I',
      "! <p class="shorttext">Character-Like</p>
      "! Character-like
      character_like type ty_filtertype value 'C',
      "! <p class="shorttext">String</p>
      "! String
      string         type ty_filtertype value 'S',
      "! <p class="shorttext">Numeric</p>
      "! Numeric
      numeric        type ty_filtertype value 'N',
      "! <p class="shorttext">Packed</p>
      "! Packed
      packed         type ty_filtertype value 'P',
    end of co_filtertype.


  types:
    "! This structure contains all relevant data of one BADI implementation filter:
    "! It compares one filter-name (from the BADI definition) with one filter-value using one comparator.
    begin of ty_filter,
      "! <p class="shorttext">Filter Name</p>
      "! Filter name
      filtername type if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Filter Type</p>
      "! Filter type
      filtertype type ty_filtertype, " read only / ENHS
      "! <p class="shorttext">Comparator</p>
      "! Comparator
      comparator type ty_comparator,
      "! <p class="shorttext">Filter Value</p>
      "! Filter value
      value      type string,
    end of ty_filter.


  types tt_filters type standard table of ty_filter with default key.

  types:
    "! <p class="shorttext">Level 2</p>
    "! Level 2
    begin of ty_level_2,
      "! <p class="shorttext">Or</p>
      "! Or
      or     type tt_filters,
      "! <p class="shorttext">Filter</p>
      "! Filter
      filter type ty_filter,
    end of ty_level_2.

  types tt_level_2 type standard table of ty_level_2 with default key.

  types:
    "! <p class="shorttext">Level 1</p>
    "! Level 1
    begin of ty_level_1,
      "! <p class="shorttext">And</p>
      "! And
      and    type tt_level_2,
      "! <p class="shorttext">Filter</p>
      "! Filter
      filter type ty_filter,
    end of ty_level_1.

  types tt_level_1 type standard table of ty_level_1 with default key.

  types:
    "! <p class="shorttext">Level 0</p>
    "! Level 0
    begin of ty_level_0,
      "! <p class="shorttext">Or</p>
      "! Or
      or     type tt_level_1,
      "! <p class="shorttext">And</p>
      "! And
      and    type tt_level_2,
      "! <p class="shorttext">Filter</p>
      "! Filter
      filter type ty_filter,
    end of ty_level_0.

  "! <p class="shorttext">Customizing</p>
  "! Customizing
  "! $values {@link zif_aff_enho_v1.data:co_customizing}
  "! $default {@link zif_aff_enho_v1.data:co_customizing.not_supported}
  types ty_customizing type c length 1.

  constants:
    "! <p class="shorttext">Customizing</p>
    "! Customizing
    begin of co_customizing,
      "! <p class="shorttext">Customizing Not Supported</p>
      "! Customizing is not supported
      not_supported          type ty_customizing value 'X',
      "! <p class="shorttext">Customizing Supported</p>
      "! Customizing is supported
      supported              type ty_customizing value ' ',
      "! <p class="shorttext">Customizing Supported (No Transport)</p>
      "! Customizing is supported (without transport)
      supported_no_transport type ty_customizing value 'D',
    end of co_customizing.

  types:
    "! <p class="shorttext">BAdI Implementation</p>
    "! Information about this BAdI implementation
    begin of ty_badi_impl,
      "! <p class="shorttext">Name</p>
      "! Name of the BAdI implementation
      "! $required
      name                      type if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description</p>
      "! Description of the BAdI implementation
      "! $required
      description               type c length 255,
      "! <p class="shorttext">BAdI Definition</p>
      "! BAdI Definition of the BAdI implementation
      "! $required
      badi_definition           type if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Implementing Class</p>
      "! Implementing class of the BAdI implementation
      implementing_class        type if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Is Example Implementation</p>
      "! BAdI implementation is an example implementation
      "! $showAlways
      is_example_implementation type abap_bool,
      "! <p class="shorttext">Is Default Implementation</p>
      "! BAdI implementation is the default implementation of the BAdI definition
      "! $showAlways
      is_default_implementation type abap_bool,
      "! <p class="shorttext">BAdI Implementation is Active</p>
      "! BAdI implementation is active
      "! $showAlways
      is_active_implementation  type abap_bool,
      "! <p class="shorttext">BAdI Implementation Customizing</p>
      "! Does the BAdI implementation support customizing
      "! $showAlways
      customizing               type ty_customizing,
      "! <p class="shorttext">Filter Values</p>
      "! Filter values for this BAdI implementation
      filter_values             type ty_level_0,
    end of ty_badi_impl,

    "! <p class="shorttext">BAdI Implementations of the ENHO</p>
    "! BAdI implementations of the ENHO
    ty_badi_impls type standard table of ty_badi_impl with default key.


  "! <p class="shorttext">Element Usage</p>
  "! Element usage
  "! $values {@link zif_aff_enho_v1.data:co_element_usage}
  types ty_element_usage type c length 4.

  constants:
    "! <p class="shorttext">Element Usage</p>
    "! Element usage
    begin of co_element_usage,
      "! <p class="shorttext">Used Object</p>
      "! Used object
      used_object     type ty_element_usage value 'USEO',
      "! <p class="shorttext">Enhanced Object</p>
      "! Enhanced object
      enhanced_object type ty_element_usage value 'EXTO',
      "! <p class="shorttext">Migrated From</p>
      "! Migrated from
      migrated_from   type ty_element_usage value 'MIGR',
    end of co_element_usage.

  types:
    "! <p class="shorttext">A Referenced Object</p>
    "! A referenced object
    begin of ty_referenced_object,
      "! <p class="shorttext">Type of the Referenced Object</p>
      "! Type of the referenced object
      "! $required
      object_type      type c length 4,
      "! <p class="shorttext">Name of the Referenced Object</p>
      "! Name of the referenced object
      "! $required
      object_name      type c length 120,
      "! <p class="shorttext">Program ID of the Referenced Object</p>
      "! Program ID (R3TR or LIMU) of the referenced object
      "! $required
      program_id       type c length 4,
      "! <p class="shorttext">Element Usage</p>
      "! Element usage of the referenced object
      "! $required
      element_usage    type ty_element_usage,
      "! <p class="shorttext">Main Object Type</p>
      "! Main object type of the referenced object
      "! $required
      main_object_type type c length 4,
      "! <p class="shorttext">Main Object Name</p>
      "! Main object name of the referenced object
      "! $required
      main_object_name type c length 40,
    end of ty_referenced_object,

    "! <p class="shorttext">Referenced Objects</p>
    "! Referenced objects of the enhancement implementation
    ty_referenced_objects type standard table of ty_referenced_object with default key.


  types:
    "! <p class="shorttext">General Information</p>
    "! General Information
    begin of ty_general_information,
      "! <p class="shorttext">Enhancement Spot Name</p>
      "! Enhancement Spot name
      "! $required
      enhancement_spot type if_aff_types_v1=>ty_object_name_30,
    end of ty_general_information.


  types:
    "! <p class="shorttext">ENHO Object Type</p>
    "! Object type ENHO
    begin of ty_main,
      "! $required
      format_version       type if_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               type if_aff_types_v1=>ty_header_100,
      "! <p class="shorttext">General Information</p>
      "! General Information
      "! $required
      general_information  type ty_general_information,
      "! <p class="shorttext">BAdI Implementations of the ENHO</p>
      "! BAdI implementations of the ENHO
      badi_implementations type ty_badi_impls,
      "! <p class="shorttext">Referenced Objects</p>
      "! Referenced objects of the enhancement implementation
      "! $required
      referenced_objects   type ty_referenced_objects,
    end of ty_main.

endinterface.