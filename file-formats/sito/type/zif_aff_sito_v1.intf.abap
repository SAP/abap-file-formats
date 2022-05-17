INTERFACE if_aff_sito_v1
  PUBLIC .

  TYPES:

    "! <p class="shorttext">SIT2_OBJ_STRUC_T</p>
    "! SIT2_OBJ_STRUC_T
    BEGIN OF ty_sit2_obj_struc_t,
      "! <p class="shorttext">Situation Object Structure Description</p>
      sitnobjstrucdesc TYPE sit2_de_obj_struc_desc,
      "! <p class="shorttext">Language Key</p>
      language         TYPE spras,
    END OF ty_sit2_obj_struc_t,

    "! <p class="shorttext">List of SIT2_OBJ_STRUC_T</p>
    "! List of SIT2_OBJ_STRUC_T
    ty_sit2_obj_struc_t_list TYPE STANDARD TABLE OF ty_sit2_obj_struc_t WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_STR_SK</p>
    "! SIT2_OBJ_STR_SK
    BEGIN OF ty_sit2_obj_str_sk,
      "! <p class="shorttext">Object Field Order for Situation</p>
      sitnobjectfieldorder TYPE sit2_de_object_field_order,
      "! <p class="shorttext">Object Field</p>
      sitnobjectfield      TYPE sit2_de_object_field,
    END OF ty_sit2_obj_str_sk,

    "! <p class="shorttext">List of SIT2_OBJ_STR_SK</p>
    "! List of SIT2_OBJ_STR_SK
    ty_sit2_obj_str_sk_list TYPE STANDARD TABLE OF ty_sit2_obj_str_sk WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_NAV_PAR</p>
    "! SIT2_OBJ_NAV_PAR
    BEGIN OF ty_sit2_obj_nav_par,
      "! <p class="shorttext">Name of Navigation Parameter</p>
      sitnnavgnparamname TYPE sit2_de_navgn_param_name,
    END OF ty_sit2_obj_nav_par,

    "! <p class="shorttext">List of SIT2_OBJ_NAV_PAR</p>
    "! List of SIT2_OBJ_NAV_PAR
    ty_sit2_obj_nav_par_list TYPE STANDARD TABLE OF ty_sit2_obj_nav_par WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_ACT_T</p>
    "! SIT2_OBJ_ACT_T
    BEGIN OF ty_sit2_obj_act_t,
      "! <p class="shorttext">Language Key</p>
      language              TYPE spras,
      "! <p class="shorttext">Name of Action</p>
      sitnactionname        TYPE sit2_de_action_name,
      "! <p class="shorttext">Description of Action</p>
      sitnactiondescription TYPE sit2_de_action_desc,
    END OF ty_sit2_obj_act_t,

    "! <p class="shorttext">List of SIT2_OBJ_ACT_T</p>
    "! List of SIT2_OBJ_ACT_T
    ty_sit2_obj_act_t_list TYPE STANDARD TABLE OF ty_sit2_obj_act_t WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_ACT_NAV</p>
    "! SIT2_OBJ_ACT_NAV
    BEGIN OF ty_sit2_obj_act_nav,
      "! <p class="shorttext">Navigation ID</p>
      sitnnavigationid TYPE sit2_de_nav_id,
    END OF ty_sit2_obj_act_nav,

    "! <p class="shorttext">List of SIT2_OBJ_ACT_NAV</p>
    "! List of SIT2_OBJ_ACT_NAV
    ty_sit2_obj_act_nav_list TYPE STANDARD TABLE OF ty_sit2_obj_act_nav WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_EVENT_T</p>
    "! SIT2_OBJ_EVENT_T
    BEGIN OF ty_sit2_obj_event_t,
      "! <p class="shorttext">Description</p>
      sitnobjeventdesc TYPE sit2_de_desc,
      "! <p class="shorttext">Language Key</p>
      language         TYPE spras,
    END OF ty_sit2_obj_event_t,

    "! <p class="shorttext">List of SIT2_OBJ_EVENT_T</p>
    "! List of SIT2_OBJ_EVENT_T
    ty_sit2_obj_event_t_list TYPE STANDARD TABLE OF ty_sit2_obj_event_t WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_ACT_CB</p>
    "! SIT2_OBJ_ACT_CB
    BEGIN OF ty_sit2_obj_act_cb,
      "! <p class="shorttext">Callback ID</p>
      sitncallbackid TYPE sit2_de_callback_id,
    END OF ty_sit2_obj_act_cb,

    "! <p class="shorttext">List of SIT2_OBJ_ACT_CB</p>
    "! List of SIT2_OBJ_ACT_CB
    ty_sit2_obj_act_cb_list TYPE STANDARD TABLE OF ty_sit2_obj_act_cb WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_CB_PAR</p>
    "! SIT2_OBJ_CB_PAR
    BEGIN OF ty_sit2_obj_cb_par,
      "! <p class="shorttext">Name of Callback Parameter</p>
      sitncallbackparamname TYPE sit2_de_callback_param_name,
    END OF ty_sit2_obj_cb_par,

    "! <p class="shorttext">List of SIT2_OBJ_CB_PAR</p>
    "! List of SIT2_OBJ_CB_PAR
    ty_sit2_obj_cb_par_list TYPE STANDARD TABLE OF ty_sit2_obj_cb_par WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_VH_S_P</p>
    "! SIT2_OBJ_VH_S_P
    BEGIN OF ty_sit2_obj_vh_s_p,
      "! <p class="shorttext">Name</p>
      sitnobjvhsrvproperty  TYPE /iwbep/sbdm_element_name,
      "! <p class="shorttext">Name</p>
      sitnobjvhsrventityset TYPE /iwbep/sbdm_element_name,
    END OF ty_sit2_obj_vh_s_p,

    "! <p class="shorttext">List of SIT2_OBJ_VH_S_P</p>
    "! List of SIT2_OBJ_VH_S_P
    ty_sit2_obj_vh_s_p_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s_p WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OS_VH_MAP</p>
    "! SIT2_OS_VH_MAP
    BEGIN OF ty_sit2_os_vh_map,
      "! <p class="shorttext">App for Value Help</p>
      sitnobjstrucvhapptype TYPE sit2_de_vh_app_type,
      "! <p class="shorttext">Type of Value Help</p>
      sitnobjstrucvhtype    TYPE sit2_de_vh_type,
      "! <p class="shorttext">Source</p>
      sitnobjstrucvhscope   TYPE sit2_de_scope,
      "! <p class="shorttext">Object Field</p>
      sitnobjstrucfieldname TYPE sit2_de_object_field,
    END OF ty_sit2_os_vh_map,

    "! <p class="shorttext">List of SIT2_OS_VH_MAP</p>
    "! List of SIT2_OS_VH_MAP
    ty_sit2_os_vh_map_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OS_VH_MAP_S</p>
    "! SIT2_OS_VH_MAP_S
    BEGIN OF ty_sit2_os_vh_map_s,
      "! <p class="shorttext">App for Value Help</p>
      sitnobjstrucvhapptype TYPE sit2_de_vh_app_type,
      "! <p class="shorttext">Object Field</p>
      sitnobjstrucfieldname TYPE sit2_de_object_field,
      "! <p class="shorttext">Name</p>
      sitnobjvhsrventityset TYPE /iwbep/sbdm_element_name,
      "! <p class="shorttext">Name</p>
      sitnobjvhsrvproperty  TYPE /iwbep/sbdm_element_name,
      "! <p class="shorttext">Service ID for Value Help</p>
      sitnobjvhsrvcid       TYPE sit2_de_vh_srv_id,
    END OF ty_sit2_os_vh_map_s,

    "! <p class="shorttext">List of SIT2_OS_VH_MAP_S</p>
    "! List of SIT2_OS_VH_MAP_S
    ty_sit2_os_vh_map_s_list TYPE STANDARD TABLE OF ty_sit2_os_vh_map_s WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJECT_T</p>
    "! SIT2_OBJECT_T
    BEGIN OF ty_sit2_object_t,
      "! <p class="shorttext">Situation Object Name</p>
      sitnobjectname        TYPE sit2_de_object_name,
      "! <p class="shorttext">Description</p>
      sitnobjectdescription TYPE sit2_de_desc,
      "! <p class="shorttext">Language Key</p>
      language              TYPE spras,
    END OF ty_sit2_object_t,

    "! <p class="shorttext">List of SIT2_OBJECT_T</p>
    "! List of SIT2_OBJECT_T
    ty_sit2_object_t_list TYPE STANDARD TABLE OF ty_sit2_object_t WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_STRUC</p>
    "! SIT2_OBJ_STRUC
    BEGIN OF ty_sit2_obj_struc,
      "! <p class="shorttext">Object Reusable</p>
      sitnobjstrucisreusable TYPE sit2_de_reusable,
      "! <p class="shorttext">Situation Object Structure Type</p>
      sitnobjstructype       TYPE sit2_de_obj_struc_type,
      "! <p class="shorttext">Source</p>
      sitnobjstrucscope      TYPE sit2_de_scope,
      "! <p class="shorttext"></p>
      sitnobjstrucname       TYPE ddstrucobjname,
      "! <p class="shorttext">Situation Object Structure ID</p>
      sitnobjstrucid         TYPE sit2_de_obj_struc_id,
      sit2_obj_struc_t       TYPE ty_sit2_obj_struc_t_list,
      sit2_obj_str_sk        TYPE ty_sit2_obj_str_sk_list,
      sit2_os_vh_map         TYPE ty_sit2_os_vh_map_list,
      sit2_os_vh_map_s       TYPE ty_sit2_os_vh_map_s_list,
    END OF ty_sit2_obj_struc,

    "! <p class="shorttext">List of SIT2_OBJ_STRUC</p>
    "! List of SIT2_OBJ_STRUC
    ty_sit2_obj_struc_list TYPE STANDARD TABLE OF ty_sit2_obj_struc WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_EVENTS</p>
    "! SIT2_OBJ_EVENTS
    BEGIN OF ty_sit2_obj_events,
      "! <p class="shorttext">Object Reusable</p>
      sitnobjevtisreusable     TYPE sit2_de_reusable,
      "! <p class="shorttext">Object Type Category</p>
      sitnobjeventcategory     TYPE swfeclstyp,
      "! <p class="shorttext">Source</p>
      sitnobjevtscope          TYPE sit2_de_scope,
      "! <p class="shorttext">Situation Event ID</p>
      sitnobjeventid           TYPE sit2_de_event_id,
      "! <p class="shorttext">Object Type</p>
      sitnobjeventobject       TYPE sibftypeid,
      "! <p class="shorttext">Object Type</p>
      sitnobjeventtype         TYPE sibftypeid,
      "! <p class="shorttext">Situation Object Structure ID</p>
      sitnobjeventparamstrucid TYPE sit2_de_obj_struc_id,
      sit2_obj_event_t         TYPE ty_sit2_obj_event_t_list,
    END OF ty_sit2_obj_events,

    "! <p class="shorttext">List of SIT2_OBJ_EVENTS</p>
    "! List of SIT2_OBJ_EVENTS
    ty_sit2_obj_events_list TYPE STANDARD TABLE OF ty_sit2_obj_events WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_NAV</p>
    "! SIT2_OBJ_NAV
    BEGIN OF ty_sit2_obj_nav,
      "! <p class="shorttext">Object Reusable</p>
      sitnobjnavisreusable     TYPE sit2_de_reusable,
      "! <p class="shorttext">Source</p>
      sitnobjnavscope          TYPE sit2_de_scope,
      "! <p class="shorttext">Navigation ID</p>
      sitnnavigationid         TYPE sit2_de_nav_id,
      "! <p class="shorttext">Semantic Object Action</p>
      sitnsemanticobjectaction TYPE sit2_de_semantic_object_act,
      "! <p class="shorttext">Semantic Object</p>
      sitnsemanticobject       TYPE sit2_de_semantic_object,
      sit2_obj_nav_par         TYPE ty_sit2_obj_nav_par_list,
    END OF ty_sit2_obj_nav,

    "! <p class="shorttext">List of SIT2_OBJ_NAV</p>
    "! List of SIT2_OBJ_NAV
    ty_sit2_obj_nav_list TYPE STANDARD TABLE OF ty_sit2_obj_nav WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_ACT</p>
    "! SIT2_OBJ_ACT
    BEGIN OF ty_sit2_obj_act,
      "! <p class="shorttext">Object Reusable</p>
      sitnobjactisreusable TYPE sit2_de_reusable,
      "! <p class="shorttext">Action Type of Situation</p>
      sitnactiontype       TYPE sit2_de_action_type,
      "! <p class="shorttext">Source</p>
      sitnobjactscope      TYPE sit2_de_scope,
      "! <p class="shorttext">Action ID</p>
      sitnactionid         TYPE sit2_de_action_id,
      sit2_obj_act_t       TYPE ty_sit2_obj_act_t_list,
      sit2_obj_act_nav     TYPE ty_sit2_obj_act_nav_list,
      sit2_obj_act_cb      TYPE ty_sit2_obj_act_cb_list,
    END OF ty_sit2_obj_act,

    "! <p class="shorttext">List of SIT2_OBJ_ACT</p>
    "! List of SIT2_OBJ_ACT
    ty_sit2_obj_act_list TYPE STANDARD TABLE OF ty_sit2_obj_act WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_CB</p>
    "! SIT2_OBJ_CB
    BEGIN OF ty_sit2_obj_cb,
      "! <p class="shorttext">Object Reusable</p>
      sitnobjclbkisreusable TYPE sit2_de_reusable,
      "! <p class="shorttext">Source</p>
      sitnobjclbkscope      TYPE sit2_de_scope,
      "! <p class="shorttext">Reference to</p>
      sitncallbackclassname TYPE classname,
      "! <p class="shorttext">Callback ID</p>
      sitncallbackid        TYPE sit2_de_callback_id,
      sit2_obj_cb_par       TYPE ty_sit2_obj_cb_par_list,
    END OF ty_sit2_obj_cb,

    "! <p class="shorttext">List of SIT2_OBJ_CB</p>
    "! List of SIT2_OBJ_CB
    ty_sit2_obj_cb_list TYPE STANDARD TABLE OF ty_sit2_obj_cb WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJ_VH_S</p>
    "! SIT2_OBJ_VH_S
    BEGIN OF ty_sit2_obj_vh_s,
      "! <p class="shorttext">Object Reusable</p>
      sitnobjvhsrvcisreusable      TYPE sit2_de_reusable,
      "! <p class="shorttext">Service Version for Value Help</p>
      sitnobjvhsrvcversion         TYPE sit2_de_vh_srv_version,
      "! <p class="shorttext">Service Protocol Version for Value Help</p>
      sitnobjvhsrvcprotocolversion TYPE sit2_de_vh_srv_protocol_vers,
      "! <p class="shorttext">Service Path Type for Value Help</p>
      sitnobjvhsrvcpathtype        TYPE sit2_de_vh_srv_path_type,
      "! <p class="shorttext">Source</p>
      sitnobjvhsrvcscope           TYPE sit2_de_scope,
      "! <p class="shorttext">Service Definition for Value Help</p>
      sitnobjvhsrvcdefinition      TYPE sit2_de_vh_srv_definition,
      "! <p class="shorttext">Service Binding for Value Help</p>
      sitnobjvhsrvcbinding         TYPE sit2_de_vh_srv_binding,
      "! <p class="shorttext">Service ID for Value Help</p>
      sitnobjvhsrvcid              TYPE sit2_de_vh_srv_id,
      "! <p class="shorttext">Service Custom Path for Value Help</p>
      sitnobjvhsrvccustompath      TYPE sit2_de_vh_srv_custom_path,
      sit2_obj_vh_s_p              TYPE ty_sit2_obj_vh_s_p_list,
    END OF ty_sit2_obj_vh_s,

    "! <p class="shorttext">List of SIT2_OBJ_VH_S</p>
    "! List of SIT2_OBJ_VH_S
    ty_sit2_obj_vh_s_list TYPE STANDARD TABLE OF ty_sit2_obj_vh_s WITH EMPTY KEY,

    "! <p class="shorttext">SIT2_OBJECT</p>
    "! SIT2_OBJECT
    BEGIN OF ty_sit2_object,
      "! <p class="shorttext">Situation Object ID</p>
      sitnobjectid          TYPE sit2_de_object_id,
      "! <p class="shorttext">ABAP Language Version</p>
      abap_language_version TYPE abap_language_version,
      "! <p class="shorttext">Object Extensible</p>
      sitnobjisextensible   TYPE sit2_de_extensible,
      "! <p class="shorttext">Object Reusable</p>
      sitnobjisreusable     TYPE sit2_de_reusable,
      "! <p class="shorttext">Source</p>
      sitnobjscope          TYPE sit2_de_scope,
      sit2_object_t         TYPE ty_sit2_object_t_list,
      sit2_obj_struc        TYPE ty_sit2_obj_struc_list,
      sit2_obj_events       TYPE ty_sit2_obj_events_list,
      sit2_obj_nav          TYPE ty_sit2_obj_nav_list,
      sit2_obj_act          TYPE ty_sit2_obj_act_list,
      sit2_obj_cb           TYPE ty_sit2_obj_cb_list,
      sit2_obj_vh_s         TYPE ty_sit2_obj_vh_s_list,
    END OF ty_sit2_object,

    "! <p class="shorttext">List of SIT2_OBJECT</p>
    "! List of SIT2_OBJECT
    ty_sit2_object_list TYPE STANDARD TABLE OF ty_sit2_object WITH EMPTY KEY.





  TYPES:
    "! <p class="shorttext">Situation Object Properties</p>
    "! Situation Object properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Format version</p>
      "! Format version
      "! $required
      format_version TYPE if_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE if_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Situation Object</p>
      "! Situation Object
      "! $required
      sit2_object    TYPE ty_sit2_object,
    END OF ty_main.

ENDINTERFACE.
