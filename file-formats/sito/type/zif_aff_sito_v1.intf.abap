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
      Customer TYPE ty_sit2_do_scope VALUE '02',
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
      In_Memory TYPE ty_sit2_do_obj_struc_type VALUE '02',
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
      Business_Class       TYPE ty_swfeclstyp VALUE 'BC',
      "! <p class="shorttext">BOR Object Type</p>
      "! BOR Object Type
      BOR_Object_Type      TYPE ty_swfeclstyp VALUE 'BO',
      "! <p class="shorttext">ABAP Class</p>
      "! ABAP Class
      ABAP_Class           TYPE ty_swfeclstyp VALUE 'CL',
      "! <p class="shorttext">Business Object Type</p>
      "! Business Object Type
      Business_Object_Type TYPE ty_swfeclstyp VALUE 'EO',
      "! <p class="shorttext">XML Object Type</p>
      "! XML Object Type
      XML_Object_Type      TYPE ty_swfeclstyp VALUE 'XC',
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
      Navigation_Action TYPE ty_sit2_do_action_type VALUE '01',
      "! <p class="shorttext">Callback Action</p>
      "! Callback Action
      Callback_Action   TYPE ty_sit2_do_action_type VALUE '02',
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
      Standard TYPE ty_sit2_do_vh_srv_path_type VALUE '01',
      "! <p class="shorttext">Custom</p>
      "! Custom
      Custom   TYPE ty_sit2_do_vh_srv_path_type VALUE '02',
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
      All_Apps TYPE ty_sit2_do_vh_app_type VALUE '01',
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
      Service TYPE ty_sit2_do_vh_type VALUE '01',
    END OF co_sit2_do_vh_type.

  TYPES:

    "! <p class="shorttext">Structure Text</p>
    "! Situation Object Structue
    BEGIN OF ty_sit2_obj_struc_t,
      "! <p class="shorttext">Description</p>
      "! Situation Object Structure Description
      Description TYPE c LENGTH 255,
    END OF ty_sit2_obj_struc_t,

    "! <p class="shorttext">Structure Text</p>
    "! Situation Object Structue
    ty_sit2_obj_struc_t_list TYPE STANDARD TABLE OF ty_sit2_obj_struc_t WITH DEFAULT KEY,

    "! <p class="shorttext">Structure Semantic Key</p>
    "! Semantic Keys of an Object Structure
    BEGIN OF ty_sit2_obj_str_sk,
      "! <p class="shorttext">Field Order</p>
      "! Object Field Order for Situation
      Field_Order TYPE n LENGTH 2,
      "! <p class="shorttext">Field</p>
      "! Object Field
      Field       TYPE c LENGTH 30,
    END OF ty_sit2_obj_str_sk,

    "! <p class="shorttext">Structure Semantic Key</p>
    "! Semantic Keys of an Object Structure
    ty_sit2_obj_str_sk_list TYPE STANDARD TABLE OF ty_sit2_obj_str_sk WITH DEFAULT KEY,

    "! <p class="shorttext">Structure Value Help Map</p>
    "! Value Help Mapping for Situation Object Structure
    BEGIN OF ty_sit2_os_vh_map,
      "! <p class="shorttext">App Type</p>
      "! App for Value Help
      "! $required
      App_Type   TYPE ty_sit2_do_vh_app_type,
      "! <p class="shorttext">Type</p>
      "! Type of Value Help
      "! $required
      Type       TYPE ty_sit2_do_vh_type,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      Scope      TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Field Name</p>
      "! Object Field
      Field_Name TYPE c LENGTH 30,
    END OF ty_sit2_os_vh_map,

    "! <p class="shorttext">Structure Value Help Map</p>
    "! Value Help Mapping for Situation Object Structure
    ty_sit2_os_vh_map_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map WITH DEFAULT KEY,

    "! <p class="shorttext">Structure Value Help Map Srv</p>
    "! Value Help Mapping for Situation Object Structure - Service
    BEGIN OF ty_sit2_os_vh_map_s,
      "! <p class="shorttext">Type</p>
      "! App for Value Help
      "! $required
      Type       TYPE ty_sit2_do_vh_app_type,
      "! <p class="shorttext">Field Name</p>
      "! Object Field
      Field_Name TYPE c LENGTH 30,
      "! <p class="shorttext">Entity Set</p>
      "! Name
      Entity_Set TYPE c LENGTH 40,
      "! <p class="shorttext">Property</p>
      "! Name
      Property   TYPE c LENGTH 40,
      "! <p class="shorttext">ID</p>
      "! Service ID for Value Help
      id         TYPE c LENGTH 32,
    END OF ty_sit2_os_vh_map_s,

    "! <p class="shorttext">Structure Value Help Map Srv</p>
    "! Value Help Mapping for Situation Object Structure - Service
    ty_sit2_os_vh_map_s_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map_s WITH DEFAULT KEY,

    "! <p class="shorttext">Event Text</p>
    "! Situation Object Events Text
    BEGIN OF ty_sit2_obj_event_t,
      "! <p class="shorttext">Description</p>
      "! Description
      Description TYPE c LENGTH 255,
    END OF ty_sit2_obj_event_t,

    "! <p class="shorttext">Event Text</p>
    "! Situation Object Events Text
    ty_sit2_obj_event_t_list TYPE STANDARD TABLE OF ty_sit2_obj_event_t WITH DEFAULT KEY,

    "! <p class="shorttext">Action Text</p>
    "! Text Table for Situation Object Actions
    BEGIN OF ty_sit2_obj_act_t,
      "! <p class="shorttext">Name</p>
      "! Name of Action
      Name        TYPE c LENGTH 40,
      "! <p class="shorttext">Description</p>
      "! Description of Action
      Description TYPE c LENGTH 255,
    END OF ty_sit2_obj_act_t,

    "! <p class="shorttext">Action Text</p>
    "! Text Table for Situation Object Actions
    ty_sit2_obj_act_t_list TYPE STANDARD TABLE OF ty_sit2_obj_act_t WITH DEFAULT KEY,

    "! <p class="shorttext">Action Navigation</p>
    "! Situation Object Action - Navigation
    BEGIN OF ty_sit2_obj_act_nav,
      "! <p class="shorttext">ID</p>
      "! Navigation ID
      id TYPE c LENGTH 32,
    END OF ty_sit2_obj_act_nav,

    "! <p class="shorttext">Action Navigation</p>
    "! Situation Object Action - Navigation
    ty_sit2_obj_act_nav_list TYPE STANDARD TABLE OF ty_sit2_obj_act_nav WITH DEFAULT KEY,

    "! <p class="shorttext">Action Callback</p>
    "! Situation Object Action - Callback
    BEGIN OF ty_sit2_obj_act_cb,
      "! <p class="shorttext">Callback ID</p>
      "! Callback ID
      Callback_ID TYPE c LENGTH 32,
    END OF ty_sit2_obj_act_cb,

    "! <p class="shorttext">Action Callback</p>
    "! Situation Object Action - Callback
    ty_sit2_obj_act_cb_list TYPE STANDARD TABLE OF ty_sit2_obj_act_cb WITH DEFAULT KEY,

    "! <p class="shorttext">Navigation Parameter</p>
    "! Situation Object Navigation Parameter
    BEGIN OF ty_sit2_obj_nav_par,
      "! <p class="shorttext">Name</p>
      "! Name of Navigation Parameter
      Name TYPE c LENGTH 30,
    END OF ty_sit2_obj_nav_par,

    "! <p class="shorttext">Navigation Parameter</p>
    "! Situation Object Navigation Parameter
    ty_sit2_obj_nav_par_list TYPE STANDARD TABLE OF ty_sit2_obj_nav_par WITH DEFAULT KEY,

    "! <p class="shorttext">Callback Parameter</p>
    "! Situation Object Callback Parameter
    BEGIN OF ty_sit2_obj_cb_par,
      "! <p class="shorttext">Name</p>
      "! Name of Callback Parameter
      Name TYPE c LENGTH 30,
    END OF ty_sit2_obj_cb_par,

    "! <p class="shorttext">Callback Parameter</p>
    "! Situation Object Callback Parameter
    ty_sit2_obj_cb_par_list TYPE STANDARD TABLE OF ty_sit2_obj_cb_par WITH DEFAULT KEY,

    "! <p class="shorttext">Value Help Service Provider</p>
    "! Property of Value Help Service for Situation Object
    BEGIN OF ty_sit2_obj_vh_s_p,
      "! <p class="shorttext">Property</p>
      "! Name
      Property   TYPE c LENGTH 40,
      "! <p class="shorttext">Entity Set</p>
      "! Name
      Entity_Set TYPE c LENGTH 40,
    END OF ty_sit2_obj_vh_s_p,

    "! <p class="shorttext">Value Help Service Provider</p>
    "! Property of Value Help Service for Situation Object
    ty_sit2_obj_vh_s_p_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s_p WITH DEFAULT KEY,

    "! <p class="shorttext">Situation Object Text</p>
    "! Situation Object Text
    BEGIN OF ty_sit2_object_t,
      "! <p class="shorttext">Name</p>
      "! Situation Object Name
      Name        TYPE c LENGTH 40,
      "! <p class="shorttext">Description</p>
      "! Description
      Description TYPE c LENGTH 255,
    END OF ty_sit2_object_t,

    "! <p class="shorttext">Situation Object Text</p>
    "! Situation Object Text
    ty_sit2_object_t_list TYPE STANDARD TABLE OF ty_sit2_object_t WITH DEFAULT KEY,

    "! <p class="shorttext">Situation Object Structure</p>
    "! Situation Object Structure
    BEGIN OF ty_sit2_obj_struc,
      "! <p class="shorttext">Reusable</p>
      "! Object Reusable
      Reusable                     TYPE abap_bool,
      "! <p class="shorttext">Type</p>
      "! Situation Object Structure Type
      "! $required
      Type                         TYPE ty_sit2_do_obj_struc_type,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      Scope                        TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Name</p>
      "!
      Name                         TYPE c LENGTH 30,
      "! <p class="shorttext">SAP Object Node Type</p>
      "! SAP Object Node Type
      SAP_Object_Node_Type         TYPE c LENGTH 30,
      "! <p class="shorttext">ID</p>
      "! Situation Object Structure ID
      id                           TYPE c LENGTH 32,
      Structure_Text               TYPE ty_sit2_obj_struc_t_list,
      Structure_Semantic_Key       TYPE ty_sit2_obj_str_sk_list,
      Structure_Value_Help_Map     TYPE ty_sit2_os_vh_map_list,
      Structure_Value_Help_Map_Srv TYPE ty_sit2_os_vh_map_s_list,
    END OF ty_sit2_obj_struc,

    "! <p class="shorttext">Situation Object Structure</p>
    "! Situation Object Structure
    ty_sit2_obj_struc_list TYPE STANDARD TABLE OF ty_sit2_obj_struc WITH DEFAULT KEY,

    "! <p class="shorttext">Situation Object Event</p>
    "! Situation Object Events
    BEGIN OF ty_sit2_obj_events,
      "! <p class="shorttext">Reusable</p>
      "! Object Reusable
      Reusable               TYPE abap_bool,
      "! <p class="shorttext">Category</p>
      "! Object Type Category
      "! $required
      Category               TYPE ty_swfeclstyp,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      Scope                  TYPE ty_sit2_do_scope,
      "! <p class="shorttext">ID</p>
      "! Situation Event ID
      id                     TYPE c LENGTH 32,
      "! <p class="shorttext">Object</p>
      "! Object Type
      Object                 TYPE c LENGTH 32,
      "! <p class="shorttext">Type</p>
      "! Object Type
      Type                   TYPE c LENGTH 32,
      "! <p class="shorttext">Parameter Structure ID</p>
      "! Situation Object Structure ID
      Parameter_Structure_ID TYPE c LENGTH 32,
      Event_Text             TYPE ty_sit2_obj_event_t_list,
    END OF ty_sit2_obj_events,

    "! <p class="shorttext">Situation Object Event</p>
    "! Situation Object Events
    ty_sit2_obj_events_list TYPE STANDARD TABLE OF ty_sit2_obj_events WITH DEFAULT KEY,

    "! <p class="shorttext">Situation Object Action</p>
    "! Situation Object Actions
    BEGIN OF ty_sit2_obj_act,
      "! <p class="shorttext">Reusable</p>
      "! Object Reusable
      Reusable          TYPE abap_bool,
      "! <p class="shorttext">Type</p>
      "! Action Type of Situation
      "! $required
      Type              TYPE ty_sit2_do_action_type,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      Scope             TYPE ty_sit2_do_scope,
      "! <p class="shorttext">ID</p>
      "! Action ID
      id                TYPE c LENGTH 32,
      Action_Text       TYPE ty_sit2_obj_act_t_list,
      Action_Navigation TYPE ty_sit2_obj_act_nav_list,
      Action_Callback   TYPE ty_sit2_obj_act_cb_list,
    END OF ty_sit2_obj_act,

    "! <p class="shorttext">Situation Object Action</p>
    "! Situation Object Actions
    ty_sit2_obj_act_list TYPE STANDARD TABLE OF ty_sit2_obj_act WITH DEFAULT KEY,

    "! <p class="shorttext">Situation Object Navigation</p>
    "! Situation Object Navigation
    BEGIN OF ty_sit2_obj_nav,
      "! <p class="shorttext">Reusable</p>
      "! Object Reusable
      Reusable               TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      Scope                  TYPE ty_sit2_do_scope,
      "! <p class="shorttext">ID</p>
      "! Navigation ID
      id                     TYPE c LENGTH 32,
      "! <p class="shorttext">Semantic Object Action</p>
      "! Semantic Object Action
      Semantic_Object_Action TYPE c LENGTH 50,
      "! <p class="shorttext">Semantic Object</p>
      "! Semantic Object
      Semantic_Object        TYPE c LENGTH 50,
      Navigation_Parameter   TYPE ty_sit2_obj_nav_par_list,
    END OF ty_sit2_obj_nav,

    "! <p class="shorttext">Situation Object Navigation</p>
    "! Situation Object Navigation
    ty_sit2_obj_nav_list TYPE STANDARD TABLE OF ty_sit2_obj_nav WITH DEFAULT KEY,

    "! <p class="shorttext">Situation Object Callback</p>
    "! Situation Object Callback
    BEGIN OF ty_sit2_obj_cb,
      "! <p class="shorttext">Reusable</p>
      "! Object Reusable
      Reusable           TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      Scope              TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Class Name</p>
      "! Reference to
      Class_Name         TYPE c LENGTH 30,
      "! <p class="shorttext">ID</p>
      "! Callback ID
      id                 TYPE c LENGTH 32,
      Callback_Parameter TYPE ty_sit2_obj_cb_par_list,
    END OF ty_sit2_obj_cb,

    "! <p class="shorttext">Situation Object Callback</p>
    "! Situation Object Callback
    ty_sit2_obj_cb_list TYPE STANDARD TABLE OF ty_sit2_obj_cb WITH DEFAULT KEY,

    "! <p class="shorttext">Value Help Service</p>
    "! Value Help Service for Situation Object
    BEGIN OF ty_sit2_obj_vh_s,
      "! <p class="shorttext">Reusable</p>
      "! Object Reusable
      Reusable                    TYPE abap_bool,
      "! <p class="shorttext">Version</p>
      "! Service Version for Value Help
      Version                     TYPE n LENGTH 4,
      "! <p class="shorttext">Protocol Version</p>
      "! Service Protocol Version for Value Help
      "! $required
      Protocol_Version            TYPE ty_sit2_do_vh_srv_protocol_ver,
      "! <p class="shorttext">Path Type</p>
      "! Service Path Type for Value Help
      "! $required
      Path_Type                   TYPE ty_sit2_do_vh_srv_path_type,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      Scope                       TYPE ty_sit2_do_scope,
      "! <p class="shorttext">Definition</p>
      "! Service Definition for Value Help
      Definition                  TYPE c LENGTH 30,
      "! <p class="shorttext">Binding</p>
      "! Service Binding for Value Help
      Binding                     TYPE c LENGTH 40,
      "! <p class="shorttext">ID</p>
      "! Service ID for Value Help
      id                          TYPE c LENGTH 32,
      "! <p class="shorttext">Custom Path</p>
      "! Service Custom Path for Value Help
      Custom_Path                 TYPE c LENGTH 255,
      Value_Help_Service_Provider TYPE ty_sit2_obj_vh_s_p_list,
    END OF ty_sit2_obj_vh_s,

    "! <p class="shorttext">Value Help Service</p>
    "! Value Help Service for Situation Object
    ty_sit2_obj_vh_s_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s WITH DEFAULT KEY,

    "! <p class="shorttext">Situation Object</p>
    "! Situation Object
    BEGIN OF ty_sit2_object,
      "! <p class="shorttext">Extensible</p>
      "! Object Extensible
      Extensible                  TYPE abap_bool,
      "! <p class="shorttext">Reusable</p>
      "! Object Reusable
      Reusable                    TYPE abap_bool,
      "! <p class="shorttext">Scope</p>
      "! Source
      "! $required
      Scope                       TYPE ty_sit2_do_scope,
      "! <p class="shorttext">SAP Object Type</p>
      "! SAP Object Type
      SAP_Object_Type             TYPE c LENGTH 30,
      Situation_Object_Text       TYPE ty_sit2_object_t_list,
      Situation_Object_Structure  TYPE ty_sit2_obj_struc_list,
      Situation_Object_Event      TYPE ty_sit2_obj_events_list,
      Situation_Object_Action     TYPE ty_sit2_obj_act_list,
      Situation_Object_Navigation TYPE ty_sit2_obj_nav_list,
      Situation_Object_Callback   TYPE ty_sit2_obj_cb_list,
      Value_Help_Service          TYPE ty_sit2_obj_vh_s_list,
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
      Situation_Object TYPE ty_sit2_object,
    END OF ty_main.

ENDINTERFACE.
