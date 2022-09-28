INTERFACE zif_aff_cfdf_v1
 PUBLIC .

  TYPES: ty_type TYPE c LENGTH 10.

  TYPES:
    "! <p class="shorttext">Label and Tooltip</p>
    "! Label and tooltip
    BEGIN OF ty_gs_ui_text,
      "! <p class="shorttext">Translation Language</p>
      "! Translation language
      "! $required
      language      TYPE langu,

      "! <p class="shorttext">Field Label</p>
      "! Field label
      "! $required
      "! $maxLength 40
      field_label   TYPE cfd_field_label,

      "! <p class="shorttext">Field Tooltip</p>
      "! Field tooltip
      "! $required
      "! $maxLength 60
      field_tooltip TYPE cfd_field_tooltip,
    END OF ty_gs_ui_text.

  TYPES: ty_gt_ui_text TYPE STANDARD TABLE OF ty_gs_ui_text WITH KEY language.

  TYPES:
    "! <p class="shorttext">Business Context</p>
    "! Business context
    BEGIN OF ty_gs_business_context,
      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      "! $maxLength 30
      business_context     TYPE cfd_business_context,

      "! <p class="shorttext">Deviating Field Name</p>
      "! Deviating field name
      "! $maxLength 30
      deviating_field_name TYPE cfd_deviating_field_name,
    END OF ty_gs_business_context.

  TYPES: ty_gt_business_context TYPE STANDARD TABLE OF ty_gs_business_context WITH KEY business_context.

  TYPES:
    "! <p class="shorttext">Extended CDS View</p>
    "! Extended CDS view
    BEGIN OF ty_gs_cds_usage,
      "! <p class="shorttext">CDS View Name</p>
      "! CDS view name
      "! $required
      "! $maxLength 30
      cds_view_name                 TYPE cfd_cds_view_name,

      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      "! $maxLength 30
      business_context              TYPE cfd_business_context,

      "! <p class="shorttext">Basic Search Relevance</p>
      "! Basic search relevance
      is_search_relevant            TYPE abap_bool,

      "! <p class="shorttext">BAdI Implementation for Visibility Control</p>
      "! BAdI implementation for visibility control
      "! $maxLength 30
      badi_impl_for_visibility_ctrl TYPE cfd_badi_implementation_name,

      "! <p class="shorttext">Field Control Property</p>
      "! Field control property
      "! $maxLength 1
      "! $values {@link zif_aff_cfdf_v1.data:gc_field_control_property}
      "! $default {@link zif_aff_cfdf_v1.data:gc_field_control_property.optional}
      field_control_property        TYPE	cfd_field_control_properties,
    END OF ty_gs_cds_usage.
  TYPES: ty_gt_cds_usage TYPE STANDARD TABLE OF ty_gs_cds_usage WITH KEY business_context cds_view_name.

  TYPES:
    "! <p class="shorttext">Extended OData Service</p>
    "! Extended OData service
    BEGIN OF ty_gs_odata_usage,
      "! <p class="shorttext">OData Service Key</p>
      "! OData service key
      "! $required
      "! $maxLength 81
      odata_service_key  TYPE c LENGTH 81,

      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      "! $maxLength 30
      business_context   TYPE cfd_business_context,

      "! <p class="shorttext">Basic Search Relevance</p>
      "! Basic search relevance
      is_search_relevant TYPE abap_bool,
    END OF ty_gs_odata_usage.
  TYPES: ty_gt_odata_usage TYPE STANDARD TABLE OF ty_gs_odata_usage WITH KEY business_context odata_service_key.


  TYPES:
    "! <p class="shorttext">Extended Business Scenario</p>
    "! Extended business scenario
    BEGIN OF ty_gs_business_scenario,
      "! <p class="shorttext">Business Scenario</p>
      "! Business scenario
      "! $required
      "! $maxLength 30
      business_scenario TYPE cfd_scenario_name,

      "! <p class="shorttext">Data Transfer</p>
      "! Data transfer
      "! $required
      "! $maxLength 30
      data_transfer     TYPE cfd_data_transfer_name,
    END OF ty_gs_business_scenario.
  TYPES: ty_gt_business_scenario TYPE STANDARD TABLE OF ty_gs_business_scenario WITH KEY business_scenario.

  TYPES:
    "! <p class="shorttext">Extended Dynpro Screen</p>
    "! Extended dynpro screen
    BEGIN OF ty_gs_dynpro_usage,
      "! <p class="shorttext">Dynpro Context</p>
      "! Dynpro context
      "! $required
      "! $maxLength 30
      dynpro_context   TYPE cfd_gui_context,

      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      "! $maxLength 30
      business_context TYPE cfd_business_context,
    END OF ty_gs_dynpro_usage.
  TYPES ty_gt_dynpro_usage TYPE STANDARD TABLE OF ty_gs_dynpro_usage WITH KEY dynpro_context business_context.

  TYPES:
    "! <p class="shorttext">Extended SOAP Service</p>
    "! Extended SOAP service
    BEGIN OF ty_gs_soap_usage,
      "! <p class="shorttext">Service Interface</p>
      "! Service interface
      "! $required
      "! $maxLength 30
      service_interface    TYPE cfd_service_interface_name,

      "! <p class="shorttext">Operation</p>
      "! Operation
      "! $required
      "! $maxLength 30
      operation            TYPE cfd_service_operation,

      "! <p class="shorttext">Message Direction</p>
      "! Message direction
      "! $required
      "! $maxLength 3
      "! $values {@link zif_aff_cfdf_v1.data:gc_soap_message_direction}
      message_direction    TYPE cfd_soap_message_direction,

      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      "! $maxLength 30
      business_context     TYPE cfd_business_context,

      "! <p class="shorttext">Component Identifier</p>
      "! Component identifier
      "! $maxLength 5
      component_identifier TYPE cfd_component_identifier,

      "! <p class="shorttext">External Namespace</p>
      "! External namespace
      "! $required
      "! $maxLength 255
      external_namespace   TYPE cfd_soap_namespace,

      "! <p class="shorttext">External Field Name</p>
      "! External field name
      "! $required
      "! $maxLength 120
      external_field_name  TYPE cfd_field_external_soap_name,
    END OF ty_gs_soap_usage.
  TYPES: ty_gt_soap_usage TYPE STANDARD TABLE OF ty_gs_soap_usage WITH KEY business_context service_interface operation message_direction component_identifier.

  TYPES:
    "! <p class="shorttext">Code Description</p>
    "! Code description
    BEGIN OF ty_gs_codelistvalue_descr,
      "! <p class="shorttext">Language</p>
      "! Language
      "! $required
      "! $maxLength 2
      language    TYPE syst_langu,

      "! <p class="shorttext">Code</p>
      "! Code
      "! $required
      "! $maxLength 30
      code        TYPE cfd_field_code_value,

      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      "! $maxLength 60
      description TYPE cfd_field_code_description,
    END OF ty_gs_codelistvalue_descr.
  TYPES: ty_gt_codelistvalue_descr TYPE STANDARD TABLE OF ty_gs_codelistvalue_descr WITH KEY language code.

  TYPES:
    "! <p class="shorttext">Code Value</p>
    "! Code value
    BEGIN OF ty_gs_codelistvalue,
      "! <p class="shorttext">Code</p>
      "! Code
      "! $required
      "! $maxLength 30
      code        TYPE cfd_field_code_value,

      "! <p class="shorttext">Disabled</p>
      "! Disabled
      is_disabled TYPE abap_bool,
    END OF ty_gs_codelistvalue.
  TYPES: ty_gt_codelistvalue TYPE STANDARD TABLE OF ty_gs_codelistvalue WITH KEY code.

  TYPES:
    "! <p class="shorttext">Value Help Key Mapping</p>
    "! Value help key mapping
    BEGIN OF ty_gs_value_help_key_mapping,
      "! <p class="shorttext">Component Identifier</p>
      "! Component identifier
      "! $maxLength 5
      component_identifier      TYPE cfd_component_identifier,

      "! <p class="shorttext">Value Help Field Name</p>
      "! Value help field name
      "! $required
      "! $maxLength 30
      value_help_field_name	    TYPE cfd_field_name,

      "! <p class="shorttext">Dimension View Field Name</p>
      "! Dimension view field name
      "! $maxLength 30
      dimension_view_field_name TYPE cfd_field_name,
    END OF ty_gs_value_help_key_mapping.

  TYPES ty_gt_value_help_key_mapping TYPE STANDARD TABLE OF ty_gs_value_help_key_mapping WITH KEY component_identifier.


  TYPES:
    "! <p class="shorttext">Value Help Binding</p>
    "! Value help binding
    BEGIN OF ty_gs_value_help_binding,
      "! <p class="shorttext">Extended CDS View Name</p>
      "! Extended CDS view name
      "! $required
      "! $maxLength 30
      cds_view_name         TYPE  cfd_cds_view_name,

      "! <p class="shorttext">Extended CDS View Field Name</p>
      "! Extended CDS view field name
      "! $required
      "! $maxLength 30
      cds_view_field_name   TYPE cfd_cds_field_name_cc,

      "! <p class="shorttext">Value Help Field Name</p>
      "! Value help field name
      "! $required
      "! $maxLength 30
      value_help_field_name TYPE  cfd_cds_field_name_cc,
    END OF ty_gs_value_help_binding.
  TYPES ty_gt_value_help_binding TYPE STANDARD TABLE OF ty_gs_value_help_binding WITH KEY cds_view_name value_help_field_name.


  TYPES:
    "! <p class="shorttext">Data Protection and Privacy</p>
    "! Data protection and privacy
    BEGIN OF ty_gs_dpp_properties,
      "! <p class="shorttext">Data Subject</p>
      "! Data subject
      "! $maxLength 10
      "! $values {@link zif_aff_cfdf_v1.data:gc_data_subject_id_type}
      "! $default {@link zif_aff_cfdf_v1.data:gc_data_subject_id_type.not_applicable}
      data_subject_id_type       TYPE cfd_irf_data_subject_id_type,

      "! <p class="shorttext">BAdI Implementation for Data Subject</p>
      "! BAdI implementation for data subject
      "! $maxLength 30
      badi_impl_for_data_subject TYPE cfd_badi_implementation_name,
    END OF ty_gs_dpp_properties.


  TYPES:
    "! <p class="shorttext">Characteristic Reference</p>
    "! Characteristic reference
    BEGIN OF ty_gs_characteristic_reference,
      "! <p class="shorttext">Characteristic Name</p>
      "! Characteristic name
      characteristic_name TYPE cfd_characteristic_name,

      "! <p class="shorttext">Class Name</p>
      "! Class name
      class_type          TYPE cfd_characteristic_class_type,

      "! <p class="shorttext">Object Type</p>
      "! Object type
      object_type         TYPE cfd_characteristic_object_type,
    END OF ty_gs_characteristic_reference.


  TYPES:
    "! <p class="shorttext">Custom Field</p>
    "! Custom field
    BEGIN OF ty_main,
      "! $required
      format_version              TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                      TYPE zif_aff_types_v1=>ty_header_60,

      "! <p class="shorttext">External Field Name</p>
      "! External field name
      "! $required
      "! $maxLength 30
      external_field_name         TYPE cfd_field_external_name,

      "! <p class="shorttext">Type</p>
      "! Custom field type
      "! $required
      BEGIN OF type,
        "! <p class="shorttext">Semantic Field Type</p>
        "! Semantic field type
        "! $required
        "! $maxLength 10
        "! $values {@link zif_aff_cfdf_v1.data:gc_type}
        semantic_field_type        TYPE cfd_field_type,

        "! <p class="shorttext">Length</p>
        "! Length
        "! $maximum 500
        length                     TYPE i,

        "! <p class="shorttext">Scale</p>
        "! Scale
        "! $maximum 14
        scale                      TYPE i,

        "! <p class="shorttext">Aggregation</p>
        "! Aggregation
        "! $maxLength 5
        "! $values {@link zif_aff_cfdf_v1.data:gc_aggregation}
        "! $default {@link zif_aff_cfdf_v1.data:gc_aggregation.none}
        aggregation                TYPE cfd_field_aggregation,

        "! <p class="shorttext">Code List Uppercase Only</p>
        "! Code List uppercase only
        code_list_uppercase_only   TYPE abap_bool,

        "! <p class="shorttext">Associated Business Object</p>
        "! Associated business object
        "! $maxLength 30
        associated_business_object TYPE cfd_associated_business_object,

        "! <p class="shorttext">Value Help View</p>
        "! Value help view
        "! $maxLength 30
        value_help_view            TYPE cfd_field_value_help_view,

        "! <p class="shorttext">Dimension View</p>
        "! Dimension view
        "! $maxLength 30
        dimension_view             TYPE cfd_cds_view_name,
      END OF type,

      "! <p class="shorttext">Data Protection and Privacy</p>
      "! Data protection and privacy
      data_protection_and_privacy TYPE ty_gs_dpp_properties,

      "! <p class="shorttext">Reference to Characteristic</p>
      "! Reference to characteristic
      characteristic_reference    TYPE ty_gs_characteristic_reference,

      "! <p class="shorttext">Label and Tooltip</p>
      "! Label and tooltip
      "! $required
      ui_texts                    TYPE ty_gt_ui_text,

      "! <p class="shorttext">Business Contexts</p>
      "! Business contexts
      business_contexts           TYPE ty_gt_business_context,

      "! <p class="shorttext">Code List Values</p>
      "! Code list values
      code_list_values            TYPE ty_gt_codelistvalue,

      "! <p class="shorttext">Code List Descriptions</p>
      "! Code list descriptions
      code_list_descriptions      TYPE ty_gt_codelistvalue_descr,

      "! <p class="shorttext">Value Help Key Mappings</p>
      "! Value help key mappings
      value_help_key_mappings     TYPE ty_gt_value_help_key_mapping,

      "! <p class="shorttext">Value Help Bindings</p>
      "! Value help bindings
      value_help_bindings         TYPE ty_gt_value_help_binding,

      "! <p class="shorttext">Extended CDS Views</p>
      "! Extended CDS views
      cds_usages                  TYPE ty_gt_cds_usage,

      "! <p class="shorttext">Extended OData Services</p>
      "! Extended OData services
      odata_usages                TYPE ty_gt_odata_usage,

      "! <p class="shorttext">Extended Business Scenarios</p>
      "! Extended business scenarios
      business_scenarios          TYPE ty_gt_business_scenario,

      "! <p class="shorttext">Extended Dynpro Screens</p>
      "! Extended dynpro screens
      dynpro_usages               TYPE ty_gt_dynpro_usage,

      "! <p class="shorttext">Extended SOAP Services</p>
      "! Extended SOAP services
      soap_usages                 TYPE ty_gt_soap_usage,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF gc_type,
      "! <p class="shorttext">Amount with Currency</p>
      "! Amount with currency
      amount                     TYPE ty_type VALUE 'AMOUNT' ##no_text,
      "! <p class="shorttext">Boolean</p>
      "! Boolean
      boolean                    TYPE ty_type VALUE 'BOOLEAN' ##no_text,
      "! <p class="shorttext">Date</p>
      "! Date
      date                       TYPE ty_type VALUE 'DATE' ##no_text,
      "! <p class="shorttext">E-Mail</p>
      "! E-Mail
      email                      TYPE ty_type VALUE 'EMAIL' ##no_text,
      "! <p class="shorttext">List</p>
      "! List
      list                       TYPE ty_type VALUE 'LIST' ##no_text,
      "! <p class="shorttext">Number</p>
      "! Number
      number                     TYPE ty_type VALUE 'NUMBER' ##no_text,
      "! <p class="shorttext">Quantity with Unit</p>
      "! Quantity with unit
      quantity                   TYPE ty_type VALUE 'QUANTITY' ##no_text,
      "! <p class="shorttext">Text</p>
      "! Text
      text                       TYPE ty_type VALUE 'TEXT' ##no_text,
      "! <p class="shorttext">Time</p>
      "! Time
      time                       TYPE ty_type VALUE 'TIME' ##no_text,
      "! <p class="shorttext">Web Address</p>
      "! Web address
      url                        TYPE ty_type VALUE 'URL' ##no_text,
      "! <p class="shorttext">Phone Number</p>
      "! Phone number
      phone                      TYPE ty_type VALUE 'PHONE' ##no_text,
      "! <p class="shorttext">Amount Only</p>
      "! Amount only
      amount_only                TYPE ty_type VALUE 'AMNT_ONLY' ##no_text,
      "! <p class="shorttext">Currency</p>
      "! Currency
      currency_code              TYPE ty_type VALUE 'CURRENCY' ##no_text,
      "! <p class="shorttext">Quantity Only</p>
      "! Quantity only
      quantity_only              TYPE ty_type VALUE 'QUAN_ONLY' ##no_text,
      "! <p class="shorttext">Unit</p>
      "! Unit
      unit_code                  TYPE ty_type VALUE 'UNIT' ##no_text,
      "! <p class="shorttext">Language</p>
      "! Language
      language_code              TYPE ty_type VALUE 'LANGUAGE' ##no_text,
      "! <p class="shorttext">Numerical Text</p>
      "! Numerical text
      numerical_text             TYPE ty_type VALUE 'NUMC_TEXT' ##no_text,
      "! <p class="shorttext">Posting Perioid</p>
      "! Posting perioid
      posting_period             TYPE ty_type VALUE 'PST_PERIOD' ##no_text,
      "! <p class="shorttext">Raw</p>
      "! Raw
      raw                        TYPE ty_type VALUE 'RAW' ##no_text,
      "! <p class="shorttext">Association to Standard Business Object</p>
      "! Association to standard business object
      association_to_standard_bo TYPE ty_type VALUE 'ASC_TO_STD' ##no_text,
      "! <p class="shorttext">Timestamp</p>
      "! Timestamp
      timestamp                  TYPE ty_type VALUE 'TIMESTAMP' ##no_text,
      "! <p class="shorttext">Code List based on CDS View</p>
      "! Code list based on CDS view
      list_cview                 TYPE ty_type VALUE 'LIST_CVIEW' ##no_text,
      "! <p class="shorttext">Characteristics - List</p>
      "!Characteristics - List
      characteristic_list        TYPE ty_type VALUE 'CHRCS_LIST' ##no_text,
      "! <p class="shorttext">Characteristics - Number</p>
      "! Characteristics - Number interval
      numeric_interval           TYPE ty_type VALUE 'NUMBER_ITV' ##no_text,
      "! <p class="shorttext">Characteristics - Amount Interval</p>
      "! Characteristics - Amount interval
      amount_interval            TYPE ty_type VALUE 'AMOUNT_ITV' ##no_text,
      "! <p class="shorttext">Characteristics - Date Interval</p>
      "! Characteristics - Date interval
      date_interval              TYPE ty_type VALUE 'DATE_ITV' ##no_text,
      "! <p class="shorttext">Characteristics - Time Interval</p>
      "! Characteristics - Time interval
      time_interval              TYPE ty_type VALUE 'TIME_ITV' ##no_text,
      "! <p class="shorttext">Association to Custom Business Object</p>
      "! Association to custom business object
      association_to_custom_bo   TYPE ty_type VALUE 'ASC_TO_CBO' ##no_text,
    END OF gc_type .

  CONSTANTS: BEGIN OF gc_data_subject_id_type,
               "! <p class="shorttext">Not applicable</p>
               "! Not applicable
               not_applicable           TYPE cfd_irf_data_subject_id_type VALUE '',
               "! <p class="shorttext">Central Business Partner</p>
               "! Central business partner
               central_business_partner TYPE cfd_irf_data_subject_id_type VALUE 'BP',
               "! <p class="shorttext">Customer</p>
               "! Customer
               customer                 TYPE cfd_irf_data_subject_id_type VALUE 'CUSTOMER',
               "! <p class="shorttext">Supplier</p>
               "! Supplier
               supplier                 TYPE cfd_irf_data_subject_id_type VALUE 'SUPPLIER',
               "! <p class="shorttext">Contact Person</p>
               "! Contact person
               contact_person           TYPE cfd_irf_data_subject_id_type VALUE 'CONTACT',
               "! <p class="shorttext">Workforce Person</p>
               "! Workforce person
               workforce_person         TYPE cfd_irf_data_subject_id_type VALUE 'WFP',
             END OF gc_data_subject_id_type.

  CONSTANTS: BEGIN OF gc_soap_message_direction,
               "! <p class="shorttext">Request</p>
               "! Request
               request  TYPE cfd_soap_message_direction VALUE 'REQ',
               "! <p class="shorttext">Response</p>
               "! Response
               response TYPE cfd_soap_message_direction VALUE 'RES',
             END OF gc_soap_message_direction.

  CONSTANTS: BEGIN OF gc_aggregation,
               "! <p class="shorttext">None</p>
               "! None
               none TYPE cfd_field_aggregation VALUE 'NONE',
               "! <p class="shorttext">Min</p>
               "! Min
               min  TYPE cfd_field_aggregation VALUE 'MIN',
               "! <p class="shorttext">Max</p>
               "! Max
               max  TYPE cfd_field_aggregation VALUE 'MAX',
               "! <p class="shorttext">Sum</p>
               "! Sum
               sum  TYPE cfd_field_aggregation VALUE 'SUM',
             END OF gc_aggregation.

  CONSTANTS: BEGIN OF gc_field_control_property,
               "! <p class="shorttext">Optional</p>
               "! Optional
               optional  TYPE cfd_field_control_properties VALUE '',
               "! <p class="shorttext">Read Only</p>
               "! Read Only
               read_only TYPE cfd_field_control_properties VALUE 'R',
               "! <p class="shorttext">Mandatory</p>
               "! Mandatory
               mandatory TYPE cfd_field_control_properties VALUE 'M',
             END OF gc_field_control_property.

ENDINTERFACE.
