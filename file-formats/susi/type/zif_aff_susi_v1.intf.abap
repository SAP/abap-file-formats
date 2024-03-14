INTERFACE zif_aff_susi_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Maintenance Mode</p>
    "! Maintenance mode
    "! $values {@link zif_aff_susi_v1.data:co_maintenance_mode}
    "! $default {@link zif_aff_susi_v1.data:co_maintenance_mode.manual}
    ty_maintenance_mode   TYPE c LENGTH 1,
    "! <p class="shorttext">Maintenance Status</p>
    "! Maintenance status
    "! $values {@link zif_aff_susi_v1.data:co_maintenance_status}
    "! $default {@link zif_aff_susi_v1.data:co_maintenance_status.default_with_values}
    ty_maintenance_status TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Maintenance Mode</p>
    "! Maintenance mode
    BEGIN OF co_maintenance_mode,
      "! <p class="shorttext">Manual Maintenance</p>
      "! Manual maintenance
      manual                  TYPE ty_maintenance_mode VALUE space,
      "! <p class="shorttext">Automatic Maintenance (All Objects)</p>
      "! Automatic maintenance (all objects)
      automatic               TYPE ty_maintenance_mode VALUE 'A',
      "! <p class="shorttext">Automatic Maintenance (Basis Authorization Objects Only)</p>
      "! Automatic maintenance (basis authorization objects only)
      automatic_basis_objects TYPE ty_maintenance_mode VALUE 'B',
      "! <p class="shorttext">Application Does Not Require Default Values</p>
      "! Application does not require default values
      no_default_values       TYPE ty_maintenance_mode VALUE 'I',
      "! <p class="shorttext">Application Is Deprecated</p>
      "! Application is deprecated
      deprecated              TYPE ty_maintenance_mode VALUE 'D',
      "! <p class="shorttext">Application Is Obsolete</p>
      "! Application is obsolete
      obsolete                TYPE ty_maintenance_mode VALUE 'O',
    END OF co_maintenance_mode,

    "! <p class="shorttext">Maintenance Status</p>
    "! Maintenance status
    BEGIN OF co_maintenance_status,
      "! <p class="shorttext">No Default</p>
      "! No default
      no_default             TYPE ty_maintenance_status VALUE 'X',
      "! <p class="shorttext">Default With Field Values</p>
      "! Default with field values
      default_with_values    TYPE ty_maintenance_status VALUE 'Y',
      "! <p class="shorttext">Default Without Field Values</p>
      "! Default without field values
      default_without_values TYPE ty_maintenance_status VALUE 'V',
      "! <p class="shorttext">Default Inactive</p>
      "! Default inactive
      inactive_values        TYPE ty_maintenance_status VALUE 'I',
    END OF co_maintenance_status.

  TYPES:
    "! <p class="shorttext">Application Name</p>
    "! Name of application
    ty_appl_name   TYPE c LENGTH 132,
    "! <p class="shorttext">Application Type</p>
    "! Type of application
    ty_type        TYPE c LENGTH 80.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    "! $required
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Application Name</p>
      "! Application name of authorization defaults
      "! $required
      application_name TYPE ty_appl_name,
      "! <p class="shorttext">Application Type</p>
      "! Type of authorization defaults
      "! $required
      application_type TYPE ty_type,
      "! <p class="shorttext">Maintenance Mode</p>
      "! Maintenance mode
      "! $values {@link zif_aff_susi_v1.data:co_maintenance_mode}
      "! $default {@link zif_aff_susi_v1.data:co_maintenance_mode.manual}
      "! $showAlways
      maintenance_mode TYPE ty_maintenance_mode,
      "! <p class="shorttext">Documentation</p>
      "! Authorization default documentation for application
      documentation    TYPE string,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Authorization Value</p>
    "! Authorization Value
    ty_val TYPE c LENGTH 40,
    "! <p class="shorttext">Authorization Field</p>
    "! Authorization Field
    ty_field TYPE c LENGTH 10.

  TYPES:
    "! <p class="shorttext">Authorization Field Values </p>
    "! Authorization field values
    BEGIN OF ty_authorization_field,
      "! <p class="shorttext">Authorization Field</p>
      "! Authorization field
      field TYPE ty_field,
      "! <p class="shorttext">From</p>
      "! From value
      "! $showAlways
      low    TYPE ty_val,
      "! <p class="shorttext">To</p>
      "! To values
      high   TYPE ty_val,
    END OF ty_authorization_field.

  TYPES:
    "! <p class="shorttext">Authorization Fields</p>
    "! Authorization fields
    ty_authorization_fields  TYPE STANDARD TABLE OF ty_authorization_field  WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Object Details</p>
    "! Details of Authorization object
    BEGIN OF ty_authorization_object,
      "! <p class="shorttext">Object</p>
      "! Name of Authorization Object
      "! $required
      object             TYPE c LENGTH 10,
      "! <p class="shorttext">Maintenance Status</p>
      "! Maintenance Status
      "! $values {@link zif_aff_susi_v1.data:co_maintenance_status}
      "! $default {@link zif_aff_susi_v1.data:co_maintenance_status.default_with_values}
      "! $showAlways
      maintenance_status TYPE ty_maintenance_status,
      "! <p class="shorttext">Documentation</p>
      "! Authorization default documentation for object
      documentation      TYPE string,
      "! <p class="shorttext">Authorization Field Values</p>
      "! Authorization field values
      fields             TYPE ty_authorization_fields,
    END OF ty_authorization_object.

  TYPES:
  "! <p class="shorttext">Authorization Objects</p>
  "! Authorization objects
    ty_authorization_objects TYPE STANDARD TABLE OF ty_authorization_object WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">SUSI Object Type</p>
    "! Object type SUSI
    BEGIN OF  ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information   TYPE ty_general_information,
      "! <p class="shorttext">Authorization Objects</p>
      "! Authorization objects
      authorization_objects TYPE ty_authorization_objects,
    END OF ty_main.

ENDINTERFACE.
