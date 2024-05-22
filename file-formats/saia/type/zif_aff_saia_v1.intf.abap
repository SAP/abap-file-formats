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

  "! <p class="shorttext">Object Type in Object Directory</p>
  "! Object Type in Object Directory
  TYPES ty_trobjtype  TYPE c LENGTH 4.
  "! <p class="shorttext">WB Request: (Internal) Type of an ABAP Workbench Object</p>
  "! WB Request: (Internal) Type of an ABAP Workbench Object
  TYPES ty_seu_objtyp TYPE c LENGTH 3.

  TYPES:
    "! <p class="shorttext">Global Workbench Object Type</p>
    "! Global Workbench Object Type
    BEGIN OF ty_wbobjtype,
      "! <p class="shorttext">Object Type in Object Directory</p>
      "! Object Type in Object Directory
      objtype_tr TYPE ty_trobjtype,
      "! <p class="shorttext">WB Request: (Internal) Type of an ABAP Workbench Object</p>
      "! WB Request: (Internal) Type of an ABAP Workbench Object
      subtype_wb TYPE ty_seu_objtyp,
    END OF ty_wbobjtype.

  "! <p class="shorttext">Development Object Types</p>
  "! Development object types
  TYPES ty_development_object_types    TYPE SORTED TABLE OF ty_wbobjtype WITH UNIQUE DEFAULT KEY.

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
      "! Number of Focused Resources
      number_of_focused_resources TYPE ty_number_of_focused_resources,
      "! <p class="shorttext">Supported Development Object Types</p>
      "! Supported development object types
      supported_dev_object_types  TYPE ty_development_object_types,
      "! <p class="shorttext">Supported Resource Types</p>
      "! Supported resource types
      supported_resource_types    TYPE ty_resource_types,
    END OF ty_filters.

  "! <p class="shorttext">ABAP Class Name</p>
  "! ABAP class name
  TYPES ty_class_name TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">ADT IDE Action</p>
    "! ADT IDE Action
    "! $required
    BEGIN OF ty_adt_saia_object,
      "! <p class="shorttext">Unique Id of the Action</p>
      "! Unique action id - it should be human readable and reveal the intention of the action
      "! Action id is case insensitive
      "! TODO: length restriction, check how long it should be, su22 variant restrictions???
      "! $required
      action_id                      TYPE string,
      "! <p class="shorttext">Action Title</p>
      "! Action title for the action
      "! $required
      title                          TYPE string,
      "! <p class="shorttext">Action Description</p>
      "! What is the action doing and how can it be used
      "! $required
      description                    TYPE string,
      "! <p class="shorttext">Action Filter(In development)</p>
      "! Filter for application of action according to specific object type or object type groups
      "! TODO: new filter mechanis currently under development -> all filters stored in a string on database
      "! $required
      filters                        TYPE ty_filters,
      "! <p class="shorttext">Action Handler Class</p>
      "! Implementation class for handling the action input. Needs to implement interface  {@link if_aia_action }.
      "! $required
      implementation_class           TYPE ty_class_name,
      "! <p class="shorttext">Action Input UI Class</p>
      "! The ABAP class implementing the server-driven UI input configuration.
      "! Needs to implement interface {@link IF_AIA_SD_ACTION_INPUT }.
      "! $required
      input_ui_configuration_class   TYPE ty_class_name,
      "! <p class="shorttext">Run Action Dialog Visibility</p>
      "! Flag to indicate that the action shouldn't be shown in the action selection dialog
      "!   where all available actions are listed.
      "! TODO: put in a structure: options -> all options stored in a string in database
      "! $required
      dont_show_in_run_action_dialog TYPE abap_bool,
    END OF ty_adt_saia_object.

  TYPES:
    "! <p class="shorttext">ADT IDE Action</p>
    "! ADT IDE Action (SAIA) v1
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_100,
      "! <p class="shorttext">ADT IDE Action</p>
      "! ADT IDE Action
      "! $required
      adt_ide_action TYPE ty_adt_saia_object,
    END OF ty_main.

ENDINTERFACE.
