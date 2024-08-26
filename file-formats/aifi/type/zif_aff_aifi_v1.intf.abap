INTERFACE zif_aff_aifi_v1
  PUBLIC.

  "! $values { @link zif_aff_aifi_v1.data:co_selection_type }
  "! $default { @link zif_aff_aifi_v1.data:co_selection_type.single }
  TYPES ty_selection_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_selection_type,
      "! <p class="shorttext">Single Selection</p>
      "! Single selection
      single   TYPE ty_selection_type VALUE ' ',
      "! <p class="shorttext">Multiple Selection</p>
      "! Multiple selection
      multiple TYPE ty_selection_type VALUE 'M',
      "! <p class="shorttext">Document ID Selection</p>
      "! Document ID selection
      document TYPE ty_selection_type VALUE 'D',
    END OF co_selection_type.

  "! $values { @link zif_aff_aifi_v1.data:co_sap_raw_structure_type }
  "! $default { @link zif_aff_aifi_v1.data:co_sap_raw_structure_type.raw }
  TYPES ty_sap_raw_structure_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_sap_raw_structure_type,
      "! <p class="shorttext">Source Structure (raw for inbound, SAP for outbound)</p>
      "! Source structure (raw for inbound, SAP for outbound)
      raw TYPE ty_sap_raw_structure_type VALUE ' ',
      "! <p class="shorttext">Destination Structure (SAP for inbound, raw for outbound)</p>
      "! Destination structure (SAP for inbound, raw for outbound)
      sap TYPE ty_sap_raw_structure_type VALUE 'S',
    END OF co_sap_raw_structure_type.

  "! $values { @link zif_aff_aifi_v1.data:co_direction_type }
  "! $default { @link zif_aff_aifi_v1.data:co_direction_type.both }
  TYPES ty_direction_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_direction_type,
      "! <p class="shorttext">Inbound</p>
      "! Inbound
      inbound  TYPE ty_direction_type VALUE 'I',
      "! <p class="shorttext">Outbound</p>
      "! Outbound
      outbound TYPE ty_direction_type VALUE 'O',
      "! <p class="shorttext">Both</p>
      "! Both
      both     TYPE ty_direction_type VALUE ' ',
    END OF co_direction_type.

  "! $values { @link zif_aff_aifi_v1.data:co_integration_type }
  "! $default { @link zif_aff_aifi_v1.data:co_integration_type.soap }
  TYPES ty_integration_type TYPE c LENGTH 40.
  CONSTANTS:
    BEGIN OF co_integration_type,
      "! <p class="shorttext">SOAP</p>
      "! SOAP
      soap     TYPE ty_integration_type VALUE 'SOAP',
      "! <p class="shorttext">Sync Log</p>
      "! Sync log
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
      "! Integration type
      integration_type         TYPE ty_integration_type,
      "! <p class="shorttext">SOAP Class</p>
      "! SOAP class
      " SOAP / web service class is stored in /AIF/T_FINF-PROXYCLASSNAMECL type /aif/proxy_outbound
      soap_class               TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">SOAP Method</p>
      "! SOAP method
      " SOAP / web service method is stored in /AIF/T_FINF-PRX_METHOD type /aif/proxy_method
      soap_method              TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">SOAP Record Type</p>
      "! SOAP record type
      " SOAP / web service record type is stored in /AIF/T_FINF-RECTYPERAW type /aif/rectyperaw
      soap_record_type         TYPE c LENGTH 45,
      "! <p class="shorttext">Repository ID</p>
      "! Repository id
      " EEE - Enterprise Event Engine (type /iwxbe/reg_repository_id)
      repository_id            TYPE c LENGTH 10,
      "! <p class="shorttext">Registration ID</p>
      "! Registration id
      " EEE - Enterprise Event Engine (type /iwxbe/reg_id)
      registration_id          TYPE c LENGTH 36,
      "! <p class="shorttext">Registration Version</p>
      "! Registration version
      " EEE - Enterprise Event Engine (type /iwxbe/reg_version)
      registration_version     TYPE n LENGTH 4,
      "! <p class="shorttext">Topic</p>
      "! Topic
      " EEE - Enterprise Event Engine (type  /iwxbe/descr_topic)
      topic                    TYPE c LENGTH 255,
      "! <p class="shorttext">Operation ID</p>
      "! Operation id
      " bgPF (type /aif/bgp_opid_e)
      operation_id             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Operation Variant ID</p>
      "! Operation variant id
      " bgPF (type /aif/bgp_variant_id_e)
      operation_variant_id     TYPE n LENGTH 10,
      "! <p class="shorttext">Operation Variant</p>
      "! Operation variant
      " bgPF (type /aif/bgp_variant_e)
      operation_varaint        TYPE string,
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      "! $required
      " (type /aif/ns_obj_name)
      namespace                TYPE c LENGTH 15,
      "! <p class="shorttext">AIF Interface Name</p>
      "! AIF interface name
      "! $required
      " (type /aif/ifname)
      interface_name           TYPE c LENGTH 10,
      "! <p class="shorttext">AIF Interface Version</p>
      "! AIF interface version
      "! $required
      " (type /aif/ifversion)
      interface_version        TYPE c LENGTH 5,
      "! <p class="shorttext">RAW Structure</p>
      "! RAW structure
      " (type /aif/if_ddic_struct_raw)
      raw_structure            TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">SAP Structure</p>
      "! SAP structure
      " (type /aif/if_ddic_struct)
      sap_structure            TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Index Table</p>
      "! Index table
      "! $default '/AIF/STD_IDX_TBL'
      " (type /aif/msg_tbl)
      index_table              TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Interface Display Name</p>
      "! Interface display name
      " (type /aif/ifdisplay)
      display_name             TYPE c LENGTH 120,
      "! <p class="shorttext">Application Log Lifetime</p>
      "! Application log lifetime
      "! $default '90'
      " (type /aif/msg_lifetime)
      app_log_lifetime         TYPE n LENGTH 10,
      "! <p class="shorttext">Direction</p>
      "! Direction
      " (type /aif/ifdirection)
      direction                TYPE ty_direction_type,
      "! <p class="shorttext">Preprocessing</p>
      "! Preprocessing
      " /AIF/PRE_PROCESSING
      preprocessing            TYPE abap_bool,
      "! <p class="shorttext">Proxy XML Transformation</p>
      "! Use proxy xml transformation
      " /AIF/PROXY_XML_TRANSFORMATION
      proxy_xml_transformation TYPE abap_bool,
      "! <p class="shorttext">Extend XML Handling</p>
      "! Extend xml handling
      " /AIF/PRX_XXML
      extend_xml_handling      TYPE abap_bool,
      "! <p class="shorttext">Postprocessing</p>
      "! Postprocessing
      postprocesssing          TYPE abap_bool,
    END OF ty_aif_interface.

  TYPES:
    "! <p class="shorttext">Recipient</p>
    "! Recipient
    BEGIN OF ty_recipient,
      "! <p class="shorttext">Alert Recipient</p>
      "! Alert recipient
      "! $required
      " (type /aif/recipient_object_name)
      recipient TYPE c LENGTH 40,
    END OF ty_recipient.

  "! <p class="shorttext">Recipients</p>
  "! Recipients
  TYPES ty_recipients TYPE STANDARD TABLE OF ty_recipient WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Key Field Rule Field</p>
    "! Key field rule field
    BEGIN OF ty_key_field_rules_field,
      "! <p class="shorttext">Key Field Rule Field</p>
      "! Key field rule field
      " (type  /aif/key_fieldname_enh)
      key_field_rule_field TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_key_field_rules_field.

  "! <p class="shorttext">Key Field Rule Fields</p>
  "! Key field rule fields
  TYPES ty_key_field_rules_fields TYPE STANDARD TABLE OF ty_key_field_rules_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Key Field</p>
    "! Key field
    BEGIN OF ty_key_field,
      "! <p class="shorttext">Key Field Name</p>
      "! Key field name
      "! $required
      " (type /aif/key_fieldname, field of index table)
      key_field_name           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Data Element</p>
      "! Data element
      "! $required
      " (type rollname)
      data_element             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Name of Select-Option/Parameter</p>
      "! Name of select-option/parameter
      " (type /aif/stexti)
      selopt_name              TYPE c LENGTH 8,
      "! <p class="shorttext">Select-Option</p>
      "! Is select-option?
      " /AIF/FLD_IS_SELECT_OPT
      is_selopt                TYPE abap_bool,
      "! <p class="shorttext">Display as Column</p>
      "! Display as column
      "! $default 'X'
      " /AIF/IS_COL
      column_display           TYPE abap_bool,
      "! <p class="shorttext">Field Name</p>
      "! Field name in define key fields
      " (type /aif/lfieldname_kflds, field of sap/raw structure)
      field_name               TYPE c LENGTH 120,
      "! <p class="shorttext">SAP or RAW Structure</p>
      "! Is sap or raw structure?
      " (type /aif/raw_or_sap_kflds)
      sap_raw_structure        TYPE ty_sap_raw_structure_type,
      "! <p class="shorttext">Enable Key Field Qualifier</p>
      "! Enable key field qualifier?
      " /AIF/ENABLE_QUALIFIER
      enable_qualifier         TYPE abap_bool,
      "! <p class="shorttext">Qualifier Field Name</p>
      "! Qualifier field name
      " (type /aif/qualifier_fld_name_kfld)
      qualifier_field_name     TYPE c LENGTH 120,
      "! <p class="shorttext">Qualifier Operator</p>
      "! Qualifier operator
      " (type /aif/qualifier_operator)
      qualifier_operator       TYPE zif_aff_types_v1=>ty_option,
      "! <p class="shorttext">Qualifier Value</p>
      "! Qualifier value
      " (type /aif/qualifier_value_kfld)
      qualifier_value          TYPE c LENGTH 45,
      "! <p class="shorttext">Selection Type</p>
      "! Selection type
      " (type /aif/multi_sel_type)
      selection_type           TYPE ty_selection_type,
      "! <p class="shorttext">Message Index Table</p>
      "! Message index table
      " (type /aif/msg_tbl)
      idx_table                TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Show Tree Node</p>
      "! Show tree node in view 1 tree
      " /AIF/IS_HIDDEN, swap to positive stature
      show_tree_node           TYPE abap_bool,
      "! <p class="shorttext">Parent Field Sequence Number</p>
      "! Parent field sequence number
      " (type /aif/field_number_parent)
      parent_field_sequence    TYPE n LENGTH 3,
      "! <p class="shorttext">Icon</p>
      "! Icon
      " (type /aif/icon_l4)
      icon                     TYPE c LENGTH 4,
      "! <p class="shorttext">Icon Tooltip</p>
      "! Icon tooltip
      " (type /aif/tooltip)
      icon_tooltip             TYPE c LENGTH 40,
      "! <p class="shorttext">Field Name in Alert Recipient Assignment Table</p>
      "! Field name in alert recipient assignment table
      " (type /aif/alertfieldname)
      alert_field_name         TYPE c LENGTH 45,
      "! <p class="shorttext">Relevant for Alert Recipient Determination</p>
      "! Relevant for alert recipient determination
      " (type /aif/alertrelevant)
      alert_recipient_relevant TYPE abap_bool,
      "! <p class="shorttext">Category Field Name</p>
      "! Category field name
      " (type /aif/alrt_catfn)
      cat_fieldname            TYPE c LENGTH 32,
      "! <p class="shorttext">Key Field Rule Fields</p>
      "! Key field rule fields
      key_field_rules_fields   TYPE ty_key_field_rules_fields,
      "! <p class="shorttext">Semantic Object</p>
      "! Semantic object
      " (type /aif/semantic_object)
      semantic_object          TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Semantic Action</p>
      "! Semantic action
      " (type /aif/semantic_action)
      semantic_action          TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Display in Message Monitoring</p>
      "! Display in message monitoring
      "! $default 'X'
      " /AIF/NOT_SHOW_FIELD
      message_monitor_show     TYPE abap_bool,
      "! <p class="shorttext">Display in Message Monitoring by Default</p>
      "! Display in message monitoring by default
      " /AIF/IS_DEFAULT_FIELD
      message_monitor_default  TYPE abap_bool,
    END OF ty_key_field.

  "! <p class="shorttext">Key Fields</p>
  "! Key fields
  "! $required
  TYPES ty_key_fields TYPE STANDARD TABLE OF ty_key_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Key Fields</p>
    "! Key fields
    BEGIN OF ty_o_key_fields,
      "! <p class="shorttext">Key Fields</p>
      "! Key fields
      "! $required
      key_fields_table TYPE ty_key_fields,
    END OF ty_o_key_fields.

  TYPES:
    "! <p class="shorttext">Structure Setting</p>
    "! Structure setting
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
      changeable  TYPE abap_bool,
      "! <p class="shorttext">Hidden</p>
      "! Hidden
      hidden      TYPE abap_bool,
      "! <p class="shorttext">Use DDIC</p>
      "! Use ddic description?
      "! $default 'X'
      " (type /aif/use_ddic)
      use_ddic    TYPE abap_bool,
      "! <p class="shorttext">Description</p>
      "! Description
      " (type /aif/err_lb_description)
      description TYPE c LENGTH 128,
      "! <p class="shorttext">Short Text</p>
      "! Short text
      " (type  /aif/err_lb_short)
      short_text  TYPE c LENGTH 10,
      "! <p class="shorttext">Medium Text</p>
      "! Medium text
      " (type /aif/err_lb_medium)
      medium_text TYPE c LENGTH 20,
      "! <p class="shorttext">Long Text</p>
      "! Long text
      " (type /aif/err_lb_long)
      long_text   TYPE c LENGTH 40,
    END OF ty_structure_setting.

  "! <p class="shorttext">Structure Settings</p>
  "! Structure Settings
  TYPES ty_structure_settings TYPE STANDARD TABLE OF ty_structure_setting WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Engines</p>
    "! Engines
    BEGIN OF ty_engines,
      "! <p class="shorttext">Application Engine</p>
      "! Application engine
      " (type /aif/appl_engine_id)
      application_engine TYPE n LENGTH 3,
      "! <p class="shorttext">Persistency Engine</p>
      "! Persistency engine
      " (type /aif/persistency_engine_id)
      persistency_engine TYPE n LENGTH 3,
      "! <p class="shorttext">Selection Engine</p>
      "! Selection engine
      " (type /aif/selection_engine_id)
      selection_engine   TYPE n LENGTH 3,
      "! <p class="shorttext">Logging Engine</p>
      "! Logging engine
      " (type /aif/logging_engine_id)
      logging_engine     TYPE n LENGTH 3,
    END OF ty_engines.

  TYPES:
    "! <p class="shorttext">Application Interface</p>
    "! Application interface
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      aif_interface        TYPE ty_aif_interface,
      "! <p class="shorttext">Recipient Assignment</p>
      "! Recipient assignment
      "! $required
      recipient_assignment TYPE ty_recipients,
      "! <p class="shorttext">Structure Settings</p>
      "! Structure settings
      "! $required
      structure_settings   TYPE ty_structure_settings,
      "! <p class="shorttext">Engines</p>
      "! Engines
      "! $required
      engines              TYPE ty_engines,
      "! <p class="shorttext">Key Fields</p>
      "! Key fields
      "! $required
      o_key_fields         TYPE ty_o_key_fields,
    END OF ty_main.

ENDINTERFACE.
