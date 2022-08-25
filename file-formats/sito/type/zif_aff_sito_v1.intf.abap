INTERFACE zif_aff_sito_v1
  PUBLIC.

  "! SIT2_DO_SCOPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_scope}
  TYPES ty_sit2_do_scope TYPE n LENGTH 2.

  CONSTANTS:
    "! SIT2_DO_SCOPE
    BEGIN OF co_sit2_do_scope,
      "! <p class="shorttext">SAP</p>
      "! SAP
      "! $enumValue 'SAP'
      sap      TYPE ty_sit2_do_scope VALUE '01',
      "! <p class="shorttext">Customer</p>
      "! Customer
      customer TYPE ty_sit2_do_scope VALUE '02',
    END OF co_sit2_do_scope.

  "! SIT2_DO_OBJ_STRUC_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_obj_struc_type}
  TYPES ty_sit2_do_obj_struc_type TYPE n LENGTH 2.

  CONSTANTS:
    "! SIT2_DO_OBJ_STRUC_TYPE
    BEGIN OF co_sit2_do_obj_struc_type,
      "! <p class="shorttext">CDS</p>
      "! CDS
      "! $enumValue 'CDS'
      cds       TYPE ty_sit2_do_obj_struc_type VALUE '01',
      "! <p class="shorttext">In Memory</p>
      "! In memory
      in_memory TYPE ty_sit2_do_obj_struc_type VALUE '02',
    END OF co_sit2_do_obj_struc_type.

  "! SWFECLSTYP
  "! $values {@link zif_aff_sito_v1.data:co_swfeclstyp}
  TYPES ty_swfeclstyp TYPE c LENGTH 2.

  CONSTANTS:
    "! SWFECLSTYP
    BEGIN OF co_swfeclstyp,
      "! <p class="shorttext">Business Class</p>
      "! Business class
      business_class       TYPE ty_swfeclstyp VALUE 'BC',
      "! <p class="shorttext">BOR Object Type</p>
      "! BOR object type
      bor_object_type      TYPE ty_swfeclstyp VALUE 'BO',
      "! <p class="shorttext">ABAP Class</p>
      "! ABAP class
      abap_class           TYPE ty_swfeclstyp VALUE 'CL',
      "! <p class="shorttext">Business Object Type</p>
      "! Business object type
      business_object_type TYPE ty_swfeclstyp VALUE 'EO',
      "! <p class="shorttext">XML Object Type</p>
      "! XML object type
      xml_object_type      TYPE ty_swfeclstyp VALUE 'XC',
    END OF co_swfeclstyp.

  "! SIT2_DO_ACTION_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_action_type}
  TYPES ty_sit2_do_action_type TYPE n LENGTH 2.

  CONSTANTS:
    "! SIT2_DO_ACTION_TYPE
    BEGIN OF co_sit2_do_action_type,
      "! <p class="shorttext">Navigation Action</p>
      "! Navigation action
      navigation_action TYPE ty_sit2_do_action_type VALUE '01',
      "! <p class="shorttext">Callback Action</p>
      "! Callback action
      callback_action   TYPE ty_sit2_do_action_type VALUE '02',
    END OF co_sit2_do_action_type.

  "! SIT2_DO_VH_SRV_PROTOCOL_VER
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_vh_srv_protocol_ver}
  TYPES ty_sit2_do_vh_srv_protocol_ver TYPE n LENGTH 2.

  CONSTANTS:
    "! SIT2_DO_VH_SRV_PROTOCOL_VER
    BEGIN OF co_sit2_do_vh_srv_protocol_ver,
      "! <p class="shorttext">V2</p>
      "! V2
      "! $enumValue 'V2'
      v2 TYPE ty_sit2_do_vh_srv_protocol_ver VALUE '01',
      "! <p class="shorttext">V4</p>
      "! V4
      "! $enumValue 'V4'
      v4 TYPE ty_sit2_do_vh_srv_protocol_ver VALUE '02',
    END OF co_sit2_do_vh_srv_protocol_ver.

  "! SIT2_DO_VH_SRV_PATH_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_vh_srv_path_type}
  TYPES ty_sit2_do_vh_srv_path_type TYPE n LENGTH 2.

  CONSTANTS:
    "! SIT2_DO_VH_SRV_PATH_TYPE
    BEGIN OF co_sit2_do_vh_srv_path_type,
      "! <p class="shorttext">Standard</p>
      "! Standard
      standard TYPE ty_sit2_do_vh_srv_path_type VALUE '01',
      "! <p class="shorttext">Custom</p>
      "! Custom
      custom   TYPE ty_sit2_do_vh_srv_path_type VALUE '02',
    END OF co_sit2_do_vh_srv_path_type.

  "! SIT2_DO_VH_APP_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_vh_app_type}
  TYPES ty_sit2_do_vh_app_type TYPE n LENGTH 2.

  CONSTANTS:
    "! SIT2_DO_VH_APP_TYPE
    BEGIN OF co_sit2_do_vh_app_type,
      "! <p class="shorttext">All Apps</p>
      "! All apps
      all_apps TYPE ty_sit2_do_vh_app_type VALUE '01',
    END OF co_sit2_do_vh_app_type.

  "! SIT2_DO_VH_TYPE
  "! $values {@link zif_aff_sito_v1.data:co_sit2_do_vh_type}
  TYPES ty_sit2_do_vh_type TYPE n LENGTH 2.

  CONSTANTS:
    "! SIT2_DO_VH_TYPE
    BEGIN OF co_sit2_do_vh_type,
      "! <p class="shorttext">Service</p>
      "! Service
      service TYPE ty_sit2_do_vh_type VALUE '01',
    END OF co_sit2_do_vh_type.

  TYPES:
    "! <p class="shorttext">Text</p>
    "! Text for situation object structure
    BEGIN OF ty_sit2_obj_struc_t,
      "! <p class="shorttext">Description</p>
      "! Situation object structure description
      "! $required
      description TYPE c LENGTH 255,
    END OF ty_sit2_obj_struc_t,

    "! <p class="shorttext">Semantic Key Details</p>
    "! Semantic key of an object structure
    BEGIN OF ty_sit2_obj_str_sk,
      "! <p class="shorttext">Field</p>
      "! Object field
      "! $required
      field       TYPE c LENGTH 30,
      "! <p class="shorttext">Field Order</p>
      "! Object field order for situation
      "! $required
      field_order TYPE n LENGTH 2,
    END OF ty_sit2_obj_str_sk,

    "! <p class="shorttext">Semantic Keys</p>
    "! Semantic keys of an object structure
    ty_sit2_obj_str_sk_list TYPE SORTED TABLE OF ty_sit2_obj_str_sk WITH UNIQUE KEY field_order,

    "! <p class="shorttext">Value Help Mapping Details</p>
    "! Value help mapping for situation object structure
    BEGIN OF ty_sit2_os_vh_map,
      "! <p class="shorttext">Field Name</p>
      "! Object field
      "! $required
      field_name TYPE c LENGTH 30,
      "! <p class="shorttext">App Type</p>
      "! App for value help
      "! $required
      app_type   TYPE ty_sit2_do_vh_app_type,
      "! <p class="shorttext">Type</p>
      "! Type of value help
      "! $required
      type       TYPE ty_sit2_do_vh_type,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope      TYPE ty_sit2_do_scope,
    END OF ty_sit2_os_vh_map,

    "! <p class="shorttext">Value Help Mappings</p>
    "! Value help mappings for situation object structure
    ty_sit2_os_vh_map_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map WITH DEFAULT KEY,

    "! <p class="shorttext">Service Details</p>
    "! Value help mapping for situation object structure - service
    BEGIN OF ty_sit2_os_vh_map_s,
      "! <p class="shorttext">ID</p>
      "! Service id for value help
      "! $required
      id         TYPE c LENGTH 32,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      "! $required
      field_name TYPE c LENGTH 30,
      "! <p class="shorttext">Type</p>
      "! App for value help
      "! $required
      type       TYPE ty_sit2_do_vh_app_type,
      "! <p class="shorttext">Entity Set</p>
      "! Entity set
      "! $required
      entity_set TYPE c LENGTH 40,
      "! <p class="shorttext">Property</p>
      "! Property
      "! $required
      property   TYPE c LENGTH 40,
    END OF ty_sit2_os_vh_map_s,

    "! <p class="shorttext">Services</p>
    "! Value help mapping for situation object structure - services
    ty_sit2_os_vh_map_s_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map_s WITH DEFAULT KEY,

    "! <p class="shorttext">Text</p>
    "! Text for situation object event
    BEGIN OF ty_sit2_obj_event_t,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description TYPE c LENGTH 255,
    END OF ty_sit2_obj_event_t,

    "! <p class="shorttext">Text</p>
    "! Text for situation object action
    BEGIN OF ty_sit2_obj_act_t,
      "! <p class="shorttext">Name</p>
      "! Name of action
      "! $required
      name        TYPE c LENGTH 40,
      "! <p class="shorttext">Description</p>
      "! Description of action
      "! $required
      description TYPE c LENGTH 255,
    END OF ty_sit2_obj_act_t,

    "! <p class="shorttext">Navigation Details</p>
    "! Situation object action - navigation
    BEGIN OF ty_sit2_obj_act_nav,
      "! <p class="shorttext">ID</p>
      "! Navigation id
      "! $required
      id TYPE c LENGTH 32,
    END OF ty_sit2_obj_act_nav,

    "! <p class="shorttext">Callback Details</p>
    "! Situation object action - callback
    BEGIN OF ty_sit2_obj_act_cb,
      "! <p class="shorttext">ID</p>
      "! Callback id
      "! $required
      id TYPE c LENGTH 32,
    END OF ty_sit2_obj_act_cb,

    "! <p class="shorttext">Parameter Details</p>
    "! Parameter
    BEGIN OF ty_sit2_obj_par,
      "! <p class="shorttext">Name</p>
      "! Name of parameter
      "! $required
      name TYPE c LENGTH 30,
    END OF ty_sit2_obj_par,

    "! <p class="shorttext">Parameters</p>
    "! Parameters
    ty_sit2_obj_par_list TYPE STANDARD TABLE OF ty_sit2_obj_par WITH DEFAULT KEY,

    "! <p class="shorttext">Value Help Service Provider Details</p>
    "! Provider of value help service for situation object
    BEGIN OF ty_sit2_obj_vh_s_p,
      "! <p class="shorttext">Entity Set</p>
      "! Entity set
      "! $required
      entity_set TYPE c LENGTH 40,
      "! <p class="shorttext">Property</p>
      "! Property
      "! $required
      property   TYPE c LENGTH 40,
    END OF ty_sit2_obj_vh_s_p,

    "! <p class="shorttext">Value Help Service Providers</p>
    "! Providers of value help service for situation object
    ty_sit2_obj_vh_s_p_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s_p WITH DEFAULT KEY,

    "! <p class="shorttext">Text</p>
    "! Text for ituation object
    BEGIN OF ty_sit2_object_t,
      "! <p class="shorttext">Name</p>
      "! Situation object name
      "! $required
      name        TYPE c LENGTH 40,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description TYPE c LENGTH 255,
    END OF ty_sit2_object_t,

    "! <p class="shorttext">Structure Details</p>
    "! Situation object structure
    BEGIN OF ty_sit2_obj_struc,
      "! <p class="shorttext">ID</p>
      "! Situation object structure id
      "! $required
      id                   TYPE c LENGTH 32,
      "! <p class="shorttext">Name</p>
      "! Name
      "! $required
      name                 TYPE c LENGTH 30,
      "! <p class="shorttext">Type</p>
      "! Situation object structure type
      "! $required
      type                 TYPE ty_sit2_do_obj_struc_type,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      "! $required
      reusable             TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope                TYPE ty_sit2_do_scope,
      "! <p class="shorttext">SAP Object Node Type</p>
      "! SAP object node type
      "! $required
      sap_object_node_type TYPE c LENGTH 30,
      "! $required
      text                 TYPE ty_sit2_obj_struc_t,
      semantic_keys        TYPE ty_sit2_obj_str_sk_list,
      value_help_mappings  TYPE ty_sit2_os_vh_map_list,
      services             TYPE ty_sit2_os_vh_map_s_list,
    END OF ty_sit2_obj_struc,

    "! <p class="shorttext">Structures</p>
    "! Situation object structures
    ty_sit2_obj_struc_list TYPE STANDARD TABLE OF ty_sit2_obj_struc WITH DEFAULT KEY,

    "! <p class="shorttext">Event Details</p>
    "! Situation object event
    BEGIN OF ty_sit2_obj_events,
      "! <p class="shorttext">ID</p>
      "! Situation event id
      "! $required
      id                     TYPE c LENGTH 32,
      "! <p class="shorttext">Object</p>
      "! Object
      "! $required
      object                 TYPE c LENGTH 32,
      "! <p class="shorttext">Type</p>
      "! Type
      "! $required
      type                   TYPE c LENGTH 32,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      "! $required
      reusable               TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope                  TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Category</p>
      "! Object type category
      "! $required
      category               TYPE ty_swfeclstyp,
      "! <p class="shorttext">Parameter Structure ID</p>
      "! Parameter structure id for situation object
      "! $required
      parameter_structure_id TYPE c LENGTH 32,
      "! $required
      text                   TYPE ty_sit2_obj_event_t,
    END OF ty_sit2_obj_events,

    "! <p class="shorttext">Events</p>
    "! Situation object events
    ty_sit2_obj_events_list TYPE STANDARD TABLE OF ty_sit2_obj_events WITH DEFAULT KEY,

    "! <p class="shorttext">End User Action Details</p>
    "! Situation object action
    BEGIN OF ty_sit2_obj_act,
      "! <p class="shorttext">ID</p>
      "! Action id
      "! $required
      id          TYPE c LENGTH 32,
      "! <p class="shorttext">Type</p>
      "! Action type of situation
      "! $required
      type        TYPE ty_sit2_do_action_type,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      "! $required
      reusable    TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope       TYPE ty_sit2_do_scope,
      "! $required
      text        TYPE ty_sit2_obj_act_t,
      navigation TYPE ty_sit2_obj_act_nav,
      callback   TYPE ty_sit2_obj_act_cb,
    END OF ty_sit2_obj_act,

    "! <p class="shorttext">End User Actions</p>
    "! Situation object end user actions
    ty_sit2_obj_act_list TYPE STANDARD TABLE OF ty_sit2_obj_act WITH DEFAULT KEY,

    "! <p class="shorttext">Navigation Details</p>
    "! Situation object navigation
    BEGIN OF ty_sit2_obj_nav,
      "! <p class="shorttext">ID</p>
      "! Navigation id
      "! $required
      id                     TYPE c LENGTH 32,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      "! $required
      reusable               TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope                  TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Semantic Object</p>
      "! Semantic object
      "! $required
      semantic_object        TYPE c LENGTH 50,
      "! <p class="shorttext">Semantic Object Action</p>
      "! Semantic object action
      "! $required
      semantic_object_action TYPE c LENGTH 50,
      parameters             TYPE ty_sit2_obj_par_list,
    END OF ty_sit2_obj_nav,

    "! <p class="shorttext">Navigations</p>
    "! Situation object navigations
    ty_sit2_obj_nav_list TYPE STANDARD TABLE OF ty_sit2_obj_nav WITH DEFAULT KEY,

    "! <p class="shorttext">Callback Details</p>
    "! Situation object callback
    BEGIN OF ty_sit2_obj_cb,
      "! <p class="shorttext">ID</p>
      "! Callback id
      "! $required
      id         TYPE c LENGTH 32,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      "! $required
      reusable   TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope      TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Class Name</p>
      "! Class name
      "! $required
      class_name TYPE c LENGTH 30,
      parameters TYPE ty_sit2_obj_par_list,
    END OF ty_sit2_obj_cb,

    "! <p class="shorttext">Callbacks</p>
    "! Situation object callbacks
    ty_sit2_obj_cb_list TYPE STANDARD TABLE OF ty_sit2_obj_cb WITH DEFAULT KEY,

    "! <p class="shorttext">Value Help Service Details</p>
    "! Value help service for situation object
    BEGIN OF ty_sit2_obj_vh_s,
      "! <p class="shorttext">ID</p>
      "! Service id for value help
      "! $required
      id                           TYPE c LENGTH 32,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      "! $required
      reusable                     TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope                        TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Protocol Version</p>
      "! Service protocol version for value help
      "! $required
      protocol_version             TYPE ty_sit2_do_vh_srv_protocol_ver,
      "! <p class="shorttext">Path Type</p>
      "! Service path type for value help
      "! $required
      path_type                    TYPE ty_sit2_do_vh_srv_path_type,
      "! <p class="shorttext">Custom Path</p>
      "! Service custom path for value help
      "! $required
      custom_path                  TYPE c LENGTH 255,
      "! <p class="shorttext">Binding</p>
      "! Service binding for value help
      "! $required
      binding                      TYPE c LENGTH 40,
      "! <p class="shorttext">Definition</p>
      "! Service definition for value help
      "! $required
      definition                   TYPE c LENGTH 30,
      "! <p class="shorttext">Version</p>
      "! Service version for value help
      "! $required
      version                      TYPE n LENGTH 4,
      value_help_service_providers TYPE ty_sit2_obj_vh_s_p_list,
    END OF ty_sit2_obj_vh_s,

    "! <p class="shorttext">Value Help Services</p>
    "! Value help services for situation object
    ty_sit2_obj_vh_s_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s WITH DEFAULT KEY,

    "! <p class="shorttext">Situation Object</p>
    "! Situation object
    BEGIN OF ty_sit2_object,
      "! <p class="shorttext">Reusable</p>
      "! Object reusable
      "! $required
      reusable            TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope               TYPE ty_sit2_do_scope,
      "! <p class="shorttext">SAP Object Type</p>
      "! SAP object type
      "! $required
      sap_object_type     TYPE c LENGTH 30,
      "! <p class="shorttext">Extensible</p>
      "! Object extensible
      "! $required
      extensible          TYPE abap_bool,
      "! $required
      text                TYPE ty_sit2_object_t,
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
