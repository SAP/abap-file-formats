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
      "! <p class="shorttext">Dependent Object</p>
      "! Dependent object
      dependent_object     TYPE c LENGTH 2 VALUE `DO`,
      "! <p class="shorttext">Hierarchy Object</p>
      "! Hierarchy object
      hierarchy_object     TYPE c LENGTH 2 VALUE `HO`,
    END OF co_category.

  TYPES:
    "! <p class="shorttext">SAP Object Type</p>
    "! SAP object type
    BEGIN OF ty_main,
      "! $required
      format_version                TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                        TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">Type Category</p>
      "! The category of the SAP Object Type
      "! $required
      "! $values {@link zif_aff_ront_v1.data:co_category}
      "! $default {@link zif_aff_ront_v1.data:co_category.business_object}
      type_category                 TYPE c LENGTH 2,

      "! <p class="shorttext">Name</p>
      "! The name of the SAP Object Type.
      "! $required
      name                          TYPE c LENGTH 30,

      "! <p class="shorttext">Object Type Code</p>
      "! The object type code uniquely identifies the SAP Object Type.
      object_type_code              TYPE c LENGTH 5,

      "! <p class="shorttext">Interface Behavior Definition</p>
      "! The interface behavior definition related to the SAP Object Type.
      interface_behavior_definition TYPE c LENGTH 30,

      "! <p class="shorttext">ODM Entity Name</p>
      "! The One Domain Model entity related to the SAP Object Type.
      odm_entity_name               TYPE c LENGTH 255,

    END OF ty_main.

ENDINTERFACE.
