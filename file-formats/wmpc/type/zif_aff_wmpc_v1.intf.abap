INTERFACE zif_aff_wmpc_v1
  PUBLIC.

  TYPES:
  "! <p class="shorttext">Priority</p>
  "! Priority
  "! $values {@link zif_aff_wmpc_v1.data:co_wmpc_priority}
  "! $default {@link zif_aff_wmpc_v1.data:co_wmpc_priority.normal}
    ty_wmpc_priority TYPE c LENGTH 10.

  TYPES:
    "! <p class="shorttext">Workload Management Process Classes(WMPC) Settings</p>
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Priority</p>
      "! Priority
      "! $required
      priority                  TYPE ty_wmpc_priority,
      "! <p class="shorttext">WMPC Interpretation Class</p>
      "! WMPC Interpretation Class
      wmpc_interpretation_class TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">WMPC Interpretation Data Element</p>
      "! WMPC Interpretation Data Element
      wmpc_interpretation_dtel  TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_main.

  CONSTANTS:
    "! <p class="shorttext">Priority</p>
    "! Priority
    BEGIN OF co_wmpc_priority,
      "! <p class="shorttext">Normal</p>
      "! Normal
      normal TYPE ty_wmpc_priority VALUE 'NORMAL',
      "! <p class="shorttext">Low</p>
      "! Low
      low    TYPE ty_wmpc_priority VALUE 'LOW',
      "! <p class="shorttext">High</p>
      "! High
      high   TYPE ty_wmpc_priority VALUE 'HIGH',
    END OF co_wmpc_priority.
ENDINTERFACE.
