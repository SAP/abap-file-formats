INTERFACE zif_aff_saia_v1
  PUBLIC.

  "! <p class="shorttext">Object Type</p>
  "! Object type
  TYPES ty_wb_object_type     TYPE c LENGTH 4.
  "! <p class="shorttext">Object Subtype</p>
  "! Object sub-type
  TYPES ty_wb_object_sub_type TYPE c LENGTH 3.

  TYPES:
    "! <p class="shorttext">Object Type</p>
    "! Object type
    BEGIN OF ty_workbench_object_type,
      "! <p class="shorttext">Object Type</p>
      "! Object type
      workbench_object_type    TYPE ty_wb_object_type,
      "! <p class="shorttext">Object Subtype</p>
      "! Object subtype
      workbench_object_subtype TYPE ty_wb_object_sub_type,
    END OF ty_workbench_object_type.

  "! <p class="shorttext">Filter: Object Types</p>
  "! Filter for object types
  TYPES ty_workbench_object_types      TYPE SORTED TABLE OF ty_workbench_object_type WITH UNIQUE DEFAULT KEY.

  "! $values { @link zif_aff_saia_v1.data:co_number_of_focused_resources }
  "! $default { @link zif_aff_saia_v1.data:co_number_of_focused_resources.any }
  TYPES ty_number_of_focused_resources TYPE string.

  CONSTANTS:
    "! <p class="shorttext">Number of Focused Resources</p>
    "! Number of focused resources
    BEGIN OF co_number_of_focused_resources,
      "! <p class="shorttext">One</p>
      "! One
      exactly_one   TYPE ty_number_of_focused_resources VALUE 'EXACTLY_ONE',
      "! <p class="shorttext">At least One</p>
      "! At least one
      at_least_one  TYPE ty_number_of_focused_resources VALUE 'AT_LEAST_ONE',
      "! <p class="shorttext">At least Two</p>
      "! At least two
      more_than_one TYPE ty_number_of_focused_resources VALUE 'MORE_THAN_ONE',
      "! <p class="shorttext">Any</p>
      "! Any
      any           TYPE ty_number_of_focused_resources VALUE 'ANY',
    END OF co_number_of_focused_resources.

  TYPES:
    "! <p class="shorttext">Filter: Cardinality</p>
    "! Filtering of action according to specified applicable criteria.
    "! If filter is satisfied then the action is available and will be shown.
    "! $required
    BEGIN OF ty_filters,
      "! <p class="shorttext">Number of Focused Resources</p>
      "! Number of focused resources
      number_of_focused_resources TYPE ty_number_of_focused_resources,
      "! <p class="shorttext">Filter: Object Types</p>
      "! Filtering of action according to specified object types
      supported_dev_object_types  TYPE ty_workbench_object_types,
    END OF ty_filters.

  "! <p class="shorttext">Title</p>
  "! title
  TYPES ty_action_title TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">IDE Action</p>
    "! IDE action
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
    "! <p class="shorttext">IDE Action</p>
    "! IDE action (SAIA) v1
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
      "! <p class="shorttext">Filter: Cardinality</p>
      "! Filtering of application of action according to cardinality and object types
      filters             TYPE ty_filters,
    END OF ty_main.

ENDINTERFACE.
