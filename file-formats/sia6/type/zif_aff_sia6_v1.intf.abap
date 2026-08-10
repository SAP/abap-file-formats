INTERFACE zif_aff_sia6_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Service</p>
    "! Service assignment
    BEGIN OF ty_service,

      "! <p class="shorttext">Service ID</p>
      "! ID of the service
      "! $required
      id                   TYPE c LENGTH 30,

      "! <p class="shorttext">Description</p>
      "! Service description text
      description          TYPE string,

      "! <p class="shorttext">Service Type</p>
      "! Type of the service
      type                 TYPE c LENGTH 2,

      "! <p class="shorttext">Related Service Name</p>
      "! Name of the related service
      rel_name             TYPE c LENGTH 40,

      "! <p class="shorttext">Related Service Type</p>
      "! Type of the related service
      rel_type             TYPE c LENGTH 10,

      "! <p class="shorttext">Related Service Type Text</p>
      "! Display text for the related service type
      rel_type_text        TYPE c LENGTH 80,

      "! <p class="shorttext">UI5 App ID Source</p>
      "! UI5 application identifier assigned as service source
      src_uiad             TYPE c LENGTH 32,

      "! <p class="shorttext">Transaction Code Source</p>
      "! Transaction code used as service source
      src_transaction_code TYPE c LENGTH 20,

    END OF ty_service.

  "! <p class="shorttext">Services</p>
  "! Service assignments
  TYPES ty_services TYPE STANDARD TABLE OF ty_service WITH DEFAULT KEY.

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
      id       TYPE c LENGTH 10,

      "! <p class="shorttext">Values</p>
      "! Authorization field value ranges
      values   TYPE ty_auth_field_values,

      "! <p class="shorttext">Status</p>
      "! Maintenance status of authorization field
      status   TYPE c LENGTH 2,

      "! <p class="shorttext">Is Activity Field</p>
      "! Indicates whether the field is an activity field
      is_actvt TYPE abap_bool,

      "! <p class="shorttext">Copied</p>
      "! Indicates whether the field was copied
      copied   TYPE c LENGTH 1,

    END OF ty_auth_field.

  "! <p class="shorttext">Authorization Fields</p>
  "! Authorization fields
  TYPES ty_auth_fields TYPE STANDARD TABLE OF ty_auth_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Instance</p>
    "! Authorization object instance
    BEGIN OF ty_auth,

      "! <p class="shorttext">UUID</p>
      "! Unique identifier of the authorization instance
      uuid           TYPE c LENGTH 32,

      "! <p class="shorttext">Authorization Object ID</p>
      "! ID of the authorization object
      "! $required
      auth_object_id TYPE c LENGTH 10,

      "! <p class="shorttext">Instance Number</p>
      "! Authorization object instance number
      "! $required
      number         TYPE n LENGTH 4,

      "! <p class="shorttext">IBS Source</p>
      "! Inbound service source
      src_ibs        TYPE c LENGTH 30,

      "! <p class="shorttext">IBS Source Type</p>
      "! Inbound service source type
      src_ibs_type   TYPE c LENGTH 2,

      "! <p class="shorttext">Status</p>
      "! Maintenance status of authorization instance
      status         TYPE c LENGTH 2,

      "! <p class="shorttext">Is Inactive</p>
      "! Indicates whether the authorization instance is inactive
      is_inactive    TYPE abap_bool,

      "! <p class="shorttext">Copied</p>
      "! Indicates whether the authorization instance was copied
      copied         TYPE c LENGTH 1,

      "! <p class="shorttext">Fields</p>
      "! Authorization field values of the instance
      fields         TYPE ty_auth_fields,

    END OF ty_auth.

  "! <p class="shorttext">Authorization Instances</p>
  "! Authorization object instances
  TYPES ty_auths TYPE STANDARD TABLE OF ty_auth WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Object</p>
    "! Authorization object entry with instances
    BEGIN OF ty_auth_object,

      "! <p class="shorttext">Authorization Object ID</p>
      "! ID of the authorization object
      "! $required
      id          TYPE c LENGTH 10,

      "! <p class="shorttext">Status</p>
      "! Maintenance status of authorization object
      status      TYPE c LENGTH 2,

      "! <p class="shorttext">Description</p>
      "! Description text of the authorization object
      description TYPE c LENGTH 60,

      "! <p class="shorttext">Authorization Instances</p>
      "! Authorization object instances
      auths       TYPE ty_auths,

    END OF ty_auth_object.

  "! <p class="shorttext">Authorization Objects</p>
  "! Authorization objects
  TYPES ty_auth_objects TYPE STANDARD TABLE OF ty_auth_object WITH DEFAULT KEY.

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
  TYPES ty_restriction_types TYPE STANDARD TABLE OF ty_restriction_type WITH DEFAULT KEY.

  TYPES:

    "! <p class="shorttext">IAM App</p>
    "! IAM App
    BEGIN OF ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version              TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                      TYPE zif_aff_types_v1=>ty_header_60,

      "! <p class="shorttext">Application Type</p>
      "! Type of the IAM application
      "! $required
      type                        TYPE c LENGTH 4,

      "! <p class="shorttext">UI5 App ID</p>
      "! UI5 application identifier linked to this IAM application
      uiad_id                     TYPE c LENGTH 32,

      "! <p class="shorttext">Transaction Code</p>
      "! Transaction code linked to this IAM application
      transaction_code            TYPE c LENGTH 20,

      "! <p class="shorttext">Scope Dependent</p>
      "! Indicates whether the application is scope-dependent
      is_scope_dependent          TYPE abap_bool,

      "! <p class="shorttext">Services</p>
      "! Service assignments for the application
      services                    TYPE ty_services,

      "! <p class="shorttext">Authorization Objects</p>
      "! Authorization default objects and values
      auth_objects                TYPE ty_auth_objects,

      "! <p class="shorttext">Restriction Types</p>
      "! Restriction types assigned to the application
      restriction_types           TYPE ty_restriction_types,

      "! <p class="shorttext">Publishing Status</p>
      "! Publishing status of the application
      publishing_status           TYPE c LENGTH 1,

      "! <p class="shorttext">Restriction Type Migration Status</p>
      "! Migration status for restriction types
      restriction_type_mig_status TYPE c LENGTH 1,

    END OF ty_main.

ENDINTERFACE.
