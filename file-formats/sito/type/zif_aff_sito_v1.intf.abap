INTERFACE zif_aff_sito_v1
  PUBLIC.

  "! <p class="shorttext">SIT2_DO_SCOPE</p>
  "! SIT2_DO_SCOPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_scope}
  TYPES ty_sit2_do_scope TYPE n LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">SIT2_DO_SCOPE</p>
    "! SIT2_DO_SCOPE
    BEGIN OF co_sit2_do_scope,
      "! <p class="shorttext">SAP</p>
      "! SAP
      sap      TYPE ty_sit2_do_scope VALUE '01',
      "! <p class="shorttext">Customer</p>
      "! Customer
      customer TYPE ty_sit2_do_scope VALUE '02',
    END OF co_sit2_do_scope.

  "! <p class="shorttext">SIT2_DO_OBJ_STRUC_TYPE</p>
  "! SIT2_DO_OBJ_STRUC_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_obj_struc_type}
  TYPES ty_sit2_do_obj_struc_type TYPE n LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">SIT2_DO_OBJ_STRUC_TYPE</p>
    "! SIT2_DO_OBJ_STRUC_TYPE
    BEGIN OF co_sit2_do_obj_struc_type,
      "! <p class="shorttext">CDS</p>
      "! CDS
      cds       TYPE ty_sit2_do_obj_struc_type VALUE '01',
      "! <p class="shorttext">In Memory</p>
      "! In Memory
      in_memory TYPE ty_sit2_do_obj_struc_type VALUE '02',
    END OF co_sit2_do_obj_struc_type.

  "! <p class="shorttext">SWFECLSTYP</p>
  "! SWFECLSTYP
  "! $values {@link zif_aff_sito_v1.data:co_swfeclstyp}
  TYPES ty_swfeclstyp TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">SWFECLSTYP</p>
    "! SWFECLSTYP
    BEGIN OF co_swfeclstyp,
      "! <p class="shorttext">Business Class</p>
      "! Business Class
      business_class       TYPE ty_swfeclstyp VALUE 'BC',
      "! <p class="shorttext">BOR Object Type</p>
      "! BOR Object Type
      bor_object_type      TYPE ty_swfeclstyp VALUE 'BO',
      "! <p class="shorttext">ABAP Class</p>
      "! ABAP Class
      abap_class           TYPE ty_swfeclstyp VALUE 'CL',
      "! <p class="shorttext">Business Object Type</p>
      "! Business Object Type
      business_object_type TYPE ty_swfeclstyp VALUE 'EO',
      "! <p class="shorttext">XML Object Type</p>
      "! XML Object Type
      xml_object_type      TYPE ty_swfeclstyp VALUE 'XC',
    END OF co_swfeclstyp.

  "! <p class="shorttext">SIT2_DO_ACTION_TYPE</p>
  "! SIT2_DO_ACTION_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_action_type}
  TYPES ty_sit2_do_action_type TYPE n LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">SIT2_DO_ACTION_TYPE</p>
    "! SIT2_DO_ACTION_TYPE
    BEGIN OF co_sit2_do_action_type,
      "! <p class="shorttext">Navigation Action</p>
      "! Navigation Action
      navigation_action TYPE ty_sit2_do_action_type VALUE '01',
      "! <p class="shorttext">Callback Action</p>
      "! Callback Action
      callback_action   TYPE ty_sit2_do_action_type VALUE '02',
    END OF co_sit2_do_action_type.

  "! <p class="shorttext">SIT2_DO_VH_SRV_PROTOCOL_VER</p>
  "! SIT2_DO_VH_SRV_PROTOCOL_VER
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_vh_srv_protocol_ver}
  TYPES ty_sit2_do_vh_srv_protocol_ver TYPE n LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">SIT2_DO_VH_SRV_PROTOCOL_VER</p>
    "! SIT2_DO_VH_SRV_PROTOCOL_VER
    BEGIN OF co_sit2_do_vh_srv_protocol_ver,
      "! <p class="shorttext">V2</p>
      "! V2
      v2 TYPE ty_sit2_do_vh_srv_protocol_ver VALUE '01',
      "! <p class="shorttext">V4</p>
      "! V4
      v4 TYPE ty_sit2_do_vh_srv_protocol_ver VALUE '02',
    END OF co_sit2_do_vh_srv_protocol_ver.

  "! <p class="shorttext">SIT2_DO_VH_SRV_PATH_TYPE</p>
  "! SIT2_DO_VH_SRV_PATH_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_vh_srv_path_type}
  TYPES ty_sit2_do_vh_srv_path_type TYPE n LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">SIT2_DO_VH_SRV_PATH_TYPE</p>
    "! SIT2_DO_VH_SRV_PATH_TYPE
    BEGIN OF co_sit2_do_vh_srv_path_type,
      "! <p class="shorttext">Standard</p>
      "! Standard
      standard TYPE ty_sit2_do_vh_srv_path_type VALUE '01',
      "! <p class="shorttext">Custom</p>
      "! Custom
      custom   TYPE ty_sit2_do_vh_srv_path_type VALUE '02',
    END OF co_sit2_do_vh_srv_path_type.

  "! <p class="shorttext">SIT2_DO_VH_APP_TYPE</p>
  "! SIT2_DO_VH_APP_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_vh_app_type}
  TYPES ty_sit2_do_vh_app_type TYPE n LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">SIT2_DO_VH_APP_TYPE</p>
    "! SIT2_DO_VH_APP_TYPE
    BEGIN OF co_sit2_do_vh_app_type,
      "! <p class="shorttext">All Apps</p>
      "! All Apps
      all_apps TYPE ty_sit2_do_vh_app_type VALUE '01',
    END OF co_sit2_do_vh_app_type.

  "! <p class="shorttext">SIT2_DO_VH_TYPE</p>
  "! SIT2_DO_VH_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_vh_type}
  TYPES ty_sit2_do_vh_type TYPE n LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">SIT2_DO_VH_TYPE</p>
    "! SIT2_DO_VH_TYPE
    BEGIN OF co_sit2_do_vh_type,
      "! <p class="shorttext">Service</p>
      "! Service
      service TYPE ty_sit2_do_vh_type VALUE '01',
    END OF co_sit2_do_vh_type.

  TYPES:

    "! <p class="shorttext">Texts</p>
    "! Situation object structue
    BEGIN OF ty_sit2_obj_struc_t,
      "! <p class="shorttext">Description</p>
      "! Situation object structure description
      description TYPE c LENGTH 255,
    END OF ty_sit2_obj_struc_t,

    "! <p class="shorttext">Texts</p>
    "! Situation object structue
    ty_sit2_obj_struc_t_list TYPE STANDARD TABLE OF ty_sit2_obj_struc_t WITH DEFAULT KEY,

    "! <p class="shorttext">Semantic Keys</p>
    "! Semantic keys of an object structure
    BEGIN OF ty_sit2_obj_str_sk,
      "! <p class="shorttext">Field Order</p>
      "! Object field order for situation
      field_order TYPE n LENGTH 2,
      "! <p class="shorttext">Field</p>
      "! Object field
      field       TYPE c LENGTH 30,
    END OF ty_sit2_obj_str_sk,

    "! <p class="shorttext">Semantic Keys</p>
    "! Semantic keys of an object structure
    ty_sit2_obj_str_sk_list TYPE STANDARD TABLE OF ty_sit2_obj_str_sk WITH DEFAULT KEY,

    "! <p class="shorttext">Value Help Mappings</p>
    "! Value help mapping for situation object structure
    BEGIN OF ty_sit2_os_vh_map,
      "! <p class="shorttext">App Type</p>
      "! App for value help
      "! $required
      app_type   TYPE ty_sit2_do_vh_app_type,
      "! <p class="shorttext">Type</p>
      "! Type of value help
      "! $required
      type       TYPE ty_sit2_do_vh_type,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      scope      TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Field Name</p>
      "! Object field
      field_name TYPE c LENGTH 30,
    END OF ty_sit2_os_vh_map,

    "! <p class="shorttext">Value Help Mappings</p>
    "! Value help mapping for situation object structure
    ty_sit2_os_vh_map_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map WITH DEFAULT KEY,

    "! <p class="shorttext">Services</p>
    "! Value help mapping for situation object structure - service
    BEGIN OF ty_sit2_os_vh_map_s,
      "! <p class="shorttext">Type</p>
      "! App for value help
      "! $required
      type       TYPE ty_sit2_do_vh_app_type,
      "! <p class="shorttext">Field Name</p>
      "! Object field
      field_name TYPE c LENGTH 30,
      "! <p class="shorttext">Entity Set</p>
      "! Name
      entity_set TYPE c LENGTH 40,
      "! <p class="shorttext">Property</p>
      "! Name
      property   TYPE c LENGTH 40,
      "! <p class="shorttext">ID</p>
      "! Service id for value help
      id         TYPE c LENGTH 32,
    END OF ty_sit2_os_vh_map_s,

    "! <p class="shorttext">Services</p>
    "! Value help mapping for situation object structure - service
    ty_sit2_os_vh_map_s_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map_s WITH DEFAULT KEY,

    "! <p class="shorttext">Texts</p>
    "! Situation object events text
    BEGIN OF ty_sit2_obj_event_t,
      "! <p class="shorttext">Description</p>
      "! Description
      description TYPE c LENGTH 255,
    END OF ty_sit2_obj_event_t,

    "! <p class="shorttext">Texts</p>
    "! Situation object events text
    ty_sit2_obj_event_t_list TYPE STANDARD TABLE OF ty_sit2_obj_event_t WITH DEFAULT KEY,

    "! <p class="shorttext">Texts</p>
    "! Text table for situation object actions
    BEGIN OF ty_sit2_obj_act_t,
      "! <p class="shorttext">Name</p>
      "! Name of action
      name        TYPE c LENGTH 40,
      "! <p class="shorttext">Description</p>
      "! Description of action
      description TYPE c LENGTH 255,
    END OF ty_sit2_obj_act_t,

    "! <p class="shorttext">Texts</p>
    "! Text table for situation object actions
    ty_sit2_obj_act_t_list TYPE STANDARD TABLE OF ty_sit2_obj_act_t WITH DEFAULT KEY,

    "! <p class="shorttext">Navigations</p>
    "! Situation object action - navigation
    BEGIN OF ty_sit2_obj_act_nav,
      "! <p class="shorttext">ID</p>
      "! Navigation id
      id TYPE c LENGTH 32,
    END OF ty_sit2_obj_act_nav,

    "! <p class="shorttext">Navigations</p>
    "! Situation object action - navigation
    ty_sit2_obj_act_nav_list TYPE STANDARD TABLE OF ty_sit2_obj_act_nav WITH DEFAULT KEY,

    "! <p class="shorttext">Callbacks</p>
    "! Situation object action - callback
    BEGIN OF ty_sit2_obj_act_cb,
      "! <p class="shorttext">ID</p>
      "! Callback id
      id TYPE c LENGTH 32,
    END OF ty_sit2_obj_act_cb,

    "! <p class="shorttext">Callbacks</p>
    "! Situation object action - callback
    ty_sit2_obj_act_cb_list TYPE STANDARD TABLE OF ty_sit2_obj_act_cb WITH DEFAULT KEY,

    "! <p class="shorttext">Parameters</p>
    "! Situation object navigation parameter
    BEGIN OF ty_sit2_obj_nav_par,
      "! <p class="shorttext">Name</p>
      "! Name of navigation parameter
      name TYPE c LENGTH 30,
    END OF ty_sit2_obj_nav_par,

    "! <p class="shorttext">Parameters</p>
    "! Situation object navigation parameter
    ty_sit2_obj_nav_par_list TYPE STANDARD TABLE OF ty_sit2_obj_nav_par WITH DEFAULT KEY,

    "! <p class="shorttext">Parameters</p>
    "! Situation object callback parameter
    BEGIN OF ty_sit2_obj_cb_par,
      "! <p class="shorttext">Name</p>
      "! Name of callback parameter
      name TYPE c LENGTH 30,
    END OF ty_sit2_obj_cb_par,

    "! <p class="shorttext">Parameters</p>
    "! Situation object callback parameter
    ty_sit2_obj_cb_par_list TYPE STANDARD TABLE OF ty_sit2_obj_cb_par WITH DEFAULT KEY,

    "! <p class="shorttext">Value Help Service Providers</p>
    "! Property of value help service for situation object
    BEGIN OF ty_sit2_obj_vh_s_p,
      "! <p class="shorttext">Property</p>
      "! Name
      property   TYPE c LENGTH 40,
      "! <p class="shorttext">Entity Set</p>
      "! Name
      entity_set TYPE c LENGTH 40,
    END OF ty_sit2_obj_vh_s_p,

    "! <p class="shorttext">Value Help Service Providers</p>
    "! Property of value help service for situation object
    ty_sit2_obj_vh_s_p_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s_p WITH DEFAULT KEY,

    "! <p class="shorttext">Texts</p>
    "! Situation object text
    BEGIN OF ty_sit2_object_t,
      "! <p class="shorttext">Name</p>
      "! Situation object name
      name        TYPE c LENGTH 40,
      "! <p class="shorttext">Description</p>
      "! Description
      description TYPE c LENGTH 255,
    END OF ty_sit2_object_t,

    "! <p class="shorttext">Texts</p>
    "! Situation object text
    ty_sit2_object_t_list TYPE STANDARD TABLE OF ty_sit2_object_t WITH DEFAULT KEY,

    "! <p class="shorttext">Structures</p>
    "! Situation object structure
    BEGIN OF ty_sit2_obj_struc,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      reusable             TYPE abap_bool,
      "! <p class="shorttext">Type</p>
      "! Situation object structure type
      "! $required
      type                 TYPE ty_sit2_do_obj_struc_type,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      scope                TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Name</p>
      "!
      name                 TYPE c LENGTH 30,
      "! <p class="shorttext">SAP Object Node Type</p>
      "! Sap object node type
      sap_object_node_type TYPE c LENGTH 30,
      "! <p class="shorttext">ID</p>
      "! Situation object structure id
      id                   TYPE c LENGTH 32,
      texts                TYPE ty_sit2_obj_struc_t_list,
      semantic_keys        TYPE ty_sit2_obj_str_sk_list,
      value_help_mappings  TYPE ty_sit2_os_vh_map_list,
      services             TYPE ty_sit2_os_vh_map_s_list,
    END OF ty_sit2_obj_struc,

    "! <p class="shorttext">Structures</p>
    "! Situation object structure
    ty_sit2_obj_struc_list TYPE STANDARD TABLE OF ty_sit2_obj_struc WITH DEFAULT KEY,

    "! <p class="shorttext">Events</p>
    "! Situation object events
    BEGIN OF ty_sit2_obj_events,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      reusable               TYPE abap_bool,
      "! <p class="shorttext">Category</p>
      "! Object type category
      "! $required
      category               TYPE ty_swfeclstyp,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      scope                  TYPE ty_sit2_do_scope,
      "! <p class="shorttext">ID</p>
      "! Situation event id
      id                     TYPE c LENGTH 32,
      "! <p class="shorttext">Object</p>
      "! Object type
      object                 TYPE c LENGTH 32,
      "! <p class="shorttext">Type</p>
      "! Object type
      type                   TYPE c LENGTH 32,
      "! <p class="shorttext">Parameter Structure ID</p>
      "! Situation object structure id
      parameter_structure_id TYPE c LENGTH 32,
      texts                  TYPE ty_sit2_obj_event_t_list,
    END OF ty_sit2_obj_events,

    "! <p class="shorttext">Events</p>
    "! Situation object events
    ty_sit2_obj_events_list TYPE STANDARD TABLE OF ty_sit2_obj_events WITH DEFAULT KEY,

    "! <p class="shorttext">End User Actions</p>
    "! Situation object actions
    BEGIN OF ty_sit2_obj_act,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      reusable    TYPE abap_bool,
      "! <p class="shorttext">Type</p>
      "! Action type of situation
      "! $required
      type        TYPE ty_sit2_do_action_type,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      scope       TYPE ty_sit2_do_scope,
      "! <p class="shorttext">ID</p>
      "! Action id
      id          TYPE c LENGTH 32,
      texts       TYPE ty_sit2_obj_act_t_list,
      navigations TYPE ty_sit2_obj_act_nav_list,
      callbacks   TYPE ty_sit2_obj_act_cb_list,
    END OF ty_sit2_obj_act,

    "! <p class="shorttext">End User Actions</p>
    "! Situation object actions
    ty_sit2_obj_act_list TYPE STANDARD TABLE OF ty_sit2_obj_act WITH DEFAULT KEY,

    "! <p class="shorttext">Navigations</p>
    "! Situation object navigation
    BEGIN OF ty_sit2_obj_nav,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      reusable               TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      scope                  TYPE ty_sit2_do_scope,
      "! <p class="shorttext">ID</p>
      "! Navigation id
      id                     TYPE c LENGTH 32,
      "! <p class="shorttext">Semantic Object Action</p>
      "! Semantic object action
      semantic_object_action TYPE c LENGTH 50,
      "! <p class="shorttext">Semantic Object</p>
      "! Semantic object
      semantic_object        TYPE c LENGTH 50,
      parameters             TYPE ty_sit2_obj_nav_par_list,
    END OF ty_sit2_obj_nav,

    "! <p class="shorttext">Navigations</p>
    "! Situation object navigation
    ty_sit2_obj_nav_list TYPE STANDARD TABLE OF ty_sit2_obj_nav WITH DEFAULT KEY,

    "! <p class="shorttext">Callbacks</p>
    "! Situation object callback
    BEGIN OF ty_sit2_obj_cb,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      reusable   TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      scope      TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Class Name</p>
      "! Reference to
      class_name TYPE c LENGTH 30,
      "! <p class="shorttext">ID</p>
      "! Callback id
      id         TYPE c LENGTH 32,
      parameters TYPE ty_sit2_obj_cb_par_list,
    END OF ty_sit2_obj_cb,

    "! <p class="shorttext">Callbacks</p>
    "! Situation object callback
    ty_sit2_obj_cb_list TYPE STANDARD TABLE OF ty_sit2_obj_cb WITH DEFAULT KEY,

    "! <p class="shorttext">Value Help Services</p>
    "! Value help service for situation object
    BEGIN OF ty_sit2_obj_vh_s,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      reusable                     TYPE abap_bool,
      "! <p class="shorttext">Version</p>
      "! Service version for value help
      version                      TYPE n LENGTH 4,
      "! <p class="shorttext">Protocol Version</p>
      "! Service protocol version for value help
      "! $required
      protocol_version             TYPE ty_sit2_do_vh_srv_protocol_ver,
      "! <p class="shorttext">Path Type</p>
      "! Service path type for value help
      "! $required
      path_type                    TYPE ty_sit2_do_vh_srv_path_type,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      scope                        TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Definition</p>
      "! Service definition for value help
      definition                   TYPE c LENGTH 30,
      "! <p class="shorttext">Binding</p>
      "! Service binding for value help
      binding                      TYPE c LENGTH 40,
      "! <p class="shorttext">ID</p>
      "! Service id for value help
      id                           TYPE c LENGTH 32,
      "! <p class="shorttext">Custom Path</p>
      "! Service custom path for value help
      custom_path                  TYPE c LENGTH 255,
      value_help_service_providers TYPE ty_sit2_obj_vh_s_p_list,
    END OF ty_sit2_obj_vh_s,

    "! <p class="shorttext">Value Help Services</p>
    "! Value help service for situation object
    ty_sit2_obj_vh_s_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s WITH DEFAULT KEY,

    "! <p class="shorttext">Situation Object</p>
    "! Situation object
    BEGIN OF ty_sit2_object,
      "! <p class="shorttext">Extensible</p>
      "! Object extensible
      extensible          TYPE abap_bool,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      reusable            TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      scope               TYPE ty_sit2_do_scope,
      "! <p class="shorttext">SAP Object Type</p>
      "! Sap object type
      sap_object_type     TYPE c LENGTH 30,
      texts               TYPE ty_sit2_object_t_list,
      structures          TYPE ty_sit2_obj_struc_list,
      events              TYPE ty_sit2_obj_events_list,
      end_user_actions    TYPE ty_sit2_obj_act_list,
      navigations         TYPE ty_sit2_obj_nav_list,
      callbacks           TYPE ty_sit2_obj_cb_list,
      value_help_services TYPE ty_sit2_obj_vh_s_list,
    END OF ty_sit2_object,



    "! <p class="shorttext">Situation Object Properties</p>
    "! Situation Object properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Format version</p>
      "! Format version
      "! $required
      format_version   TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header           TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Situation Object</p>
      "! Situation Object
      "! $required
      situation_object TYPE ty_sit2_object,
    END OF ty_main.

ENDINTERFACE.
