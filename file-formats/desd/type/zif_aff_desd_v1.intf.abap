INTERFACE zif_aff_desd_v1
  PUBLIC.

  TYPES:

    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Default Remote Schema</p>
      "! Default remote database schema name when configuring the connection
      "! details of logical external schema.
      default_remote_schema_name TYPE c LENGTH 256,
      "! <p class="shorttext">Uses Routing</p>
      "! If true, the logical external schema can only be used
      "! in routed scenarios.
      uses_routing               TYPE abap_bool,
    END OF ty_general_information,

    "! <p class="shorttext">CDS Logical External Schema</p>
    "! CDS logical external schema
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information TYPE ty_general_information,
    END OF ty_main.

ENDINTERFACE.
