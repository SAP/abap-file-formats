interface zif_aff_aifp_v1
  public.

  types:
  "! $values { @link zif_aff_aifp_v1.data:co_check_scenario }
  "! $default { @link zif_aff_aifp_v1.data:co_check_scenario.simple }
    ty_check_scenario TYPE c LENGTH 10 .
  types:
  "! $values { @link zif_aff_aifp_v1.data:co_simple_field_check }
  "! $default { @link zif_aff_aifp_v1.data:co_simple_field_check.empty }
    ty_simple_field_check TYPE c LENGTH 1 .
  types:
  "! $values { @link zif_aff_aifp_v1.data:co_operator }
  "! $default { @link zif_aff_aifp_v1.data:co_operator.equal }
    ty_operator TYPE c LENGTH 2 .
  types:
  "! $values { @link zif_aff_aifp_v1.data:co_operator_db }
  "! $default { @link zif_aff_aifp_v1.data:co_operator_db.equal }
    ty_operator_db TYPE c LENGTH 2 .
  types:
  "! $values { @link zif_aff_aifp_v1.data:co_database_check_type }
  "! $default { @link zif_aff_aifp_v1.data:co_database_check_type.check_existence }
    ty_database_check_type TYPE c LENGTH 1 .
  types:
    "! <p class="shorttext">Success Message Detail</p>
    "! Success message detail
    BEGIN OF ty_success_message_detail,
      "! <p class="shorttext">Success Message Class</p>
      "! Success message class
      success_message_class      TYPE c LENGTH 20,
      "! <p class="shorttext">Success Message Number</p>
      "! Success message number
      success_message_number     TYPE c LENGTH 3,
      "! <p class="shorttext">Success Message Variable 1</p>
      "! Success message variable 1
      success_message_variable_1 TYPE c LENGTH 120,
      "! <p class="shorttext">Success Message Variable 2</p>
      "! Success message variable 2
      success_message_variable_2 TYPE c LENGTH 120,
      "! <p class="shorttext">Success Message Variable 3</p>
      "! Success message variable 3
      success_message_variable_3 TYPE c LENGTH 120,
      "! <p class="shorttext">Success Message Variable 4</p>
      "! Success message variable 4
      success_message_variable_4 TYPE c LENGTH 120,
    END OF ty_success_message_detail .
  types:
    "! <p class="shorttext">Field Check Detail</p>
    "! Field check detail
    BEGIN OF ty_field_check_detail,
      "! <p class="shorttext">Field Check</p>
      "! Field check
      field_check          TYPE ty_simple_field_check,
      "! <p class="shorttext">Field Check Operator</p>
      "! Field Check Operator
      field_check_operator TYPE ty_operator,
      "! <p class="shorttext">Field Check Pattern</p>
      "! Pattern for Field Check
      field_check_pattern  TYPE c LENGTH 60,
    END OF ty_field_check_detail .
  types:
    "! <p class="shorttext">Database Check Detail</p>
    "! Database check detail
    BEGIN OF ty_database_check_detail,
      "! <p class="shorttext">Table Name</p>
      "! Table name
      table_name              TYPE c LENGTH 45,
      "! <p class="shorttext">Where Condition for Select Statement</p>
      "! Where Condition for Select Statement
      where_condition         TYPE c LENGTH 200,
      "! <p class="shorttext">Database Check Type</p>
      "! Database Check Type
      database_check_type     TYPE ty_database_check_type,
      "! <p class="shorttext">Field Name for Comparison</p>
      "! Field Name for Comparison
      field_name              TYPE c LENGTH 45,
      "! <p class="shorttext">Database Check Operator</p>
      "! Database check operator
      database_check_operator TYPE ty_operator_db,
      "! <p class="shorttext">Database Check Pattern</p>
      "! Pattern for database check
      database_check_pattern  TYPE c LENGTH 60,
    END OF ty_database_check_detail .
  types:
    "! <p class="shorttext">Class Check Detail</p>
    "! Class check detail
    BEGIN OF ty_class_check_detail,
      "! <p class="shorttext">Check Class</p>
      "! Check class
      check_class TYPE c LENGTH 30,
    END OF ty_class_check_detail .
  types:
    "! <p class="shorttext">Single Check</p>
    "! Single check
    BEGIN OF ty_single_check,
      "! <p class="shorttext">Check Number</p>
      "! Check number
      "! $required
      check_number           TYPE c LENGTH 3,
      "! <p class="shorttext">Check Description</p>
      "! Check description
      check_description      TYPE c LENGTH 120,
      "! <p class="shorttext">Check Scenario</p>
      "! Check scenario
      check_scenario         TYPE ty_check_scenario,
      "! <p class="shorttext">Field Check Detail</p>
      "! Field check detail
      field_check_detail     TYPE ty_field_check_detail,
      "! <p class="shorttext">Database Check Detail</p>
      "! Database check detail
      database_check_detail  TYPE ty_database_check_detail,
      "! <p class="shorttext">Class Check Detail</p>
      "! Class check detail
      class_check_detail     TYPE ty_class_check_detail,
      "! <p class="shorttext">Success Message Detail</p>
      "! Success message detail
      success_message_detail TYPE ty_success_message_detail,
    END OF ty_single_check .
  types:
  "! <p class="shorttext">Single Checks</p>
  "! Single checks
    ty_single_checks TYPE STANDARD TABLE OF ty_single_check WITH DEFAULT KEY .
  types:
    "! <p class="shorttext">Check Message Detail</p>
    "! Check detail
    BEGIN OF ty_check_message_detail,
      "! <p class="shorttext">Error Message Class</p>
      "! Error message class
      error_message_class      TYPE c LENGTH 20,
      "! <p class="shorttext">Error Message Number</p>
      "! Error message number
      error_message_number     TYPE c LENGTH 3,
      "! <p class="shorttext">Error Message Variable 1</p>
      "! Error message variable 1
      error_message_variable_1 TYPE c LENGTH 120,
      "! <p class="shorttext">Error Message Variable 2</p>
      "! Error message variable 2
      error_message_variable_2 TYPE c LENGTH 120,
      "! <p class="shorttext">Error Message Variable 3</p>
      "! Error message variable 3
      error_message_variable_3 TYPE c LENGTH 120,
      "! <p class="shorttext">Error Message Variable 4</p>
      "! Error message variable 4
      error_message_variable_4 TYPE c LENGTH 120,
    END OF ty_check_message_detail .
  types:
    "! <p class="shorttext">Check Details</p>
    "! Check details
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Namespace</p>
      "! Namespace of the check
      "! $required
      namespace TYPE c LENGTH 15,
      "! <p class="shorttext">AIF Check</p>
      "! SAP Application Interface check
      "! $required
      aif_check TYPE c LENGTH 20,
    END OF ty_general_information .
  types:
    "! <p class="shorttext">Recipient</p>
    "! Recipient
    BEGIN OF ty_main,
      "! $required
      format_version          TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                  TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information     TYPE ty_general_information,
      "! <p class="shorttext">Message Detail</p>
      "! Message detail
      message_detail          TYPE ty_check_message_detail,
      "! <p class="shorttext">Single Check Assignment</p>
      "! Single check assignment
      "! $required
      single_check_assignment TYPE ty_single_checks,
    END OF ty_main .

  constants:
    BEGIN OF co_check_scenario,
      "! <p class="shorttext">Simple Field Check</p>
      "! Simple field check
      simple     TYPE ty_check_scenario VALUE 'SIMPLE',
      "! <p class="shorttext">Advanced Field Check</p>
      "! Advanced field check
      advanced   TYPE ty_check_scenario VALUE 'ADVANCED',
      "! <p class="shorttext">Simple Field Check and Database Check</p>
      "! Simple field check  and database check
      simpledb   TYPE ty_check_scenario VALUE 'SIMPLEDB',
      "! <p class="shorttext">Advanced Field Check and Database Check</p>
      "! Advanced field check and database check
      advanceddb TYPE ty_check_scenario VALUE 'ADVANCEDDB',
      "! <p class="shorttext">Database Check</p>
      "! Database check
      database   TYPE ty_check_scenario VALUE 'DATABASE',
      "! <p class="shorttext">Manual Implementation</p>
      "! Manual implementation
      implement  TYPE ty_check_scenario VALUE 'IMPLEMENT',
    END OF co_check_scenario .
  constants:
    BEGIN OF co_simple_field_check,
      "! <p class="shorttext">Empty</p>
      "! Empty
      empty              TYPE ty_simple_field_check VALUE 'I',
      "! <p class="shorttext">Not Empty</p>
      "! Not empty
      not_empty          TYPE ty_simple_field_check VALUE 'N',
      "! <p class="shorttext">Empty or '0'</p>
      "! Empty or '0'
      empty_or_zero      TYPE ty_simple_field_check VALUE '0',
      "! <p class="shorttext">Numeric (Integer)</p>
      "! Numeric (Integer)
      numeric_integer    TYPE ty_simple_field_check VALUE '1',
      "! <p class="shorttext">Numeric or Empty</p>
      "! Numeric or empty
      numeric_empty      TYPE ty_simple_field_check VALUE '2',
      "! <p class="shorttext">Numeric (Integer/Negative)</p>
      "! Numeric (Integer/Negative)
      numeric_negativ    TYPE ty_simple_field_check VALUE '3',
      "! <p class="shorttext">Numeric (Comma/Negative)</p>
      "! Numeric (Comma/Negative)
      numeric_comma      TYPE ty_simple_field_check VALUE '4',
      "! <p class="shorttext">Numeric (Dot/Negative)</p>
      "! Numeric (Dot/Negative)
      numeric_dot        TYPE ty_simple_field_check VALUE '5',
      "! <p class="shorttext">Only Characters A-Z</p>
      "! Only characters A-Z
      only_chars_capital TYPE ty_simple_field_check VALUE 'A',
      "! <p class="shorttext">Only Characters a-z</p>
      "! Only characters a-z
      only_chars_lower   TYPE ty_simple_field_check VALUE 'a',
      "! <p class="shorttext">Only Characters A-Z, a-z</p>
      "! Only characters A-Z, a-z
      only_chars         TYPE ty_simple_field_check VALUE 'Z',
      "! <p class="shorttext">Alphanumeric with special chars and German Umlauts</p>
      "! Alphanumeric with special chars and German Umlauts
      x                  TYPE ty_simple_field_check VALUE 'X',
    END OF co_simple_field_check .
  constants:
    BEGIN OF co_operator,
      "! <p class="shorttext">Equal</p>
      "! Equal
      equal                      TYPE ty_operator VALUE 'E',
      "! <p class="shorttext">Non Equal</p>
      "! Non equal
      non_equal                  TYPE ty_operator VALUE 'N',
      "! <p class="shorttext">Empty or '0'</p>
      "! Empty or '0'
      contains_pattern           TYPE ty_operator VALUE 'CP',
      "! <p class="shorttext">No Pattern</p>
      "! No pattern
      no_pattern                 TYPE ty_operator VALUE 'NP',
      "! <p class="shorttext">Contains Any Character</p>
      "! Contains any character
      contains_any_character     TYPE ty_operator VALUE 'CA',
      "! <p class="shorttext">Not Contains Any Character</p>
      "! Not contains any character
      not_contains_any_character TYPE ty_operator VALUE 'NA',
      "! <p class="shorttext">Matches (regular expression)</p>
      "! Matches (regular expression)
      matches                    TYPE ty_operator VALUE 'MT',
    END OF co_operator .
  constants:
    BEGIN OF co_operator_db,
      "! <p class="shorttext">Equal</p>
      "! Equal
      equal            TYPE ty_operator VALUE 'E',
      "! <p class="shorttext">Non Equal</p>
      "! Non equal
      non_equal        TYPE ty_operator VALUE 'N',
      "! <p class="shorttext">Empty or '0'</p>
      "! Empty or '0'
      contains_pattern TYPE ty_operator VALUE 'CP',
      "! <p class="shorttext">No Pattern</p>
      "! No pattern
      no_pattern       TYPE ty_operator VALUE 'NP',
    END OF co_operator_db .
  constants:
    BEGIN OF co_database_check_type,
      "! <p class="shorttext">Check Existence</p>
      "! Check Existence
      check_existence     TYPE ty_operator VALUE '1',
      "! <p class="shorttext">Check Non Existence</p>
      "! Check Non Existence
      check_non_existence TYPE ty_operator VALUE '2',
      "! <p class="shorttext">Compare</p>
      "! Compare
      compare             TYPE ty_operator VALUE '3',
    END OF co_database_check_type .
endinterface.
