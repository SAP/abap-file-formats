INTERFACE zif_aff_edcc_v1
  PUBLIC .
  "! <p class="shorttext">Country</p>
  "! Country
  TYPES ty_country TYPE c LENGTH 3.

  TYPES  ty_short_description TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">Tax Authority Message Type</p>
    "! Tax Authority Message type
    BEGIN OF ty_messages,
      "! <p class="shorttext">Message Type</p>
      "! Message type
      message_type             TYPE c LENGTH 20,
      "! <p class="shorttext">Message Type Description</p>
      "! Message type description
      message_type_description TYPE ty_short_description,
      "! <p class="shorttext">Tax Authority Document Type</p>
      "! Tax authority document type
      taxauth_documenttype     TYPE c LENGTH 20,
      original_language        TYPE zif_aff_types_v1=>ty_original_language,
    END OF ty_messages,
    "! <p class="shorttext">Tax Authority Message Types</p>
    "! Tax Authority Message types
    tt_messages TYPE SORTED TABLE OF ty_messages WITH UNIQUE KEY message_type.

  TYPES:
    "! <p class="shorttext">Additional Tax Authority Table</p>
    "! Additional tax authority table
    BEGIN OF ty_taxauth_table,
      "! <p class="shorttext">Table Name</p>
      "! Table name
      table_name TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_taxauth_table,
    "! <p class="shorttext">Additional Tax Authority Tables</p>
    "! Additional tax authority tables
    tt_taxauth_table TYPE SORTED TABLE OF ty_taxauth_table WITH UNIQUE KEY table_name.

  TYPES:
    "! <p class="shorttext">Position Number</p>
    "! position number
    ty_position_number  TYPE c LENGTH 2,
    "! <p class="shorttext">Result Process</p>
    "! Result process
    ty_result_process   TYPE c LENGTH 10,
    "! <p class="shorttext">Field Value</p>
    "! Field value
    ty_field_value      TYPE c LENGTH 40,
    "! <p class="shorttext">Sequence Number</p>
    "! Sequence number
    ty_sequence_number  TYPE c LENGTH 3,
    "! <p class="shorttext">Check Number</p>
    "! Check number
    ty_check_number     TYPE c LENGTH 5,
    ty_long_description TYPE c LENGTH 120.

  TYPES:
    "! <p class="shorttext">Existence Check</p>
    "! Assigned existence check
    BEGIN OF ty_existence_check,
      "! <p class="shorttext">Check Id</p>
      "! Check id
      check_id       TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Description</p>
      "! Check description
      description    TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      field_name     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Field Value</p>
      "! Field value
      field_value    TYPE ty_field_value,
      "! <p class="shorttext">Result Process</p>
      "! Result process
      result_process TYPE ty_result_process,
    END OF ty_existence_check.

  TYPES:
    "! <p class="shorttext">Status Check</p>
    "! status check
    BEGIN OF ty_status_check,
      "! <p class="shorttext">Check Id</p>
      "! Check id
      check_id           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Description</p>
      "! Check description
      description        TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Sequence Number</p>
      "! Sequence number
      sequence_number    TYPE ty_sequence_number,
      "! <p class="shorttext">Source Field Name 1</p>
      "! Source field name 1
      source_fieldname1  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field Value 1</p>
      "! Source field value 1
      source_fieldvalue1 TYPE ty_field_value,
      "! <p class="shorttext">Source Field Name 2</p>
      "! Source field name 2
      source_fieldname2  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field Value 2</p>
      "! Source field value 2
      source_fieldvalue2 TYPE ty_field_value,
      "! <p class="shorttext">Result Process</p>
      "! Result process
      result_process     TYPE ty_result_process,
    END OF ty_status_check,
    "! <p class="shorttext">Status Checks</p>
    "! Assigned status checks
    ty_status_checks TYPE SORTED TABLE OF ty_status_check WITH UNIQUE KEY check_id sequence_number.

  TYPES:
    "! <p class="shorttext">Mismatch Field Group</p>
    "! Comparison field group for mismatched fields
    ty_fieldgroup          TYPE c LENGTH 20,
    "! <p class="shorttext">Field Group Level</p>
    "! Level of comparison field group
    "! $values {@link zif_aff_edcc_v1.data:co_fieldgrouplevel}
    "! $default {@link zif_aff_edcc_v1.data:co_fieldgrouplevel.header}
    ty_fieldgroup_level    TYPE c LENGTH 1,
    ty_comparison_sequence TYPE c LENGTH 5,
    "! <p class="shorttext">Check Formula</p>
    "! Formula applied to do content check for the field group
    "! $values {@link zif_aff_edcc_v1.data:co_checkformula}
    "! $default {@link zif_aff_edcc_v1.data:co_checkformula.field}
    ty_checkformula        TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Check Formula</p>
    "! Formula applied to do content check for the field group
    BEGIN OF co_checkformula,
      "! <p class="shorttext">Field to Field Comparison</p>
      "! Field to field comparison
      field                      TYPE ty_checkformula VALUE '1',
      "! <p class="shorttext">Amount Comparison with Absolute Tolerance</p>
      "! Amount comparison with absolute tolerance
      field_with_abstolerance    TYPE ty_checkformula VALUE '2',
      "! <p class="shorttext">Amount Comparison without Absolute Tolerance</p>
      "! Amount comparison without absolute tolerance
      field_with_nonabstolerance TYPE ty_checkformula VALUE '3',
    END OF co_checkformula,
    "! <p class="shorttext">Field Group Level</p>
    "! Level of comparison field group
    BEGIN OF co_fieldgrouplevel,
      "! <p class="shorttext">Header</p>
      "! Header
      header TYPE ty_fieldgroup_level VALUE 'H',
      "! <p class="shorttext">Item</p>
      "! Item
      item   TYPE ty_fieldgroup_level VALUE 'I',
    END OF co_fieldgrouplevel.

  TYPES:
    "! <p class="shorttext">Fields Configuration</p>
    "! Configuration of field those would be compared
    BEGIN OF ty_comparison_field,
      "! <p class="shorttext">Representation Type</p>
      "! Representation type
      representation_type TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Field Name</p>
      "! Field name to be compared
      field_name          TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Comparison Sequence</p>
      "! Comparison sequence
      comparison_sequence TYPE ty_comparison_sequence,
    END OF ty_comparison_field,
    "! <p class="shorttext">Fields Configuration</p>
    "! Configuration of fields those would be compared
    ty_comparison_fields TYPE SORTED TABLE OF ty_comparison_field WITH UNIQUE KEY representation_type.

  TYPES:

    "! <p class="shorttext">Comparison Field Group</p>
    "! Comparison field group
    BEGIN OF ty_comparison_fieldgroup,
      "! <p class="shorttext">Mismatch Field Group</p>
      "! Comparison field group for mismatched fields
      field_group       TYPE ty_fieldgroup,
      "! <p class="shorttext">Description</p>
      "! Mismatch field group description
      description       TYPE ty_short_description,
      "! <p class="shorttext">Field Group Level</p>
      "! Level of comparison field group
      field_group_level TYPE ty_fieldgroup_level,
      "! <p class="shorttext">Check Formula</p>
      "! Formula applied to do content check for the field group
      check_formula     TYPE ty_checkformula,
      "! <p class="shorttext">Result Process</p>
      "! Result process
      result_process    TYPE ty_result_process,
      "! <p class="shorttext">Fields Configuration</p>
      "! Configuration of fields those would be compared
      comparison_field  TYPE ty_comparison_fields,
    END OF ty_comparison_fieldgroup,
    "! <p class="shorttext">Comparison Field Groups</p>
    "! Comparison field groups
    ty_comparison_fieldgroups TYPE SORTED TABLE OF ty_comparison_fieldgroup
      WITH UNIQUE KEY field_group.
  TYPES:
    "! <p class="shorttext">Content Check</p>
    "! Content check
    BEGIN OF ty_content_check,
      "! <p class="shorttext">Check Id</p>
      "! Check id
      check_id                      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Description</p>
      "! Check description
      description                   TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Check Number</p>
      "! Check number
      check_number                  TYPE ty_check_number,
      "! <p class="shorttext">Additional Data Source</p>
      "! Additional data source
      data_source                   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Additional Description</p>
      "! Additional check description
      additional_description        TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Comparison Field Groups</p>
      "! Comparison field groups
      content_comparison_fieldgroup TYPE ty_comparison_fieldgroups,
    END OF ty_content_check,

    "! <p class="shorttext">Content Checks</p>
    "! Assigned content checks
    ty_content_checks TYPE SORTED TABLE OF ty_content_check WITH UNIQUE KEY check_id check_number.

  TYPES:
    "! <p class="shorttext">Filter Operation</p>
    "! Operand to build the where condition
    "! $values {@link zif_aff_edcc_v1.data:co_filteroperation}
    "! $default {@link zif_aff_edcc_v1.data:co_filteroperation.and}
    ty_filter_operation     TYPE c LENGTH 3,
    "! <p class="shorttext">Comparison Operator</p>
    "! Comparison operator
    "! $values {@link zif_aff_edcc_v1.data:co_compareoperation}
    "! $default {@link zif_aff_edcc_v1.data:co_compareoperation.equal}
    ty_comparison_operator  TYPE c LENGTH 3,
    "! <p class="shorttext">Filter Field Value</p>
    "! Value used to build the where condition
    ty_filter_value         TYPE c LENGTH 30,
    "! <p class="shorttext">Expression Indicator</p>
    "! Expression indicator
    "! $values {@link zif_aff_edcc_v1.data:co_expression}
    "! $default {@link zif_aff_edcc_v1.data:co_expression.beginof}
    ty_expression_indicator TYPE c LENGTH 3,
    "! <p class="shorttext">Selection Filters on Check</p>
    "! Selection filters on check
    BEGIN OF ty_check_filter,
      "! <p class="shorttext">Sequence Number</p>
      "! Sequence number
      sequence_number      TYPE ty_sequence_number,
      "! <p class="shorttext">Filter Operation</p>
      "! Operand to build the where condition
      filter_operation     TYPE ty_filter_operation,
      "! <p class="shorttext">Filter Field</p>
      "! Field on which where condition would be applied
      filter_field         TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Comparison Operator</p>
      "! Comparison operator
      comparison_operator  TYPE ty_comparison_operator,
      "! <p class="shorttext">Filter Field Value</p>
      "! Value used to build the where condition
      filter_value         TYPE ty_filter_value,
      "! <p class="shorttext">Expression Indicator</p>
      "! Expression indicator
      expression_indicator TYPE ty_expression_indicator,
    END OF ty_check_filter,
    "! <p class="shorttext">Selection Filters on Check</p>
    "! Selection filters on check
    ty_check_filters TYPE SORTED TABLE OF ty_check_filter WITH UNIQUE KEY sequence_number.

  CONSTANTS:
    "! <p class="shorttext">Filter Operation</p>
    "! Operand to build the where condition
    BEGIN OF co_filteroperation,
      "! <p class="shorttext">And</p>
      "! And
      and TYPE ty_filter_operation VALUE 'AND',
      "! <p class="shorttext">Or</p>
      "! Or
      or  TYPE ty_filter_operation VALUE 'OR',
    END OF co_filteroperation,

    "! <p class="shorttext">Expression Indicator</p>
    "! Expression indicator
    BEGIN OF co_expression,
      "! <p class="shorttext">Begin of Expression</p>
      "! Begin of expression
      beginof TYPE ty_expression_indicator VALUE '/',
      "! <p class="shorttext">End of Expression</p>
      "! End of Eexpression
      endof   TYPE ty_expression_indicator VALUE '\',
    END OF co_expression,

    "! <p class="shorttext">Comparison Operator</p>
    "! Comparison operator
    BEGIN OF co_compareoperation,
      "! <p class="shorttext">Equal</p>
      "! Equal
      equal     TYPE ty_comparison_operator VALUE '=',
      "! <p class="shorttext">Not Equal</p>
      "! Not Equal
      not_equal TYPE ty_comparison_operator VALUE '<>',
    END OF co_compareoperation.

  TYPES:
    "! <p class="shorttext">Position Number</p>
    "! Position number
    ty_check_position_number TYPE c LENGTH 3,
    "! <p class="shorttext">Check Execution Sequence</p>
    "! Check execution sequence
    ty_execution_sequence    TYPE c LENGTH 3,
    "! <p class="shorttext">Check Execution Control</p>
    "! Check execution control
    "! $values {@link zif_aff_edcc_v1.data:co_execution_control}
    "! $default {@link zif_aff_edcc_v1.data:co_execution_control.proceed}
    ty_execution_control     TYPE c LENGTH 2,
    "! <p class="shorttext">Check Attribute</p>
    "! Check attribute
    BEGIN OF ty_check_attribute,
      "! <p class="shorttext">Check Id</p>
      "! Check id
      check_id           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Position Number</p>
      "! Position number
      position_number    TYPE ty_check_position_number,
      "! <p class="shorttext">Check Execution Sequence</p>
      "! Check execution sequence
      execution_sequence TYPE ty_execution_sequence,
      "! <p class="shorttext">Check Execution Control</p>
      "! Check execution control
      execution_control  TYPE ty_execution_control,
      "! <p class="shorttext">Selection Filters on Check</p>
      "! Selection filters on check
      check_filter       TYPE ty_check_filters,
    END OF ty_check_attribute,

    "! <p class="shorttext">Check Attributes</p>
    "! Check attributes
    ty_check_attributes TYPE SORTED TABLE OF ty_check_attribute WITH UNIQUE KEY check_id.

  CONSTANTS:
    "! <p class="shorttext">Check Execution Control</p>
    "! Check execution control
    BEGIN OF co_execution_control,
      "! <p class="shorttext">No Check</p>
      "! Proceed with check even when inconsistency is identified
      proceed    TYPE  ty_execution_control VALUE '00',
      "! <p class="shorttext">Proceed If No Inconsistency Identified From Previous Check</p>
      "! Proceed If No Inconsistency Identified From Previous Check
      no_proceed TYPE  ty_execution_control VALUE '01',
    END OF co_execution_control.

  TYPES:
    "! <p class="shorttext">Representation Type</p>
    "! Assigned representation type
    BEGIN OF ty_representation_type,
      "! <p class="shorttext">Assigned Representation Type</p>
      "! Assigned representation type
      representation_type TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description</p>
      "! Description
      description         TYPE zif_aff_types_v1=>ty_description_60,
    END OF ty_representation_type,
    "! <p class="shorttext">Representation Types</p>
    "! Assigned representation types
    ty_representation_types TYPE SORTED TABLE OF ty_representation_type WITH UNIQUE KEY
                              representation_type.

  TYPES:
    "! <p class="shorttext">Comparison Type</p>
    "! Comparison type
    BEGIN OF ty_comparison_type,
      "! <p class="shorttext">Comparison Type</p>
      "! Comparison type
      "! $required
      comparison_type      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Comparison Type Description</p>
      "! Description of the comparison type
      "! $required
      description          TYPE ty_long_description,
      "! <p class="shorttext">Position Number</p>
      "! position number
      "! $required
      position_number      TYPE ty_position_number,
      "! <p class="shorttext">Implementing Class</p>
      "! Implementing Class
      "! $required
      class_name           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Data Source</p>
      "! Data Source
      "! $required
      data_source          TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Existence Check</p>
      "! Assigned existence check
      "! $required
      existence_check      TYPE ty_existence_check,
      "! <p class="shorttext">Status Checks</p>
      "! Assigned status checks
      status_check         TYPE ty_status_checks,
      "! <p class="shorttext">Content Checks</p>
      "! Assigned content checks
      content_check        TYPE ty_content_checks,
      "! <p class="shorttext">Check Attributes</p>
      "! Check attributes
      "! $required
      check_attributes     TYPE ty_check_attributes,
      "! <p class="shorttext">Representation Types</p>
      "! Assigned representation types
      "! $required
      representation_types TYPE ty_representation_types,
    END OF ty_comparison_type,
    "! <p class="shorttext">Comparison Types</p>
    "! Define comparison types
    ty_comparison_types TYPE SORTED TABLE OF ty_comparison_type WITH UNIQUE KEY comparison_type.

  TYPES:
    "! <p class="shorttext">Consistency Scenario</p>
    "! Consistency scenario
    BEGIN OF ty_main,
      "! $required
      format_version           TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                   TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Country</p>
      "! Country
      country                  TYPE ty_country,
      "! <p class="shorttext">Tax Authority Message Types</p>
      "! Tax authority message types
      taxauth_messages         TYPE tt_messages,
      "! <p class="shorttext">Additional Tax Authority Tables</p>
      "! Additional tax authority tables
      taxauth_tables           TYPE tt_taxauth_table,
      "! <p class="shorttext">Comparison Types</p>
      "! Define comparison types
      comparison_types         TYPE ty_comparison_types,


    END OF ty_main .


ENDINTERFACE.
