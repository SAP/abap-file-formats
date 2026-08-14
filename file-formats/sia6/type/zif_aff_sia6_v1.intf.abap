INTERFACE zif_aff_sia6_v1
  PUBLIC.

  "! <p class="shorttext">Inbound Service Type</p>
  "! Type of the inbound service
  "! $values {@link zif_aff_sia6_v1.data:co_service_type }
  TYPES ty_service_type TYPE c LENGTH 10.

  "! <p class="shorttext">Authorization Object Status</p>
  "! Maintenance status of authorization objects
  "! $values {@link zif_aff_sia6_v1.data:co_auth_status }
  TYPES ty_auth_status  TYPE c LENGTH 2.

  "! <p class="shorttext">IAM App Type</p>
  "! Type of the IAM app
  "! $values {@link zif_aff_sia6_v1.data:co_app_type }
  TYPES ty_app_type     TYPE c LENGTH 4.

  "! <p class="shorttext">Restriction Type Migration Status</p>
  "! Migration status for restriction types
  "! $values {@link zif_aff_sia6_v1.data:co_mig_status }
  TYPES ty_mig_status   TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Inbound Service Type</p>
    "! Inbound service types
    BEGIN OF co_service_type,

      "! <p class="shorttext">OData V2</p>
      "! OData V2 service
      odata_v2               TYPE ty_service_type VALUE 'IWSV',

      "! <p class="shorttext">OData V2 (Deprecated)</p>
      "! OData V2 service (deprecated)
      odata_v2_deprecated    TYPE ty_service_type VALUE 'IWSG',

      "! <p class="shorttext">OData V4</p>
      "! OData V4 service
      odata_v4               TYPE ty_service_type VALUE 'G4BA',

      "! <p class="shorttext">HTTP Service</p>
      "! HTTP service
      http                   TYPE ty_service_type VALUE 'HTTP',

      "! <p class="shorttext">InA (Information Access) - UI</p>
      "! InA (Information Access) - UI
      ina_ui                 TYPE ty_service_type VALUE 'INA1',

      "! <p class="shorttext">SQL1 Service</p>
      "! SQL1 service
      sql1_service           TYPE ty_service_type VALUE 'SQL1',

    END OF co_service_type.

  CONSTANTS:
    "! <p class="shorttext">Authorization Object Status</p>
    "! Authorization object maintenance statuses
    BEGIN OF co_auth_status,

      "! <p class="shorttext">Standard</p>
      "! Standard
      standard   TYPE ty_auth_status VALUE 'S',

      "! <p class="shorttext">Maintained</p>
      "! Maintained
      maintained TYPE ty_auth_status VALUE 'G',

      "! <p class="shorttext">Changed</p>
      "! Changed
      changed    TYPE ty_auth_status VALUE 'M',

      "! <p class="shorttext">Updated</p>
      "! Updated
      updated    TYPE ty_auth_status VALUE 'U',

    END OF co_auth_status.

  CONSTANTS:
    "! <p class="shorttext">IAM App Type</p>
    "! IAM app types
    BEGIN OF co_app_type,

      "! <p class="shorttext">External App</p>
      "! External app
      external                  TYPE ty_app_type VALUE 'EXT',

      "! <p class="shorttext">Custom Inbound Service App</p>
      "! Custom inbound service app
      custom_inbound_service    TYPE ty_app_type VALUE 'IBS',

      "! <p class="shorttext">Business Configurations App</p>
      "! Business configurations app
      business_configurations   TYPE ty_app_type VALUE 'MBC',

      "! <p class="shorttext">Application Job Catalog Entry</p>
      "! Application job catalog entry
      app_job_catalog_entry     TYPE ty_app_type VALUE 'SAJC',

      "! <p class="shorttext">UI Adaptation App</p>
      "! UI adaptation app
      ui_adaptation             TYPE ty_app_type VALUE 'UI5A',

    END OF co_app_type.

  CONSTANTS:
    "! <p class="shorttext">Restriction Type Migration Status</p>
    "! Restriction type migration statuses
    BEGIN OF co_mig_status,

      "! <p class="shorttext">Not Migrated</p>
      "! Not migrated
      not_migrated TYPE ty_mig_status VALUE '',

      "! <p class="shorttext">Migrated</p>
      "! Migrated
      migrated     TYPE ty_mig_status VALUE '3',

    END OF co_mig_status.

  TYPES:
    "! <p class="shorttext">Service</p>
    "! Service assignment
    BEGIN OF ty_service,

      "! <p class="shorttext">Service Name</p>
      "! Name of the service
      "! $required
      name                    TYPE c LENGTH 40,

      "! <p class="shorttext">Description</p>
      "! Service description text
      description             TYPE string,

      "! <p class="shorttext">Service Type</p>
      "! Type of the service
      "! $required
      type                    TYPE ty_service_type,

      "! <p class="shorttext">Service ID</p>
      "! ID of the underlying service
      service_id              TYPE c LENGTH 30,

      "! <p class="shorttext">Launchpad App Descriptor Item ID Source</p>
      "! Launchpad app descriptor item assigned as service source
      uiad_id_source          TYPE c LENGTH 32,

      "! <p class="shorttext">Transaction Code Source</p>
      "! Transaction code used as service source
      transaction_code_source TYPE c LENGTH 20,

    END OF ty_service.

  "! <p class="shorttext">Services</p>
  "! Service assignments
  TYPES ty_services TYPE SORTED TABLE OF ty_service WITH UNIQUE KEY name type.

  TYPES:
    "! <p class="shorttext">Authorization Field Value Range</p>
    "! Authorization field value range
    BEGIN OF ty_auth_field_value,

      "! <p class="shorttext">Low Value</p>
      "! Low value
      low_value  TYPE c LENGTH 40,

      "! <p class="shorttext">High Value</p>
      "! High value
      high_value TYPE c LENGTH 40,

    END OF ty_auth_field_value.

  "! <p class="shorttext">Authorization Field Values</p>
  "! Authorization field values
  TYPES ty_auth_field_values TYPE STANDARD TABLE OF ty_auth_field_value WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Field</p>
    "! Authorization field with values
    BEGIN OF ty_auth_field,

      "! <p class="shorttext">Field ID</p>
      "! ID of the authorization field
      "! $required
      id          TYPE c LENGTH 10,

      "! <p class="shorttext">Values</p>
      "! Authorization field value ranges
      values      TYPE ty_auth_field_values,

      "! <p class="shorttext">Status</p>
      "! Maintenance status of authorization field
      status      TYPE ty_auth_status,

      "! <p class="shorttext">Is Activity Field</p>
      "! Indicates whether the field is an activity field
      is_activity TYPE abap_bool,

    END OF ty_auth_field.

  "! <p class="shorttext">Authorization Fields</p>
  "! Authorization fields
  TYPES ty_auth_fields TYPE SORTED TABLE OF ty_auth_field WITH UNIQUE KEY id.

  TYPES:
    "! <p class="shorttext">Authorization Instance</p>
    "! Authorization object instance
    BEGIN OF ty_auth,

      "! <p class="shorttext">Authorization Object ID</p>
      "! ID of the authorization object
      "! $required
      authorization_object_id TYPE c LENGTH 10,

      "! <p class="shorttext">Instance Number</p>
      "! Authorization object instance number
      "! $required
      number                  TYPE n LENGTH 4,

      "! <p class="shorttext">Service ID Source</p>
      "! Service ID source
      service_id_source       TYPE c LENGTH 30,

      "! <p class="shorttext">Status</p>
      "! Maintenance status of authorization instance
      status                  TYPE ty_auth_status,

      "! <p class="shorttext">Is Inactive</p>
      "! Indicates whether the authorization instance is inactive
      is_inactive             TYPE abap_bool,

      "! <p class="shorttext">Fields</p>
      "! Authorization field values of the instance
      fields                  TYPE ty_auth_fields,

    END OF ty_auth.

  "! <p class="shorttext">Authorization Instances</p>
  "! Authorization object instances
  TYPES ty_auths TYPE SORTED TABLE OF ty_auth WITH UNIQUE KEY authorization_object_id number.

  TYPES:
    "! <p class="shorttext">Authorization Object</p>
    "! Authorization object entry with instances
    BEGIN OF ty_auth_object,

      "! <p class="shorttext">Authorization Object ID</p>
      "! ID of the authorization object
      "! $required
      id             TYPE c LENGTH 10,

      "! <p class="shorttext">Status</p>
      "! Maintenance status of authorization object
      status         TYPE ty_auth_status,

      "! <p class="shorttext">Description</p>
      "! Description text of the authorization object
      description    TYPE c LENGTH 60,

      "! <p class="shorttext">Authorization Instances</p>
      "! Authorization object instances
      authorizations TYPE ty_auths,

    END OF ty_auth_object.

  "! <p class="shorttext">Authorization Objects</p>
  "! Authorization objects
  TYPES ty_auth_objects TYPE SORTED TABLE OF ty_auth_object WITH UNIQUE KEY id.

  TYPES:
    "! <p class="shorttext">Restriction Type</p>
    "! Restriction type assigned to the application
    BEGIN OF ty_restriction_type,

      "! <p class="shorttext">Restriction Type ID</p>
      "! ID of the assigned restriction type
      "! $required
      id           TYPE c LENGTH 30,

      "! <p class="shorttext">Description</p>
      "! Description text of the restriction type
      description  TYPE c LENGTH 80,

      "! <p class="shorttext">Write Access</p>
      "! Indicates whether write access restriction is active
      write_access TYPE abap_bool,

      "! <p class="shorttext">Read Access</p>
      "! Indicates whether read access restriction is active
      read_access  TYPE abap_bool,

      "! <p class="shorttext">F4 Access</p>
      "! Indicates whether F4 value help access restriction is active
      f4_access    TYPE abap_bool,

    END OF ty_restriction_type.

  "! <p class="shorttext">Restriction Types</p>
  "! Restriction types assigned to the application
  TYPES ty_restriction_types TYPE SORTED TABLE OF ty_restriction_type WITH UNIQUE KEY id.

  TYPES:

    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,

      "! <p class="shorttext">App Type</p>
      "! Type of the IAM app
      "! $required
      app_type                    TYPE ty_app_type,

      "! <p class="shorttext">Launchpad App Descriptor Item ID</p>
      "! Launchpad app descriptor item linked to this IAM app
      uiad_id                     TYPE c LENGTH 32,

      "! <p class="shorttext">Transaction Code</p>
      "! Transaction code linked to this IAM app
      transaction_code            TYPE c LENGTH 20,

      "! <p class="shorttext">Scope Dependent</p>
      "! Indicates whether the application is scope-dependent
      is_scope_dependent          TYPE abap_bool,

      "! <p class="shorttext">Restriction Type Migration Status</p>
      "! Migration status for restriction types
      restriction_type_mig_status TYPE ty_mig_status,

    END OF ty_general_information.

  TYPES:

    "! <p class="shorttext">IAM App</p>
    "! IAM App
    BEGIN OF ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60,

      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information   TYPE ty_general_information,

      "! <p class="shorttext">Services</p>
      "! Service assignments for the application
      services              TYPE ty_services,

      "! <p class="shorttext">Authorization Objects</p>
      "! Authorization default objects and values
      authorization_objects TYPE ty_auth_objects,

      "! <p class="shorttext">Restriction Types</p>
      "! Restriction types assigned to the application
      restriction_types     TYPE ty_restriction_types,

    END OF ty_main.

ENDINTERFACE.
