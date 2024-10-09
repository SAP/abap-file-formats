INTERFACE zif_aff_edcc_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Description</p>
    "! Description
    ty_short_description TYPE c LENGTH 30.
  TYPES:
    "! <p class="shorttext">Tax Authority Message Type</p>
    "! Tax Authority Message type
    BEGIN OF ty_message,
      "! <p class="shorttext">Message Type</p>
      "! Message type
      message_type                TYPE c LENGTH 20,
      "! <p class="shorttext">Message Type Description</p>
      "! Message type description
      message_type_description    TYPE ty_short_description,
      "! <p class="shorttext">Tax Authority Document Type</p>
      "! Tax authority document type
      tax_authority_document_type TYPE c LENGTH 20,
    END OF ty_message.
  TYPES:
    "! <p class="shorttext">Tax Authority Message Types</p>
    "! Tax authority message types
    ty_messages TYPE SORTED TABLE OF ty_message WITH UNIQUE KEY message_type.
  TYPES:
    "! <p class="shorttext">Additional Tax Authority Table</p>
    "! Additional tax authority table
    BEGIN OF ty_tax_authority_table,
      "! <p class="shorttext">Table Name</p>
      "! Table name
      table_name TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_tax_authority_table.
  TYPES:
    "! <p class="shorttext">Additional Tax Authority Tables</p>
    "! Additional tax authority tables
    ty_tax_authority_tables TYPE SORTED TABLE OF ty_tax_authority_table WITH UNIQUE KEY table_name.
  TYPES:
    "! <p class="shorttext">Position Number</p>
    "! Position number
    ty_position_number  TYPE c LENGTH 2.
  TYPES:
    "! <p class="shorttext">Result Process</p>
    "! Result process
    ty_result_process   TYPE c LENGTH 10.
  TYPES:
    "! <p class="shorttext">Field Value</p>
    "! Field value
    ty_field_value      TYPE c LENGTH 40.
  TYPES:
    "! <p class="shorttext">Sequence Number</p>
    "! Sequence number
    ty_sequence_number  TYPE c LENGTH 3.
  TYPES:
    "! <p class="shorttext">Check Number</p>
    "! Check number
    ty_check_number     TYPE c LENGTH 5.
  TYPES:
    "! <p class="shorttext">Description</p>
    "! Description
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
    "! Status check
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
      source_field_name1  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field Value 1</p>
      "! Source field value 1
      source_field_value1 TYPE ty_field_value,
      "! <p class="shorttext">Source Field Name 2</p>
      "! Source field name 2
      source_field_name2  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field Value 2</p>
      "! Source field value 2
      source_field_value2 TYPE ty_field_value,
      "! <p class="shorttext">Result Process</p>
      "! Result process
      result_process     TYPE ty_result_process,
    END OF ty_status_check.
  TYPES:
    "! <p class="shorttext">Status Checks</p>
    "! Assigned status checks
    ty_status_checks TYPE SORTED TABLE OF ty_status_check WITH UNIQUE KEY check_id sequence_number.
  TYPES:
    "! <p class="shorttext">Mismatch Field Group</p>
    "! Comparison field group for mismatched fields
    ty_field_group          TYPE c LENGTH 20.
  TYPES:
    "! <p class="shorttext">Field Group Level</p>
    "! Level of comparison field group
    "! $values {@link zif_aff_edcc_v1.data:co_field_group_level}
    "! $default {@link zif_aff_edcc_v1.data:co_field_group_level.header}
    ty_field_group_level    TYPE c LENGTH 1.
  TYPES:
    ty_comparison_sequence TYPE c LENGTH 5.
  TYPES:
    "! <p class="shorttext">Check Formula</p>
    "! Formula applied to perform the content check on the field group
    "! $values {@link zif_aff_edcc_v1.data:co_check_formula}
    "! $default {@link zif_aff_edcc_v1.data:co_check_formula.field}
    ty_check_formula        TYPE c LENGTH 1.
  TYPES:
    "! <p class="shorttext">Comparison Field Name</p>
    "! Field Names whose values will be compared
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
    END OF ty_comparison_field.
  TYPES:
    "! <p class="shorttext">Comparison Field Name</p>
    "! Field Names whose values will be compared
    ty_comparison_fields TYPE SORTED TABLE OF ty_comparison_field WITH UNIQUE KEY representation_type.
  TYPES:
    "! <p class="shorttext">Comparison Field Group</p>
    "! Comparison field group
    BEGIN OF ty_comparison_field_group,
      "! <p class="shorttext">Mismatch Field Group</p>
      "! Comparison field group for mismatched fields
      field_group       TYPE ty_field_group,
      "! <p class="shorttext">Description</p>
      "! Mismatch field group description
      description       TYPE ty_short_description,
      "! <p class="shorttext">Field Group Level</p>
      "! Level of comparison field group
      field_group_level TYPE ty_field_group_level,
      "! <p class="shorttext">Check Formula</p>
      "! Formula applied to perform the content check on the field group
      check_formula     TYPE ty_check_formula,
      "! <p class="shorttext">Result Process</p>
      "! Result process
      result_process    TYPE ty_result_process,
      "! <p class="shorttext">Comparison Field Name</p>
      "! Field Names whose values will be compared
      comparison_field  TYPE ty_comparison_fields,
    END OF ty_comparison_field_group.
  TYPES:
    "! <p class="shorttext">Comparison Field Groups</p>
    "! Comparison field groups
    ty_comparison_field_groups TYPE SORTED TABLE OF ty_comparison_field_group
      WITH UNIQUE KEY field_group.
  TYPES:
    "! <p class="shorttext">Content Check</p>
    "! Content check
    BEGIN OF ty_content_check,
      "! <p class="shorttext">Check Id</p>
      "! Check id
      check_id                       TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Description</p>
      "! Check description
      description                    TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Check Number</p>
      "! Check number
      check_number                   TYPE ty_check_number,
      "! <p class="shorttext">Additional Data Source</p>
      "! Additional data source
      data_source                    TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Additional Description</p>
      "! Additional check description
      additional_description         TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Comparison Field Groups</p>
      "! Comparison field groups
      content_comparison_field_group TYPE ty_comparison_field_groups,
    END OF ty_content_check.
  TYPES:
    "! <p class="shorttext">Content Checks</p>
    "! Assigned content checks
    ty_content_checks TYPE SORTED TABLE OF ty_content_check WITH UNIQUE KEY check_id check_number.
  TYPES:
    "! <p class="shorttext">Filter Operation</p>
    "! Operand to build the where condition
    "! $values {@link zif_aff_edcc_v1.data:co_filter_operation}
    "! $default {@link zif_aff_edcc_v1.data:co_filter_operation.and}
    ty_filter_operation     TYPE c LENGTH 3.
  TYPES:
    "! <p class="shorttext">Comparison Operator</p>
    "! Comparison operator
    "! $values {@link zif_aff_edcc_v1.data:co_compare_operation}
    "! $default {@link zif_aff_edcc_v1.data:co_compare_operation.equal}
    ty_comparison_operator  TYPE c LENGTH 3.
  TYPES:
    "! <p class="shorttext">Filter Field Value</p>
    "! Value used to build the where condition
    ty_filter_value         TYPE c LENGTH 30.
  TYPES:
    "! <p class="shorttext">Expression Indicator</p>
    "! Expression indicator
    "! $values {@link zif_aff_edcc_v1.data:co_expression}
    "! $default {@link zif_aff_edcc_v1.data:co_expression.begin_of}
    ty_expression_indicator TYPE c LENGTH 3.
  TYPES:
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
    END OF ty_check_filter.
  TYPES:
    "! <p class="shorttext">Selection Filters on Check</p>
    "! Selection filters on check
    ty_check_filters TYPE SORTED TABLE OF ty_check_filter WITH UNIQUE KEY sequence_number.
  TYPES:
    "! <p class="shorttext">Position Number</p>
    "! Position number
    ty_check_position_number TYPE c LENGTH 3.
  TYPES:
    "! <p class="shorttext">Check Execution Sequence</p>
    "! Check execution sequence
    ty_execution_sequence    TYPE c LENGTH 3.
  TYPES:
    "! <p class="shorttext">Check Execution Control</p>
    "! Check execution control
    "! $values {@link zif_aff_edcc_v1.data:co_execution_control}
    "! $default {@link zif_aff_edcc_v1.data:co_execution_control.proceed}
    ty_execution_control     TYPE c LENGTH 2.
  TYPES:
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
    END OF ty_check_attribute.
  TYPES:
    "! <p class="shorttext">Check Attributes</p>
    "! Check attributes
    ty_check_attributes TYPE SORTED TABLE OF ty_check_attribute WITH UNIQUE KEY check_id.
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
    END OF ty_representation_type.
  TYPES:
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
      "! Position number
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
    END OF ty_comparison_type.
  TYPES:
    "! <p class="shorttext">Comparison Types</p>
    "! Define comparison types
    ty_comparison_types TYPE SORTED TABLE OF ty_comparison_type WITH UNIQUE KEY comparison_type.
  TYPES:
    "! <p class="shorttext">Relevance</p>
    "! Relevance
    "! $values {@link zif_aff_edcc_v1.data:co_relevance}
    "! $default {@link zif_aff_edcc_v1.data:co_relevance.unchanged}
    ty_relevance  TYPE c LENGTH 1.
  TYPES:
    "! <p class="shorttext">Event Name</p>
    "! Event name
    ty_event_name TYPE c LENGTH 25.
  TYPES:
    "! <p class="shorttext">Assigned Comparison</p>
    "! Assigned comparison
    BEGIN OF ty_assigned_comparison,
      "! <p class="shorttext">Comparison Type</p>
      "! Comparison type
      comparison_type TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Id</p>
      "! Check id
      check_id        TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_assigned_comparison.
  TYPES:
    "! <p class="shorttext">Assign Checks and Comparison Type</p>
    "! Assign Checks and Comparison Type
    ty_assigned_comparisons TYPE SORTED TABLE OF ty_assigned_comparison WITH UNIQUE KEY
    comparison_type check_id.
  TYPES:
    "! <p class="shorttext">Check Relevance</p>
    "! Define relevance of check
    BEGIN OF ty_check_relevance,
      "! <p class="shorttext">Comparison Type</p>
      "! Comparison type
      "! $required
      comparison_type TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Id</p>
      "! Check id
      "! $required
      check_id        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Relevance</p>
      "! Relevance
      relevance       TYPE ty_relevance,
    END OF ty_check_relevance.
  TYPES:
    "! <p class="shorttext">Check Relevance</p>
    "! Define relevance of checks
    ty_check_relevances TYPE SORTED TABLE OF ty_check_relevance WITH UNIQUE KEY
                          comparison_type check_id.
  TYPES:
    "! <p class="shorttext">Assign Event</p>
    "! Assign event to consistency scenario
    BEGIN OF ty_event,
      "! <p class="shorttext">Event Name</p>
      "! Event name
      event               TYPE ty_event_name,
      "! <p class="shorttext">Description</p>
      "! Description
      description         TYPE zif_aff_types_v1=>ty_description_100,
      "! <p class="shorttext">Assign Checks and Comparison Type</p>
      "! Assign Checks and Comparison Type
      assigned_comparison TYPE ty_assigned_comparisons,
      "! <p class="shorttext">Check Relevance</p>
      "! Define relevance of checks
      check_relevance     TYPE ty_check_relevances,
    END OF ty_event.
  TYPES:
    "! <p class="shorttext">Assign Events</p>
    "! Assign events to consistency scenario
    ty_events TYPE SORTED TABLE OF ty_event WITH UNIQUE KEY event.
  TYPES:
    "! <p class="shorttext">Representation Type</p>
    "! Assign representation type associated with consistency scenario
    BEGIN OF ty_relationship_attribute,
      "! <p class="shorttext">Representation Type</p>
      "! Representation type
      representation_type TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_relationship_attribute.
  TYPES:
    "! <p class="shorttext">Representation Types</p>
    "! Assign representation types associated with consistency scenario
    ty_relationship_attributes TYPE SORTED TABLE OF ty_relationship_attribute WITH UNIQUE KEY
    representation_type.
  TYPES:
    "! <p class="shorttext">eDocument Type Assignment</p>
    "! Assign eDocument types associated with consistency scenario
    BEGIN OF ty_edoc_type,
      "! <p class="shorttext">eDocument Type</p>
      "! eDocument Type
      edoc_type TYPE c LENGTH 10,
    END OF ty_edoc_type.
  TYPES:
    "! <p class="shorttext">eDocument Type Assignment</p>
    "! Assign eDocument types associated with consistency scenario
    ty_edoc_types TYPE SORTED TABLE OF ty_edoc_type WITH UNIQUE KEY edoc_type.
  TYPES:
    "! <p class="shorttext">Inconsistency Category</p>
    "! Inconsistency category
    ty_resultgroup TYPE c LENGTH 20.
  TYPES:
    "! <p class="shorttext">Result Process</p>
    "! Assign result process to the UI group
    BEGIN OF ty_results_process,
      result_process TYPE ty_result_process,
    END OF ty_results_process.
  TYPES:
    "! <p class="shorttext">Result Processes</p>
    "! Assign result process to the UI group
    ty_result_processes TYPE SORTED TABLE OF ty_results_process WITH UNIQUE KEY result_process.
  TYPES:
    "! <p class="shorttext">Inconsistency Category</p>
    "! Inconsistency category
    BEGIN OF ty_inconsistency_category,
      "! <p class="shorttext">Inconsistency Category</p>
      "! Inconsistency category
      result_ui_group  TYPE ty_resultgroup,
      "! <p class="shorttext">Country View Extension</p>
      "! Country view extension
      country_xtension TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Result Processes</p>
      "! Assign result process to the UI group
      result_process   TYPE ty_result_processes,
    END OF ty_inconsistency_category.
  TYPES:
    "! <p class="shorttext">Inconsistency Categories</p>
    "! Inconsistency categories
    ty_inconsistency_categories TYPE SORTED TABLE OF ty_inconsistency_category WITH UNIQUE KEY
                                  result_ui_group.
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
      country                  TYPE c LENGTH 3,
      "! <p class="shorttext">Tax Authority Message Types</p>
      "! Tax authority message types
      tax_authority_messages   TYPE ty_messages,
      "! <p class="shorttext">Additional Tax Authority Tables</p>
      "! Additional tax authority tables
      tax_authority_tables     TYPE ty_tax_authority_tables,
      "! <p class="shorttext">Comparison Types</p>
      "! Define comparison types
      comparison_types         TYPE ty_comparison_types,
      "! <p class="shorttext">Events Assignment</p>
      "! Assign events to consistency scenario
      events                   TYPE ty_events,
      "! <p class="shorttext">Representation Types</p>
      "! Assign representation types associated with consistency scenario
      relationship_attribute   TYPE ty_relationship_attributes,
      "! <p class="shorttext">eDocument Type Assignment</p>
      "! Assign eDocument types associated with consistency scenario
      edocument_types          TYPE ty_edoc_types,
      "! <p class="shorttext">Inconsistency Categories</p>
      "! Inconsistency categories
      inconsistency_categories TYPE ty_inconsistency_categories,
    END OF ty_main.

  CONSTANTS:
    "! <p class="shorttext">Check Formula</p>
    "! Formula applied to perform the content check on the field group
    BEGIN OF co_check_formula,
      "! <p class="shorttext">Field to Field Comparison</p>
      "! Field to field comparison
      field                      TYPE ty_check_formula VALUE '1',
      "! <p class="shorttext">Amount Comparison with Absolute Tolerance</p>
      "! Amount comparison with absolute tolerance
      field_with_abs_tolerance    TYPE ty_check_formula VALUE '2',
      "! <p class="shorttext">Amount Comparison without Absolute Tolerance</p>
      "! Amount comparison without absolute tolerance
      field_without_abs_tolerance TYPE ty_check_formula VALUE '3',
    END OF co_check_formula.
  CONSTANTS:
    "! <p class="shorttext">Field Group Level</p>
    "! Level of comparison field group
    BEGIN OF co_field_group_level,
      "! <p class="shorttext">Header</p>
      "! Header
      header TYPE ty_field_group_level VALUE 'H',
      "! <p class="shorttext">Item</p>
      "! Item
      item   TYPE ty_field_group_level VALUE 'I',
    END OF co_field_group_level.
  CONSTANTS:
    "! <p class="shorttext">Filter Operation</p>
    "! Operand to build the where condition
    BEGIN OF co_filter_operation,
      "! <p class="shorttext">And</p>
      "! And
      and TYPE ty_filter_operation VALUE 'AND',
      "! <p class="shorttext">Or</p>
      "! Or
      or  TYPE ty_filter_operation VALUE 'OR',
    END OF co_filter_operation.
  CONSTANTS:
    "! <p class="shorttext">Expression Indicator</p>
    "! Expression indicator
    BEGIN OF co_expression,
      "! <p class="shorttext">Begin of Expression</p>
      "! Begin of expression
      begin_of TYPE ty_expression_indicator VALUE '/',
      "! <p class="shorttext">End of Expression</p>
      "! End of Eexpression
      end_of   TYPE ty_expression_indicator VALUE '\',
    END OF co_expression.
  CONSTANTS:
    "! <p class="shorttext">Comparison Operator</p>
    "! Comparison operator
    BEGIN OF co_compare_operation,
      "! <p class="shorttext">Equal</p>
      "! Equal
      equal     TYPE ty_comparison_operator VALUE '=',
      "! <p class="shorttext">Not Equal</p>
      "! Not Equal
      not_equal TYPE ty_comparison_operator VALUE '<>',
    END OF co_compare_operation.
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
  CONSTANTS:
    "! <p class="shorttext">Relevance</p>
    "! Relevance
    BEGIN OF co_relevance,
      "! <p class="shorttext">Relevant</p>
      "! Relevant
      relevant     TYPE ty_relevance VALUE 'R',
      "! <p class="shorttext">Not Relevant</p>
      "! Not relevant
      not_relevant TYPE ty_relevance VALUE 'N',
      "! <p class="shorttext">Unchanged</p>
      "! Unchanged
      unchanged    TYPE ty_relevance VALUE 'U',
    END OF co_relevance.
ENDINTERFACE.
