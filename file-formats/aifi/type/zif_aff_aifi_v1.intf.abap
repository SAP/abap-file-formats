INTERFACE zif_aff_aifi_v1
  PUBLIC.

  "! $values { @link zif_aff_aifi_v1.data:co_integration_type }
  "! $default { @link zif_aff_aifi_v1.data:co_integration_type.soap }
  TYPES ty_integration_type TYPE c LENGTH 40.
  CONSTANTS:
    BEGIN OF co_integration_type,
      "! <p class="shorttext">SOAP</p>
      "! SOAP
      soap     TYPE ty_integration_type VALUE 'SOAP',
      "! <p class="shorttext">Sync Log</p>
      "! Sync Log
      sync_log TYPE ty_integration_type VALUE 'Sync Log',
      "! <p class="shorttext">pgPF</p>
      "! pfPF
      pg_pf    TYPE ty_integration_type VALUE 'pfPF',
      "! <p class="shorttext">Eventing</p>
      "! Eventing
      eventing TYPE ty_integration_type VALUE 'Eventing',
    END OF co_integration_type.

  TYPES:
    "! <p class="shorttext">Application Interface</p>
    "! Application interface
    BEGIN OF ty_aif_interface,
      "! <p class="shorttext">Integration Type</p>
      "! Integration Type
      "! $required
      integration_type         TYPE ty_integration_type,
      "! <p class="shorttext">SOAP Class</p>
      "! SOAP Class
      "! $required
      " SOAP / web service class is stored in /AIF/T_FINF-PROXYCLASSNAMECL type /aif/proxy_outbound
      soap_class               TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">SOAP Method</p>
      "! SOAP Method
      "! $required
      " SOAP / web service method is stored in /AIF/T_FINF-PRX_METHOD type /aif/proxy_method
      soap_method              TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">SOAP Record Type</p>
      "! SOAP Record Type
      "! $required
      " SOAP / web service record type is stored in /AIF/T_FINF-RECTYPERAW type /aif/rectyperaw
      soap_record_type         TYPE c LENGTH 45,
      "! <p class="shorttext">Repository ID</p>
      "! Repository ID
      "! $required
      " EEE - Enterprise Event Engine (type /iwxbe/reg_repository_id)
      repository_id            TYPE c LENGTH 10,
      "! <p class="shorttext">Registration ID</p>
      "! Registration ID
      "! $required
      " EEE - Enterprise Event Engine (type /iwxbe/reg_id)
      registration_id          TYPE c LENGTH 36,
      "! <p class="shorttext">Registration Version</p>
      "! Registration Version
      "! $required
      " EEE - Enterprise Event Engine (type /iwxbe/reg_version)
      registration_version     TYPE n LENGTH 4,
      "! <p class="shorttext">Topic</p>
      "! Topic
      "! $required
      " EEE - Enterprise Event Engine (type  /iwxbe/descr_topic)
      topic                    TYPE c LENGTH 255,
      "! <p class="shorttext">Operation ID</p>
      "! Operation ID
      "! $required
      " bgPF (type /aif/bgp_opid_e)
      operation_id             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Operation Variant ID</p>
      "! Operation Variant ID
      "! $required
      " bgPF (type /aif/bgp_variant_id_e)
      operation_variant_id     TYPE n LENGTH 10,
      "! <p class="shorttext">Operation Variant</p>
      "! Operation Variant
      "! $required
      " bgPF (type /aif/bgp_variant_e)
      operation_varaint        TYPE string,
      "! <p class="shorttext">Namespace Object</p>
      "! Namespace Object
      "! $required
      " (type /aif/ns_obj_name)
      namespace_object         TYPE c LENGTH 15,
      "! <p class="shorttext">AIF Interface Name</p>
      "! AIF Interface Name
      "! $required
      " (type /aif/ifname)
      interface_name           TYPE c LENGTH 10,
      "! <p class="shorttext">AIF Interface Version</p>
      "! AIF Interface Version
      "! $required
      " (type /aif/ifversion)
      interface_version        TYPE c LENGTH 5,
      "! <p class="shorttext">Index Table</p>
      "! Index Table
      "! $default '/AIF/STD_IDX_TBL'
      " (type /aif/msg_tbl)
      index_table              TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Interface Display Name</p>
      "! Interface Display Name
      " (type /aif/ifdisplay)
      display_name             TYPE c LENGTH 120,
      "! <p class="shorttext">Application Log Lifetime</p>
      "! Application Log Lifetime
      "! $default '90'
      " (type /aif/msg_lifetime)
      app_log_lifetime         TYPE n LENGTH 10,
      "! <p class="shorttext">Direction</p>
      "! Direction
      " (type /aif/ifdirection)
      direction                TYPE boolean,
      "! <p class="shorttext">Preprocessing</p>
      "! Preprocessing
      " /AIF/PRE_PROCESSING
      preprocessing            TYPE boolean,
      "! <p class="shorttext">Proxy XML Transformation</p>
      "! Use Proxy XML Transformation
      " /AIF/PROXY_XML_TRANSFORMATION
      proxy_xml_transformation TYPE boolean,
      "! <p class="shorttext">Extend XML Handling</p>
      "! Extend XML Handling
      " /AIF/PRX_XXML
      extend_xml_handling      TYPE boolean,
      "! <p class="shorttext">Postprocessing</p>
      "! Postprocessing
      postprocesssing          TYPE boolean,
    END OF ty_aif_interface.

  TYPES:
    "! <p class="shorttext">Recipient</p>
    "! Recipient
    BEGIN OF ty_recipient,
      "! <p class="shorttext">Alert Recipient</p>
      "! Alert Recipient
      "! $required
      " (type /aif/recipient_object_name)
      recipient TYPE c LENGTH 40,
    END OF ty_recipient.

  "! <p class="shorttext">Recipients</p>
  "! Recipients
  TYPES ty_recipients TYPE STANDARD TABLE OF ty_recipient WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Key Field Rule Field</p>
    "! Key Field Rule Field
    BEGIN OF ty_key_field_rules_field,
      "! <p class="shorttext">Key Field Rule Field</p>
      "! Key Field Rule Field
      " (type  /aif/key_fieldname_enh)
      key_field_rule_field TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_key_field_rules_field.

  "! <p class="shorttext">Key Field Rule Fields</p>
  "! Key Field Rule Fields
  TYPES ty_key_field_rules_fields TYPE STANDARD TABLE OF ty_key_field_rules_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Key Field</p>
    "! Key Field
    BEGIN OF ty_key_field,
      "! <p class="shorttext">Key Field Name</p>
      "! Key Field Name
      "! $required
      " (type /aif/key_fieldname)
      key_field_name           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Data Element</p>
      "! Data Element
      "! $required
      data_element             TYPE rollname,
      "! <p class="shorttext">Name of Select-Option/Parameter</p>
      "! Name of Select-Option/Parameter
      " (type /aif/stexti)
      selopt_name              TYPE c LENGTH 8,
      "! <p class="shorttext">Select-Option</p>
      "! Is Select-Option?
      " /AIF/FLD_IS_SELECT_OPT
      is_selopt                TYPE boolean,
      "! <p class="shorttext">Display as Column</p>
      "! Display as Column
      "! $default 'X'
      " /AIF/IS_COL
      column_display           TYPE boolean,
      "! <p class="shorttext">Field Name</p>
      "! Field Name in Define Key Fields
      " (type /aif/lfieldname_kflds)
      field_name               TYPE c LENGTH 120,
      "! <p class="shorttext">SAP or RAW Structure</p>
      "! Is SAP or RAW Structure?
      " (type /aif/raw_or_sap_kflds)
      sap_raw_structure        TYPE boolean,
      "! <p class="shorttext">Enable Key Field Qualifier</p>
      "! Is SAP or RAW Structure?
      " /AIF/ENABLE_QUALIFIER
      enable_qualifier         TYPE boolean,
      "! <p class="shorttext">Qualifier Field Name</p>
      "! Qualifier Field Name
      " (type /aif/qualifier_fld_name_kfld)
      qualifier_field_name     TYPE c LENGTH 120,
      "! <p class="shorttext">Qualifier Operator</p>
      "! Qualifier Operator
      " (type /aif/qualifier_operator)
      qualifier_operator       TYPE zif_aff_types_v1=>ty_option,
      "! <p class="shorttext">Qualifier Value</p>
      "! Qualifier Value
      " (type /aif/qualifier_value_kfld)
      qualifier_value          TYPE c LENGTH 45,
      "! <p class="shorttext">Mulitple Selection Type</p>
      "! Mulitple Selection Type
      " (type /aif/multi_sel_type)
      multi_selection_type     TYPE boolean,
      "! <p class="shorttext">Message Index Table</p>
      "! Message Index Table
      " (type /aif/msg_tbl)
      idx_table                TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Show Tree Node in View 1 Tree</p>
      "! Show Tree Node in View 1 Tree
      " /AIF/IS_HIDDEN, swap to positive stature
      show_tree_node           TYPE boolean,
      "! <p class="shorttext">Parent Field Sequence Number</p>
      "! Parent Field Sequence Number
      " (type /aif/field_number_parent)
      parent_field_sequence    TYPE n LENGTH 3,
      "! <p class="shorttext">Icon</p>
      "! Icon
      " (type /aif/icon_l4)
      icon                     TYPE c LENGTH 4,
      "! <p class="shorttext">Icon Tooltip</p>
      "! Icon Tooltip
      " (type /aif/tooltip)
      icon_tooltip             TYPE c LENGTH 40,
      "! <p class="shorttext">Field Name in Alert Recipient Assignment Table</p>
      "! Field Name in Alert Recipient Assignment Table
      " (type /aif/alertfieldname)
      alert_field_name         TYPE c LENGTH 45,
      "! <p class="shorttext">Relevant for Alert Recipient Determination</p>
      "! Relevant for Alert Recipient Determination
      " (type /aif/alertrelevant)
      alert_recipient_relevant TYPE boolean,
      "! <p class="shorttext">Category Field Name</p>
      "! Category Field Name
      " (type /aif/alrt_catfn)
      cat_fieldname            TYPE c LENGTH 32,
      "! <p class="shorttext">Key Field Rule Fields</p>
      "! Key Field Rule Fields
      key_field_rules_fields   TYPE ty_key_field_rules_fields,
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      " (type /aif/ns)
      valmap_namespace         TYPE c LENGTH 6,
      "! <p class="shorttext">Value Mapping</p>
      "! Value Mapping
      " (type /aif/vmapname)
      value_mapping            TYPE c LENGTH 20,
      "! <p class="shorttext">Semantic Object</p>
      "! Semantic Object
      " (type /aif/semantic_object)
      semantic_object          TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Semantic Action</p>
      "! Semantic Action
      " (type /aif/semantic_action)
      semantic_action          TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Display in Message Monitoring</p>
      "! Display in Message Monitoring
      "! $default 'X'
      " /AIF/NOT_SHOW_FIELD
      message_monitor_show     TYPE boolean,
      "! <p class="shorttext">Display in Message Monitoring by Default</p>
      "! Display in Message Monitoring by Default
      " /AIF/IS_DEFAULT_FIELD
      message_monitor_default  TYPE boolean,
    END OF ty_key_field.

  "! <p class="shorttext">Key Fields</p>
  "! Key Fields
  "! $required
  TYPES ty_key_fields TYPE STANDARD TABLE OF ty_key_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Key Fields</p>
    "! Key Fields
    BEGIN OF ty_o_key_fields,
      "! <p class="shorttext">Key Fields</p>
      "! Key Fields
      "! $required
      key_fields_table TYPE ty_key_fields,
    END OF ty_o_key_fields.

  TYPES:
    "! <p class="shorttext">Structure Setting</p>
    "! Structure Setting
    BEGIN OF ty_structure_setting,
      "! <p class="shorttext">Sequence</p>
      "! Sequence
      "! $required
      " (type /aif/countnr)
      sequence    TYPE n LENGTH 3,
      "! <p class="shorttext">Component</p>
      "! Component
      "! $required
      " (type /aif/datatype)
      component   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Changeable</p>
      "! Changeable
      changeable  TYPE boolean,
      "! <p class="shorttext">Hidden</p>
      "! Hidden
      hidden      TYPE boolean,
      "! <p class="shorttext">Use DDIC</p>
      "! Use DDIC
      "! $default 'X'
      " (type /aif/use_ddic)
      use_ddic    TYPE boolean,
      "! <p class="shorttext">Description</p>
      "! Description
      " (type /aif/err_lb_description)
      description TYPE c LENGTH 128,
      "! <p class="shorttext">Short Text</p>
      "! Short Text
      " (type  /aif/err_lb_short)
      short_text  TYPE c LENGTH 10,
      "! <p class="shorttext">Medium Text</p>
      "! Medium Text
      " (type /aif/err_lb_medium)
      medium_text TYPE c LENGTH 20,
      "! <p class="shorttext">Long Text</p>
      "! Long Text
      " (type /aif/err_lb_long)
      long_text   TYPE c LENGTH 40,
    END OF ty_structure_setting.

  "! <p class="shorttext">Structure Settings</p>
  "! Structure Settings
  TYPES ty_structure_settings TYPE STANDARD TABLE OF ty_structure_setting WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Engines and Structures</p>
    "! Engines and Structures
    BEGIN OF ty_engines,
      "! <p class="shorttext">Application Engine</p>
      "! Application Engine
      " (type /aif/appl_engine_id)
      application_engine TYPE n LENGTH 3,
      "! <p class="shorttext">Persistency Engine</p>
      "! Persistency Engine
      " (type /aif/persistency_engine_id)
      persistency_engine TYPE n LENGTH 3,
      "! <p class="shorttext">Selection Engine</p>
      "! Selection Engine
      " (type /aif/selection_engine_id)
      selection_engine   TYPE n LENGTH 3,
      "! <p class="shorttext">Logging Engine</p>
      "! Logging Engine
      " (type /aif/logging_engine_id)
      logging_engine     TYPE n LENGTH 3,
      "! <p class="shorttext">RAW Structure</p>
      "! RAW Structure
      " (type /aif/if_ddic_struct_raw)
      raw_structure      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">SAP Structure</p>
      "! SAP Structure
      " (type /aif/if_ddic_struct)
      sap_structure      TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_engines.

  TYPES:
    "! <p class="shorttext">Application Interface</p>
    "! Application Interface
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General Information
      "! $required
      aif_interface        TYPE ty_aif_interface,
      "! <p class="shorttext">Recipient Assignment</p>
      "! Recipient Assignment
      "! $required
      recipient_assignment TYPE ty_recipients,
      "! <p class="shorttext">Structure Settings</p>
      "! Structure Settings
      "! $required
      structure_settings   TYPE ty_structure_settings,
      "! <p class="shorttext">Engines and Structures</p>
      "! Engines and Structures
      "! $required
      engines              TYPE ty_engines,
      "! <p class="shorttext">Key Fields</p>
      "! Key Fields
      "! $required
      o_key_fields         TYPE ty_o_key_fields,
    END OF ty_main.

ENDINTERFACE.
