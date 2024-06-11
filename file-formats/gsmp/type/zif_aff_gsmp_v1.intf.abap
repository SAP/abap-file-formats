INTERFACE zif_aff_gsmp_v1
  PUBLIC.

  TYPES:

    "! <p class="shorttext">Type</p>
    "! Type
    "! $values {@link zif_aff_gsmp_v1.data:co_provider_type}
    "! $default {@link zif_aff_gsmp_v1.data:co_provider_type.class}
    ty_provider_type  TYPE c LENGTH 4,

    "! <p class="shorttext">Execution Mode</p>
    "! Execution mode
    "! $values {@link zif_aff_gsmp_v1.data:co_execution_mode}
    ty_execution_mode TYPE c LENGTH 1,


    "! <p class="shorttext">Priority</p>
    "! Priority
    "! $values {@link zif_aff_gsmp_v1.data:co_priority}
    "! $default {@link zif_aff_gsmp_v1.data:co_priority.normal}
    ty_priority   TYPE i,

    "! <p class="shorttext">Instantiation</p>
    "! Instantiation
    "! $values {@link zif_aff_gsmp_v1.data:co_instantiation}
    "! $default {@link zif_aff_gsmp_v1.data:co_instantiation.create_new}
    ty_instantiation TYPE c LENGTH 1,

    "! <p class="shorttext">Implementation</p>
    "! Implementation
    BEGIN OF ty_provider_implementation,

      "! <p class="shorttext">Type</p>
      "! Type
      "! $required
      type TYPE ty_provider_type,

      "! <p class="shorttext">Name</p>
      "! Name
      "! $required
      name TYPE zif_aff_types_v1=>ty_object_name_30,

    END OF ty_provider_implementation,

    "! <p class="shorttext">Execution Configuration</p>
    "! Execution configuration
    BEGIN OF ty_provider_execution,

      "! <p class="shorttext">Mode</p>
      "! Mode
      "! $required
      mode            TYPE ty_execution_mode,

      "! <p class="shorttext">Priority</p>
      "! Priority
      "! $required
      priority        TYPE ty_priority,

      "! <p class="shorttext">Instantiation</p>
      "! Instantiation
      "! $showAlways
      instantiation   TYPE ty_instantiation,

      "! <p class="shorttext">Scope Dependent</p>
      "! Scope dependent
      "! $required
      scope_dependent TYPE abap_bool,

    END OF ty_provider_execution,

    "! <p class="shorttext">Model</p>
    "! Model
    BEGIN OF ty_model,

      "! <p class="shorttext">JSON Data</p>
      "! JSON data
      data TYPE string,

    END OF ty_model.

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

      "! <p class="shorttext">Job</p>
      "! Job
      job        TYPE ty_execution_mode VALUE 'J',

      "! <p class="shorttext">None</p>
      "! No execution. Only model. Data from external.
      none        TYPE ty_execution_mode VALUE 'N',

    END OF co_execution_mode,

    "! <p class="shorttext">Provider Priority</p>
    "! Provider priority
    BEGIN OF co_priority,

      "! <p class="shorttext">Very High (Availability)</p>
      "! Very high (Availability)
      availability TYPE ty_priority VALUE 1,

      "! <p class="shorttext">High</p>
      "! High
      high         TYPE ty_priority VALUE 200,

      "! <p class="shorttext">Normal</p>
      "! Normal
      normal       TYPE ty_priority VALUE 300,

      "! <p class="shorttext">Low</p>
      "! Low
      low          TYPE ty_priority VALUE 400,

    END OF co_priority,

    "! <p class="shorttext">Instantiation</p>
    "! Instantiation
    BEGIN OF co_instantiation,

      "! <p class="shorttext">Reuse Instances</p>
      "! Reuse instances
      reuse       TYPE ty_instantiation VALUE 'R',

      "! <p class="shorttext">Creating New Instances</p>
      "! Creating new instances
      create_new  TYPE ty_instantiation VALUE 'C',

    END OF co_instantiation.

  TYPES:

    "! <p class="shorttext">Metric Provider</p>
    "! Metric Provider (GSMP)
    BEGIN OF ty_main,

      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">Implementation</p>
      "! Implementation
      "! $required
      implementation TYPE ty_provider_implementation,

      "! <p class="shorttext">Execution</p>
      "! Execution
      "! $required
      execution      TYPE ty_provider_execution,

      "! <p class="shorttext">Model</p>
      "! Model
      model          TYPE ty_model,

    END OF ty_main.

ENDINTERFACE.
