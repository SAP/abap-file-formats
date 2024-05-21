INTERFACE zif_aff_saia_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Resource Type</p>
    "! Resource type
    BEGIN OF resource_type,
      "! <p class="shorttext">Category Scheme</p>
      "! Category scheme
      category_scheme TYPE string,
      "! <p class="shorttext">Category Term</p>
      "! Category term
      category_term   TYPE string,
    END OF resource_type.

  "! <p class="shorttext">Development Object Types</p>
  "! Development object types
  TYPES development_object_types TYPE SORTED TABLE OF wbobjtype WITH UNIQUE DEFAULT KEY.

  "! <p class="shorttext">Resource Types</p>
  "! Resource types
  TYPES resource_types           TYPE SORTED TABLE OF resource_type WITH UNIQUE DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Number of Focuses Resources</p>
    "! Number of focused resources
    BEGIN OF ENUM number_of_focused_resources,
      "! <p class="shorttext">Exactly One</p>
      "! Exactly one
      exactly_one,
      "! <p class="shorttext">At Least One</p>
      "! At least one
      at_least_one,
      "! <p class="shorttext">More Than One</p>
      "! More than one
      more_than_one,
    END OF ENUM number_of_focused_resources.

  TYPES:
    "! <p class="shorttext">Action Filter</p>
    "! Filtering of action according to specified applicable criteria. If filter is satisfied then the action is available and will be shown.
    "! $required
    BEGIN OF filters,
      "! <p class="shorttext">Number of Focused Resources</p>
      "! Number of Focused Resources
      number_of_focused_resources TYPE number_of_focused_resources,
      "! <p class="shorttext">Supported Development Object Types</p>
      "! Supported development object types
      supported_dev_object_types  TYPE development_object_types,
      "! <p class="shorttext">Supported Resource Types</p>
      "! Supported resource types
      supported_resource_types    TYPE resource_types,
    END OF filters.

  TYPES:
    "! <p class="shorttext">ADT IDE Action</p>
    "! ADT IDE Action (SAIA) v1
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version                 TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                         TYPE zif_aff_types_v1=>ty_header_100,
      "! <p class="shorttext">Unique Id of the Action</p>
      "! Unique action id - it should be human readable and reveal what the action is supposed to do
      "! Action id is case insensitive
      "! $required
      action_id                      TYPE string,                             " length restriction, check how long it should be, su22 variant restrictions???
      "! <p class="shorttext">Action Title</p>
      "! Action title for the action
      "! $required
      title                          TYPE string,
      "! <p class="shorttext">Action Description</p>
      "! What is the action doing and how can it be used
      "! $required
      description                    TYPE string,
      "! new filter mechanis currently under development
      "! <p class="shorttext">Action Filter(In development)</p>
      "! Filter for application of action according to specific object type or object type groups (currently under development).
      "! $required
      filters                        TYPE filters,                            " -> all filters stored in a string on database
      "! <p class="shorttext">Action Handler Class</p>
      "! Implementation class for handling the action input. Needs to implement interface  {@link if_aia_action }.
      "! $required
      implementation_class           TYPE seoclsname,
      "! <p class="shorttext">Action Input UI Class</p>
      "! The ABAP class implementing the server-driven UI input configuration. Needs to implement interface {@link IF_AIA_SD_ACTION_INPUT }.
      "! $required
      input_ui_configuration_class   TYPE seoclsname,
      "! <p class="shorttext">Run Action Dialog Visibility</p>
      "! Flag to indicate that the action shouldn't be shown in the action selection dialog where all available actions are listed.
      "! $required
      dont_show_in_run_action_dialog TYPE abap_bool,                          " put in a structure: options -> all options stored in a string in database
    END OF ty_main.

ENDINTERFACE.
