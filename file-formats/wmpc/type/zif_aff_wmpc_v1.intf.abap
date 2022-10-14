INTERFACE zif_aff_wmpc_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Priority</p>
    "! Priority
    "! $values {@link zif_aff_wmpc_v1.data:co_priority}
    "! $default {@link zif_aff_wmpc_v1.data:co_priority.normal}
    ty_priority TYPE c LENGTH 10.

  CONSTANTS:
    "! <p class="shorttext">Priority</p>
    "! Priority
    BEGIN OF co_priority,
      "! <p class="shorttext">Normal</p>
      "! Normal
      normal TYPE ty_priority VALUE 'NORMAL',
      "! <p class="shorttext">Low</p>
      "! Low
      low    TYPE ty_priority VALUE 'LOW',
      "! <p class="shorttext">High</p>
      "! High
      high   TYPE ty_priority VALUE 'HIGH',
    END OF co_priority.

  TYPES:

    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Priority</p>
      "! Priority
      priority                  TYPE ty_priority,
      "! <p class="shorttext">Interpretation Class</p>
      "! Interpretation class
      interpretation_class TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Interpretation Data Element</p>
      "! Interpretation data element
      interpretation_dtel  TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_main.

ENDINTERFACE.
