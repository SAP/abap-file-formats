INTERFACE zif_aff_ilmb_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Condition Fields Direct</p>
    "! Condition fields direct
    BEGIN OF ty_cond_fields_direct,
      "! <p class="shorttext">Condition Field</p>
      "! Condition field
      condition_field TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Table</p>
      "! Source table
      source_table    TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field</p>
      "! Source field
      source_field    TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_cond_fields_direct,
    "! <p class="shorttext">Condition Fields Direct</p>
    "!  Condition fields direct
    ty_cond_fields_directs TYPE SORTED TABLE OF ty_cond_fields_direct WITH UNIQUE KEY source_table source_field.

  TYPES:
    "! <p class="shorttext">Available Condition Fields</p>
    "! Available condition fields
    BEGIN OF ty_available_condition_field,
      "! <p class="shorttext">Condition Field</p>
      "! Condition field
      condition_field             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Data Element</p>
      "! Data element
      data_element                TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Data Element Description</p>
      "! Data element description
      data_element_description    TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Field Name Description</p>
      "! Field name description
      condition_field_description TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">No Intervals</p>
      "! No intervals
      no_intervals                TYPE xsdboolean,
    END OF ty_available_condition_field,
    "! <p class="shorttext">Available Condition Fields</p>
    "! Available condition fields
    ty_available_condition_fields TYPE SORTED TABLE OF ty_available_condition_field WITH UNIQUE KEY condition_field.

  TYPES:
    "! <p class="shorttext">Destruction Object</p>
    "! Destruction object
    BEGIN OF ty_destruction_object,
      "! <p class="shorttext">Destruction Object</p>
      "! Destruction object
      destruction_object  TYPE c LENGTH 30,
    END OF ty_destruction_object,
    "! <p class="shorttext">Destruction Object</p>
    "! Destruction object
    ty_destruction_objects TYPE SORTED TABLE OF ty_destruction_object WITH UNIQUE KEY destruction_object.

  TYPES:
    "! <p class="shorttext">Time References</p>
    "! Time references
    BEGIN OF ty_time_reference,
      "! <p class="shorttext">IRM Constant</p>
      "! IRM constant
      constant     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description</p>
      "! Description
      description  TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Source Table</p>
      "! Source table
      source_table TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Source Field</p>
      "! Source field
      source_field TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_time_reference,
    "! <p class="shorttext">Time References</p>
    "! Time references
    ty_time_references TYPE SORTED TABLE OF ty_time_reference WITH UNIQUE KEY constant.


  TYPES:
    "! <p class="shorttext">ILM Object</p>
    "! ILM object (ILMB) v1
    BEGIN OF ty_main,
      "! $required
      format_version             TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                     TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Mapping ILM Object To Data Destruction Object</p>
      "! Mapping ILM object to data destruction object
      "! $required
      destruction_object         TYPE ty_destruction_objects,
      "! <p class="shorttext">Value Determination for Time References</p>
      "!  Value determination for time references
      "! $required
      time_references            TYPE ty_time_references,
      "! <p class="shorttext">Available Condition Fields</p>
      "! Available condition fields
      "! $required
      available_condition_field  TYPE ty_available_condition_fields,
      "! <p class="shorttext">Condition Fields For Direct Value Determination</p>
      "! Condition fields for direct value determination
      "! $required
      cond_fields_direct         TYPE ty_cond_fields_directs,
    END OF ty_main.

ENDINTERFACE.
