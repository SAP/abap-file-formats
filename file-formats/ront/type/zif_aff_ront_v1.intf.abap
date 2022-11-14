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

      "! <p class="shorttext">Name</p>
      "! Node type name in camel case
      "! $required
      name           TYPE c LENGTH 30,

      "! <p class="shorttext">Expanded Name</p>
      "! Expanded name
      "! $required
      expanded_name  TYPE c LENGTH 512,

      "! <p class="shorttext">Object Type Code</p>
      "! Object type code
      object_type_code  TYPE c LENGTH 5,

    END OF ty_main.

ENDINTERFACE.
