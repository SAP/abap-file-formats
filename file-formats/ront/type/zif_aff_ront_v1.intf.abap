INTERFACE zif_aff_ront_v1
  PUBLIC.

  CONSTANTS:
    BEGIN OF co_category,
      "! <p class="shorttext">Business Object</p>
      "! Business object
      business_object      TYPE c LENGTH 2 VALUE `BO`,
      "! <p class="shorttext">Technical Object</p>
      "! Technical object
      technical_object     TYPE c LENGTH 2 VALUE `TO`,
      "! <p class="shorttext">Analytical Object</p>
      "! Analytical object
      analytical_object    TYPE c LENGTH 2 VALUE `AO`,
      "! <p class="shorttext">Configuration Object</p>
      "! Configuration object
      configuration_object TYPE c LENGTH 2 VALUE `CO`,
    END OF co_category.

  TYPES:
    "! <p class="shorttext">Node</p>
    BEGIN OF ty_node_type,
      "! <p class="shorttext">Name</p>
      "! Node type name in camel case
      "! $required
      name TYPE c LENGTH 40,

      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description   TYPE zif_aff_types_v1=>ty_description_60,
    END OF ty_node_type.

  TYPES:
    "! <p class="shorttext">General Information</p>
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">Type Category</p>
      "! Type category
      "! $required
      "! $values {@link zif_aff_ront_v1.data:co_category}
      type_category  TYPE c LENGTH 2,

      "! <p class="shorttext">Root SAP Object Node Type</p>
      "! Root SAP object node type
      "! $required
      root_node_type TYPE ty_node_type,

      "! <p class="shorttext">SAP Object Node Types</p>
      node_types     TYPE SORTED TABLE OF ty_node_type WITH NON-UNIQUE KEY name,

    END OF ty_main.
ENDINTERFACE.
