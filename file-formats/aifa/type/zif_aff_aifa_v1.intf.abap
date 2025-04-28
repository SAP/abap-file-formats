INTERFACE zif_aff_aifa_v1
   PUBLIC.

  "! $values { @link zif_aff_aifa_v1.data:co_error_handling }
  "! $default { @link zif_aff_aifa_v1.data:co_error_handling.ignore_data }
  TYPES ty_error_handling_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_error_handling,
      "! <p class="shorttext">Treat As Error</p>
      "! Treat as error if check is not successful
      trigger_error TYPE c LENGTH 1 VALUE '',
      "! <p class="shorttext">Ignore Data</p>
      "! Ignore data if check is not successful
      ignore_data   TYPE c LENGTH 1 VALUE 'I',
    END OF co_error_handling.

  TYPES:
    "! <p class="shorttext">Field To Check</p>
    "! Field to check
    BEGIN OF ty_field_to_check,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      name TYPE string,
    END OF ty_field_to_check,
    "! <p class="shorttext">Fields To Check</p>
    "! Fields to check
    ty_fields_to_check TYPE STANDARD TABLE OF ty_field_to_check WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      "! $required
      namespace           TYPE c LENGTH 15,
      "! <p class="shorttext">AIF Action</p>
      "! AIF action
      "! $required
      aif_action          TYPE c LENGTH 20,
      "! <p class="shorttext">Main Component Type</p>
      "! Main component type
      main_component_type TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Class</p>
      "! Class
      class               TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information,

    "! <p class="shorttext">Check Details</p>
    "! Check details
    BEGIN OF ty_check_details,
      "! <p class="shorttext">Check</p>
      "! Check
      "! $required
      check_obj_name  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Numeric ID</p>
      "! Numeric id
      "! $required
      numeric_id      TYPE n LENGTH 3,
      "! <p class="shorttext">Check Behavior</p>
      "! Check behavior
      check_behaviour TYPE ty_error_handling_type,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      field_name      TYPE ty_fields_to_check,
    END OF ty_check_details,
    "! <p class="shorttext">Check Data</p>
    "! Check data
    ty_checks TYPE STANDARD TABLE OF ty_check_details WITH DEFAULT KEY,

    "! <p class="shorttext">Field To Restore</p>
    "! Field to restore
    BEGIN OF ty_field_to_restore,
      "! <p class="shorttext">Name</p>
      "! Name
      name TYPE string,
    END OF ty_field_to_restore,
    "! <p class="shorttext">Fields To Restore</p>
    "! Fields to restore
    ty_fields_to_restore TYPE STANDARD TABLE OF ty_field_to_restore WITH DEFAULT KEY,

    "! <p class="shorttext">Action</p>
    "! Action
    BEGIN OF ty_main,
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
      "! <p class="shorttext">Fields To Restore</p>
      "! Fields to restore
      field_restore       TYPE ty_fields_to_restore,
      "! <p class="shorttext">Checks</p>
      "! Checks
      check_data          TYPE ty_checks,
    END OF ty_main.

ENDINTERFACE.
