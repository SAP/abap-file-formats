INTERFACE zif_aff_uiad_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Header</p>
    "! The header for an ABAP main object (without source code) with a description of 255 characters
    BEGIN OF ty_header,
      "! <p class="shorttext">Description</p>
      "! Description of the ABAP object
      "! $required
      description           TYPE c LENGTH 255,

      "! $required
      original_language     TYPE zif_aff_types_v1=>ty_original_language,

      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.

  "! <p class="shorttext">Application Type</p>
  "! LADI application type
  "! $values {@link zif_aff_uiad_v1.data:co_app_type}
  "! $default {@link zif_aff_uiad_v1.data:co_app_type.ui5}
  TYPES ty_app_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Application Type</p>
    "! LADI application type
    BEGIN OF co_app_type,

      "! <p class="shorttext">Transaction</p>
      "! Transaction
      transaction  TYPE ty_app_type VALUE 'T',

      "! <p class="shorttext">Web Dynpro Application</p>
      "! Web Dynpro application
      web_dynpro   TYPE ty_app_type VALUE 'W',

      "! <p class="shorttext">Web Client UI Application</p>
      "! Web Client UI application
      web_client   TYPE ty_app_type VALUE 'C',

      "! <p class="shorttext">SAPUI5 Fiori Application</p>
      "! SAPUI5 Fiori application
      ui5          TYPE ty_app_type VALUE 'U',

      "! <p class="shorttext">SAPUI5 Fiori Application on SAP BTP (Deprecated)</p>
      "! SAPUI5 Fiori application on SAP BTP (deprecated)
      legacy_ui5   TYPE ty_app_type VALUE 'S',

      "! <p class="shorttext">URL Application</p>
      "! URL application
      url          TYPE ty_app_type VALUE 'R',

      "! <p class="shorttext">Tile Only</p>
      "! Tile only
      tile_only    TYPE ty_app_type VALUE 'O',

      "! <p class="shorttext">URL Template</p>
      "! URL template
      url_template TYPE ty_app_type VALUE 'G',

    END OF co_app_type.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,

      "! <p class="shorttext">Application Type</p>
      "! Application type
      "! $required
      app_type          TYPE ty_app_type,

      "! <p class="shorttext">Technical Catalog</p>
      "! Technical catalog
      "! $required
      catalog_id        TYPE c LENGTH 40,

      "! <p class="shorttext">SAP Fiori ID</p>
      "! SAP Fiori ID
      fiori_id          TYPE c LENGTH 20,

      "! <p class="shorttext">Transaction Code</p>
      "! Transaction code
      transaction       TYPE c LENGTH 20,

      "! <p class="shorttext">Target Mapping Information</p>
      "! Target mapping information
      information       TYPE c LENGTH 255,

      "! <p class="shorttext">Application Component (ACH)</p>
      "! Application component (ACH)
      support_component TYPE c LENGTH 24,

      "! <p class="shorttext">Suppress Tiles</p>
      "! Suppress tiles
      suppress_tiles    TYPE abap_bool,

    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">SAPUI5 Fiori Application Information</p>
    "! SAPUI5 Fiori application information
    BEGIN OF ty_app_details_ui5,

      "! <p class="shorttext">SAPUI5 Component ID</p>
      "! SAPUI5 Component ID
      "! $required
      app_id   TYPE c LENGTH 70,

      "! <p class="shorttext">ICF Path</p>
      "! ICF path
      icf_path TYPE string,

    END OF ty_app_details_ui5.

  "! Web Dynpro integration mode
  "! $values {@link zif_aff_uiad_v1.data:co_web_dynpro_integration_mode}
  "! $default {@link zif_aff_uiad_v1.data:co_web_dynpro_integration_mode.system_default}
  TYPES ty_web_dynpro_integration_mode TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Web Dynpro Integration Mode</p>
    "! Web Dynpro integration mode
    BEGIN OF co_web_dynpro_integration_mode,

      "! <p class="shorttext">System Default</p>
      "! System default
      system_default TYPE ty_web_dynpro_integration_mode VALUE ' ',

      "! <p class="shorttext">Direct</p>
      "! Direct
      direct         TYPE ty_web_dynpro_integration_mode VALUE 'D',

      "! <p class="shorttext">Compatible</p>
      "! Compatible
      compatible     TYPE ty_web_dynpro_integration_mode VALUE 'C',

    END OF co_web_dynpro_integration_mode.

  TYPES:
    "! <p class="shorttext">Web Dynpro Application Inforation</p>
    "! Web Dynpro application information
    BEGIN OF ty_app_details_web_dynpro,

      "! <p class="shorttext">Web Dynpro Application</p>
      "! Web Dynpro application
      "! $required
      app_id             TYPE c LENGTH 30,

      "! <p class="shorttext">Application Configuration</p>
      "! Application configuration
      config_id          TYPE c LENGTH 32,

      "! <p class="shorttext">Flavor ID</p>
      "! Flavor ID (deprecated)
      flavor_id          TYPE c LENGTH 32,

      "! <p class="shorttext">Integration Mode</p>
      "! Integration mode (deprecated)
      integration_mode   TYPE ty_web_dynpro_integration_mode,

      "! <p class="shorttext">Compatibility Mode</p>
      "! Compatibility mode (deprecated)
      compatibility_mode TYPE abap_bool,

    END OF ty_app_details_web_dynpro.

  TYPES:
    "! <p class="shorttext">Web Client Application Information</p>
    "! Web Client application information
    BEGIN OF ty_app_details_web_client,

      "! <p class="shorttext">Target ID</p>
      "! Target ID
      "! $required
      target_id TYPE c LENGTH 10,

    END OF ty_app_details_web_client.

  TYPES:
    "! <p class="shorttext">URL Template Parameter</p>
    "! URL template parameter
    BEGIN OF ty_url_template_parameter,

      "! <p class="shorttext">Name</p>
      "! Parameter name
      "! $required
      name  TYPE string,

      "! <p class="shorttext">Value</p>
      "! Parameter value
      value TYPE string,

    END OF ty_url_template_parameter,

    ty_url_template_parameters TYPE STANDARD TABLE OF ty_url_template_parameter WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">URL Template Application Information</p>
    "! URL template application information
    BEGIN OF ty_app_details_url_template,

      "! <p class="shorttext">URL Template</p>
      "! URL template
      "! $required
      template_id TYPE c LENGTH 32,

      "! <p class="shorttext">URL Template Parameters</p>
      "! URL template parameters
      parameters  TYPE ty_url_template_parameters,

    END OF ty_app_details_url_template.

  "! <p class="shorttext">Filter Type</p>
  "! Type of the filter value
  "! $values {@link zif_aff_uiad_v1.data:co_filter_type}
  "! $default {@link zif_aff_uiad_v1.data:co_filter_type.plain}
  TYPES ty_filter_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Filter Type</p>
    "! Type of the filter value
    BEGIN OF co_filter_type,

      "! <p class="shorttext">Plain</p>
      "! The filter value is used as is
      plain TYPE ty_filter_type VALUE ' ',

      "! <p class="shorttext">Regex</p>
      "! The filter value is used as a regular expression
      regex TYPE ty_filter_type VALUE 'R',

    END OF co_filter_type.

  TYPES:
    "! <p class="shorttext">Navigation Parameter</p>
    "! Navigation parameter
    BEGIN OF ty_parameter_item,

      "! <p class="shorttext">Parameter Name</p>
      "! Parameter name
      "! $required
      name          TYPE string,

      "! <p class="shorttext">Parameter in Target Application</p>
      "! Parameter in target application
      rename_to     TYPE string,

      "! <p class="shorttext">Default Value</p>
      "! Default value
      default_value TYPE string,

      "! <p class="shorttext">Filter Value</p>
      "! Filter value
      filter_value  TYPE string,

      "! <p class="shorttext">Filter Type</p>
      "! Filter type
      filter_type   TYPE ty_filter_type,

      "! <p class="shorttext">Required</p>
      "! Whether the parameter is required
      required      TYPE abap_bool,

    END OF ty_parameter_item,

    ty_parameter_items TYPE STANDARD TABLE OF ty_parameter_item WITH DEFAULT KEY.

  "! <p class="shorttext">Additional Parameter Handling</p>
  "! How additional parameters are handled
  "! $values {@link zif_aff_uiad_v1.data:co_additional_param_handling}
  "! $default {@link zif_aff_uiad_v1.data:co_additional_param_handling.allowed}
  TYPES ty_additional_param_handling TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Additional Parameter Handling</p>
    "! How additional parameters are handled
    BEGIN OF co_additional_param_handling,

      "! <p class="shorttext">Allowed</p>
      "! Additional parameters are allowed
      allowed     TYPE ty_additional_param_handling VALUE 'A',

      "! <p class="shorttext">Ignored</p>
      "! Additional parameters are ignored
      ignored     TYPE ty_additional_param_handling VALUE 'I',

      "! <p class="shorttext">Not Allowed</p>
      "! Additional parameters are not allowed
      not_allowed TYPE ty_additional_param_handling VALUE 'N',

    END OF co_additional_param_handling.

  TYPES:
    "! <p class="shorttext">Navigation Information</p>
    "! Navigation information
    BEGIN OF ty_navigation,

      "! <p class="shorttext">Target Mapping ID</p>
      "! Target mapping ID
      "! $required
      target_mapping_id             TYPE c LENGTH 50,

      "! <p class="shorttext">Semantic Object</p>
      "! Semantic object of the target mapping
      "! $required
      semantic_object               TYPE c LENGTH 30,

      "! <p class="shorttext">Action</p>
      "! Action of the target mapping
      "! $required
      action                        TYPE c LENGTH 60,

      "! <p class="shorttext">Target URL</p>
      "! Target URL used for apps of type 'Tile Only' and 'URL Application'
      target_url                    TYPE string,

      "! <p class="shorttext">System Alias</p>
      "! System alias
      system_alias                  TYPE c LENGTH 32,

      "! <p class="shorttext">Desktop</p>
      "! Desktop is supported as device type
      desktop                       TYPE abap_bool,

      "! <p class="shorttext">Tablet</p>
      "! Tablet is supported as device type
      tablet                        TYPE abap_bool,

      "! <p class="shorttext">Phone</p>
      "! Phone is supported as device type
      phone                         TYPE abap_bool,

      "! <p class="shorttext">Navigation Parameters</p>
      "! Navigation parameters of the target mapping
      parameters                    TYPE ty_parameter_items,

      "! <p class="shorttext">Additional Parameter Handling</p>
      "! How additional parameters are handled
      additional_parameter_handling TYPE ty_additional_param_handling,

    END OF ty_navigation.

  "! <p class="shorttext">Tile Type</p>
  "! Tile type
  "! $values {@link zif_aff_uiad_v1.data:co_tile_type}
  "! $default {@link zif_aff_uiad_v1.data:co_tile_type.static}
  TYPES ty_tile_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Tile Type</p>
    "! Tile type
    BEGIN OF co_tile_type,

      "! <p class="shorttext">Static</p>
      "! Static tile
      static  TYPE ty_tile_type VALUE 'S',

      "! <p class="shorttext">Dynamic</p>
      "! Dynamic tile
      dynamic TYPE ty_tile_type VALUE 'D',

      "! <p class="shorttext">Custom</p>
      "! Custom tile
      custom  TYPE ty_tile_type VALUE 'C',

    END OF co_tile_type.

  TYPES:
    "! <p class="shorttext">Dynamic Tile Details</p>
    "! Dynamic tile details
    BEGIN OF ty_dynamic_tile_details,

      "! <p class="shorttext">Service URL</p>
      "! Service URL
      service_base_url TYPE string,

      "! <p class="shorttext">Service Path</p>
      "! Service path
      service_path     TYPE string,

      "! <p class="shorttext">Refresh Interval</p>
      "! Duration until the tile is refreshed
      refresh_interval TYPE i,

      "! <p class="shorttext">Number Unit</p>
      "! Number unit
      number_unit      TYPE string,

    END OF ty_dynamic_tile_details.

  TYPES:
    "! <p class="shorttext">Tile Navigation Parameter</p>
    "! Tile navigation parameter
    BEGIN OF ty_tile_navigation_parameter,

      "! <p class="shorttext">Name</p>
      "! Parameter name
      "! $required
      name  TYPE string,

      "! <p class="shorttext">Value</p>
      "! Parameter value
      value TYPE string,

    END OF ty_tile_navigation_parameter,

    ty_tile_navigation_parameters TYPE STANDARD TABLE OF ty_tile_navigation_parameter WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Standard Tile Details</p>
    "! Standard tile details
    BEGIN OF ty_standard_tile_details,

      "! <p class="shorttext">Reuse Text From Application</p>
      "! Reuse text defined as part of the app
      reuse_text_from_app        TYPE abap_bool,

      "! <p class="shorttext">Title</p>
      "! Tile title
      "! $required
      title                      TYPE c LENGTH 255,

      "! <p class="shorttext">Subtitle</p>
      "! Tile subtitle
      subtitle                   TYPE c LENGTH 255,

      "! <p class="shorttext">Information</p>
      "! Tile information
      information                TYPE c LENGTH 255,

      "! <p class="shorttext">Keywords</p>
      "! Tile keywords
      keywords                   TYPE c LENGTH 255,

      "! <p class="shorttext">Icon</p>
      "! Tile icon
      icon                       TYPE string,

      "! <p class="shorttext">Dynamic Tile Details</p>
      "! Dynamic tile details
      dynamic                    TYPE ty_dynamic_tile_details,

      "! <p class="shorttext">Tile Navigation Parameters</p>
      "! Tile navigation parameters
      tile_navigation_parameters TYPE ty_tile_navigation_parameters,

    END OF ty_standard_tile_details.

  TYPES:
    "! <p class="shorttext">CHIP Bag Property</p>
    "! Property of a CHIP bag
    BEGIN OF ty_chip_bag_property,

      "! <p class="shorttext">Bag ID</p>
      "! Bag ID
      "! $required
      bag_id       TYPE c LENGTH 100,

      "! <p class="shorttext">Name</p>
      "! Property name
      "! $required
      name         TYPE c LENGTH 100,

      "! <p class="shorttext">Value</p>
      "! Property value
      value        TYPE string,

      "! <p class="shorttext">Translatable</p>
      "! Property is translatable
      translatable TYPE abap_bool,

    END OF ty_chip_bag_property,

    ty_chip_bag_properties TYPE STANDARD TABLE OF ty_chip_bag_property WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Custom Tile Details</p>
    "! CHIP based Custom tile details
    BEGIN OF ty_custom_tile_details,

      "! <p class="shorttext">Base CHIP</p>
      "! Base CHIP
      base_chip_id   TYPE c LENGTH 255,

      "! <p class="shorttext">Configuration</p>
      "! Configuration string of the CHIP
      configuration  TYPE string,

      "! <p class="shorttext">Bag Properties</p>
      "! These Bags are available in the Javascript Frontend via the CHIP API "bag" Contract
      bag_properties TYPE ty_chip_bag_properties,

    END OF ty_custom_tile_details.

  TYPES:
    "! <p class="shorttext">Tile Details</p>
    "! Details of a tile
    BEGIN OF ty_tile,

      "! <p class="shorttext">ID</p>
      "! Tile ID
      "! $required
      id         TYPE c LENGTH 50,

      "! <p class="shorttext">Tile Type</p>
      "! Tile type
      "! $required
      tile_type  TYPE ty_tile_type,

      "! <p class="shorttext">Is Default Tile</p>
      "! Tile is chosen by default
      is_default TYPE abap_bool,

      "! <p class="shorttext">Is Legacy Tile</p>
      "! Tile is stored as legacy tile
      is_legacy  TYPE abap_bool,

      "! <p class="shorttext">Standard Details</p>
      "! Standard tile details
      standard   TYPE ty_standard_tile_details,

      "! <p class="shorttext">Custom Details</p>
      "! Custom tile details
      custom     TYPE ty_custom_tile_details,

    END OF ty_tile,

    ty_tiles TYPE STANDARD TABLE OF ty_tile WITH DEFAULT KEY.

  "! <p class="shorttext">Life Cycle Deprecation Status</p>
  "! Life cycle deprecation status
  "! $values {@link zif_aff_uiad_v1.data:co_life_cycle_status}
  "! $default {@link zif_aff_uiad_v1.data:co_life_cycle_status.active}
  TYPES ty_life_cycle_status TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Life Cycle Status</p>
    "! Life cycle deprecation status
    BEGIN OF co_life_cycle_status,

      "! <p class="shorttext">Active</p>
      "! LADI is active
      active     TYPE ty_life_cycle_status VALUE ' ',

      "! <p class="shorttext">Deprecated</p>
      "! LADI is deprecated and should no longer be used
      deprecated TYPE ty_life_cycle_status VALUE 'D',

      "! <p class="shorttext">Obsolete</p>
      "! LADI is obsolete and must no longer be used
      obsolete   TYPE ty_life_cycle_status VALUE 'O',

    END OF co_life_cycle_status.


  TYPES:
    "! <p class="shorttext">Life Cycle</p>
    "! Life cycle
    BEGIN OF ty_life_cycle,

      "! <p class="shorttext">Status</p>
      "! Life cycle status
      status    TYPE ty_life_cycle_status,

      "! <p class="shorttext">Successor</p>
      "! LADI of the successor application
      successor TYPE c LENGTH 32,

    END OF ty_life_cycle.

  TYPES:
    "! <p class="shorttext">LADI</p>
    "! Launchpad application descriptor item (LADI)
    BEGIN OF ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version           TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                   TYPE ty_header,

      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information      TYPE ty_general_information,

      "! <p class="shorttext">SAPUI5 Application Information</p>
      "! SAPUI5 application information
      ui5_app_details          TYPE ty_app_details_ui5,

      "! <p class="shorttext">Web Dynpro Application Information</p>
      "! Web Dynpro application information
      web_dynpro_app_details   TYPE ty_app_details_web_dynpro,

      "! <p class="shorttext">Web Client Application Information</p>
      "! Web Client application information
      web_client_app_details   TYPE ty_app_details_web_client,

      "! <p class="shorttext">URL Template Application Information</p>
      "! URL Template application information
      url_template_app_details TYPE ty_app_details_url_template,

      "! <p class="shorttext">Navigation Information</p>
      "! Navigation information
      "! $required
      navigation               TYPE ty_navigation,

      "! <p class="shorttext">Tiles</p>
      "! Tiles
      "! $required
      tiles                    TYPE ty_tiles,

      "! <p class="shorttext">Life Cycle</p>
      "! Life cycle
      life_cycle               TYPE ty_life_cycle,

    END OF ty_main.

ENDINTERFACE.
