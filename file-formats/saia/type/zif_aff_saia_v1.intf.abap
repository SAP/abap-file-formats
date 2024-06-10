INTERFACE zif_aff_saia_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Resource Type</p>
    "! Resource type
    BEGIN OF ty_resource_type,
      "! <p class="shorttext">Category Scheme</p>
      "! Category scheme
      category_scheme TYPE string,
      "! <p class="shorttext">Category Term</p>
      "! Category term
      category_term   TYPE string,
    END OF ty_resource_type.

  "! <p class="shorttext">Transport Object Type</p>
  "! Transport object type
  TYPES ty_transport_object_type     TYPE c LENGTH 4.
  "! <p class="shorttext">Transport Object Sub-Type</p>
  "! Transport object sub-type
  TYPES ty_transport_object_sub_type TYPE c LENGTH 3.

  TYPES:
    "! <p class="shorttext">Workbench Object Type</p>
    "! Workbench object type
    BEGIN OF ty_workbench_object_type,
      "! <p class="shorttext">Transport Object Type</p>
      "! Transport object type
      transport_object_type       TYPE ty_transport_object_type,
      "! <p class="shorttext">Transport Object Sub-Type</p>
      "! Transport object sub-type
      transport_object_subtype_wb TYPE ty_transport_object_sub_type,
    END OF ty_workbench_object_type.

  "! <p class="shorttext">Development Object Types</p>
  "! Development object types
  TYPES ty_development_object_types    TYPE SORTED TABLE OF ty_workbench_object_type WITH UNIQUE DEFAULT KEY.

  "! <p class="shorttext">Resource Types</p>
  "! Resource types
  TYPES ty_resource_types              TYPE SORTED TABLE OF ty_resource_type WITH UNIQUE DEFAULT KEY.

  "! <p class="shorttext">Number of Focused Resources</p>
  "! Number of focused resources
  TYPES ty_number_of_focused_resources TYPE string.

  CONSTANTS:
    "! <p class="shorttext">Number of Focuses Resources</p>
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
      "! <p class="shorttext">Supported Development Object Types</p>
      "! Supported development object types
      supported_dev_object_types  TYPE ty_development_object_types,
      "! <p class="shorttext">Supported Resource Types</p>
      "! Supported resource types
      supported_resource_types    TYPE ty_resource_types,
    END OF ty_filters.

  "! <p class="shorttext">Action ID</p>
  "! Action id
  TYPES ty_action_id    TYPE c LENGTH 20.

  "! <p class="shorttext">Action Title</p>
  "! Action title
  TYPES ty_action_title TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">ADT IDE Action</p>
    "! ADT IDE action
    "! $required
    BEGIN OF ty_adt_saia_object,
      "! <p class="shorttext">Action ID</p>
      "! Unique action id - it should be human readable and reveal the intention of the action
      "! Action id is case insensitive
      "! $required
      action_id                      TYPE ty_action_id,
      "! <p class="shorttext">Base URI</p>
      "! Base uri
      "! $required
      base_uri                       TYPE string,
      "! <p class="shorttext">Title</p>
      "! Title
      "! $required
      title                          TYPE ty_action_title,
      "! <p class="shorttext">Description</p>
      "! What is the action doing and how can it be used
      "! $required
      description                    TYPE string,
      "! <p class="shorttext">Action Filters</p>
      "! Filters for application of action according to specific object type or object type groups
      "! $required
      filters                        TYPE ty_filters,
      "! <p class="shorttext">Implementation Class</p>
      "! Implementation class for handling the action input. Needs to implement interface  {@link if_aia_action }.
      "! $required
      implementation_class           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Input UI Configuration Class</p>
      "! Input UI configuration class for implementing the server-driven UI input configuration.
      "! Needs to implement interface {@link IF_AIA_SD_ACTION_INPUT }.
      "! $required
      input_ui_configuration_class   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Don't Show in Run Action Dialog</p>
      "! Flag to indicate that the action shouldn't be shown in the action selection dialog
      "!   where all available actions are listed.
      "! TODO: put in a structure: options -> all options stored in a string in database
      "! $required
      dont_show_in_run_action_dialog TYPE abap_bool,
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
    END OF ty_main.

ENDINTERFACE.
