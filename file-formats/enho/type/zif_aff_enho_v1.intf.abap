INTERFACE zif_aff_enho_v1
  PUBLIC.

  "! <p class="shorttext">Kind</p>
  "! Kind of enhancement implementation
  "! $values {@link zif_aff_enho_v1.data:co_kind}
  TYPES ty_kind TYPE c LENGTH 9.

  CONSTANTS:
    "! <p class="shorttext">Kind</p>
    "! Kind of enhancement implementation
    BEGIN OF co_kind,
      "! <p class="shorttext">BAdI Implementation</p>
      "! Enhancement implementation containing BAdI implementations
      badi_implementation TYPE ty_kind VALUE 'BADI_IMPL',
      "! <p class="shorttext">Source Code Plug-In</p>
      "! Enhancement implementation containing source code plug-ins
      source_code_plugin  TYPE ty_kind VALUE 'HOOK_IMPL',
    END OF co_kind.

  "! <p class="shorttext">Enhancement Mode</p>
  "! Static or dynamic enhancement mode
  "! $values {@link zif_aff_enho_v1.data:co_enhancement_mode}
  TYPES ty_enhancement_mode TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Enhancement Mode</p>
    "! Static or dynamic enhancement mode
    BEGIN OF co_enhancement_mode,
      "! <p class="shorttext">Static</p>
      "! Static enhancement point or section
      static  TYPE ty_enhancement_mode VALUE 'S',
      "! <p class="shorttext">Dynamic</p>
      "! Dynamic enhancement point or section
      dynamic TYPE ty_enhancement_mode VALUE 'D',
    END OF co_enhancement_mode.

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
  "! $default {@link zif_aff_enho_v1.data:co_comparator.not_specified}
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
      "! <p class="shorttext">Conforms to Pattern</p>
      "! True, if the content of operand1 matches the pattern in operand2.
      "! Wildcard characters can be used to form the operand2 pattern, where * represents any character string,
      "! including an empty string, and + represents any character. It is not case-sensitive. Trailing blanks in
      "! the left operand are respected.
      "! $enumValue 'CP'
      conforms_to_pattern         TYPE ty_comparator VALUE 'CP',
      "! <p class="shorttext">Does Not Conform to Pattern</p>
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
      "! <p class="shorttext">Not Specified</p>
      "! Not specified: used in case of range filter
      not_specified               TYPE ty_comparator VALUE 'XX',
    END OF co_comparator.

  TYPES:
    "! <p class="shorttext">Range Filter</p>
    "! Range filter
    BEGIN OF ty_range_filter,
      "! <p class="shorttext">Left Comparator</p>
      "! Left comparator
      "! $required
      left_comparator  TYPE ty_range_filter_comparator,
      "! <p class="shorttext">Left Filter Value</p>
      "! Left filter value
      "! $required
      left_value       TYPE string,
      "! <p class="shorttext">Right Comparator</p>
      "! Right comparator
      "! $required
      right_comparator TYPE ty_range_filter_comparator,
      "! <p class="shorttext">Right Filter Value</p>
      "! Right filter value
      "! $required
      right_value      TYPE string,
    END OF ty_range_filter.

  TYPES:
    "! <p class="shorttext">Filter</p>
    "! Filter
    BEGIN OF ty_filter,
      "! <p class="shorttext">Name</p>
      "! Filter name
      "! $required
      name       TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Comparator</p>
      "! Filter comparator
      comparator TYPE ty_comparator,
      "! <p class="shorttext">Filter Value</p>
      "! Filter value
      value      TYPE string,
      "! <p class="shorttext">Range</p>
      "! Range
      range      TYPE ty_range_filter,
    END OF ty_filter.

  TYPES:
    "! <p class="shorttext">Or</p>
    "! Or
    BEGIN OF ty_inner_or,
      "! <p class="shorttext">Filter</p>
      "! Filter
      filter TYPE ty_filter,
    END OF ty_inner_or.

  TYPES:
    "! <p class="shorttext">And</p>
    "! And
    BEGIN OF ty_and,
      "! <p class="shorttext">Or</p>
      "! Or
      or     TYPE STANDARD TABLE OF ty_inner_or WITH DEFAULT KEY,
      "! <p class="shorttext">Filter</p>
      "! Filter
      filter TYPE ty_filter,
    END OF ty_and.

  TYPES:
    "! <p class="shorttext">Or</p>
    "! Or
    BEGIN OF ty_outer_or,
      "! <p class="shorttext">And</p>
      "! And
      and    TYPE STANDARD TABLE OF ty_and WITH DEFAULT KEY,
      "! <p class="shorttext">Or</p>
      "! Or
      or     TYPE STANDARD TABLE OF ty_inner_or WITH DEFAULT KEY,
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
    "! BAdI implementation
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
      "! BAdI definition
      "! $required
      badi_definition           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Implementing Class</p>
      "! Implementing class
      "! $required
      implementing_class        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Is Example Implementation</p>
      "! BAdI implementation is an example implementation
      is_example_implementation TYPE abap_bool,
      "! <p class="shorttext">Is Default Implementation</p>
      "! Is the default implementation of the BAdI definition
      "! $showAlways
      is_default_implementation TYPE abap_bool,
      "! <p class="shorttext">BAdI Implementation Is Active</p>
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
    "! Information shared by all enhancement implementation kinds
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Kind</p>
      "! Kind of enhancement implementation
      "! $required
      kind TYPE ty_kind,
    END OF ty_general_information,

    "! <p class="shorttext">BAdI Information</p>
    "! Information shared by the BAdI implementations
    BEGIN OF ty_badi_information,
      "! <p class="shorttext">Enhancement Spot</p>
      "! Enhancement Spot containing the BAdI definitions
      "! $required
      enhancement_spot TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_badi_information,

    "! <p class="shorttext">Original Object</p>
    "! Enhanced repository object and its program context
    BEGIN OF ty_original_object,
      "! <p class="shorttext">Program ID</p>
      "! Program ID of the enhanced repository object
      "! $required
      program_id       TYPE c LENGTH 4,
      "! <p class="shorttext">Object Type</p>
      "! Type of the enhanced repository object
      "! $required
      object_type      TYPE c LENGTH 4,
      "! <p class="shorttext">Object Name</p>
      "! Name of the enhanced repository object
      "! $required
      object_name      TYPE c LENGTH 120,
      "! <p class="shorttext">Main Object Type</p>
      "! Type of the main object; defaults to object type when omitted
      main_object_type TYPE c LENGTH 4,
      "! <p class="shorttext">Main Object Name</p>
      "! Name of the main object; defaults to object name when omitted
      main_object_name TYPE zif_aff_types_v1=>ty_object_name_40,
      "! <p class="shorttext">Program Name</p>
      "! Program context of the enhanced object
      "! $required
      program_name     TYPE zif_aff_types_v1=>ty_object_name_40,
    END OF ty_original_object,

    "! <p class="shorttext">Source Code Plug-In Information</p>
    "! Information shared by the source code plug-ins
    BEGIN OF ty_source_code_plugin_info,
      "! <p class="shorttext">Original Object</p>
      "! Enhanced repository object and its program context
      "! $required
      original_object TYPE ty_original_object,
      "! <p class="shorttext">Include Bound</p>
      "! Enhancement implementation is bound to an include
      "! $showAlways
      include_bound   TYPE abap_bool,
    END OF ty_source_code_plugin_info,

    "! <p class="shorttext">Source Code Plug-In</p>
    "! Attachment metadata for one enhancement block in the ABAP file
    BEGIN OF ty_source_code_plugin,
      "! <p class="shorttext">Enhancement Number</p>
      "! File-local association key matching the ENHANCEMENT statement in the ABAP file
      "! $required
      "! $minimum 1
      enhancement_number TYPE i,
      "! <p class="shorttext">Full Name</p>
      "! Backend identifier of the enhancement option
      "! $required
      full_name          TYPE string,
      "! <p class="shorttext">Enhancement Mode</p>
      "! Static or dynamic enhancement mode
      "! $required
      enhancement_mode   TYPE ty_enhancement_mode,
      "! <p class="shorttext">Enhancement Spot</p>
      "! Enhancement Spot of an explicit enhancement option, if applicable
      enhancement_spot   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Overwrite</p>
      "! Overwrite flag of the hook implementation
      "! $showAlways
      overwrite          TYPE abap_bool,
      "! <p class="shorttext">Parent Full Name</p>
      "! Backend identifier of the parent enhancement option, if applicable
      parent_full_name   TYPE string,
    END OF ty_source_code_plugin,

    "! <p class="shorttext">Source Code Plug-Ins</p>
    "! Source code plug-ins ordered by their enhancement numbers
    ty_source_code_plugins TYPE SORTED TABLE OF ty_source_code_plugin WITH UNIQUE KEY enhancement_number.

  TYPES:
    "! <p class="shorttext">ENHO</p>
    "! Object type ENHO
    BEGIN OF ty_main,
      "! $required
      format_version                 TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                         TYPE zif_aff_types_v1=>ty_header_100,
      "! <p class="shorttext">General Information</p>
      "! Information shared by all enhancement implementation kinds
      "! $required
      general_information            TYPE ty_general_information,
      "! <p class="shorttext">BAdI Information</p>
      "! Information shared by the BAdI implementations
      "! $availableWhen {@link zif_aff_enho_v1.data:ty_general_information.kind} = {@link zif_aff_enho_v1.data:co_kind.badi_implementation}
      "! $requiredWhen {@link zif_aff_enho_v1.data:ty_general_information.kind} = {@link zif_aff_enho_v1.data:co_kind.badi_implementation}
      badi_information               TYPE ty_badi_information,
      "! <p class="shorttext">BAdI Implementations</p>
      "! BAdI implementations
      "! $availableWhen {@link zif_aff_enho_v1.data:ty_general_information.kind} = {@link zif_aff_enho_v1.data:co_kind.badi_implementation}
      badi_implementations           TYPE ty_badi_implementations,
      "! <p class="shorttext">Source Code Plug-In Information</p>
      "! Information shared by the source code plug-ins
      "! $availableWhen {@link zif_aff_enho_v1.data:ty_general_information.kind} = {@link zif_aff_enho_v1.data:co_kind.source_code_plugin}
      "! $requiredWhen {@link zif_aff_enho_v1.data:ty_general_information.kind} = {@link zif_aff_enho_v1.data:co_kind.source_code_plugin}
      source_code_plugin_information TYPE ty_source_code_plugin_info,
      "! <p class="shorttext">Source Code Plug-Ins</p>
      "! Optional attachment metadata; an enhancement implementation can have no plug-ins
      "! $availableWhen {@link zif_aff_enho_v1.data:ty_general_information.kind} = {@link zif_aff_enho_v1.data:co_kind.source_code_plugin}
      source_code_plugins            TYPE ty_source_code_plugins,
    END OF ty_main.

ENDINTERFACE.
