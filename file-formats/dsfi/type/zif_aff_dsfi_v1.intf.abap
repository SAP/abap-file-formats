INTERFACE zif_aff_dsfi_v1
  PUBLIC.

  TYPES:
    BEGIN OF ENUM ty_engine STRUCTURE en_engine BASE TYPE dddsfi_engine,
      analytical_engine VALUE 'ANA',
      sql_engine        VALUE 'SQL',
      built_in          VALUE 'BLT',
      undefined         VALUE IS INITIAL,
    END OF ENUM ty_engine STRUCTURE en_engine.

  TYPES:
    BEGIN OF ty_dsfi,
      scalar_function_name TYPE dddsfd_name,
      engine               TYPE ty_engine,
      BEGIN OF sql,
        amdp_name TYPE ddamdpname,
      END OF sql,
    END OF ty_dsfi.

  TYPES:
    "! <p class="shorttext">Interface Properties</p>
    "! Interface properties
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_src,

      "! <p class="shorttext">Implementation Type</p>
      "! DSFI properties
      "! $required
      content        TYPE ty_dsfi,

    END OF ty_main.

ENDINTERFACE.
