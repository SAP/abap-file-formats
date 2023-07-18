INTERFACE zif_aff_srvc_v1
  PUBLIC.
  "! <p class="shorttext">Consumer Type</p>
  "! Consumer Type
  "! $values {@link zif_aff_srvc_v1.data:co_cons_type}
  TYPES ty_cons_type TYPE c LENGTH 2.

  CONSTANTS:
    BEGIN OF co_cons_type,
      "! <p class="shorttext">OData</p>
      "! OData
      odata       TYPE ty_cons_type VALUE '01',
      "! <p class="shorttext">Web Service</p>
      "! Web Service
      web_service TYPE ty_cons_type VALUE '02',
      "! <p class="shorttext">RFC</p>
      "! RFC
      rfc         TYPE ty_cons_type VALUE '03',
      "! <p class="shorttext">HTTP</p>
      "! HTTP
      http        TYPE ty_cons_type VALUE '04',
    END OF co_cons_type.

  TYPES:
    "! <p class="shorttext">Consumer Connection Property</p>
    "! Consumer Connection Property
    BEGIN OF ty_connection_property,
      "! <p class="shorttext">Id</p>
      "! Id
      id    TYPE c LENGTH 40,
      "! <p class="shorttext">Value</p>
      "! Value
      value TYPE c LENGTH 40,
    END OF ty_connection_property.

  "! <p class="shorttext">Connection Properties</p>
  "! Connection Properties
  TYPES ty_connection_properties TYPE TABLE OF ty_connection_property WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Consumer Information</p>
    "! Consumer Information
    BEGIN OF ty_consumer_information,
      "! <p class="shorttext">Consumer type</p>
      "! Consumer type
      consumer_type         TYPE ty_cons_type,
      "! <p class="shorttext">Consumer object name</p>
      "! Consumer object name
      consumer_object_name  TYPE c LENGTH 40,
      "! <p class="shorttext">Consumer object type</p>
      "! Consumer object type
      consumer_object_type  TYPE c LENGTH 4,
      "! <p class="shorttext">Connection properties</p>
      "! Connection properties
      "! $required
      connection_properties TYPE ty_connection_properties,
    END OF ty_consumer_information.

  TYPES:
    "! <p class="shorttext">Service Consumption Model Properties</p>
    "! Service Consumption Model properties
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Consumer information</p>
      "! Consumer information
      "! $required
      consumer_information TYPE ty_consumer_information,

    END OF ty_main.

ENDINTERFACE.
