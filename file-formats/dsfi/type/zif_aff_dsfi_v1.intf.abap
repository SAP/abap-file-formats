INTERFACE zif_aff_dsfi_v1
  PUBLIC.


  TYPES:
    "! <p class="shorttext">Engine</p>
    "! Engine
    "! $values {@link zif_aff_dsfi_v1.data:co_engine}
    "! $default {@link zif_aff_dsfi_v1.data:co_engine.analytical_engine}
    ty_engine TYPE zif_aff_types_v1=>ty_object_name_30.

  CONSTANTS:
    BEGIN OF co_engine,
      "! <p class="shorttext">Analytical Engine</p>
      "! Analytical engine
      analytical_engine TYPE ty_engine VALUE 'ANA',
      "! <p class="shorttext">SQL Engine</p>
      "! SQL engine
      sql_engine TYPE ty_engine VALUE 'SQL',
    END OF co_engine.

  TYPES:
    BEGIN OF ty_sql_properties,
      "! <p class="shorttext">AMDP Reference</p>
      "! The name of the AMDP implementation reference
      "! $required
      amdp_name          TYPE c LENGTH 100,
      "! <p class="shorttext">Auto Exposure</p>
      "! Flag whether or not the SQL implementation of the
      "! CDS scalar function will be automatically exposed in all SQL services
      "! $required
      auto_exposure_flag TYPE abap_bool,
    END OF ty_sql_properties.

  TYPES:
    "! <p class="shorttext">General Information</p>
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">Scalar Function Name</p>
      "! The name of the scalar function
      "! $required
      scalar_function_name TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Engine</p>
      "! Engine
      engine               TYPE ty_engine,
      "! <p class="shorttext">SQL Properties</p>
      "! SQL Properties
      sql_properties       TYPE ty_sql_properties,
    END OF ty_main.

ENDINTERFACE.
