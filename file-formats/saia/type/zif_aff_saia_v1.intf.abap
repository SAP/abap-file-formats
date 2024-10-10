INTERFACE zif_aff_saia_v1
  PUBLIC.

  "! <p class="shorttext">Workbench Object Type</p>
  "! Workbench object type
  TYPES ty_wb_object_type     TYPE c LENGTH 4.
  "! <p class="shorttext">Workbench Object Sub-Type</p>
  "! Workbench object sub-type
  TYPES ty_wb_object_sub_type TYPE c LENGTH 3.

  TYPES:
    "! <p class="shorttext">Workbench Object Type</p>
    "! Workbench object type
    BEGIN OF ty_workbench_object_type,
      "! <p class="shorttext">Workbench Object Type</p>
      "! Workbench object type
      workbench_object_type       TYPE ty_wb_object_type,
      "! <p class="shorttext">Workbench Object Sub-Type</p>
      "! Workbench object sub-type
      workbench_object_subtype_wb TYPE ty_wb_object_sub_type,
    END OF ty_workbench_object_type.

  "! <p class="shorttext">Workbench Object Types</p>
  "! Workbench object types
  TYPES ty_workbench_object_types      TYPE SORTED TABLE OF ty_workbench_object_type WITH UNIQUE DEFAULT KEY.

  "! $values { @link zif_aff_saia_v1.data:co_number_of_focused_resources }
  "! $default { @link zif_aff_saia_v1.data:co_number_of_focused_resources.any }
  TYPES ty_number_of_focused_resources TYPE string.

  CONSTANTS:
    "! <p class="shorttext">Number of Focused Resources</p>
    "! Number of focused resources
    BEGIN OF co_number_of_focused_resources,
      "! <p class="shorttext">Any</p>
      "! Any
      any           TYPE ty_number_of_focused_resources VALUE 'ANY',
      "! <p class="shorttext">Exactly One</p>
      "! Exactly one
      exactly_one   TYPE ty_number_of_focused_resources VALUE 'EXACTLY_ONE',
      "! <p class="shorttext">At Least One</p>
      "! At least one
      at_least_one  TYPE ty_number_of_focused_resources VALUE 'AT_LEAST_ONE',
      "! <p class="shorttext">More Than One</p>
      "! More than one
      more_than_one TYPE ty_number_of_focused_resources VALUE 'MORE_THAN_ONE',
    END OF co_number_of_focused_resources.

  TYPES:
    "! <p class="shorttext">Action Filter</p>
    "! Filtering of action according to specified applicable criteria.
    "! If filter is satisfied then the action is available and will be shown.
    "! $required
    BEGIN OF ty_filters,
      "! <p class="shorttext">Number of Focused Resources</p>
      "! Number of focused resources
      number_of_focused_resources TYPE ty_number_of_focused_resources,
      "! <p class="shorttext">Supported Workbench Object Types</p>
      "! Supported workbench object types
      supported_dev_object_types  TYPE ty_workbench_object_types,
    END OF ty_filters.

  "! <p class="shorttext">Action Title</p>
  "! Action title
  TYPES ty_action_title TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">ADT IDE Action</p>
    "! ADT IDE action
    "! $required
    BEGIN OF ty_adt_saia_object,
      "! <p class="shorttext">Title</p>
      "! Title
      "! $required
      title                        TYPE ty_action_title,
      "! <p class="shorttext">Summary</p>
      "! What is the action doing and how can it be used
      "! $required
      summary                      TYPE string,
      "! <p class="shorttext">Implementing Class</p>
      "! Implementing class for handling the action input. Needs to implement interface  {@link if_aia_action }.
      implementing_class           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Input UI Configuration Class</p>
      "! Input UI configuration class for implementing the server-driven UI input configuration.
      "! Needs to implement interface {@link IF_AIA_SD_ACTION_INPUT }.
      input_ui_configuration_class TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_adt_saia_object.

  TYPES:
    "! <p class="shorttext">ADT IDE Action</p>
    "! ADT IDE action (SAIA) v1
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_100,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_adt_saia_object,
      "! <p class="shorttext">Action Filters</p>
      "! Filters for application of action according to specific object type or object type groups
      filters             TYPE ty_filters,
    END OF ty_main.

ENDINTERFACE.
