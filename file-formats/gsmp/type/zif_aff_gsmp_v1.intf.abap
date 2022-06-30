INTERFACE zif_aff_gsmp_v1
  PUBLIC .

  TYPES:

    "! <p class="shorttext">Provider Type</p>
    "! Provider type
    "! $values {@link zif_aff_gsmp_v1.data:co_provider_type}
    ty_provider_type  TYPE c length 4,

    "! <p class="shorttext">Execution Mode</p>
    "! Execution mode
    "! $values {@link zif_aff_gsmp_v1.data:co_execution_mode}
    ty_execution_mode type c length 1,


    "! <p class="shorttext">Provider Position</p>
    "! Provider position
    "! $values {@link zif_aff_gsmp_v1.data:co_provider_pos}
    ty_provider_pos   type i.


  constants:

    "! <p class="shorttext">Provider Type</p>
    "! Provider type
    begin of co_provider_type,

      "! <p class="shorttext">Class</p>
      "! Class
      "! $enumValue 'CLAS'
      type_class    type ty_provider_type value 'CLAS',

      "! <p class="shorttext">CDS View</p>
      "! CDS view
      "! $enumValue 'CDSA'
      type_cds_view type ty_provider_type value 'CDSA',

    end of co_provider_type,



    "! <p class="shorttext">Execution Mode</p>
    "! Execution mode
    begin of co_execution_mode,

      "! <p class="shorttext">System</p>
      "! System
      "! $enumValue 'S'
      system      type ty_execution_mode value 'S',

      "! <p class="shorttext">Instance</p>
      "! Instance
      "! $enumValue 'I'
      instance    type ty_execution_mode value 'I',

      "! <p class="shorttext">Application</p>
      "! Application
      "! $enumValue 'A'
      application type ty_execution_mode value 'A',

      "! <p class="shorttext">None</p>
      "! No execution. Only model. Data from external.
      "! $enumValue 'N'
      none        type ty_execution_mode value 'N',

    end of co_execution_mode,




    "! <p class="shorttext">Provider Position</p>
    "! Provider position
    begin of co_provider_pos,

      "! <p class="shorttext">Availability</p>
      "! Availability
      "! $enumValue '1'
      availability type ty_provider_pos value 1,

      "! <p class="shorttext">High</p>
      "! High
      "! $enumValue '200'
      high         type ty_provider_pos value 200,

      "! <p class="shorttext">Normal</p>
      "! Normal
      "! $enumValue '300'
      normal       type ty_provider_pos value 300,


      "! <p class="shorttext">Lown</p>
      "! Low
      "! $enumValue '400'
      low          type ty_provider_pos value 400,

    end of co_provider_pos.


  types:

    "! <p class="shorttext">Metric Provider</p>
    "! Metric Provider (GSMP) v1
    begin of ty_main,

      "! $required
      format_version type zif_aff_types_v1=>ty_format_version,


      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         type zif_aff_types_v1=>ty_header_60_cloud,


      "! <p class="shorttext">Provider Type</p>
      "! Provider type
      "! $required
      provider_type  type ty_provider_type,


      "! <p class="shorttext">Implementation</p>
      "! Implementation
      "! $required
      implementation type zif_aff_types_v1=>ty_object_name_30,


      "! <p class="shorttext">Execution Mode</p>
      "! Execution mode
      "! $required
      execution_mode type ty_execution_mode,


      "! <p class="shorttext">Scope Dependent</p>
      "! Scope dependent
      "! $required
      is_scope       type abap_bool,


      "! <p class="shorttext">Provider Position</p>
      "! Provider Position
      "! $required
      provider_pos   type ty_provider_pos,


      "! <p class="shorttext">Model Date</p>
      "! Model data
      model_data     type string,


    end of ty_main.

endinterface.
