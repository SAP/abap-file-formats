INTERFACE zif_aff_cfdf_v1
  PUBLIC.

  TYPES: ty_field_name              TYPE c LENGTH 30.
  TYPES: ty_component_identifier    TYPE c LENGTH 5.
  TYPES: ty_business_context        TYPE c LENGTH 30.
  TYPES: ty_code_value              TYPE c LENGTH 30.
  TYPES: ty_data_subject_id_type    TYPE c LENGTH 10.
  TYPES: ty_type                    TYPE c LENGTH 10.
  TYPES: ty_message_direction       TYPE c LENGTH 3.
  TYPES: ty_field_control_property  TYPE c LENGTH 1.
  TYPES: ty_aggregation             TYPE c LENGTH 5.

  TYPES:
    "! <p class="shorttext">Label and Tooltip</p>
    "! Label and tooltip
    BEGIN OF ty_gs_ui_text,
      "! <p class="shorttext">Translation Language</p>
      "! Translation language
      "! $required
      language      TYPE sy-langu,

      "! <p class="shorttext">Field Label</p>
      "! Field label
      "! $required
      field_label   TYPE c LENGTH 40,

      "! <p class="shorttext">Field Tooltip</p>
      "! Field tooltip
      "! $required
      field_tooltip TYPE c LENGTH 60,
    END OF ty_gs_ui_text.
  TYPES: ty_gt_ui_text TYPE STANDARD TABLE OF ty_gs_ui_text WITH KEY language.

  TYPES:
    "! <p class="shorttext">Extended Business Context Details</p>
    "! Extended business context details
    BEGIN OF ty_gs_extended_bus_context,
      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      business_context     TYPE ty_business_context,

      "! <p class="shorttext">Deviating Field Name</p>
      "! Deviating field name
      deviating_field_name TYPE ty_field_name,
    END OF ty_gs_extended_bus_context.
  TYPES: ty_gt_extended_bus_context TYPE STANDARD TABLE OF ty_gs_extended_bus_context WITH KEY business_context.

  TYPES:
    "! <p class="shorttext">Extended CDS View Details</p>
    "! Extended CDS view details
    BEGIN OF ty_gs_extended_cds_view,
      "! <p class="shorttext">CDS View Name</p>
      "! CDS view name
      "! $required
      cds_view_name                 TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      business_context              TYPE ty_business_context,

      "! <p class="shorttext">Basic Search Relevance</p>
      "! Basic search relevance
      is_search_relevant            TYPE abap_bool,

      "! <p class="shorttext">BAdI Implementation for Visibility Control</p>
      "! BAdI implementation for visibility control
      badi_impl_for_visibility_ctrl TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Field Control Property</p>
      "! Field control property
      "! $values {@link zif_aff_cfdf_v1.data:co_field_control_property}
      "! $default {@link zif_aff_cfdf_v1.data:co_field_control_property.optional}
      field_control_property        TYPE ty_field_control_property,
    END OF ty_gs_extended_cds_view.
  TYPES: ty_gt_extended_cds_view TYPE STANDARD TABLE OF ty_gs_extended_cds_view WITH KEY business_context cds_view_name.

  TYPES:
    "! <p class="shorttext">Extended OData Service Details</p>
    "! Extended OData service details
    BEGIN OF ty_gs_extended_odata_service,
      "! <p class="shorttext">OData Service Key</p>
      "! OData service key
      "! $required
      odata_service_key  TYPE c LENGTH 81,

      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      business_context   TYPE ty_business_context,

      "! <p class="shorttext">Basic Search Relevance</p>
      "! Basic search relevance
      is_search_relevant TYPE abap_bool,
    END OF ty_gs_extended_odata_service.
  TYPES: ty_gt_extended_odata_service TYPE STANDARD TABLE OF ty_gs_extended_odata_service
                                           WITH KEY business_context odata_service_key.

  TYPES:
    "! <p class="shorttext">Extended Business Scenario Details</p>
    "! Extended business scenario details
    BEGIN OF ty_gs_extended_bus_scenario,
      "! <p class="shorttext">Business Scenario</p>
      "! Business scenario
      "! $required
      business_scenario TYPE c LENGTH 30,

      "! <p class="shorttext">Data Transfer</p>
      "! Data transfer
      "! $required
      data_transfer     TYPE c LENGTH 30,
    END OF ty_gs_extended_bus_scenario.
  TYPES: ty_gt_extended_bus_scenario TYPE STANDARD TABLE OF ty_gs_extended_bus_scenario WITH KEY business_scenario.

  TYPES:
    "! <p class="shorttext">Extended Dynpro Context Details</p>
    "! Extended dynpro context details
    BEGIN OF ty_gs_extended_dynpro_context,
      "! <p class="shorttext">Dynpro Context</p>
      "! Dynpro context
      "! $required
      dynpro_context   TYPE c LENGTH 30,

      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      business_context TYPE ty_business_context,
    END OF ty_gs_extended_dynpro_context.
  TYPES ty_gt_extended_dynpro_context TYPE STANDARD TABLE OF ty_gs_extended_dynpro_context
                                      WITH KEY dynpro_context business_context.

  TYPES:
    "! <p class="shorttext">Extended SOAP Service Details</p>
    "! Extended SOAP service details
    BEGIN OF ty_gs_extended_soap_service,
      "! <p class="shorttext">Service Interface</p>
      "! Service interface
      "! $required
      service_interface    TYPE c LENGTH 30,

      "! <p class="shorttext">Operation</p>
      "! Operation
      "! $required
      operation            TYPE c LENGTH 30,

      "! <p class="shorttext">Message Direction</p>
      "! Message direction
      "! $required
      "! $values {@link zif_aff_cfdf_v1.data:co_soap_message_direction}
      message_direction    TYPE ty_message_direction,

      "! <p class="shorttext">Business Context</p>
      "! Business context
      "! $required
      business_context     TYPE ty_business_context,

      "! <p class="shorttext">Component Identifier</p>
      "! Component identifier
      component_identifier TYPE ty_component_identifier,

      "! <p class="shorttext">External Namespace</p>
      "! External namespace
      "! $required
      external_namespace   TYPE c LENGTH 255,

      "! <p class="shorttext">External Field Name</p>
      "! External field name
      "! $required
      external_field_name  TYPE c LENGTH 120,
    END OF ty_gs_extended_soap_service.
  TYPES: ty_gt_extended_soap_service TYPE STANDARD TABLE OF ty_gs_extended_soap_service
                          WITH KEY business_context service_interface operation message_direction component_identifier.

  TYPES:
    "! <p class="shorttext">Code Description</p>
    "! Code description
    BEGIN OF ty_gs_code_list_value_descr,
      "! <p class="shorttext">Language</p>
      "! Language
      "! $required
      language    TYPE sy-langu,

      "! <p class="shorttext">Code</p>
      "! Code
      "! $required
      code        TYPE ty_code_value,

      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description TYPE c LENGTH 60,
    END OF ty_gs_code_list_value_descr.
  TYPES: ty_gt_code_list_value_descr TYPE STANDARD TABLE OF ty_gs_code_list_value_descr WITH KEY language code.

  TYPES:
    "! <p class="shorttext">Code Value</p>
    "! Code value
    BEGIN OF ty_gs_code_list_value,
      "! <p class="shorttext">Code</p>
      "! Code
      "! $required
      code        TYPE ty_code_value,

      "! <p class="shorttext">Disabled</p>
      "! Disabled
      is_disabled TYPE abap_bool,
    END OF ty_gs_code_list_value.
  TYPES: ty_gt_code_list_value TYPE STANDARD TABLE OF ty_gs_code_list_value WITH KEY code.

  TYPES:
    "! <p class="shorttext">Value Help Key Mapping Details</p>
    "! Value help key mapping details
    BEGIN OF ty_gs_value_help_key_mapping,
      "! <p class="shorttext">Component Identifier</p>
      "! Component identifier
      component_identifier      TYPE ty_component_identifier,

      "! <p class="shorttext">Value Help Field Name</p>
      "! Value help field name
      "! $required
      value_help_field_name     TYPE ty_field_name,

      "! <p class="shorttext">Dimension View Field Name</p>
      "! Dimension view field name
      dimension_view_field_name TYPE ty_field_name,
    END OF ty_gs_value_help_key_mapping.
  TYPES ty_gt_value_help_key_mapping TYPE STANDARD TABLE OF ty_gs_value_help_key_mapping WITH KEY component_identifier.

  TYPES:
    "! <p class="shorttext">Value Help Binding Details</p>
    "! Value help binding details
    BEGIN OF ty_gs_value_help_binding,
      "! <p class="shorttext">Extended CDS View Name</p>
      "! Extended CDS view name
      "! $required
      cds_view_name                TYPE  zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Extended CDS View Field Name</p>
      "! Extended CDS view field name
      "! $required
      extended_cds_view_field_name TYPE ty_field_name,

      "! <p class="shorttext">Value Help Field Name</p>
      "! Value help field name
      "! $required
      value_help_field_name        TYPE  ty_field_name,
    END OF ty_gs_value_help_binding.
  TYPES ty_gt_value_help_binding TYPE STANDARD TABLE OF ty_gs_value_help_binding
                                 WITH KEY cds_view_name value_help_field_name.

  TYPES:
    "! <p class="shorttext">Data Protection and Privacy</p>
    "! Data protection and privacy
    BEGIN OF ty_gs_dpp_properties,
      "! <p class="shorttext">Data Subject</p>
      "! Data subject
      "! $values {@link zif_aff_cfdf_v1.data:co_data_subject_id_type}
      "! $default {@link zif_aff_cfdf_v1.data:co_data_subject_id_type.not_applicable}
      data_subject_id_type       TYPE ty_data_subject_id_type,

      "! <p class="shorttext">BAdI Implementation for Data Subject</p>
      "! BAdI implementation for data subject
      badi_impl_for_data_subject TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_gs_dpp_properties.

  TYPES:
    "! <p class="shorttext">Characteristic Reference</p>
    "! Characteristic reference
    BEGIN OF ty_gs_characteristic_reference,
      "! <p class="shorttext">Characteristic Name</p>
      "! Characteristic name
      characteristic_name TYPE c LENGTH 30,

      "! <p class="shorttext">Class Name</p>
      "! Class name
      class_type          TYPE c LENGTH 3,

      "! <p class="shorttext">Object Type</p>
      "! Object type
      object_type         TYPE c LENGTH 30,
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
      header                      TYPE zif_aff_types_v1=>ty_header_60_no_abap_lv,

      "! <p class="shorttext">External Name</p>
      "! External name
      "! $required
      external_name               TYPE ty_field_name,

      "! <p class="shorttext">Type</p>
      "! Type
      "! $required
      "! $values {@link zif_aff_cfdf_v1.data:co_type}
      type                        TYPE ty_type,

      "! <p class="shorttext">Type Details</p>
      "! Type details
      BEGIN OF type_details,
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
        "! $values {@link zif_aff_cfdf_v1.data:co_aggregation}
        "! $default {@link zif_aff_cfdf_v1.data:co_aggregation.none}
        aggregation                TYPE ty_aggregation,

        "! <p class="shorttext">Code List Uppercase Only</p>
        "! Code List uppercase only
        code_list_uppercase_only   TYPE abap_bool,

        "! <p class="shorttext">Associated Business Object</p>
        "! Associated business object
        associated_business_object TYPE zif_aff_types_v1=>ty_object_name_30,

        "! <p class="shorttext">Value Help View</p>
        "! Value help view
        value_help_view            TYPE zif_aff_types_v1=>ty_object_name_30,

        "! <p class="shorttext">Dimension View</p>
        "! Dimension view
        dimension_view             TYPE zif_aff_types_v1=>ty_object_name_30,
      END OF type_details,

      "! <p class="shorttext">Data Protection and Privacy</p>
      "! Data protection and privacy
      data_protection_and_privacy TYPE ty_gs_dpp_properties,

      "! <p class="shorttext">Reference to Characteristic</p>
      "! Reference to characteristic
      characteristic_reference    TYPE ty_gs_characteristic_reference,

      "! <p class="shorttext">Labels and Tooltips</p>
      "! Labels and tooltips
      ui_texts                    TYPE ty_gt_ui_text,

      "! <p class="shorttext">Code List Values</p>
      "! Code list values
      code_list_values            TYPE ty_gt_code_list_value,

      "! <p class="shorttext">Code List Descriptions</p>
      "! Code list descriptions
      code_list_descriptions      TYPE ty_gt_code_list_value_descr,

      "! <p class="shorttext">Extended Business Context Details</p>
      "! Extended business context details
      extended_business_contexts  TYPE ty_gt_extended_bus_context,

      "! <p class="shorttext">Extended CDS View Details</p>
      "! Extended CDS view details
      extended_cds_views          TYPE ty_gt_extended_cds_view,

      "! <p class="shorttext">Extended OData Service Details</p>
      "! Extended OData service details
      extended_odata_services     TYPE ty_gt_extended_odata_service,

      "! <p class="shorttext">Extended Business Scenario Details</p>
      "! Extended business scenario details
      extended_business_scenarios TYPE ty_gt_extended_bus_scenario,

      "! <p class="shorttext">Extended Dynpro Context Details</p>
      "! Extended dynpro context details
      extended_dynpro_contexts    TYPE ty_gt_extended_dynpro_context,

      "! <p class="shorttext">Extended SOAP Service Details</p>
      "! Extended SOAP service details
      extended_soap_services      TYPE ty_gt_extended_soap_service,

      "! <p class="shorttext">Value Help Key Mapping Details</p>
      "! Value help key mapping details
      value_help_key_mappings     TYPE ty_gt_value_help_key_mapping,

      "! <p class="shorttext">Value Help Binding Details</p>
      "! Value help binding details
      value_help_bindings         TYPE ty_gt_value_help_binding,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_type,
      "! <p class="shorttext">Amount with Currency</p>
      "! Amount with currency
      amount_with_currency       TYPE ty_type VALUE 'AMOUNT',
      "! <p class="shorttext">Boolean</p>
      "! Boolean
      boolean                    TYPE ty_type VALUE 'BOOLEAN',
      "! <p class="shorttext">Date</p>
      "! Date
      date                       TYPE ty_type VALUE 'DATE',
      "! <p class="shorttext">E-Mail</p>
      "! E-Mail
      email                      TYPE ty_type VALUE 'EMAIL',
      "! <p class="shorttext">List</p>
      "! List
      list                       TYPE ty_type VALUE 'LIST',
      "! <p class="shorttext">Number</p>
      "! Number
      number                     TYPE ty_type VALUE 'NUMBER',
      "! <p class="shorttext">Quantity with Unit</p>
      "! Quantity with unit
      quantity                   TYPE ty_type VALUE 'QUANTITY',
      "! <p class="shorttext">Text</p>
      "! Text
      text                       TYPE ty_type VALUE 'TEXT',
      "! <p class="shorttext">Time</p>
      "! Time
      time                       TYPE ty_type VALUE 'TIME',
      "! <p class="shorttext">Web Address</p>
      "! Web address
      url                        TYPE ty_type VALUE 'URL',
      "! <p class="shorttext">Phone Number</p>
      "! Phone number
      phone                      TYPE ty_type VALUE 'PHONE',
      "! <p class="shorttext">Amount without Currency</p>
      "! Amount without currency
      amount_without_currency    TYPE ty_type VALUE 'AMNT_ONLY',
      "! <p class="shorttext">Currency</p>
      "! Currency
      currency_code              TYPE ty_type VALUE 'CURRENCY',
      "! <p class="shorttext">Quantity without Unit</p>
      "! Quantity without unit
      quantity_only              TYPE ty_type VALUE 'QUAN_ONLY',
      "! <p class="shorttext">Unit</p>
      "! Unit
      unit_code                  TYPE ty_type VALUE 'UNIT',
      "! <p class="shorttext">Language</p>
      "! Language
      language_code              TYPE ty_type VALUE 'LANGUAGE',
      "! <p class="shorttext">Numerical Text</p>
      "! Numerical text
      numerical_text             TYPE ty_type VALUE 'NUMC_TEXT',
      "! <p class="shorttext">Posting Perioid</p>
      "! Posting perioid
      posting_period             TYPE ty_type VALUE 'PST_PERIOD',
      "! <p class="shorttext">Raw</p>
      "! Raw
      raw                        TYPE ty_type VALUE 'RAW',
      "! <p class="shorttext">Association to Standard Business Object</p>
      "! Association to standard business object
      association_to_standard_bo TYPE ty_type VALUE 'ASC_TO_STD',
      "! <p class="shorttext">Timestamp</p>
      "! Timestamp
      timestamp                  TYPE ty_type VALUE 'TIMESTAMP',
      "! <p class="shorttext">Code List based on CDS View</p>
      "! Code list based on CDS view
      list_based_on_cds_view     TYPE ty_type VALUE 'LIST_CVIEW',
      "! <p class="shorttext">Characteristics - List</p>
      "!Characteristics - List
      characteristics_list       TYPE ty_type VALUE 'CHRCS_LIST',
      "! <p class="shorttext">Characteristics - Number</p>
      "! Characteristics - Number interval
      numeric_interval           TYPE ty_type VALUE 'NUMBER_ITV',
      "! <p class="shorttext">Characteristics - Amount Interval</p>
      "! Characteristics - Amount interval
      amount_interval            TYPE ty_type VALUE 'AMOUNT_ITV',
      "! <p class="shorttext">Characteristics - Date Interval</p>
      "! Characteristics - Date interval
      date_interval              TYPE ty_type VALUE 'DATE_ITV',
      "! <p class="shorttext">Characteristics - Time Interval</p>
      "! Characteristics - Time interval
      time_interval              TYPE ty_type VALUE 'TIME_ITV',
      "! <p class="shorttext">Association to Custom Business Object</p>
      "! Association to custom business object
      association_to_custom_bo   TYPE ty_type VALUE 'ASC_TO_CBO',
    END OF co_type.

  CONSTANTS:
    BEGIN OF co_data_subject_id_type,
      "! <p class="shorttext">Not Applicable</p>
      "! Not applicable
      not_applicable           TYPE ty_data_subject_id_type VALUE '',
      "! <p class="shorttext">Central Business Partner</p>
      "! Central business partner
      central_business_partner TYPE ty_data_subject_id_type VALUE 'BP',
      "! <p class="shorttext">Customer</p>
      "! Customer
      customer                 TYPE ty_data_subject_id_type VALUE 'CUSTOMER',
      "! <p class="shorttext">Supplier</p>
      "! Supplier
      supplier                 TYPE ty_data_subject_id_type VALUE 'SUPPLIER',
      "! <p class="shorttext">Contact Person</p>
      "! Contact person
      contact_person           TYPE ty_data_subject_id_type VALUE 'CONTACT',
      "! <p class="shorttext">Workforce Person</p>
      "! Workforce person
      workforce_person         TYPE ty_data_subject_id_type VALUE 'WFP',
    END OF co_data_subject_id_type.

  CONSTANTS:
    BEGIN OF co_soap_message_direction,
      "! <p class="shorttext">Request</p>
      "! Request
      request  TYPE ty_message_direction VALUE 'REQ',
      "! <p class="shorttext">Response</p>
      "! Response
      response TYPE ty_message_direction VALUE 'RES',
    END OF co_soap_message_direction.

  CONSTANTS:
    BEGIN OF co_aggregation,
      "! <p class="shorttext">None</p>
      "! None
      none TYPE ty_aggregation VALUE 'NONE',
      "! <p class="shorttext">Min</p>
      "! Min
      min  TYPE ty_aggregation VALUE 'MIN',
      "! <p class="shorttext">Max</p>
      "! Max
      max  TYPE ty_aggregation VALUE 'MAX',
      "! <p class="shorttext">Sum</p>
      "! Sum
      sum  TYPE ty_aggregation VALUE 'SUM',
    END OF co_aggregation.

  CONSTANTS:
    BEGIN OF co_field_control_property,
      "! <p class="shorttext">Optional</p>
      "! Optional
      optional  TYPE ty_field_control_property VALUE '',
      "! <p class="shorttext">Read Only</p>
      "! Read Only
      read_only TYPE ty_field_control_property VALUE 'R',
      "! <p class="shorttext">Mandatory</p>
      "! Mandatory
      mandatory TYPE ty_field_control_property VALUE 'M',
    END OF co_field_control_property.

ENDINTERFACE.
