INTERFACE zif_aff_dsfi_v1
  PUBLIC .


  "! <p class="shorttext">Engine</p>
  "! Engine
  "! $values {@link zif_aff_dsfi_v1.data:co_engine}
  "! $default {@link zif_aff_dsfi_v1.data:co_engine.analytical_engine}
  TYPES: ty_engine TYPE zif_aff_types_v1=>ty_object_name_30.

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
    "! <p class="shorttext">CDS Scalar Function Implementation</p>
    "! CDS scalar function implementation
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
      "! <p class="shorttext">AMDP Reference</p>
      "! The name of the AMDP Implementation Reference
      "! $required
      amdp_name            TYPE ddamdpname,
      "! <p class="shorttext">Automatically exposed in SQL Service</p>
      "! Flag whether or not the SQL impementation of the CDS SCalar Function will be automatically exposed in all SQL Services
      "! $required
      auto_exposure_flag TYPE abap_bool,
    END OF ty_main.

ENDINTERFACE.
