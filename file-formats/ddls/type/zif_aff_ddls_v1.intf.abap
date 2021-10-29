INTERFACE zif_aff_ddls_v1
  PUBLIC.

  "! <p class="shorttext">Source Type</p>
  "! Source Type
  "! $values {@link zif_aff_ddls_v1.data:co_source_type}
  TYPES ty_source_type TYPE c LENGTH 1.

  "! <p class="shorttext">Source Origin</p>
  "! Source Origin
  "! $values {@link zif_aff_ddls_v1.data:co_source_origin}
  TYPES ty_source_origin TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Source Type</p>
    "! Source type
    BEGIN OF co_source_type,
      "! <p class="shorttext">View</p>
      "! View
      view               TYPE ty_source_type VALUE 'V',
      "! <p class="shorttext">View Entity</p>
      "! View Entity
      view_entity        TYPE ty_source_type VALUE 'W',
      "! <p class="shorttext">View Extend</p>
      "! View Extend
      view_extend        TYPE ty_source_type VALUE 'E',
      "! <p class="shorttext">View Entity Extend</p>
      "! View Entity Extend
      view_entity_extend TYPE ty_source_type VALUE 'X',
      "! <p class="shorttext">Table Function</p>
      "! Table Function
      table_function     TYPE ty_source_type VALUE 'F',
      "! <p class="shorttext">Table Entity</p>
      "! Table Entity
      table_entity       TYPE ty_source_type VALUE 'T',
      "! <p class="shorttext">Abstract Entity</p>
      "! Abstract Entity
      abstract_entity    TYPE ty_source_type VALUE 'A',
      "! <p class="shorttext">Custom Entity</p>
      "! Custom Entity
      custom_entity      TYPE ty_source_type VALUE 'Q',
      "! <p class="shorttext">Hierarchy</p>
      "! Hierarchy
      hierarchy          TYPE ty_source_type VALUE 'H',
      "! <p class="shorttext">Projection View</p>
      "! Projection View
      projection_view    TYPE ty_source_type VALUE 'P',
    END OF co_source_type,

    "! <p class="shorttext">Source Origin</p>
    "! Source origin
    BEGIN OF co_source_origin,
      "! <p class="shorttext">ABAP Development Tools</p>
      "! ABAP Development Tools
      abap_development_tools         TYPE ty_source_origin VALUE '0',
      "! <p class="shorttext">Custom CDS Views</p>
      "! Custom CDS Views
      custom_cds_views               TYPE ty_source_origin VALUE '1',
      "! <p class="shorttext">Custom Analytical Queries</p>
      "! Custom Analytical Queries
      custom_analytical_queries      TYPE ty_source_origin VALUE '2',
      "! <p class="shorttext">Custom Business Object</p>
      "! Custom Business Object
      custom_business_object         TYPE ty_source_origin VALUE '3',
      "! <p class="shorttext">Custom Code List</p>
      "! Custom Code List
      custom_code_list               TYPE ty_source_origin VALUE '4',
      "! <p class="shorttext">Custom CDS Views for Variant Configurations</p>
      "! Custom CDS Views for Variant Configurations
      custom_cds_views_variant_confg TYPE ty_source_origin VALUE '5',
      "! <p class="shorttext">Custom Fields</p>
      "! Custom Fields
      custom_fields                  TYPE ty_source_origin VALUE '6',
      "! <p class="shorttext">Extensions for Data Sources</p>
      "! Extensions for Data Sources
      extensions_for_data_sources    TYPE ty_source_origin VALUE '7',
      "! <p class="shorttext">Custom Search Modeler</p>
      "! Custom Search Modeler
      custom_search_modeler          TYPE ty_source_origin VALUE '8',
      "! <p class="shorttext">Service Consumption Model</p>
      "! Service Consumption Model
      service_consumption_model      TYPE ty_source_origin VALUE '9',
    END OF co_source_origin.

  TYPES:
    "! <p class="shorttext">Object Type DDLS</p>
    "! DDLS object type
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Source Origin</p>
      "! Source Origin
      "! $required
      source_origin  TYPE ty_source_origin,
      "! <p class="shorttext">Source Type</p>
      "! Source Type
      "! $required
      source_type    TYPE ty_source_type,
      "! <p class="shorttext">Parent Name</p>
      "! DDLS Name of the parent of an extend
      parent_name    TYPE c LENGTH 40,
    END OF ty_main.

ENDINTERFACE.
