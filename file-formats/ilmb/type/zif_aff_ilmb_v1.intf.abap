INTERFACE zif_aff_ilmb_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Condition Field</p>
    "! Condition field
    BEGIN OF ty_cond_field,
      "! <p class="shorttext">Name</p>
      "! Condition field
      name             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Condition Field Description</p>
      "! Field name description
      condition_field_description TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Data Element</p>
      "! Data element
      data_element                TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Table</p>
      "! Source table
      source_table                TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field</p>
      "! Source field
      source_field                TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">No Intervals</p>
      "! No intervals
      no_intervals                TYPE abap_bool,
    END OF ty_cond_field,
    "! <p class="shorttext">Condition Fields Details</p>
    "!  Condition fields
    ty_cond_fields TYPE SORTED TABLE OF ty_cond_field WITH UNIQUE KEY source_table source_field.

  TYPES:
    "! <p class="shorttext">Destruction Object</p>
    "! Destruction object
    BEGIN OF ty_destruction_object,
      "! <p class="shorttext">Name</p>
      "! Name
      name TYPE c LENGTH 30,
    END OF ty_destruction_object.

  TYPES:
    "! <p class="shorttext">Time Reference</p>
    "! Time reference
    BEGIN OF ty_time_reference,
      "! <p class="shorttext">Constant</p>
      "! IRM constant
      constant     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Table</p>
      "! Source table
      source_table TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field</p>
      "! Source field
      source_field TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_time_reference,
    "! <p class="shorttext">Time References Details</p>
    "! Time references
    ty_time_references TYPE SORTED TABLE OF ty_time_reference WITH UNIQUE KEY constant.


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
      "! $required
      destruction_object TYPE ty_destruction_object,
      "! <p class="shorttext">Time References</p>
      "!  Value determination for time references
      "! $required
      time_references    TYPE ty_time_references,
      "! <p class="shorttext">Condition Fields Direct</p>
      "! Condition fields for direct value determination
      "! $required
      cond_fields_direct TYPE ty_cond_fields,
    END OF ty_main.

ENDINTERFACE.
