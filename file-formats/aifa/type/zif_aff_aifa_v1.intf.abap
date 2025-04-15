INTERFACE zif_aff_aifa_v1
   PUBLIC.

  CONSTANTS:
    BEGIN OF co_error_handling,
      "! <p class="shorttext">Treat As An Error</p>
      "! Treat as error if check in not successful
      trigger_error TYPE c LENGTH 1 VALUE '',
      "! <p class="shorttext">Ignore Data</p>
      "! Ignore data if check is not successful
      ignore_data   TYPE c LENGTH 1 VALUE 'I',
    END OF co_error_handling.

  TYPES:
    "! $values { @link zif_aff_aifa_v1.data:co_error_handling }
    "! $default { @link zif_aff_aifa_v1.data:co_error_handling.ignore_data }
    error_handling_type TYPE c LENGTH 1,

    "! <p class="shorttext">Field To Check</p>
    "! Field to check
    BEGIN OF ty_fields_check,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      field_name TYPE c LENGTH 255,
    END OF ty_fields_check,
    "! <p class="shorttext">Fields To Restore</p>
    "! Fields to restore
    tty_fields_check TYPE STANDARD TABLE OF ty_fields_check WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      "! $required
      namespace      TYPE c LENGTH 15,
      "! <p class="shorttext">AIF Action</p>
      "! AIF action
      "! $required
      aif_action     TYPE c LENGTH 20,
      "! <p class="shorttext">Main Component Type</p>
      "! Main component type
      main_comp_type TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Class</p>
      "! Class
      class          TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information,

    "! <p class="shorttext">Check Data</p>
    "! Check data
    BEGIN OF ty_check_data,
      "! <p class="shorttext">Number</p>
      "! Number
      "! $required
      number         TYPE n LENGTH 3,
      "! <p class="shorttext">Check</p>
      "! (type /AIF/CHECK_OBJ_NAME )
      "! Check
      "! $required
      check_obj_name TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Behavior</p>
      "! Check behavior
      check_ignore   TYPE error_handling_type,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      field_name     TYPE tty_fields_check,
    END OF ty_check_data,
    tty_check_data TYPE STANDARD TABLE OF ty_check_data WITH DEFAULT KEY,

    "! <p class="shorttext">Field To Restore</p>
    "! Field to restore
    BEGIN OF ty_fields_restore,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      field_name TYPE c LENGTH 255,
    END OF ty_fields_restore,
    "! <p class="shorttext">Fields To Restore</p>
    "! Fields to restore
    tty_fields_restore TYPE STANDARD TABLE OF ty_fields_restore WITH DEFAULT KEY,

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
      "! <p class="shorttext">Fields To Restore Assignment</p>
      "! Fields to restore assignment
      field_restore       TYPE tty_fields_restore,
      "! <p class="shorttext">Checks Assignment</p>
      "! Checks assignment
      check_data          TYPE tty_check_data,
    END OF ty_main.
ENDINTERFACE.
