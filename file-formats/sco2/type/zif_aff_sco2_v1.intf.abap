INTERFACE zif_aff_sco2_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">IDoc Service</p>
    "! Details of an inbound service of type IDoc
    BEGIN OF ty_idoc,

      "! <p class="shorttext">Message Type</p>
      "! IDoc message type
      msg_type TYPE c LENGTH 30,

      "! <p class="shorttext">Basic Type</p>
      "! IDoc basic type
      type     TYPE c LENGTH 30,

    END OF ty_idoc.

  TYPES:
    "! <p class="shorttext">SOAP Service</p>
    "! Details of an inbound service of type SOAP
    BEGIN OF ty_soap,

      "! <p class="shorttext">Service Definition</p>
      "! Name of the service definition
      interface_name TYPE c LENGTH 30,

      "! <p class="shorttext">SOAP Operation</p>
      "! Internal name of the SOAP operation
      operation_name TYPE c LENGTH 30,

    END OF ty_soap.

  TYPES:
    "! <p class="shorttext">OData Service</p>
    "! Details of an inbound service of type OData
    BEGIN OF ty_odata,

      "! <p class="shorttext">Service Document Identifier</p>
      "! Identifier of the OData service document
      srv_identifier TYPE c LENGTH 40,

      "! <p class="shorttext">OData V4 Group ID</p>
      "! Group ID of the OData V4 service
      v4_group_id    TYPE c LENGTH 36,

    END OF ty_odata.

  TYPES:
    "! <p class="shorttext">Event Consumption Service</p>
    "! Details of an inbound service of type EEEC
    BEGIN OF ty_eeec,

      "! <p class="shorttext">Registration ID</p>
      "! ID of the event registration
      id      TYPE c LENGTH 36,

      "! <p class="shorttext">Registration Version</p>
      "! Version of the event registration, with leading zeros
      version TYPE n LENGTH 4,

    END OF ty_eeec.

  TYPES:
    "! <p class="shorttext">Service Details</p>
    "! Protocol-specific details of the inbound service.
    "! Only the field or group that corresponds to the inbound service type is filled.
    BEGIN OF ty_service_details,

      "! <p class="shorttext">ICF Path</p>
      "! Path of the ICF node (case-sensitive)
      icf_path        TYPE c LENGTH 200,

      "! <p class="shorttext">IDoc Service</p>
      "! Details of an inbound service of type IDoc
      idoc            TYPE ty_idoc,

      "! <p class="shorttext">RFC Service ID</p>
      "! ID of the RFC service
      rfc_service_id  TYPE c LENGTH 30,

      "! <p class="shorttext">SOAP Service</p>
      "! Details of an inbound service of type SOAP
      soap            TYPE ty_soap,

      "! <p class="shorttext">OData Service</p>
      "! Details of an inbound service of type OData
      odata           TYPE ty_odata,

      "! <p class="shorttext">HTTP Service ID</p>
      "! ID of the HTTP service
      http_service_id TYPE c LENGTH 30,

      "! <p class="shorttext">ADT Service Group</p>
      "! Name of the ADT service group
      sadt_group_name TYPE c LENGTH 40,

      "! <p class="shorttext">SQL Service Binding</p>
      "! ID of the SQL service binding
      sql1_name       TYPE c LENGTH 30,

      "! <p class="shorttext">Event Consumption Service</p>
      "! Details of an inbound service of type EEEC
      eeec            TYPE ty_eeec,

      "! <p class="shorttext">ABAP Daemon ID</p>
      "! ID of the ABAP daemon application
      daemon_id       TYPE c LENGTH 30,

      "! <p class="shorttext">INA Service ID</p>
      "! ID of the INA service
      ina1_service_id TYPE c LENGTH 40,

    END OF ty_service_details.

  "! <p class="shorttext">Inbound Service Type</p>
  "! Type of the inbound service
  "! $values {@link zif_aff_sco2_v1.data:co_ibs_type}
  TYPES ty_ibs_type TYPE c LENGTH 4.

  CONSTANTS:
    "! <p class="shorttext">Inbound Service Type</p>
    "! Type of the inbound service
    BEGIN OF co_ibs_type,

      "! <p class="shorttext">ABAP Daemon</p>
      "! ABAP daemon, application ID
      abap_daemon         TYPE ty_ibs_type VALUE 'DMON',

      "! <p class="shorttext">Event Consumption Model</p>
      "! Event consumption model
      event_consumption   TYPE ty_ibs_type VALUE 'EEEC',

      "! <p class="shorttext">OData V4</p>
      "! OData V4 service
      odata_v4            TYPE ty_ibs_type VALUE 'G4BA',

      "! <p class="shorttext">HTTP Service</p>
      "! HTTP service
      http_service        TYPE ty_ibs_type VALUE 'HTTP',

      "! <p class="shorttext">IDoc</p>
      "! IDoc
      idoc                TYPE ty_ibs_type VALUE 'IDOC',

      "! <p class="shorttext">OData V2</p>
      "! OData V2 service
      odata_v2            TYPE ty_ibs_type VALUE 'IWSG',

      "! <p class="shorttext">ADT Service Group</p>
      "! ADT service group
      adt_service_group   TYPE ty_ibs_type VALUE 'SADT',

      "! <p class="shorttext">ICF</p>
      "! ICF service
      icf                 TYPE ty_ibs_type VALUE 'SICF',

      "! <p class="shorttext">SQL Service Binding</p>
      "! SQL service binding
      sql_service_binding TYPE ty_ibs_type VALUE 'SQL1',

      "! <p class="shorttext">RFC</p>
      "! RFC service
      rfc                 TYPE ty_ibs_type VALUE 'SRFC',

      "! <p class="shorttext">SOAP</p>
      "! SOAP service
      soap                TYPE ty_ibs_type VALUE 'WEBI',

    END OF co_ibs_type.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information of an inbound service of communication management
    BEGIN OF ty_general_information,

      "! <p class="shorttext">Inbound Service Type</p>
      "! Type of the inbound service. Determines which field or group of the service details is filled.
      "! Check the {@link zif_aff_sco2_v1.data:co_ibs_type} constants for possible values.
      "! $required
      "! $values {@link zif_aff_sco2_v1.data:co_ibs_type}
      ibs_type        TYPE ty_ibs_type,

      "! <p class="shorttext">Scope Dependent</p>
      "! Indicates whether the inbound service is scope-dependent
      scope_dependent TYPE abap_bool,

      "! <p class="shorttext">App Type</p>
      "! Inbound service app type for extensibility
      ibs_app_type    TYPE c LENGTH 4,

      "! <p class="shorttext">Leading Business Object</p>
      "! SAP object type of the leading business object
      leading_bo_type TYPE c LENGTH 30,

*      "! <p class="shorttext">Released for Customer Scenarios</p>
*      "! Indicates whether the inbound service is released for communication
*      "! scenarios of type Customer
*      released_for_customer_scenario TYPE abap_bool,
*
*      "! <p class="shorttext">Publish on SAP Business Accelerator Hub</p>
*      "! Indicates whether the inbound service is published on the
*      "! SAP Business Accelerator Hub
*      publish_api_hub                TYPE abap_bool,

    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Inbound Service</p>
    "! Inbound service of communication management
    BEGIN OF ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60,

      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,

      "! <p class="shorttext">Service Details</p>
      "! Protocol-specific details of the inbound service
      service_details     TYPE ty_service_details,

    END OF ty_main.

ENDINTERFACE.
