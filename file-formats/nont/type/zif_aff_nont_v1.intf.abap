INTERFACE zif_aff_nont_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">Name</p>
      "! Node type name in camel case
      "! $required
      name           TYPE c LENGTH 30,

      "! <p class="shorttext">Expanded Name</p>
      "! Expanded name
      "! $required
      expanded_name  TYPE c LENGTH 512,

      "! <p class="shorttext">SAP Object Type</p>
      "! Name of SAP Object Type
      parent_name    TYPE c LENGTH 30,

      "! <p class="shorttext">Root Node Flag</p>
      "! SAP Object Root Node Indicator
      root_node_flag TYPE abap_bool,

    END OF ty_main.

ENDINTERFACE.
