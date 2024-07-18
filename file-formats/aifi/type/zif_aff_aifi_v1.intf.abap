INTERFACE zif_aff_aifi_v1
  PUBLIC .

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
      "! <p class="shorttext">Monitored Object</p>
      "! Monitored Object
      "! $required
      monitored_object         TYPE c LENGTH 40,
      "! <p class="shorttext">AIF Namespace</p>
      "! AIF Namespace
      "! $required
      namespace                TYPE /aif/ns,
      "! <p class="shorttext">AIF Interface Name</p>
      "! AIF Interface Name
      "! $required
      interface_name           TYPE /aif/ifname,
      "! <p class="shorttext">AIF Interface Version</p>
      "! AIF Interface Version
      "! $required
      interface_version        TYPE /aif/ifversion,
      "! <p class="shorttext">Index Table</p>
      "! Index Table
      "! $default '/AIF/STD_IDX_TBL'
      index_table              TYPE /aif/msg_tbl,
      "! <p class="shorttext">Interface Display Name</p>
      "! Interface Display Name
      display_name             TYPE /aif/ifdisplay,
      "! <p class="shorttext">Application Log Lifetime</p>
      "! Application Log Lifetime
      "! $default '90'
      app_log_lifetime         TYPE /aif/msg_lifetime,
      "! <p class="shorttext">Preprocessing</p>
      "! Preprocessing
      preprocessing            TYPE boolean, " /aif/pre_processing,
      "! <p class="shorttext">Proxy XML Transformation</p>
      "! Use Proxy XML Transformation
      proxy_xml_transformation TYPE boolean, " /aif/proxy_xml_transformation,
      "! <p class="shorttext">Extend XML Handling</p>
      "! Extend XML Handling
      extend_xml_handling      TYPE boolean, " /aif/prx_xxml,
      "! <p class="shorttext">Postprocessing</p>
      "! Postprocessing
      postprocesssing          TYPE boolean,
      "! <p class="shorttext">RAW Structure</p>
      "! RAW Structure
      raw_structure            TYPE /aif/if_ddic_struct_raw,
      "! <p class="shorttext">SAP Structure</p>
      "! SAP Structure
      sap_structure            TYPE /aif/if_ddic_struct,
      "! <p class="shorttext">Direction</p>
      "! Direction
      direction                TYPE /aif/ifdirection,
    END OF ty_aif_interface .

  TYPES:
    "! <p class="shorttext">Application Interfaces</p>
    "! Application interfaces
    ty_aif_interfaces TYPE STANDARD TABLE OF ty_aif_interface WITH DEFAULT KEY .

  TYPES:
    "! <p class="shorttext">Recipient</p>
    "! Recipient
    BEGIN OF ty_recipient,
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      "! $required
      namespace TYPE /aif/ns_recipient,
      "! <p class="shorttext">Alert Recipient</p>
      "! Alert Recipient
      "! $required
      recipient TYPE /aif/alrt_rec,
    END OF ty_recipient .

  TYPES:
    "! <p class="shorttext">Recipients</p>
    "! Recipients
    ty_recipients TYPE STANDARD TABLE OF ty_recipient WITH DEFAULT KEY .

  TYPES:
    "! <p class="shorttext">Key Field Rule Field</p>
    "! Key Field Rule Field
    BEGIN OF ty_key_field_rules_field,
      "! <p class="shorttext">Key Field Rule Field</p>
      "! Key Field Rule Field
      key_field_rule_field TYPE /aif/key_fieldname_enh,
    END OF ty_key_field_rules_field.

  TYPES:
    "! <p class="shorttext">Key Field Rule Fields</p>
    "! Key Field Rule Fields
    ty_key_field_rules_fields TYPE STANDARD TABLE OF ty_key_field_rules_field WITH DEFAULT KEY .

  TYPES:
    "! <p class="shorttext">Key Field</p>
    "! Key Field
    BEGIN OF ty_key_field,
      "! <p class="shorttext">Key Field Name</p>
      "! Key Field Name
      "! $required
      key_field_name           TYPE /aif/key_fieldname,
      "! <p class="shorttext">Data Element</p>
      "! Data Element
      "! $required
      data_element             TYPE rollname,
      "! <p class="shorttext">Name of Select-Option/Parameter</p>
      "! Name of Select-Option/Parameter
      selopt_name              TYPE /aif/stexti,
      "! <p class="shorttext">Select-Option</p>
      "! Is Select-Option?
      is_selopt                TYPE boolean, " /aif/fld_is_select_opt,
      "! <p class="shorttext">Display as Column</p>
      "! Display as Column
      "! $default 'X'
      column_display           TYPE boolean, " /aif/is_col,
      "! <p class="shorttext">Field Name</p>
      "! Field Name in Define Key Fields
      field_name               TYPE /aif/lfieldname_kflds,
      "! <p class="shorttext">SAP or RAW Structure</p>
      "! Is SAP or RAW Structure?
      sap_raw_structure        TYPE /aif/raw_or_sap_kflds,
      "! <p class="shorttext">Enable Key Field Qualifier</p>
      "! Is SAP or RAW Structure?
      enable_qualifier         TYPE boolean, " /aif/enable_qualifier,
      "! <p class="shorttext">Mulitple Selection Type</p>
      "! Mulitple Selection Type
      multi_selection_type     TYPE /aif/multi_sel_type,
      "! <p class="shorttext">Show Tree Node in View 1 Tree</p>
      "! Show Tree Node in View 1 Tree
      show_tree_node           TYPE boolean, " /aif/is_hidden, " swap to positive stature
      "! <p class="shorttext">Parent Field Sequence Number</p>
      "! Parent Field Sequence Number
      parent_field_sequence    TYPE /aif/field_number_parent,
      "! <p class="shorttext">Icon</p>
      "! Icon
      icon                     TYPE /aif/icon_l4,
      "! <p class="shorttext">Icon Tooltip</p>
      "! Icon Tooltip
      icon_tooltip             TYPE /aif/tooltip,
      "! <p class="shorttext">Field Name in Alert Recipient Assignment Table</p>
      "! Field Name in Alert Recipient Assignment Table
      alert_field_name         TYPE /aif/alertfieldname,
      "! <p class="shorttext">Relevant for Alert Recipient Determination</p>
      "! Relevant for Alert Recipient Determination
      alert_recipient_relevant TYPE /aif/alertrelevant,
      "! <p class="shorttext">Category Field Name</p>
      "! Category Field Name
      cat_fieldname            TYPE /aif/alrt_catfn,
      "! <p class="shorttext">Key Field Rule Fields</p>
      "! Key Field Rule Fields
      key_field_rules_fields   TYPE ty_key_field_rules_fields,
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      valmap_namespace         TYPE /aif/ns,
      "! <p class="shorttext">Value Mapping</p>
      "! Value Mapping
      value_mapping            TYPE /aif/vmapname,
      "! <p class="shorttext">Display in Message Monitoring</p>
      "! Display in Message Monitoring
      "! $default 'X'
      message_monitor_show     TYPE boolean, " /aif/not_show_field,
      "! <p class="shorttext">Display in Message Monitoring by Default</p>
      "! Display in Message Monitoring by Default
      message_monitor_default  TYPE boolean, " /aif/is_default_field,
      "! <p class="shorttext">Semantic Object</p>
      "! Semantic Object
      semantic_object          TYPE /aif/semantic_object,
      "! <p class="shorttext">Semantic Action</p>
      "! Semantic Action
      semantic_action          TYPE /aif/semantic_action,
    END OF ty_key_field .

  TYPES:
    "! <p class="shorttext">Key Fields</p>
    "! Key Fields
    "! $required
    ty_key_fields TYPE STANDARD TABLE OF ty_key_field WITH DEFAULT KEY .

  TYPES:
    "! <p class="shorttext">Key Fields</p>
    "! Key Fields
    BEGIN OF ty_o_key_fields,
      "! <p class="shorttext">Key Fields</p>
      "! Key Fields
      "! $required
      key_fields_table TYPE ty_key_fields,
    END OF ty_o_key_fields .

  TYPES:
    "! <p class="shorttext">Structure Setting</p>
    "! Structure Setting
    BEGIN OF ty_structure_setting,
      "! <p class="shorttext">Sequence</p>
      "! Sequence
      "! $required
      sequence    TYPE /aif/countnr,
      "! <p class="shorttext">Component</p>
      "! Component
      "! $required
      component   TYPE /aif/datatype,
      "! <p class="shorttext">Changeable</p>
      "! Changeable
      changeable  TYPE boolean,
      "! <p class="shorttext">Hidden</p>
      "! Hidden
      hidden      TYPE boolean,
      "! <p class="shorttext">Use DDIC</p>
      "! Use DDIC
      use_ddic    TYPE boolean, " /aif/use_ddic,
      "! <p class="shorttext">Description</p>
      "! Description
      description TYPE /aif/err_lb_description,
      "! <p class="shorttext">Short Text</p>
      "! Short Text
      short_text  TYPE /aif/err_lb_short,
      "! <p class="shorttext">Medium Text</p>
      "! Medium Text
      medium_text TYPE /aif/err_lb_medium,
      "! <p class="shorttext">Long Text</p>
      "! Long Text
      long_text   TYPE /aif/err_lb_long,
    END OF ty_structure_setting .

  TYPES:
    "! <p class="shorttext">Stucture Settings</p>
    "! Structure Settings
    ty_structure_settings TYPE STANDARD TABLE OF ty_structure_setting WITH DEFAULT KEY .

  TYPES:
    "! <p class="shorttext">Engines</p>
    "! Engines
    BEGIN OF ty_engines,
      "! <p class="shorttext">Application Engine</p>
      "! Application Engine
      application_engine TYPE /aif/appl_engine_id,
      "! <p class="shorttext">Persistency Engine</p>
      "! Persistency Engine
      persistency_engine TYPE /aif/persistency_engine_id,
      "! <p class="shorttext">Selection Engine</p>
      "! Selection Engine
      selection_engine   TYPE /aif/selection_engine_id,
      "! <p class="shorttext">Logging Engine</p>
      "! Logging Engine
      logging_engine     TYPE /aif/logging_engine_id,
    END OF ty_engines .

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
      "! <p class="shorttext">Application Interface</p>
      "! Application interface
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
      "! <p class="shorttext">Engines</p>
      "! Engines
      "! $required
      engines              TYPE ty_engines,
      "! <p class="shorttext">Key Fields</p>
      "! Key Fields
      "! $required
      o_key_fields         TYPE ty_o_key_fields,
    END OF ty_main .

ENDINTERFACE.
