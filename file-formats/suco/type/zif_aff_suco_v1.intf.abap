INTERFACE zif_aff_suco_v1
  PUBLIC.

  "! <p class="shorttext">Application Default Variant Name</p>
  "! Name of authorization default variant
  TYPES ty_var_name TYPE c LENGTH 40.

  "! <p class="shorttext">Language Key</p>
  "! Language key
  TYPES ty_language TYPE c LENGTH 1.

  "! <p class="shorttext">Short Text</p>
  "! Short text of the authorization default variant
  TYPES ty_text     TYPE c LENGTH 80.

    "! <p class="shorttext">Program ID of the referenced Object</p>
  "! Program ID of the referenced object
  TYPES ty_refpgm_id    TYPE c LENGTH 4.

  "! <p class="shorttext">Object Type of the referenced object</p>
  "! Object type of the referenced object
  TYPES ty_refobj_type  TYPE c LENGTH 4.

  "! <p class="shorttext">Object Name of the referenced Object</p>
  "! Object name of the referenced object
  TYPES ty_refobj_name  TYPE c LENGTH 40.

  "! <p class="shorttext">Type of the referenced external Service</p>
  "! Type of the referenced external service
  TYPES ty_refserv_type TYPE c LENGTH 16.

  "! <p class="shorttext">Name of the referenced external Service</p>
  "! Name of the referenced external service
  TYPES ty_refserv_name TYPE string.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    "! $required
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Application Default Variant Name</p>
      "! Name of the authorization default variant
      variant_name TYPE ty_var_name,
      "! <p class="shorttext">Language Key for Short Text</p>
      "! Language key for short text
      language_key TYPE ty_language,
      "! <p class="shorttext">Short Text</p>
      "! Short text of the authorization default variant
      variant_text TYPE ty_text,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Leading Application</p>
    "! Leading application
    BEGIN OF ty_leading_application,
      "! <p class="shorttext">Program ID</p>
      "! Program ID
      "! $required
      referred_object_program_id TYPE ty_refpgm_id,
      "! <p class="shorttext">Object Type</p>
      "! Object type
      "! $required
      referred_object_type       TYPE ty_refobj_type,
      "! <p class="shorttext">Object Name</p>
      "! Object name
      "! $required
      referred_object_name       TYPE ty_refobj_name,
      "! <p class="shorttext">Service Type</p>
      "! Service type
      referred_service_type      TYPE ty_refserv_type,
      "! <p class="shorttext">Service Name</p>
      "! Service name
      referred_service_name      TYPE ty_refserv_name,
    END OF ty_leading_application.

  TYPES:
    "! <p class="shorttext">SUCO Object Type</p>
    "! Object type SUCO
    BEGIN OF  ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Leading Application</p>
      "! Leading application
      "! $required
      leading_application TYPE ty_leading_application,
    END OF ty_main.
ENDINTERFACE.
