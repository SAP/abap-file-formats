"! AFF Type for SUCO (Authorization Default Variant)
INTERFACE zif_aff_suco_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Leading Application</p>
    "! Leading application
    BEGIN OF ty_leading_application,
      "! <p class="shorttext">Program ID</p>
      "! Program ID
      "! $default 'R3TR'
      program_id   TYPE c LENGTH 4,
      "! <p class="shorttext">Object Type</p>
      "! Object type
      "! $required
      object_type  TYPE c LENGTH 4,
      "! <p class="shorttext">Object Name</p>
      "! Object name
      "! $required
      object_name  TYPE c LENGTH 40,
      "! <p class="shorttext">Service Type</p>
      "! Service type
      service_type TYPE c LENGTH 16,
      "! <p class="shorttext">Service Name</p>
      "! Service name
      service_name TYPE string,
    END OF ty_leading_application.

  TYPES:
    "! <p class="shorttext">Object Type SUCO (Authorization Default Variant)</p>
    "! Object type SUCO (authorization default variant)
    BEGIN OF  ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_80_cloud,
      "! <p class="shorttext">Leading Application</p>
      "! Leading application
      "! $required
      leading_application TYPE ty_leading_application,
    END OF ty_main.
ENDINTERFACE.
