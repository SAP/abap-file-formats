INTERFACE zif_aff_ddls_v1
  PUBLIC.

  "! <p class="shorttext">Source Type</p>
  "! Source type
  "! $values {@link zif_aff_ddls_v1.data:co_source_type}
  "! $default {@link zif_aff_ddls_v1.data:co_source_type.unknown}
  TYPES ty_source_type TYPE c LENGTH 1.

  "! <p class="shorttext">Source Origin</p>
  "! Source origin
  "! $values {@link zif_aff_ddls_v1.data:co_source_origin}
  "! $default {@link zif_aff_ddls_v1.data:co_source_origin.abap_development_tools}
  TYPES ty_source_origin TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Source Type</p>
    "! Source type
    BEGIN OF co_source_type,
      "! <p class="shorttext">DDIC-Based View</p>
      "! DDIC-based view
      ddic_based_view    TYPE ty_source_type VALUE 'V',
      "! <p class="shorttext">View Entity</p>
      "! View entity
      view_entity        TYPE ty_source_type VALUE 'W',
      "! <p class="shorttext">View Extend</p>
      "! View extend
      view_extend        TYPE ty_source_type VALUE 'E',
      "! <p class="shorttext">View Entity Extend</p>
      "! View entity extend
      view_entity_extend TYPE ty_source_type VALUE 'X',
      "! <p class="shorttext">Table Function</p>
      "! Table function
      table_function     TYPE ty_source_type VALUE 'F',
      "! <p class="shorttext">Table Entity</p>
      "! Table entity
      table_entity       TYPE ty_source_type VALUE 'T',
      "! <p class="shorttext">Abstract Entity</p>
      "! Abstract entity
      abstract_entity    TYPE ty_source_type VALUE 'A',
      "! <p class="shorttext">Custom Entity</p>
      "! Custom entity
      custom_entity      TYPE ty_source_type VALUE 'Q',
      "! <p class="shorttext">Hierarchy</p>
      "! Hierarchy
      hierarchy          TYPE ty_source_type VALUE 'H',
      "! <p class="shorttext">Projection View</p>
      "! Projection view
      projection_view    TYPE ty_source_type VALUE 'P',
      "! <p class="shorttext">External Entity</p>
      "! External entity
      external_entity    TYPE ty_source_type VALUE 'O',
      "! <p class="shorttext">Unknown</p>
      "! Unknown
      unknown            TYPE ty_source_type VALUE ' ',
    END OF co_source_type,

    "! <p class="shorttext">Source Origin</p>
    "! Source origin
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
      "! Source origin
      "! $required
      source_origin  TYPE ty_source_origin,
      "! <p class="shorttext">Source Type</p>
      "! Source type
      "! $required
      source_type    TYPE ty_source_type,
      "! <p class="shorttext">Parent Name</p>
      "! DDLS name of the parent of an extend
      parent_name    TYPE c LENGTH 40,
    END OF ty_main.

ENDINTERFACE.
