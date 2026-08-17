INTERFACE zif_aff_sush_v1
  PUBLIC.


  "! <p class="shorttext">Application Name</p>
  "! Application name of authorization defaults
  TYPES ty_application_name TYPE c LENGTH 132.

  "! <p class="shorttext">Application Type</p>
  "! Type of authorization defaults (on-premise: up to 80 chars, cloud: object type up to 4 chars)
  TYPES ty_application_type TYPE c LENGTH 80.

  "! <p class="shorttext">Documentation</p>
  "! Authorization default documentation
  TYPES ty_documentation TYPE string.

  "! $values {@link zif_aff_sush_v1.data:co_maintenance_mode}
  "! $default {@link zif_aff_sush_v1.data:co_maintenance_mode.manual}
  TYPES ty_maintenance_mode TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Maintenance Mode</p>
    "! Maintenance modes for applications define how applications can be modified.
    "! Used on on-premise systems only.
    BEGIN OF co_maintenance_mode,
      "! <p class="shorttext">Manual Maintenance</p>
      "! This mode is appropriate as long as maintenance of default data has not been completed yet.
      "! New objects whose check has been detected by the authorization trace are added
      "! to the object list in change mode with the maintenance status Not maintained.
      manual                  TYPE ty_maintenance_mode VALUE space,
      "! <p class="shorttext">Automatic Maintenance (All Objects)</p>
      "! In change mode, all authorization objects added from the authorization trace are
      "! automatically assigned the default status No Default.
      automatic               TYPE ty_maintenance_mode VALUE 'A',
      "! <p class="shorttext">Automatic Maintenance (Basis Authorization Objects Only)</p>
      "! Only authorization objects from the application areas Basis (S_*) and HR (P_* and PLOG) are
      "! automatically added with the default status No Default.
      "! All other new objects are given the status Unmaintained, which must be changed.
      automatic_basis_objects TYPE ty_maintenance_mode VALUE 'B',
      "! <p class="shorttext">Application Does Not Require Default Values</p>
      "! This mode is given to all applications for whose execution only the start authorization is required.
      no_default_values       TYPE ty_maintenance_mode VALUE 'I',
      "! <p class="shorttext">Application Is Deprecated</p>
      "! It is used to classify applications that are not being developed any more but that can still be used.
      deprecated              TYPE ty_maintenance_mode VALUE 'D',
      "! <p class="shorttext">Application Is Obsolete</p>
      "! This mode is used to classify applications that are not being developed any more and because of
      "! this do not meet important functional requirements or are not needed any more.
      obsolete                TYPE ty_maintenance_mode VALUE 'O',
    END OF co_maintenance_mode.

  "! $values {@link zif_aff_sush_v1.data:co_default_values_required}
  "! $default {@link zif_aff_sush_v1.data:co_default_values_required.no}
  TYPES ty_default_values_required TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Default Values Required</p>
    "! Indicates that no authorization defaults are defined.
    "! Used on cloud systems only.
    BEGIN OF co_default_values_required,
      "! <p class="shorttext">Yes</p>
      "! Default values are required
      yes TYPE ty_default_values_required VALUE '1',
      "! <p class="shorttext">No</p>
      "! Default values are not required
      no  TYPE ty_default_values_required VALUE '0',
    END OF co_default_values_required.

  TYPES:
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Name</p>
      "! Name of the authorization default
      "! $required
      name                    TYPE ty_application_name,
      "! <p class="shorttext">Type</p>
      "! Type of authorization defaults
      "! $required
      type                    TYPE ty_application_type,
      "! <p class="shorttext">Application Name</p>
      "! Display name of the authorization default
      "! $required
      application_name        TYPE ty_application_name,
      "! <p class="shorttext">Application Type</p>
      "! Object type of the authorization default
      "! $required
      application_type        TYPE ty_application_type,
      "! <p class="shorttext">Maintenance Mode</p>
      "! Maintenance modes for applications define how applications can be modified
      "! Used on on-premise systems only.
      maintenance_mode        TYPE ty_maintenance_mode,
      "! <p class="shorttext">Default Values Required</p>
      "! Indicates that no authorization defaults are defined.
      "! Used on cloud systems only.
      default_values_required TYPE ty_default_values_required,
      "! <p class="shorttext">Documentation</p>
      "! Authorization defaults documentation for application.
      documentation           TYPE ty_documentation,
    END OF ty_general_information.

  "! <p class="shorttext">Authorization Object</p>
  "! Name of authorization object
  TYPES ty_auth_object_name TYPE c LENGTH 10.

  "! <p class="shorttext">Authorization Object Text</p>
  "! Description of the authorization object
  TYPES ty_auth_object_text TYPE c LENGTH 60.

  "! $values {@link zif_aff_sush_v1.data:co_maintenance_status}
  "! $default {@link zif_aff_sush_v1.data:co_maintenance_status.default_with_values}
  TYPES ty_maintenance_status TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Maintenance Status</p>
    "! The maintenance status of an authorization object controls if AUTHORITY-CHECK runs for it
    "! in its application and whether an authorization default is added to a data of role
    "! by the profile generator when the app is in the role menu.
    BEGIN OF co_maintenance_status,
      "! <p class="shorttext">Undefined</p>
      "! The maintenance status is undefined and must be specified.
      undefined              TYPE ty_maintenance_status VALUE ' ',
      "! <p class="shorttext">No Default</p>
      "! This status is given to all objects that are not required for the execution
      "! of functions in the application.
      no_default             TYPE ty_maintenance_status VALUE 'X',
      "! <p class="shorttext">Default With Field Values</p>
      "! This default status is assigned to all objects that are used to protect functions
      "! within the associated application and for which the delivery of fixed values in one
      "! or more authorization fields would help to simplify authorization maintenance in roles.
      default_with_values    TYPE ty_maintenance_status VALUE 'Y',
      "! <p class="shorttext">Default Without Field Values</p>
      "! This status is suitable for objects whose authorizations are required for using an application,
      "! but all of whose authorization fields have to be maintained by the role administrator
      "! with customer-specific values.
      default_without_values TYPE ty_maintenance_status VALUE 'V',
      "! <p class="shorttext">Default Inactive</p>
      "! For objects with this status, the authorization check always returns the value sy-subrc = 0
      "! regardless of which authorizations the user actually has.
      inactive_values        TYPE ty_maintenance_status VALUE 'I',
      "! <p class="shorttext">No Authorization Check</p>
      "! No authorization check is performed for this object.
      "! Used on cloud systems only.
      no_authorization_check TYPE ty_maintenance_status VALUE 'N',
    END OF co_maintenance_status.

  "! <p class="shorttext">Authorization Field</p>
  "! Authorization field name
  TYPES ty_auth_field TYPE c LENGTH 10.

  "! <p class="shorttext">Authorization Value</p>
  "! Authorization value
  TYPES ty_auth_value TYPE c LENGTH 40.

  TYPES:
    "! <p class="shorttext">Value Range</p>
    "! Authorization field value range
    BEGIN OF ty_value_range,
      "! <p class="shorttext">From</p>
      "! From value
      "! $showAlways
      low  TYPE ty_auth_value,
      "! <p class="shorttext">To</p>
      "! To value
      high TYPE ty_auth_value,
    END OF ty_value_range.
  TYPES ty_value_range_t TYPE STANDARD TABLE OF ty_value_range WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Field Values</p>
    "! Authorization field with value ranges
    BEGIN OF ty_field_values,
      "! <p class="shorttext">Authorization Field</p>
      "! Name of the authorization field
      "! $required
      field  TYPE ty_auth_field,
      "! <p class="shorttext">Values</p>
      "! Authorization field value ranges
      values TYPE ty_value_range_t,
    END OF ty_field_values.
  TYPES ty_field_values_t TYPE STANDARD TABLE OF ty_field_values WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Object Details</p>
    "! Authorization default values define which authorization objects and field values are automatically
    "! proposed when creating roles, simplifying role maintenance and ensuring consistent security
    "! settings across users and roles.
    BEGIN OF ty_authorization_object,
      "! <p class="shorttext">Object</p>
      "! Name of the authorization object
      "! $required
      object_name        TYPE ty_auth_object_name,
      "! <p class="shorttext">Object Text</p>
      "! Description of the authorization object
      object_text        TYPE ty_auth_object_text,
      "! <p class="shorttext">Maintenance Status</p>
      "! The maintenance status of an authorization object controls if AUTHORITY-CHECK runs for
      "! it in its application and whether an authorization default is added to a data of role
      "! by the profile generator when the app is in the role menu.
      maintenance_status TYPE ty_maintenance_status,
      "! <p class="shorttext">Documentation</p>
      "! Authorization default documentation for object
      documentation      TYPE ty_documentation,
      "! <p class="shorttext">Authorization Field Values</p>
      "! Authorization field values
      fields             TYPE ty_field_values_t,
    END OF ty_authorization_object.
  TYPES ty_authorization_objects_t TYPE STANDARD TABLE OF ty_authorization_object WITH KEY object_name.

  TYPES:
    "! <p class="shorttext">Authorization Default Properties</p>
    "! Authorization default (SUSH) properties
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
      "! <p class="shorttext">Authorization Objects</p>
      "! Authorization objects with maintenance status and field values
      authorization_objects TYPE ty_authorization_objects_t,
    END OF ty_main.

ENDINTERFACE.
