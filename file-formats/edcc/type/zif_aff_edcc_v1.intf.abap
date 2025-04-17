INTERFACE zif_aff_edcc_v1
  PUBLIC.


  "! <p class="shorttext">Sequence Number</p>
  "! Sequence number
  TYPES ty_sequence_number   TYPE c LENGTH 3.
  "! <p class="shorttext">Description</p>
  "! Description
  TYPES ty_short_description TYPE c LENGTH 30.
  TYPES:
    "! <p class="shorttext">Tax Authority Message Type</p>
    "! Tax authority message type
    BEGIN OF ty_message_type,
      "! <p class="shorttext">Name</p>
      "! Message type
      "! $required
      name                        TYPE c LENGTH 20,
      "! <p class="shorttext">Tax Authority Document Type</p>
      "! Tax authority document type
      "! $required
      tax_authority_document_type TYPE c LENGTH 20,
    END OF ty_message_type.
  "! <p class="shorttext">Tax Authority Message Types</p>
  "! Tax authority message types
  TYPES ty_message_types TYPE SORTED TABLE OF ty_message_type WITH UNIQUE KEY name.
  TYPES:
    "! <p class="shorttext">Additional Tax Authority Table</p>
    "! Additional tax authority table
    BEGIN OF ty_tax_authority_table,
      "! <p class="shorttext">Name</p>
      "! Table name
      "! $required
      name TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_tax_authority_table.
  "! <p class="shorttext">Additional Tax Authority Tables</p>
  "! Additional tax authority tables
  TYPES ty_tax_authority_tables TYPE SORTED TABLE OF ty_tax_authority_table WITH UNIQUE KEY name.
  "! <p class="shorttext">Position Number</p>
  "! Position number
  TYPES ty_position_number      TYPE n LENGTH 2.
  "! <p class="shorttext">Result Process</p>
  "! Result process
  TYPES ty_result_process       TYPE c LENGTH 10.
  "! <p class="shorttext">Field Value</p>
  "! Field value
  TYPES ty_field_value          TYPE c LENGTH 40.
  "! <p class="shorttext">Check Number</p>
  "! Check number
  TYPES ty_check_number         TYPE n LENGTH 5.
  "! <p class="shorttext">Description</p>
  "! Description
  TYPES ty_long_description     TYPE c LENGTH 120.
  TYPES:
    "! <p class="shorttext">Existence Check</p>
    "! Assigned existence check
    BEGIN OF ty_existence_check,
      "! <p class="shorttext">Check ID</p>
      "! Check id
      "! $required
      check_id       TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      "! $required
      field_name     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Field Value</p>
      "! Field value
      "! $required
      field_value    TYPE ty_field_value,
      "! <p class="shorttext">Result Process</p>
      "! Result process
      "! $required
      result_process TYPE ty_result_process,
    END OF ty_existence_check.
  TYPES:
    "! <p class="shorttext">Status Check</p>
    "! Status check
    BEGIN OF ty_status_check,
      "! <p class="shorttext">Check ID</p>
      "! Check id
      "! $required
      check_id             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Sequence Number</p>
      "! Sequence number
      "! $required
      sequence_number      TYPE ty_sequence_number,
      "! <p class="shorttext">Source Field Name 1</p>
      "! Source field name 1
      "! $required
      source_field_name_1  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field Value 1</p>
      "! Source field value 1
      "! $required
      source_field_value_1 TYPE ty_field_value,
      "! <p class="shorttext">Source Field Name 2</p>
      "! Source field name 2
      "! $required
      source_field_name_2  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field Value 2</p>
      "! Source field value 2
      "! $required
      source_field_value_2 TYPE ty_field_value,
      "! <p class="shorttext">Result Process</p>
      "! Result process
      "! $required
      result_process       TYPE ty_result_process,
    END OF ty_status_check.
  "! <p class="shorttext">Status Checks</p>
  "! Assigned status checks
  TYPES ty_status_checks        TYPE SORTED TABLE OF ty_status_check WITH UNIQUE KEY check_id sequence_number.
  "! <p class="shorttext">Mismatch Field Group</p>
  "! Comparison field group for mismatched fields
  TYPES ty_mismatch_field_group TYPE c LENGTH 20.
  "! <p class="shorttext">Level</p>
  "! Level of comparison field group
  "! $values {@link zif_aff_edcc_v1.data:co_field_group_level}
  "! $default {@link zif_aff_edcc_v1.data:co_field_group_level.header}
  TYPES ty_level                TYPE c LENGTH 1.
  TYPES ty_comparison_sequence  TYPE c LENGTH 5.
  "! <p class="shorttext">Check Formula</p>
  "! Formula applied to perform the content check on the field group
  "! $values {@link zif_aff_edcc_v1.data:co_check_formula}
  "! $default {@link zif_aff_edcc_v1.data:co_check_formula.field}
  TYPES ty_check_formula        TYPE c LENGTH 1.
  TYPES:
    "! <p class="shorttext">Comparison Field Name</p>
    "! Field Names whose values will be compared
    BEGIN OF ty_comparison_field,
      "! <p class="shorttext">Representation Type</p>
      "! Representation type
      "! $required
      representation_type TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Field Name</p>
      "! Field name to be compared
      "! $required
      field_name          TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Comparison Sequence</p>
      "! Comparison sequence
      "! $required
      comparison_sequence TYPE ty_comparison_sequence,
    END OF ty_comparison_field.
  "! <p class="shorttext">Comparison Fields</p>
  "! Field Names whose values will be compared
  TYPES ty_comparison_fields TYPE SORTED TABLE OF ty_comparison_field WITH UNIQUE KEY representation_type.
  TYPES:
    "! <p class="shorttext">Comparison Field Group</p>
    "! Comparison field group
    BEGIN OF ty_comparison_field_group,
      "! <p class="shorttext">Name</p>
      "! Comparison field group for mismatched fields
      "! $required
      name              TYPE ty_mismatch_field_group,
      "! <p class="shorttext">Description</p>
      "! Mismatch field group description
      "! $required
      description       TYPE ty_short_description,
      "! <p class="shorttext">Level</p>
      "! Level of comparison field group
      "! $required
      level             TYPE ty_level,
      "! <p class="shorttext">Check Formula</p>
      "! Formula applied to perform the content check on the field group
      "! $required
      check_formula     TYPE ty_check_formula,
      "! <p class="shorttext">Result Process</p>
      "! Result process
      "! $required
      result_process    TYPE ty_result_process,
      "! <p class="shorttext">Comparison Fields</p>
      "! Field Names whose values will be compared
      "! $required
      comparison_fields TYPE ty_comparison_fields,
    END OF ty_comparison_field_group.
  "! <p class="shorttext">Comparison Field Groups</p>
  "! Comparison field groups
  TYPES ty_comparison_field_groups TYPE SORTED TABLE OF ty_comparison_field_group WITH UNIQUE KEY name.
  TYPES:
    "! <p class="shorttext">Content Check</p>
    "! Content check
    BEGIN OF ty_content_check,
      "! <p class="shorttext">Check ID</p>
      "! Check id
      "! $required
      check_id                TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Number</p>
      "! Check number
      "! $required
      check_number            TYPE ty_check_number,
      "! <p class="shorttext">Additional Data Source</p>
      "! Additional data source
      data_source             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Additional Description</p>
      "! Additional check description
      "! $required
      additional_description  TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Comparison Field Groups</p>
      "! Comparison field groups
      "! $required
      comparison_field_groups TYPE ty_comparison_field_groups,
    END OF ty_content_check.
  "! <p class="shorttext">Content Checks</p>
  "! Assigned content checks
  TYPES ty_content_checks    TYPE SORTED TABLE OF ty_content_check WITH UNIQUE KEY check_id check_number.
  "! <p class="shorttext">Control Parameter</p>
  "! Check execution control parameter
  "! $values {@link zif_aff_edcc_v1.data:co_control_parameter}
  "! $default {@link zif_aff_edcc_v1.data:co_control_parameter.always_run_check}
  TYPES ty_control_parameter TYPE c LENGTH 2.
  TYPES:
    "! <p class="shorttext">Check Sequence</p>
    "!Sequence of the checks and control parameter
    BEGIN OF ty_check_sequence,
      "! <p class="shorttext">Check ID</p>
      "! Check id
      "! $required
      check_id          TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Control Parameter</p>
      "! Check execution control parameter
      control_parameter TYPE ty_control_parameter,
    END OF ty_check_sequence.
  "! <p class="shorttext">Check Sequence</p>
  "! Sequence of the checks and control parameter
  TYPES ty_checks_sequence TYPE STANDARD TABLE OF ty_check_sequence WITH KEY check_id.
  TYPES:
    "! <p class="shorttext">Representation Type</p>
    "! Assigned representation type
    BEGIN OF ty_representation_type,
      "! <p class="shorttext">Name</p>
      "! Assigned representation type
      "! $required
      name TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_representation_type.
  "! <p class="shorttext">Representation Types</p>
  "! Assigned representation types
  TYPES ty_representation_types TYPE SORTED TABLE OF ty_representation_type WITH UNIQUE KEY name.
  TYPES:
    "! <p class="shorttext">Checks</p>
    "! Assigned checks
    BEGIN OF ty_checks,
      "! <p class="shorttext">Existence Check</p>
      "! Assigned existence check
      "! $required
      existence_check TYPE ty_existence_check,
      "! <p class="shorttext">Status Checks</p>
      "! Assigned status checks
      status_checks   TYPE ty_status_checks,
      "! <p class="shorttext">Content Checks</p>
      "! Assigned content checks
      content_checks  TYPE ty_content_checks,
      "! <p class="shorttext">Check Sequence</p>
      "! Sequence of the checks and control parameter
      check_sequence  TYPE ty_checks_sequence,
    END OF ty_checks.
  TYPES:
    "! <p class="shorttext">Comparison Type</p>
    "! Comparison type
    BEGIN OF ty_comparison_type,
      "! <p class="shorttext">Name</p>
      "! Comparison type
      "! $required
      name                 TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description</p>
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
      implementing_class   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Data Source</p>
      "! Data Source
      "! $required
      data_source          TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Checks</p>
      "! Assigned checks
      "! $required
      checks               TYPE ty_checks,
      "! <p class="shorttext">Representation Types</p>
      "! Assigned representation types
      "! $required
      representation_types TYPE ty_representation_types,
    END OF ty_comparison_type.
  "! <p class="shorttext">Comparison Types</p>
  "! Define comparison types
  TYPES ty_comparison_types TYPE SORTED TABLE OF ty_comparison_type WITH UNIQUE KEY name.
  "! <p class="shorttext">Relevance</p>
  "! Relevance
  "! $values {@link zif_aff_edcc_v1.data:co_relevance}
  "! $default {@link zif_aff_edcc_v1.data:co_relevance.unchanged}
  TYPES ty_relevance        TYPE c LENGTH 1.
  "! <p class="shorttext">Event Name</p>
  "! Event name
  TYPES ty_event_name       TYPE c LENGTH 25.
  TYPES:
    "! <p class="shorttext">Comparison Type And Check</p>
    "! Assigned comparison type and check
    BEGIN OF ty_comparison_check,
      "! <p class="shorttext">Comparison Type</p>
      "! Comparison type
      "! $required
      comparison_type TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check ID</p>
      "! Check id
      check_id        TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_comparison_check.
  "! <p class="shorttext">Comparison Types And Checks</p>
  "! Assigned comparison types and checks
  TYPES ty_comparisons_checks TYPE SORTED TABLE OF ty_comparison_check WITH UNIQUE KEY
            comparison_type check_id.
  TYPES:
    "! <p class="shorttext">Check Relevance</p>
    "! Define relevance of check
    BEGIN OF ty_check_relevance,
      "! <p class="shorttext">Comparison Type</p>
      "! Comparison type
      "! $required
      comparison_type TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check ID</p>
      "! Check id
      "! $required
      check_id        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Relevance</p>
      "! Relevance
      relevance       TYPE ty_relevance,
    END OF ty_check_relevance.
  "! <p class="shorttext">Check Relevance</p>
  "! Define relevance of checks
  TYPES ty_check_relevances TYPE SORTED TABLE OF ty_check_relevance WITH UNIQUE KEY
                                  comparison_type check_id.
  TYPES:
    "! <p class="shorttext">Event</p>
    "! Assigned event to consistency scenario
    BEGIN OF ty_event,
      "! <p class="shorttext">Name</p>
      "! Event name
      "! $required
      name                        TYPE ty_event_name,
      "! <p class="shorttext">Comparison Types And Checks</p>
      "! Assigned comparison Types and checks
      "! $required
      comparison_types_and_checks TYPE ty_comparisons_checks,
      "! <p class="shorttext">Check Relevance</p>
      "! Define relevance of checks
      "! $required
      check_relevance             TYPE ty_check_relevances,
    END OF ty_event.
  "! <p class="shorttext">Events</p>
  "! Assigned events to consistency scenario
  TYPES ty_events TYPE SORTED TABLE OF ty_event WITH UNIQUE KEY name.

  TYPES:
    "! <p class="shorttext">eDocument Type</p>
    "! eDocument types associated with consistency scenario
    BEGIN OF ty_edoc_type,
      "! <p class="shorttext">Name</p>
      "! eDocument Type
      "! $required
      name TYPE c LENGTH 10,
    END OF ty_edoc_type.
  "! <p class="shorttext">eDocument Types</p>
  "! Assign eDocument types associated with consistency scenario
  TYPES ty_edoc_types  TYPE SORTED TABLE OF ty_edoc_type WITH UNIQUE KEY name.
  "! <p class="shorttext">Inconsistency Category</p>
  "! Inconsistency category
  TYPES ty_resultgroup TYPE c LENGTH 20.
  TYPES:
    "! <p class="shorttext">Result Process</p>
    "! Assign result process to the UI group
    BEGIN OF ty_results_process,
      "! <p class="shorttext">Name</p>
      "! $required
      name TYPE ty_result_process,
    END OF ty_results_process.
  "! <p class="shorttext">Result Processes</p>
  "! Assign result process to the UI group
  TYPES ty_result_processes TYPE SORTED TABLE OF ty_results_process WITH UNIQUE KEY name.
  TYPES:
    "! <p class="shorttext">Inconsistency Category</p>
    "! Inconsistency category
    BEGIN OF ty_inconsistency_category,
      "! <p class="shorttext">Name</p>
      "! Inconsistency category
      "! $required
      name                   TYPE ty_resultgroup,
      "! <p class="shorttext">Description</p>
      "! Description of the result ui group
      "! $required
      description            TYPE ty_long_description,
      "! <p class="shorttext">Country View Extension</p>
      "! Country view extension
      country_view_extension TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Result Processes</p>
      "! Assign result process to the UI group
      "! $required
      result_processes       TYPE ty_result_processes,
    END OF ty_inconsistency_category.
  "! <p class="shorttext">Inconsistency Categories</p>
  "! Define inconsistency categories and assign result processes
  TYPES ty_inconsistency_categories TYPE SORTED TABLE OF ty_inconsistency_category WITH UNIQUE KEY name.
  "! <p class="shorttext">Field Type</p>
  "! Field type
  "! $values {@link zif_aff_edcc_v1.data:co_field_type}
  "! $default {@link zif_aff_edcc_v1.data:co_field_type.select_options}
  TYPES ty_field_type               TYPE c LENGTH 1.
  TYPES:
    "! <p class="shorttext">Additional Selection Field</p>
    "! Additional selection fields of validation report
    BEGIN OF ty_additional_selection_field,
      "! <p class="shorttext">View Name</p>
      "! View name
      "! $required
      view_name  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      "! $required
      field_name TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Field Type</p>
      "! Field type
      "! $required
      field_type TYPE ty_field_type,
    END OF  ty_additional_selection_field.
  "! <p class="shorttext">Additional Selection Fields</p>
  "! Additional selection fields of validation report
  TYPES ty_additional_selection_fields TYPE SORTED TABLE OF ty_additional_selection_field WITH UNIQUE KEY
            view_name field_name.
  TYPES:
    BEGIN OF ty_comparison_types_and_events,
      "! <p class="shorttext">Comparison Types</p>
      "! Define comparison types
      "! $required
      comparison_types         TYPE ty_comparison_types,
      "! <p class="shorttext">Events</p>
      "! Assigned events to consistency scenario
      events                   TYPE ty_events,
      "! <p class="shorttext">Inconsistency Categories</p>
      "! Inconsistency categories and assigned result processes
      "! $required
      inconsistency_categories TYPE ty_inconsistency_categories,
    END OF ty_comparison_types_and_events.
  TYPES:
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Country Code</p>
      "! Country code
      "! $required
      country_code TYPE c LENGTH 2,
    END OF ty_attributes.
  TYPES:
    "! <p class="shorttext">Consistency Scenario</p>
    "! Consistency scenario
    BEGIN OF ty_main,
      "! $required
      format_version              TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                      TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information of consistency scenario
      "! $required
      general_information         TYPE ty_attributes,
      "! <p class="shorttext">Representation Types</p>
      "! Assign representation types associated with consistency scenario
      "! $required
      representation_types        TYPE ty_representation_types,
      "! <p class="shorttext">Additional Selection Fields</p>
      "! Additional selection fields of validation report
      additional_selection_fields TYPE ty_additional_selection_fields,
      "! <p class="shorttext">Tax Authority Message Types</p>
      "! Tax authority message types
      tax_authority_message_types TYPE ty_message_types,
      "! <p class="shorttext">Additional Tax Authority Tables</p>
      "! Additional tax authority tables
      tax_authority_tables        TYPE ty_tax_authority_tables,
      "! <p class="shorttext">eDocument Types</p>
      "! Assign eDocument types associated with consistency scenario
      edocument_types             TYPE ty_edoc_types,
      "! <p class="shorttext">Comparison Types And Events</p>
      "! Define comparison types and assign events to the comparison scenario
      "! $required
      comparison_types_and_events TYPE ty_comparison_types_and_events,
    END OF ty_main.

  CONSTANTS:
    "! <p class="shorttext">Field Type</p>
    "! Field type
    BEGIN OF co_field_type,
      "! <p class="shorttext">Selection Option</p>
      "! Selection option
      select_options            TYPE ty_field_type VALUE 'S',
      "! <p class="shorttext">Parameter Single Value</p>
      "! Parameter single value
      parameter_single_value    TYPE ty_field_type VALUE 'N',
      "! <p class="shorttext">Parameter Multiple Values</p>
      "! Parameter multiple values
      parameter_multiple_values TYPE ty_field_type VALUE 'P',
    END OF co_field_type.
  CONSTANTS:
    "! <p class="shorttext">Check Formula</p>
    "! Formula applied to perform the content check on the field group
    BEGIN OF co_check_formula,
      "! <p class="shorttext">Field to Field Comparison</p>
      "! Field to field comparison
      field                       TYPE ty_check_formula VALUE '1',
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
      header TYPE ty_level VALUE 'H',
      "! <p class="shorttext">Item</p>
      "! Item
      item   TYPE ty_level VALUE 'I',
    END OF co_field_group_level.

  CONSTANTS:
    "! <p class="shorttext">Control Parameter</p>
    "! Check execution control parameter
    BEGIN OF co_control_parameter,
      "! <p class="shorttext">Always Run Check</p>
      "!Proceed even if inconsistency was found by previous checks
      always_run_check              TYPE ty_control_parameter VALUE '00',
      "! <p class="shorttext">Run Check if No Inconsistency was found by Previous Checks</p>
      "!Proceed If no inconsistency was found by previous checks
      run_check_if_no_inconsistency TYPE ty_control_parameter VALUE '01',
    END OF co_control_parameter.
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
