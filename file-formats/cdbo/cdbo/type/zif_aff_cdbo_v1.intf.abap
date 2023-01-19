INTERFACE zif_aff_cdbo_v1
  PUBLIC.
  "! <p class="shorttext">Object Type</p>
  "! Object type
  "! $values {@link zif_aff_cdbo_v1.data:co_object_type}
  TYPES ty_object_type TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Object Type</p>
    "! Object type
    BEGIN OF co_object_type,
      "! <p class="shorttext">Tables</p>
      "! Tables
      tables    TYPE ty_object_type VALUE '01',
      "! <p class="shorttext">CDS Views</p>
      "! CDS views
      cds_views TYPE ty_object_type VALUE '02',
    END OF co_object_type.

  "! <p class="shorttext">CDS View Type</p>
  "! CDS view type
  "! $values {@link zif_aff_cdbo_v1.data:co_cds_type}
  "! $default {@link zif_aff_cdbo_v1.data:co_cds_type.basic}
  TYPES ty_cds_view_type TYPE c LENGTH 20.

  CONSTANTS:
    "! <p class="shorttext">CDS View Type</p>
    "! CDS View type
    BEGIN OF co_cds_type,
      "! <p class="shorttext">Basic</p>
      "! Basic
      basic       TYPE ty_cds_view_type VALUE 'BASIC',
      "! <p class="shorttext">Composite</p>
      "! Composite
      composite   TYPE ty_cds_view_type VALUE 'COMPOSITE',
      "! <p class="shorttext">Consumption</p>
      "! Consumption
      consumption TYPE ty_cds_view_type VALUE 'CONSUMPTION',
      "! <p class="shorttext">Extension</p>
      "! Extension
      extension   TYPE ty_cds_view_type VALUE 'EXTENSION',
    END OF co_cds_type.

  "! <p class="shorttext">CDS View Status</p>
  "! CDS view status
  "! $values {@link zif_aff_cdbo_v1.data:co_cds_view_status}
  "! $default {@link zif_aff_cdbo_v1.data:co_cds_view_status.released}
  TYPES ty_cds_view_status TYPE c LENGTH 60.

  CONSTANTS:
    "! <p class="shorttext">CDS View Status</p>
    "! CDS View type
    BEGIN OF co_cds_view_status,
      "! <p class="shorttext">Released</p>
      "! Released
      released TYPE ty_cds_view_status VALUE 'RELEASED',
      "! <p class="shorttext">Not Released</p>
      "! Not Realeased
      not_released    TYPE ty_cds_view_status VALUE ' ',
    END OF co_cds_view_status.

  "! <p class="shorttext">Field Nature</p>
  "! Nature of the field
  "! $values {@link zif_aff_cdbo_v1.data:co_field_nature}
  TYPES ty_field_nature TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Field Nature</p>
    "! Nature of the field
    BEGIN OF co_field_nature,
      "! <p class="shorttext">General fields that do not contain sensitive personal info.</p>
      "! General fields that do not contain sensitive personal info.
      general TYPE ty_field_nature VALUE 'GE',
      "! <p class="shorttext">Sensitive personal information fields including key fields</p>
      "! Sensitive personal information fields including key fields
      sensitive    TYPE ty_field_nature VALUE 'SP',
      "! <p class="shorttext">Non Business Information</p>
      "! Non business information
      non_business_information TYPE ty_field_nature VALUE 'NB',
    END OF co_field_nature.


  TYPES:
    "! <p class="shorttext">CDBO Details</p>
    "! CDBO deatils
    BEGIN OF ty_object_details,
      "! <p class="shorttext">Business Area</p>
      "! Business area to which the object belongs
      "! $required
      business_area         TYPE  c LENGTH 60,
      "! <p class="shorttext">Sub Business Area</p>
      "! Sub Business area to which the object belongs
      "! $required
      sub_business_area     TYPE  c LENGTH 60,
      "! <p class="shorttext">Application Component</p>
      "! Application component to which object belongs
      "! $required
      application_component TYPE c LENGTH 24,
      "! <p class="shorttext">CDS View Type</p>
      "! Type of the CDS View
      cds_view_type   TYPE ty_cds_view_type,
      "! <p class="shorttext">CDS View Status</p>
      "! Status of the CDS View
      cds_view_status TYPE ty_cds_view_status,
    END OF ty_object_details.

  TYPES:
    "! <p class="shorttext">CDBO Details</p>
    "! CDBO details
    BEGIN OF ty_field,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      "! $required
      field_name TYPE c LENGTH 30,
      "! <p class="shorttext">Field Nature</p>
      "! Field nature
      "! $required
      field_nature TYPE ty_field_nature,
    END OF ty_field.

  TYPES:
    "! <p class="shorttext">Object Fields</p>
    "! Object Fields Table
    ty_fields TYPE STANDARD TABLE OF ty_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Object Type CDBO</p>
    "! CDBO object type
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Object Type</p>
      "! Object type
      "! $required
      object_type   TYPE ty_object_type,
      "! <p class="shorttext">Object Name</p>
      "! Object name
      "! $required
      object_name       TYPE c LENGTH 40,
      "! <p class="shorttext">Object Details</p>
      "! Object details
      "! $required
      object_details    TYPE ty_object_details,
      "! <p class="shorttext">CDBO Fields</p>
      "! CDBO fields
      "! $required
      object_fields     TYPE ty_fields,

    END OF ty_main.

ENDINTERFACE.
