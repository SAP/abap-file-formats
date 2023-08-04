INTERFACE zif_aff_srvc_v1
  PUBLIC.
  "! <p class="shorttext">Consumer Type</p>
  "! Consumer type
  "! $values {@link zif_aff_srvc_v1.data:co_cons_type}
  TYPES ty_cons_type TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_cons_type,
      "! <p class="shorttext">OData</p>
      "! OData
      "! $enumValue 'OData'
      odata       TYPE ty_cons_type VALUE '01',
      "! <p class="shorttext">Web Service</p>
      "! Web service
      web_service TYPE ty_cons_type VALUE '02',
      "! <p class="shorttext">RFC</p>
      "! RFC
      "! $enumValue 'RFC'
      rfc         TYPE ty_cons_type VALUE '03',
    END OF co_cons_type.

  TYPES:
    "! <p class="shorttext">Consumer Property Details</p>
    "! Consumer property details
    BEGIN OF ty_consumer_property,
      "! <p class="shorttext">Id</p>
      "! Id
      id    TYPE c LENGTH 40,
      "! <p class="shorttext">Value</p>
      "! Value
      value TYPE c LENGTH 40,
    END OF ty_consumer_property.

  "! <p class="shorttext">Consumer Properties</p>
  "! Consumer properties
  TYPES ty_consumer_properties TYPE TABLE OF ty_consumer_property WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Consumer Information</p>
    "! Consumer information
    BEGIN OF ty_consumer,
      "! <p class="shorttext">Type</p>
      "! Type
      "! $required
      type        TYPE ty_cons_type,
      "! <p class="shorttext">Object Type</p>
      "! Object type
      "! $required
      object_type TYPE c LENGTH 4,
      "! <p class="shorttext">Object Name</p>
      "! Object name
      "! $required
      object_name TYPE c LENGTH 40,
      "! <p class="shorttext">Properties</p>
      "! Properties
      properties  TYPE ty_consumer_properties,
    END OF ty_consumer.

  TYPES:
    "! <p class="shorttext">Service Consumption Model Properties</p>
    "! Service Consumption Model properties
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Consumer</p>
      "! Consumer
      "! $required
      consumer       TYPE ty_consumer,

    END OF ty_main.

ENDINTERFACE.
