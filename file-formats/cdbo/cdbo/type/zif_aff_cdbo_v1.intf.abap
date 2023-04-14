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
    "! <p class="shorttext">CDBO Detail</p>
    "! CDBO detail
    BEGIN OF ty_field,
      "! <p class="shorttext">Name</p>
      "! Name
      "! $required
      name TYPE C LENGTH 30,
      "! <p class="shorttext">Nature</p>
      "! Nature
      "! $required
      nature TYPE ty_field_nature,
    END OF ty_field.

  TYPES:
    "! <p class="shorttext">Object Fields</p>
    "! Object Fields Table
    ty_fields TYPE STANDARD TABLE OF ty_field WITH DEFAULT KEY.

  TYPES:
  "! <p class="shorttext">General Information</p>
  "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Object Type</p>
      "! Object type
      "! $required
      object_type   TYPE ty_object_type,
      "! <p class="shorttext">Object Name</p>
      "! Object name
      "! $required
      object_name       TYPE C LENGTH 40,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Customer Data Browser Object</p>
    "! Customer Data Browser Object
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Fields and Field Nature</p>
      "! Fields and Field nature
      "! $required
      object_fields     TYPE ty_fields,
    END OF ty_main.

ENDINTERFACE.
