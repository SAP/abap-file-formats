INTERFACE zif_aff_aifa_v1
   PUBLIC.

  "! $values { @link zif_aff_aifa_v1.data:co_field_type }
  "! $default { @link zif_aff_aifa_v1.data:co_field_type.source_structure }
  TYPES ty_field_type TYPE c LENGTH 5.
  CONSTANTS:
    BEGIN OF co_field_type,
      "! <p class="shorttext">Source Structure</p>
      "! Field is in source structure
      source_structure      TYPE c LENGTH 5 VALUE 'SRC_S',
      "! <p class="shorttext">Destination Structure</p>
      "! Field is in desctination structure
      destination_structure TYPE c LENGTH 5 VALUE 'DST_S',
      "! <p class="shorttext">Constant</p>
      "! Field is constant value
      constant              TYPE c LENGTH 5 VALUE 'CONST',
      "! <p class="shorttext">System Field</p>
      "! Field is system field
      system_field          TYPE c LENGTH 5 VALUE 'SYSTF',
      "! <p class="shorttext">Sending System</p>
      "! Field is in sending systemte
      sending_system        TYPE c LENGTH 5 VALUE 'SND_S',
      "! <p class="shorttext">Current Line Number</p>
      "! Field is current line number
      current_line_number   TYPE c LENGTH 5 VALUE 'LINEN',
      "! <p class="shorttext">Hierarchical Mapping</p>
      "! Fieldpath is starting from a parant node
      hierarchical_mapping  TYPE c LENGTH 5 VALUE 'MAP_H',
    END OF co_field_type.

  "! $values { @link zif_aff_aifa_v1.data:co_error_handling_type }
  "! $default { @link zif_aff_aifa_v1.data:co_error_handling_type.ignore_data }
  TYPES ty_error_handling_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_error_handling_type,
      "! <p class="shorttext">Treat As Error</p>
      "! Treat as error if check is not successful
      treat_as_error TYPE c LENGTH 1 VALUE '',
      "! <p class="shorttext">Ignore Data</p>
      "! Ignore data if check is not successful
      ignore_data    TYPE c LENGTH 1 VALUE 'I',
    END OF co_error_handling_type.

  TYPES:
    "! <p class="shorttext">Fields To Check</p>
    "! Field to check
    BEGIN OF ty_field_to_check,
      "! <p class="shorttext">Type</p>
      "! Type
      type TYPE ty_field_type,
      "! <p class="shorttext">Name/Value</p>
      "! Name/Value
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
      "! <p class="shorttext">Implementing Class</p>
      "! Implementing class
      implementing_class  TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information,

    "! <p class="shorttext">Check Details</p>
    "! Check details
    BEGIN OF ty_check_details,
      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      id              TYPE n LENGTH 3,
      "! <p class="shorttext">Check</p>
      "! Check
      "! $required
      check           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Check Behavior</p>
      "! Check behavior
      check_behaviour TYPE ty_error_handling_type,
      "! <p class="shorttext">Fields</p>
      "! Fields
      fields          TYPE ty_fields_to_check,
    END OF ty_check_details,
    "! <p class="shorttext">Checks</p>
    "! Checks
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
      fields_to_restore   TYPE ty_fields_to_restore,
      "! <p class="shorttext">Checks</p>
      "! Checks
      checks              TYPE ty_checks,
    END OF ty_main.

ENDINTERFACE.
