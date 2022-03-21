INTERFACE zif_aff_ront_v1
  PUBLIC .

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
    BEGIN OF ty_rontnode,
      "! <p class="shorttext">Name</p>
      "! Node name
      node_name     TYPE c LENGTH 40,

      "! <p class="shorttext">Root Node Flag</p>
      "! Root node flag
      is_root       TYPE abap_bool,

      "! <p class="shorttext">Name</p>
      "! Raw (camel case) node name
      "! $required
      node_name_raw TYPE c LENGTH 40,

      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description   TYPE c LENGTH 60,
    END OF ty_rontnode.

  TYPES:
    "! <p class="shorttext">General Information</p>
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,

      "! <p class="shorttext">Category</p>
      "! Category
      "! $required
      "! $values {@link zif_aff_ront_v1.data:co_category}
      type_category  TYPE c LENGTH 2,

      "! <p class="shorttext">SAP Object Node Type</p>
      "! $required
      rontnodes      TYPE SORTED TABLE OF ty_rontnode WITH NON-UNIQUE KEY node_name,

    END OF ty_main.
ENDINTERFACE.
