INTERFACE zif_aff_srvd_v1
  PUBLIC.

  "! <p class="shorttext">Source Type</p>
  "! States which statement is used in the service definition
  "! $values {@link zif_aff_srvd_v1.data:co_source_type}
  "! $default {@link zif_aff_srvd_v1.data:co_source_type.definition}
  TYPES ty_source_type TYPE c LENGTH 1.

  "! <p class="shorttext">Source Origin</p>
  "! States which tool was used to create the service definition
  "! $values {@link zif_aff_srvd_v1.data:co_source_origin}
  "! $default {@link zif_aff_srvd_v1.data:co_source_origin.abap_development_tools}
  TYPES ty_source_origin TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Source Type Values</p>
    "! Allowed values for source type
    BEGIN OF co_source_type,
      "! <p class="shorttext">Definition</p>
      "! Definition
      definition         TYPE ty_source_type VALUE 'S',
      "! <p class="shorttext">Extension</p>
      "! Extension
      extension          TYPE ty_source_type VALUE 'X',
    END OF co_source_type,

    "! <p class="shorttext">Source Origin Values</p>
    "! Allowed values for source origin
    BEGIN OF co_source_origin,
      "! <p class="shorttext">ABAP Development Tools</p>
      "! ABAP Development Tools
      abap_development_tools         TYPE ty_source_origin VALUE '0',
      "! <p class="shorttext">Custom CDS Views</p>
      "! Custom CDS views
      custom_cds_views               TYPE ty_source_origin VALUE '1',
      "! <p class="shorttext">Custom Analytical Queries</p>
      "! Custom analytical queries
      custom_analytical_queries      TYPE ty_source_origin VALUE '2',
      "! <p class="shorttext">Custom Business Object</p>
      "! Custom business object
      custom_business_object         TYPE ty_source_origin VALUE '3',
      "! <p class="shorttext">Custom Code List</p>
      "! Custom code list
      custom_code_list               TYPE ty_source_origin VALUE '4',
      "! <p class="shorttext">Custom CDS Views for Variant Configurations</p>
      "! Custom CDS views for variant configurations
      custom_cds_views_variant_confg TYPE ty_source_origin VALUE '5',
      "! <p class="shorttext">Custom Fields</p>
      "! Custom fields
      custom_fields                  TYPE ty_source_origin VALUE '6',
      "! <p class="shorttext">Extensions for Data Sources</p>
      "! Extensions for data sources
      extensions_for_data_sources    TYPE ty_source_origin VALUE '7',
      "! <p class="shorttext">Custom Search Modeler</p>
      "! Custom search modeler
      custom_search_modeler          TYPE ty_source_origin VALUE '8',
      "! <p class="shorttext">Service Consumption Model</p>
      "! Service Consumption Model
      service_consumption_model      TYPE ty_source_origin VALUE '9',
    END OF co_source_origin.


  TYPES:
    "! <p class="shorttext">General Information</p>
    "! Metadata for the service definition
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Source Origin</p>
      "! Source Origin states which tool was used to create the service definition
      "! $values {@link zif_aff_srvd_v1.data:co_source_origin}
      "! $default {@link zif_aff_srvd_v1.data:co_source_origin.abap_development_tools}
      source_origin TYPE ty_source_origin,
      "! <p class="shorttext">Source Type</p>
      "! Source type states which statement is in the service definition.
      "! $values {@link zif_aff_srvd_v1.data:co_source_type}
      "! $default {@link zif_aff_srvd_v1.data:co_source_type.definition}
      source_type   TYPE ty_source_type,
    END OF ty_general_information,

    "! <p class="shorttext">Service Definition Properties</p>
    "! Properties of a Service Definition
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,

    END OF ty_main.

ENDINTERFACE.
