INTERFACE zif_aff_nont_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">SAP Object Node Type</p>
    "! SAP object node type
    BEGIN OF ty_main,
      "! $required
      format_version  TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header          TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">Name</p>
      "! The name of the SAP Object Node Type.
      "! $required
      name            TYPE c LENGTH 30,

      "! <p class="shorttext">SAP Object Type</p>
      "! The name of the referenced SAP Object Type.
      sap_object_type TYPE c LENGTH 30,

      "! <p class="shorttext">Root Node</p>
      "! Indicates that the SAP Object Node Type corresponds to the referenced SAP Object Type.
      root_node  TYPE abap_bool,

    END OF ty_main.

ENDINTERFACE.
