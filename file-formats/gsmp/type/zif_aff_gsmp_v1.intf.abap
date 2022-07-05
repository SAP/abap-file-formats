INTERFACE zif_aff_gsmp_v1
  PUBLIC.

  TYPES:

    "! <p class="shorttext">Provider Type</p>
    "! Provider type
    "! $values {@link zif_aff_gsmp_v1.data:co_provider_type}
    ty_provider_type  TYPE c LENGTH 4,

    "! <p class="shorttext">Execution Mode</p>
    "! Execution mode
    "! $values {@link zif_aff_gsmp_v1.data:co_execution_mode}
    ty_execution_mode TYPE c LENGTH 1,


    "! <p class="shorttext">Provider Position</p>
    "! Provider position
    "! $values {@link zif_aff_gsmp_v1.data:co_provider_pos}
    ty_provider_pos   TYPE i.


  CONSTANTS:

    "! <p class="shorttext">Provider Type</p>
    "! Provider type
    BEGIN OF co_provider_type,

      "! <p class="shorttext">Class</p>
      "! Class
      "! $enumValue 'CLAS'
      type_class    TYPE ty_provider_type VALUE 'CLAS',

      "! <p class="shorttext">CDS View</p>
      "! CDS view
      "! $enumValue 'CDSA'
      type_cds_view TYPE ty_provider_type VALUE 'CDSA',

    END OF co_provider_type,



    "! <p class="shorttext">Execution Mode</p>
    "! Execution mode
    BEGIN OF co_execution_mode,

      "! <p class="shorttext">System</p>
      "! System
      "! $enumValue 'S'
      system      TYPE ty_execution_mode VALUE 'S',

      "! <p class="shorttext">Instance</p>
      "! Instance
      "! $enumValue 'I'
      instance    TYPE ty_execution_mode VALUE 'I',

      "! <p class="shorttext">Application</p>
      "! Application
      "! $enumValue 'A'
      application TYPE ty_execution_mode VALUE 'A',

      "! <p class="shorttext">None</p>
      "! No execution. Only model. Data from external.
      "! $enumValue 'N'
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
      "! $enumValue '200'
      high         TYPE ty_provider_pos VALUE 200,

      "! <p class="shorttext">Normal</p>
      "! Normal
      "! $enumValue '300'
      normal       TYPE ty_provider_pos VALUE 300,


      "! <p class="shorttext">Low</p>
      "! Low
      "! $enumValue '400'
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


      "! <p class="shorttext">Provider Type</p>
      "! Provider type
      "! $required
      provider_type  TYPE ty_provider_type,


      "! <p class="shorttext">Implementation</p>
      "! Implementation
      "! $required
      implementation TYPE zif_aff_types_v1=>ty_object_name_30,


      "! <p class="shorttext">Execution Mode</p>
      "! Execution mode
      "! $required
      execution_mode TYPE ty_execution_mode,


      "! <p class="shorttext">Scope Dependent</p>
      "! Scope dependent
      "! $required
      is_scope       TYPE abap_bool,


      "! <p class="shorttext">Provider Position</p>
      "! Provider Position
      "! $required
      provider_position   TYPE ty_provider_pos,


      "! <p class="shorttext">Model Data</p>
      "! Model data
      model_data     TYPE string,


    END OF ty_main.

ENDINTERFACE.
