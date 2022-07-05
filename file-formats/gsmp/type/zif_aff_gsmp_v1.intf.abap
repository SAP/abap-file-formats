INTERFACE zif_aff_gsmp_v1
  PUBLIC.

  TYPES:

    "! <p class="shorttext">Provider Type</p>
    "! Provider type
    "! $values {@link zif_aff_gsmp_v1.data:co_provider_type}
    "! $default {@link zif_aff_gsmp_v1.data:co_provider_type.class}
    ty_provider_type  TYPE c LENGTH 4,

    "! <p class="shorttext">Execution Mode</p>
    "! Execution mode
    "! $values {@link zif_aff_gsmp_v1.data:co_execution_mode}
    ty_execution_mode TYPE c LENGTH 1,


    "! <p class="shorttext">Provider Position</p>
    "! Provider position
    "! $values {@link zif_aff_gsmp_v1.data:co_provider_pos}
    "! $default {@link zif_aff_gsmp_v1.data:co_provider_pos.normal}
    ty_provider_pos   TYPE i,


    "! <p class="shorttext">Provider Implementation</p>
    "! Provider implementation
    BEGIN OF ty_provider_implementation,

      "! <p class="shorttext">Type</p>
      "! Type
      "! $required
      type TYPE ty_provider_type,

      "! <p class="shorttext">Implementation</p>
      "! Implementation
      "! $required
      implementation TYPE zif_aff_types_v1=>ty_object_name_30,

    END OF ty_provider_implementation.


  CONSTANTS:

    "! <p class="shorttext">Provider Type</p>
    "! Provider type
    BEGIN OF co_provider_type,

      "! <p class="shorttext">Class</p>
      "! Class
      "! $enumValue 'CLAS'
      class    TYPE ty_provider_type VALUE 'CLAS',

    END OF co_provider_type,



    "! <p class="shorttext">Execution Mode</p>
    "! Execution mode
    BEGIN OF co_execution_mode,

      "! <p class="shorttext">System</p>
      "! System
      system      TYPE ty_execution_mode VALUE 'S',

      "! <p class="shorttext">Instance</p>
      "! Instance
      instance    TYPE ty_execution_mode VALUE 'I',

      "! <p class="shorttext">Application</p>
      "! Application
      application TYPE ty_execution_mode VALUE 'A',

      "! <p class="shorttext">None</p>
      "! No execution. Only model. Data from external.
      none        TYPE ty_execution_mode VALUE 'N',

    END OF co_execution_mode,




    "! <p class="shorttext">Provider Position</p>
    "! Provider position
    BEGIN OF co_provider_pos,

      "! <p class="shorttext">Availability</p>
      "! Availability
      availability TYPE ty_provider_pos VALUE 1,

      "! <p class="shorttext">High</p>
      "! High
      high         TYPE ty_provider_pos VALUE 200,

      "! <p class="shorttext">Normal</p>
      "! Normal
      normal       TYPE ty_provider_pos VALUE 300,


      "! <p class="shorttext">Low</p>
      "! Low
      low          TYPE ty_provider_pos VALUE 400,

    END OF co_provider_pos.


  TYPES:

    "! <p class="shorttext">Metric Provider</p>
    "! Metric Provider (GSMP) v1
    BEGIN OF ty_main,

      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,


      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,


      "! <p class="shorttext">Provider Implementation</p>
      "! Provider implementation
      "! $required
      implementation TYPE ty_provider_implementation,


      "! <p class="shorttext">Execution Mode</p>
      "! Execution mode
      "! $required
      execution_mode TYPE ty_execution_mode,


      "! <p class="shorttext">Scope Dependent</p>
      "! Scope dependent
      "! $required
      scope_dependent       TYPE abap_bool,


      "! <p class="shorttext">Provider Position</p>
      "! Provider Position
      "! $required
      position   TYPE ty_provider_pos,


      "! <p class="shorttext">Model Data</p>
      "! Model data
      model_data     TYPE string,


    END OF ty_main.

ENDINTERFACE.
