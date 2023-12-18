INTERFACE zif_aff_ilmb_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Condition Field Details</p>
    "! Condition field details
    BEGIN OF ty_cond_field,
      "! <p class="shorttext">Condition Field</p>
      "! Condition field
      "! $required
      condition_field   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description</p>
      "! Description of condition field
      description    TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Data Element</p>
      "! Data element
      data_element   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Table</p>
      "! Source table
      "! $required
      source_table   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field</p>
      "! Source field
      "! $required
      source_field   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Indirect Value Determination</p>
      "! Indirect Value Determination
      indirect_value TYPE abap_bool,
      "! <p class="shorttext">No Intervals</p>
      "! No intervals
      no_intervals   TYPE abap_bool,
    END OF ty_cond_field,
    "! <p class="shorttext">Condition Fields</p>
    "!  Condition fields
    ty_cond_fields TYPE SORTED TABLE OF ty_cond_field WITH UNIQUE KEY condition_field source_table source_field.

  TYPES:
    "! <p class="shorttext">ILM</p>
    "! Destruction object
    BEGIN OF ty_destruction_object,
      "! <p class="shorttext">Name</p>
      "! Name
      name TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_destruction_object.

  TYPES:
    "! <p class="shorttext">Class</p>
    "! Callback class
    BEGIN OF ty_callback_class,
      "! <p class="shorttext">Name</p>
      "! Name
      name TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_callback_class.

  TYPES:
    "! <p class="shorttext">Time Reference Details</p>
    "! Time reference details
    BEGIN OF ty_time_reference,
      "! <p class="shorttext">Time Reference</p>
      "! Time reference
      "! $required
      time_reference TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Table</p>
      "! Source table
      "! $required
      source_table   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field</p>
      "! Source field
      "! $required
      source_field   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Indirect Value Determination</p>
      "! Indirect Value Determination
      indirect_value TYPE abap_bool,
    END OF ty_time_reference,
    "! <p class="shorttext">Time References</p>
    "! Time references
    ty_time_references TYPE SORTED TABLE OF ty_time_reference WITH UNIQUE KEY time_reference source_table
                                                                               source_field.

  TYPES:
    "! <p class="shorttext">ILM Object</p>
    "! ILM object (ILMB) v1
    BEGIN OF ty_main,
      "! $required
      format_version     TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header             TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Destruction Object</p>
      "! Mapping ILM object to data destruction object
      destruction_object TYPE ty_destruction_object,
      "! <p class="shorttext">Time References</p>
      "! Value determination for time references
      "! $required
      time_references    TYPE ty_time_references,
      "! <p class="shorttext">Condition Fields</p>
      "! Condition fields for direct value determination
      "! $required
      condition_fields   TYPE ty_cond_fields,
      "! <p class="shorttext">Value Determination Callback Class</p>
      "! Value determination callback class
      callback_class     TYPE ty_callback_class,
    END OF ty_main.

ENDINTERFACE.
