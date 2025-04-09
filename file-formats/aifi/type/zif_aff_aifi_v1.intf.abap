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

  "! $values { @link zif_aff_aifi_v1.data:co_structure_type }
  "! $default { @link zif_aff_aifi_v1.data:co_structure_type.source_structure }
  TYPES ty_structure_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_structure_type,
      "! <p class="shorttext">Source Structure</p>
      "! Source structure (raw for inbound, SAP for outbound)
      source_structure      TYPE ty_structure_type VALUE ' ',
      "! <p class="shorttext">Destination Structure</p>
      "! Destination structure (SAP for inbound, raw for outbound)
      destination_structure TYPE ty_structure_type VALUE 'S',
    END OF co_structure_type.

  "! $values { @link zif_aff_aifi_v1.data:co_expiration_behavior_type }
  "! $default { @link zif_aff_aifi_v1.data:co_expiration_behavior_type.archive }
  TYPES ty_expiration_behavior_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_expiration_behavior_type,
      "! <p class="shorttext">Delete Messages</p>
      "! Delete messages after retention period
      delete  TYPE ty_expiration_behavior_type VALUE 'D',
      "! <p class="shorttext">Archive Messages</p>
      "! Archive messages after retention period
      archive TYPE ty_expiration_behavior_type VALUE 'A',
    END OF co_expiration_behavior_type.

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
      "! <p class="shorttext">Internal</p>
      "! Internal
      internal TYPE ty_direction_type VALUE 'S',
    END OF co_direction_type.

  TYPES:
    "! <p class="shorttext">SOAP Settings</p>
    "! SOAP settings
    BEGIN OF ty_soap_settings,
      " SOAP / web service class is stored in /AIF/T_FINF-PROXYCLASSNAMECL type /aif/proxy_outbound
      "! <p class="shorttext">SOAP Class</p>
      "! SOAP class
      "! $required
      soap_class                    TYPE zif_aff_types_v1=>ty_object_name_30,
      " SOAP / web service method is stored in /AIF/T_FINF-PRX_METHOD type /aif/proxy_method
      "! <p class="shorttext">SOAP Method</p>
      "! SOAP method
      "! $required
      soap_method                   TYPE zif_aff_types_v1=>ty_object_name_30,
      " SOAP / web service record type is stored in /AIF/T_FINF-RECTYPERAW type /aif/rectyperaw
      "! <p class="shorttext">SOAP Record Type</p>
      "! SOAP record type
      "! $required
      soap_record_type              TYPE c LENGTH 45,
      " /AIF/PROXY_XML_TRANSFORMATION
      "! <p class="shorttext">Proxy XML Transformation</p>
      "! Use proxy xml transformation
      uses_proxy_xml_transformation TYPE abap_bool,
      " /AIF/PRX_XXML
      "! <p class="shorttext">Extend XML Handling</p>
      "! Extend xml handling
      uses_extended_xml_handling    TYPE abap_bool,
    END OF ty_soap_settings.

  TYPES:
    "! <p class="shorttext">Event Settings</p>
    "! Event settings
    BEGIN OF ty_event_settings,
      " EEE - Enterprise Event Engine (type /iwxbe/reg_repository_id)
      "! <p class="shorttext">Repository ID</p>
      "! Repository id
      "! $required
      repository_id        TYPE c LENGTH 10,
      " EEE - Enterprise Event Engine (type /iwxbe/reg_id)
      "! <p class="shorttext">Registration ID</p>
      "! Registration id
      "! $required
      registration_id      TYPE c LENGTH 36,
      " EEE - Enterprise Event Engine (type /iwxbe/reg_version)
      "! <p class="shorttext">Registration Version</p>
      "! Registration version
      "! $required
      registration_version TYPE n LENGTH 4,
      " EEE - Enterprise Event Engine (type  /iwxbe/descr_topic)
      "! <p class="shorttext">Topic</p>
      "! Topic
      "! $required
      topic                TYPE c LENGTH 255,
    END OF ty_event_settings.

  TYPES:
    "! <p class="shorttext">BgPF Settings</p>
    "! Background processing framework settings
    BEGIN OF ty_bgpf_settings,
      " bgPF (type /aif/bgp_opid_e)
      "! <p class="shorttext">Operation ID</p>
      "! Operation id
      "! $required
      operation_id         TYPE zif_aff_types_v1=>ty_object_name_30,
      " bgPF (type /aif/bgp_variant_id_e)
      "! <p class="shorttext">Operation Variant ID</p>
      "! Operation variant id
      "! $required
      operation_variant_id TYPE n LENGTH 10,
      " bgPF (type /aif/bgp_variant_id_e)
      "! <p class="shorttext">Operation Variant</p>
      "! Operation variant
      "! $required
      operation_variant    TYPE string,
    END OF ty_bgpf_settings.

  TYPES:
    "! <p class="shorttext">Application Interface</p>
    "! Application interface
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Integration Type</p>
      "! Integration type
      integration_type      TYPE c LENGTH 40,
      "! <p class="shorttext">Scenario</p>
      "! Scenario
      scenario              TYPE c LENGTH 40,
      "! <p class="shorttext">SOAP Settings</p>
      "! SOAP settings
      soap_settings         TYPE ty_soap_settings,
      "! <p class="shorttext">Event Settings</p>
      "! Event settings
      event_settings        TYPE ty_event_settings,
      "! <p class="shorttext">BgPF Settings</p>
      "! Background processing framework settings
      bgpf_settings         TYPE ty_bgpf_settings,
      " (type /aif/ns_obj_name)
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      namespace             TYPE c LENGTH 15,
      " (type /aif/ifname)
      "! <p class="shorttext">AIF Interface Name</p>
      "! AIF interface name
      interface_name        TYPE c LENGTH 10,
      " (type /aif/ifversion)
      "! <p class="shorttext">AIF Interface Version</p>
      "! AIF interface version
      interface_version     TYPE c LENGTH 5,
      " (type /aif/if_ddic_struct_raw)
      "! <p class="shorttext">Data Structure</p>
      "! Data structure
      "! $required
      data_structure        TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type /aif/if_ddic_struct)
      "! <p class="shorttext">Mapped Data Structure</p>
      "! Mapped data structure
      mapped_data_structure TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type /aif/msg_tbl)
      "! <p class="shorttext">Index Table</p>
      "! Index table
      "! $required
      index_table           TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type /aif/ifdisplay)
      "! <p class="shorttext">Interface Display Name</p>
      "! Interface display name
      display_name          TYPE c LENGTH 120,
      " (relevant types /AIF/MSG_LIFETIME && /AIF/DATA_OLDER_THAN_E)
      "! <p class="shorttext">Retention Period</p>
      "! Retention period
      "! $default '090'
      retention_period      TYPE c LENGTH 3,
      "! <p class="shorttext">Expiration Behavior</p>
      "! Expiration_behavior
      expiration_behavior   TYPE ty_expiration_behavior_type,
      " (type /aif/system_field)
      "! <p class="shorttext">Sending System</p>
      "! Path for sending system in data structure
      sending_system        TYPE string,
      " (type /aif/ifdirection)
      "! <p class="shorttext">Direction</p>
      "! Direction
      direction             TYPE ty_direction_type,
      " /AIF/PRE_PROCESSING
      "! <p class="shorttext">Preprocessing</p>
      "! Preprocessing
      uses_preprocessing    TYPE abap_bool,
      "! <p class="shorttext">Postprocessing</p>
      "! Postprocessing
      uses_postprocesssing  TYPE abap_bool,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Recipient</p>
    "! Recipient
    BEGIN OF ty_recipient,
      " (type /aif/recipient_object_name)
      "! <p class="shorttext">Recipient</p>
      "! Recipient
      "! $required
      recipient TYPE c LENGTH 40,
    END OF ty_recipient.

  "! <p class="shorttext">Recipients</p>
  "! Recipients
  TYPES ty_recipients TYPE STANDARD TABLE OF ty_recipient WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Key Field Determination by Qualifier</p>
    "! Key field determination by qualifier
    BEGIN OF ty_key_field_qualifier,
      " /AIF/ENABLE_QUALIFIER
      "! <p class="shorttext">Enable Key Field Qualifier</p>
      "! Enable key field qualifier?
      uses_qualifier       TYPE abap_bool,
      " (type /aif/qualifier_fld_name_kfld)
      "! <p class="shorttext">Qualifier Field Name</p>
      "! Qualifier field name
      qualifier_field_name TYPE c LENGTH 120,
      " (type /aif/qualifier_operator)
      "! <p class="shorttext">Qualifier Operator</p>
      "! Qualifier operator
      qualifier_operator   TYPE zif_aff_types_v1=>ty_option,
      " (type /aif/qualifier_value_kfld)
      "! <p class="shorttext">Qualifier Value</p>
      "! Qualifier value
      qualifier_value      TYPE c LENGTH 45,
    END OF ty_key_field_qualifier.

  TYPES:
    "! <p class="shorttext">Key Field Selection</p>
    "! Key field selection type and settings
    BEGIN OF ty_key_field_selection,
      " (type /aif/multi_sel_type)
      "! <p class="shorttext">Selection Type</p>
      "! Selection type
      selection_type              TYPE ty_selection_type,
      " (type /aif/msg_tbl)
      "! <p class="shorttext">Message Index Table</p>
      "! Message index table
      message_index_table         TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type /aif/field_number_parent)
      "! <p class="shorttext">Parent Field Sequence Number</p>
      "! Parent field sequence number
      parent_field_sequence       TYPE n LENGTH 3,
      " (type /aif/icon_l4)
      "! <p class="shorttext">Icon</p>
      "! Icon
      icon                        TYPE c LENGTH 4,
      " (type /aif/tooltip)
      "! <p class="shorttext">Icon Tooltip</p>
      "! Icon tooltip
      icon_tooltip                TYPE c LENGTH 40,
      " (type /aif/alertfieldname)
      "! <p class="shorttext">Alert Recipient Field Name</p>
      "! Field name in alert recipient assignment table
      alert_field_name            TYPE c LENGTH 45,
      " (type /aif/alrt_catfn)
      "! <p class="shorttext">Category Field Name</p>
      "! Category field name
      category_field_name         TYPE c LENGTH 32,
      " /AIF/IS_HIDDEN, swap to positive stature
      "! <p class="shorttext">Show Tree Node</p>
      "! Show tree node in view 1 tree
      "! $default 'X'
      is_tree_node_visible        TYPE abap_bool,
      " (type /aif/alertrelevant)
      "! <p class="shorttext">Relevant for Alert Recipient Determination</p>
      "! Relevant for alert recipient determination
      is_alert_recipient_relevant TYPE abap_bool,
    END OF ty_key_field_selection.

  TYPES:
    "! <p class="shorttext">SAP Fiori Features</p>
    "! SAP Fiori specific features
    BEGIN OF ty_fiori_features,
      " (type /aif/semantic_object)
      "! <p class="shorttext">Semantic Object</p>
      "! Semantic object
      semantic_object             TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type /aif/semantic_action)
      "! <p class="shorttext">Semantic Action</p>
      "! Semantic action
      semantic_action             TYPE zif_aff_types_v1=>ty_description_60,
      " /AIF/NOT_SHOW_FIELD
      "! <p class="shorttext">Display in Message Monitoring</p>
      "! Display in message monitoring
      "! $default 'X'
      is_shown_in_message_monitor TYPE abap_bool,
      " /AIF/IS_DEFAULT_FIELD
      "! <p class="shorttext">Display in Message Monitoring by Default</p>
      "! Display in message monitoring by default
      is_shown_by_default         TYPE abap_bool,
    END OF ty_fiori_features.

  TYPES:
    " Related key fields used by key field rules
    "! <p class="shorttext">Rule Key Field</p>
    "! Rule key field
    BEGIN OF ty_rule_key_field,
      " (type /aif/key_fieldname_enh)
      "! <p class="shorttext">Name</p>
      "! Rule Key field name
      name                 TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type /aif/field_number_enh)
      "! <p class="shorttext">Field Sequence Number</p>
      "! Field sequence number
      field_sequnce_number TYPE c LENGTH 3,
    END OF ty_rule_key_field.

  "! <p class="shorttext">Rule Key Fields</p>
  "! Rule key fields
  TYPES ty_rule_key_fields TYPE STANDARD TABLE OF ty_rule_key_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Key Field Rule</p>
    "! Key field rule
    BEGIN OF ty_key_field_rule,
      "! <p class="shorttext">Rule Key Fields</p>
      "! Rule key fields
      rule_key_fields TYPE ty_rule_key_fields,
      "! <p class="shorttext">Key Field Rule Class</p>
      "! Key Field Rule class
      rule_class      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Key Field Rule Method</p>
      "! Key field rule method
      rule_method     TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_key_field_rule.

  TYPES:
    "! <p class="shorttext">Key Field Details</p>
    "! Key field details
    BEGIN OF ty_key_field,
      " (type /aif/key_fieldname, field of index table)
      "! <p class="shorttext">Name</p>
      "! Key field name
      "! $required
      name                TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type rollname)
      "! <p class="shorttext">Data Element</p>
      "! Data element
      "! $required
      data_element        TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type /aif/stexti)
      "! <p class="shorttext">Name of Select-Option/Parameter</p>
      "! Name of select-option/parameter
      select_option_name  TYPE c LENGTH 8,
      " (type /aif/lfieldname_kflds, field of sap/raw structure)
      "! <p class="shorttext">Field Name</p>
      "! Field name in define key fields
      field_name          TYPE c LENGTH 120,
      " (type /aif/raw_or_sap_kflds)
      "! <p class="shorttext">Structure Type</p>
      "! Structure type (source or destination)
      structure_type      TYPE ty_structure_type,
      " /AIF/FLD_IS_SELECT_OPT
      "! <p class="shorttext">Select-Option</p>
      "! Is select-option?
      is_select_option    TYPE abap_bool,
      " /AIF/IS_COL
      "! <p class="shorttext">Display Column</p>
      "! Display the column
      "! $default 'X'
      is_column_display   TYPE abap_bool,
      "! <p class="shorttext">Key Field Determination by Qualifier</p>
      "! Key field determination by qualifier
      key_field_qualifier TYPE ty_key_field_qualifier,
      "! <p class="shorttext">Key Field Selection</p>
      "! Key field selection type and settings
      key_field_selection TYPE ty_key_field_selection,
      "! <p class="shorttext">Key Field Rule</p>
      "! Key field rule
      key_field_rule      TYPE ty_key_field_rule,
      "! <p class="shorttext">SAP Fiori Features</p>
      "! SAP Fiori specific features
      fiori_features      TYPE ty_fiori_features,
    END OF ty_key_field.

  "! <p class="shorttext">Key Fields</p>
  "! Key fields
  "! $required
  TYPES ty_key_fields TYPE STANDARD TABLE OF ty_key_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Error Handling Configuration</p>
    "! Error handling configuration
    BEGIN OF ty_error_handling_config,
      " (type /aif/countnr)
      "! <p class="shorttext">Sequence</p>
      "! Sequence
      "! $required
      sequence      TYPE n LENGTH 3,
      " (type /aif/field_path)
      "! <p class="shorttext">Component</p>
      "! Component
      "! $required
      component     TYPE string,
      "! <p class="shorttext">Changeable</p>
      "! Changeable
      is_changeable TYPE abap_bool,
      "! <p class="shorttext">Hidden</p>
      "! Hidden
      is_hidden     TYPE abap_bool,
      " (type /aif/use_ddic)
      "! <p class="shorttext">Use DDIC</p>
      "! Use ddic description?
      "! $default 'X'
      uses_ddic     TYPE abap_bool,
      " (type /aif/err_lb_description)
      "! <p class="shorttext">Description</p>
      "! Description
      description   TYPE c LENGTH 128,
      " (type  /aif/err_lb_short)
      "! <p class="shorttext">Short Text</p>
      "! Short text
      short_text    TYPE c LENGTH 10,
      " (type /aif/err_lb_medium)
      "! <p class="shorttext">Medium Text</p>
      "! Medium text
      medium_text   TYPE c LENGTH 20,
      " (type /aif/err_lb_long)
      "! <p class="shorttext">Long Text</p>
      "! Long text
      long_text     TYPE c LENGTH 40,
    END OF ty_error_handling_config.

  "! <p class="shorttext">Error Handling Configuration</p>
  "! Error handling configuration
  TYPES ty_error_handling_configs TYPE STANDARD TABLE OF ty_error_handling_config WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Engines</p>
    "! Engines
    BEGIN OF ty_engines,
      " (type /aif/appl_engine_id)
      " use type c instead of n, so value '000' will be displayed
      "! <p class="shorttext">Application Engine</p>
      "! Application engine
      application_engine TYPE c LENGTH 3,
      " (type /aif/persistency_engine_id)
      "! <p class="shorttext">Persistency Engine</p>
      "! Persistency engine
      persistency_engine TYPE c LENGTH 3,
      " (type /aif/selection_engine_id)
      "! <p class="shorttext">Selection Engine</p>
      "! Selection engine
      selection_engine   TYPE c LENGTH 3,
      " (type /aif/logging_engine_id)
      "! <p class="shorttext">Logging Engine</p>
      "! Logging engine
      logging_engine     TYPE c LENGTH 3,
    END OF ty_engines.

  TYPES:
    "! <p class="shorttext">Application Interface</p>
    "! Application interface
    BEGIN OF ty_main,
      "! $required
      format_version         TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                 TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information    TYPE ty_general_information,
      "! <p class="shorttext">Recipient Assignment</p>
      "! Recipient assignment
      "! $required
      recipient_assignment   TYPE ty_recipients,
      "! <p class="shorttext">Error Handling Configuration</p>
      "! Error handling configuration
      "! $required
      error_handling_configs TYPE ty_error_handling_configs,
      "! <p class="shorttext">Engines</p>
      "! Engines
      "! $required
      engines                TYPE ty_engines,
      "! <p class="shorttext">Key Fields</p>
      "! Key fields
      "! $required
      key_fields             TYPE ty_key_fields,
    END OF ty_main.

ENDINTERFACE.
