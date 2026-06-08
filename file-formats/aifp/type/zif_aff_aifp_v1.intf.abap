INTERFACE zif_aff_aifp_v1
  PUBLIC.

  TYPES:
  "! $values { @link zif_aff_aifp_v1.data:co_check_scenario }
  "! $default { @link zif_aff_aifp_v1.data:co_check_scenario.simple_field_check }
    ty_check_scenario TYPE c LENGTH 10.
  TYPES:
  "! $values { @link zif_aff_aifp_v1.data:co_simple_check_type }
  "! $default { @link zif_aff_aifp_v1.data:co_simple_check_type.empty }
    ty_simple_check_type TYPE c LENGTH 1.
  TYPES:
  "! $values { @link zif_aff_aifp_v1.data:co_database_check_type }
  "! $default { @link zif_aff_aifp_v1.data:co_database_check_type.check_existence }
    ty_database_check_type TYPE c LENGTH 1.
  TYPES:
  "! $values { @link zif_aff_aifp_v1.data:co_field_type }
  "! $default { @link zif_aff_aifp_v1.data:co_field_type.pattern }
    ty_field_type TYPE c LENGTH 7.
  TYPES:
  "! $values { @link zif_aff_aifp_v1.data:co_variable_type }
  "! $default { @link zif_aff_aifp_v1.data:co_variable_type.defined_field }
    ty_variable_type TYPE c LENGTH 5.
  TYPES:
    "! <p class="shorttext">Variable List</p>
    "! Variable list
    BEGIN OF ty_variable,
      "! <p class="shorttext">Number</p>
      "! Number
      "! $minimum 1
      "! $maximum 4
      number TYPE i,
      "! <p class="shorttext">Type</p>
      "! Type
      type   TYPE ty_variable_type,
      "! <p class="shorttext">Field</p>
      "! Field
      field  TYPE string,
      "! <p class="shorttext">Value</p>
      "! Value
      value  TYPE string,
    END OF ty_variable.
  TYPES:
  "! <p class="shorttext">Variable Details</p>
  "! Variable details
    ty_variables TYPE STANDARD TABLE OF ty_variable WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">Check Message</p>
    "! Check Message
    BEGIN OF ty_message,
      "! <p class="shorttext">Message Class</p>
      "! Message class
      message_class        TYPE c LENGTH 20,
      "! <p class="shorttext">Message Number</p>
      "! Message number
      message_number       TYPE c LENGTH 3,
      "! <p class="shorttext">Message Variable Assignments</p>
      "! Message variable assignments
      variable_assignments TYPE ty_variables,
    END OF ty_message.
  TYPES:
    "! <p class="shorttext">Field Check</p>
    "! Field check
    BEGIN OF ty_field_check,
      "! <p class="shorttext">Check Type</p>
      "! Check type
      check_type TYPE ty_simple_check_type,
      "! <p class="shorttext">Operator</p>
      "! Operator for field check
      operator   TYPE zif_aff_types_v1=>ty_option,
      "! <p class="shorttext">Field Type</p>
      "! Field type
      field_type TYPE ty_field_type,
      "! <p class="shorttext">Field</p>
      "! Field
      field      TYPE c LENGTH 60,
      "! <p class="shorttext">Value</p>
      "! Value or pattern for Field Check
      value      TYPE c LENGTH 60,
    END OF ty_field_check.
  TYPES:
    "! <p class="shorttext">Database Check</p>
    "! Database check
    BEGIN OF ty_database_check,
      "! <p class="shorttext">Table</p>
      "! Table
      table           TYPE c LENGTH 45,
      "! <p class="shorttext">Where Condition for Select Statement</p>
      "! Where Condition for Select Statement
      where_condition TYPE c LENGTH 200,
      "! <p class="shorttext">Check Type</p>
      "! Check type
      check_type      TYPE ty_database_check_type,
      "! <p class="shorttext">Field Name for Comparison</p>
      "! Field Name for Comparison
      field_name      TYPE c LENGTH 45,
      "! <p class="shorttext">Operator</p>
      "! Operator for database check
      operator        TYPE zif_aff_types_v1=>ty_option,
      "! <p class="shorttext">Field Type</p>
      "! Field type
      field_type      TYPE ty_field_type,
      "! <p class="shorttext">Field</p>
      "! Field
      field           TYPE c LENGTH 60,
      "! <p class="shorttext">Value</p>
      "! Value or pattern for database check
      value           TYPE c LENGTH 60,
    END OF ty_database_check.
  TYPES:
    "! <p class="shorttext">Custom Implementation</p>
    "! Custom implementation
    BEGIN OF ty_custom_implementation,
      "! <p class="shorttext">Class</p>
      "! Class name for check
      class TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_custom_implementation.

  TYPES:
    "! <p class="shorttext">Single Check</p>
    "! Single check
    BEGIN OF ty_single_check,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description           TYPE c LENGTH 120,
      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      id                    TYPE n LENGTH 3,
      "! <p class="shorttext">Scenario</p>
      "! Scenario
      scenario              TYPE ty_check_scenario,
      "! <p class="shorttext">Field Check</p>
      "! Field check
      field_check           TYPE ty_field_check,
      "! <p class="shorttext">Database Check</p>
      "! Database check
      database_check        TYPE ty_database_check,
      "! <p class="shorttext">Custom Implementation</p>
      "! Custom implementation
      custom_implementation TYPE ty_custom_implementation,
      "! <p class="shorttext">Success Message</p>
      "! Success message
      success_message       TYPE ty_message,
    END OF ty_single_check.
  TYPES:
  "! <p class="shorttext">Check Details</p>
  "! Check details
    ty_single_checks TYPE STANDARD TABLE OF ty_single_check WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Namespace</p>
      "! Namespace of the check
      "! $required
      namespace TYPE c LENGTH 15,
      "! <p class="shorttext">AIF Check</p>
      "! SAP Application Interface check
      "! $required
      aif_check TYPE c LENGTH 20,
    END OF ty_general_information.
  TYPES:
    "! <p class="shorttext">Check</p>
    "! Check
    BEGIN OF ty_main,
      "! $required
      format_version           TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                   TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information      TYPE ty_general_information,
      "! <p class="shorttext">Error Message</p>
      "! Error message
      error_message            TYPE ty_message,
      "! <p class="shorttext">Single Check Assignments</p>
      "! Single check assignments
      "! $required
      single_check_assignments TYPE ty_single_checks,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_check_scenario,
      "! <p class="shorttext">Simple Field Check</p>
      "! Simple field check
      simple_field_check          TYPE ty_check_scenario VALUE 'SMPL',
      "! <p class="shorttext">Advanced Field Check</p>
      "! Advanced field check
      advanced_field_check        TYPE ty_check_scenario VALUE 'ADVD',
      "! <p class="shorttext">Simple Field Check and Database Check</p>
      "! Simple field check and database check
      simple_field_and_db_check   TYPE ty_check_scenario VALUE 'SMDB',
      "! <p class="shorttext">Advanced Field Check and Database Check</p>
      "! Advanced field check and database check
      advanced_field_and_db_check TYPE ty_check_scenario VALUE 'ADDB',
      "! <p class="shorttext">Database Check</p>
      "! Database check
      database_check              TYPE ty_check_scenario VALUE 'DBCK',
      "! <p class="shorttext">Custom Implementation</p>
      "! Custom implementation
      custom_implementation       TYPE ty_check_scenario VALUE 'IMPL',
    END OF co_check_scenario.
  CONSTANTS:
    BEGIN OF co_simple_check_type,
      "! <p class="shorttext">Empty</p>
      "! Empty
      empty                       TYPE ty_simple_check_type VALUE 'I',
      "! <p class="shorttext">Not Empty</p>
      "! Not empty
      not_empty                   TYPE ty_simple_check_type VALUE 'N',
      "! <p class="shorttext">Empty or '0'</p>
      "! Empty or '0'
      empty_or_zero               TYPE ty_simple_check_type VALUE '0',
      "! <p class="shorttext">Numeric (Integer)</p>
      "! Numeric (Integer)
      numeric_integer             TYPE ty_simple_check_type VALUE '1',
      "! <p class="shorttext">Numeric or Empty</p>
      "! Numeric or empty
      numeric_empty               TYPE ty_simple_check_type VALUE '2',
      "! <p class="shorttext">Numeric (Integer/Negative)</p>
      "! Numeric (Integer/Negative)
      numeric_negative            TYPE ty_simple_check_type VALUE '3',
      "! <p class="shorttext">Numeric (Comma/Negative)</p>
      "! Numeric (Comma/Negative)
      numeric_comma               TYPE ty_simple_check_type VALUE '4',
      "! <p class="shorttext">Numeric (Dot/Negative)</p>
      "! Numeric (Dot/Negative)
      numeric_dot                 TYPE ty_simple_check_type VALUE '5',
      "! <p class="shorttext">Only Characters A-Z</p>
      "! Only characters A-Z
      only_chars_capital          TYPE ty_simple_check_type VALUE 'A',
      "! <p class="shorttext">Only Characters a-z</p>
      "! Only characters a-z
      only_chars_lower            TYPE ty_simple_check_type VALUE 'a',
      "! <p class="shorttext">Only Characters A-Z, a-z</p>
      "! Only characters A-Z, a-z
      only_chars                  TYPE ty_simple_check_type VALUE 'Z',
      "! <p class="shorttext">Alphanumeric with Special Chars and German Umlauts</p>
      "! Alphanumeric with special chars and German umlauts
      alphanumeric_special_umlaut TYPE ty_simple_check_type VALUE 'X',
    END OF co_simple_check_type.
  CONSTANTS:
    BEGIN OF co_database_check_type,
      "! <p class="shorttext">Check Existence</p>
      "! Check existence
      check_existence     TYPE ty_database_check_type VALUE '1',
      "! <p class="shorttext">Check Non-Existence</p>
      "! Check non-existence
      check_non_existence TYPE ty_database_check_type VALUE '2',
      "! <p class="shorttext">Compare</p>
      "! Compare
      compare             TYPE ty_database_check_type VALUE '3',
    END OF co_database_check_type.
  CONSTANTS:
    BEGIN OF co_field_type,
      "! <p class="shorttext">Defined Field</p>
      "! Defined field in the check assignment
      defined_field TYPE ty_field_type VALUE 'DEF_FLD',
      "! <p class="shorttext">Pattern</p>
      "! Pattern
      pattern       TYPE ty_field_type VALUE 'STRING',
      "! <p class="shorttext">System Field</p>
      "! System field
      system_field  TYPE ty_field_type VALUE 'SYS_FLD',
    END OF co_field_type.
  CONSTANTS:
    BEGIN OF co_variable_type,
*      "! <p class="shorttext">Source Structure</p>
*      "! Source structure
*      source_structure        TYPE ty_variable_type VALUE 'SRC_S',
*      "! <p class="shorttext">Destination Structure</p>
*      "! Destination structure
*      destination_structure   TYPE ty_variable_type VALUE 'DST_S',
      "! <p class="shorttext">Constant</p>
      "! Constant value
      constant                TYPE ty_variable_type VALUE 'CONST',
      "! <p class="shorttext">System Field</p>
      "! System field
      system_field            TYPE ty_variable_type VALUE 'SYSTF',
      "! <p class="shorttext">Defined Field</p>
      "! Defined field in the check assignment
      defined_field           TYPE ty_variable_type VALUE 'D_FLD',
    END OF co_variable_type.
ENDINTERFACE.
