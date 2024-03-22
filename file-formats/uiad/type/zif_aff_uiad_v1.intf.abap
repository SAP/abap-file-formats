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

  "! <p class="shorttext">App Type</p>
  "! LADI app type
  "! $values {@link zif_aff_uiad_v1.data:co_app_type}
  TYPES ty_app_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">App Type</p>
    "! LADI app type
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

      "! <p class="shorttext">UI5</p>
      "! SAPUI5 Fiori app
      ui5          TYPE ty_app_type VALUE 'U',

      "! <p class="shorttext">SAPUI5 Fiori App on SAP BTP (Deprecated)</p>
      "! SAPUI5 Fiori app on SAP BTP (Deprecated)
      legacy_ui5   TYPE ty_app_type VALUE 'S',

      "! <p class="shorttext">URL App</p>
      "! URL app
      url          TYPE ty_app_type VALUE 'R',

      "! <p class="shorttext">Tile Only</p>
      "! Tile only
      tile_only    TYPE ty_app_type VALUE 'O',

      "! <p class="shorttext">Url Template</p>
      "! Url Template
      url_template TYPE ty_app_type VALUE 'G',

    END OF co_app_type.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,

      "! <p class="shorttext">Information</p>
      "! LADI information text
      information       TYPE c LENGTH 255,

      "! <p class="shorttext">Catalog ID</p>
      "! Catalog ID
      catalog_id        TYPE c LENGTH 40,

      "! <p class="shorttext">Transaction</p>
      "! Transaction
      transaction       TYPE c LENGTH 20,

      "! <p class="shorttext">Fiori ID</p>
      "! Fiori ID
      fiori_id          TYPE c LENGTH 20,

      "! <p class="shorttext">Support Component</p>
      "! Support component
      support_component TYPE c LENGTH 24,

      "! <p class="shorttext">Suppress Tiles</p>
      "! Suppress tiles
      suppress_tiles    TYPE abap_bool,

      "! <p class="shorttext">App Type</p>
      "! LADI app type
      "! $required
      app_type          TYPE ty_app_type,

      "! <p class="shorttext">System Alias</p>
      "! System alias
      system_alias      TYPE c LENGTH 32,

    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">UI5 App Details</p>
    "! UI5 specific app details
    BEGIN OF ty_app_details_ui5,

      "! <p class="shorttext">App ID</p>
      "! SAP UI5 component ID
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
    "! <p class="shorttext">Integration Mode</p>
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
    "! <p class="shorttext">Web Dynpro App Details</p>
    "! Web Dynpro specific app details
    BEGIN OF ty_app_details_web_dynpro,

      "! <p class="shorttext">App ID</p>
      "! App ID
      "! $required
      app_id             TYPE c LENGTH 30,

      "! <p class="shorttext">Config ID</p>
      "! Config ID
      config_id          TYPE c LENGTH 32,

      "! <p class="shorttext">Flavor ID</p>
      "! Flavor ID
      flavor_id          TYPE c LENGTH 32,

      "! <p class="shorttext">Integration Mode</p>
      "! Integration mode
      integration_mode   TYPE ty_web_dynpro_integration_mode,

      "! <p class="shorttext">Compatibility Mode</p>
      "! Compatibility mode
      compatibility_mode TYPE abap_bool,

    END OF ty_app_details_web_dynpro.

  TYPES:
    "! <p class="shorttext">Web Client App Details</p>
    "! Web Client specific app details
    BEGIN OF ty_app_details_web_client,

      "! <p class="shorttext">Target ID</p>
      "! Target ID
      "! $required
      target_id TYPE c LENGTH 10,

    END OF ty_app_details_web_client.

  TYPES:
    "! <p class="shorttext">Url Template Parameter Details</p>
    "! Url Template parameter details
    BEGIN OF ty_url_template_parameter,

      "! <p class="shorttext">Name</p>
      "! Parameter name
      name  TYPE string,

      "! <p class="shorttext">Value</p>
      "! Parameter value
      value TYPE string,

    END OF ty_url_template_parameter,

    ty_url_template_parameters TYPE STANDARD TABLE OF ty_url_template_parameter WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Url Template App Details</p>
    "! Url Template specific app details
    BEGIN OF ty_app_details_url_template,

      "! <p class="shorttext">Template ID</p>
      "! Url Template ID
      "! $required
      template_id TYPE c LENGTH 32,

      "! <p class="shorttext">Url Template Parameters Details</p>
      "! Url Template parameters details
      parameters  TYPE ty_url_template_parameters,

    END OF ty_app_details_url_template.

  "! <p class="shorttext">Filter Value Type</p>
  "! Type of the filter value
  "! $values {@link zif_aff_uiad_v1.data:co_filter_value_type}
  "! $default {@link zif_aff_uiad_v1.data:co_filter_value_type.plain}
  TYPES ty_filter_value_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Filter Value Type</p>
    "! Type of the filter value
    BEGIN OF co_filter_value_type,

      "! <p class="shorttext">Plain</p>
      "! The filter value is used as is
      plain TYPE ty_filter_value_type VALUE ' ',

      "! <p class="shorttext">Regex</p>
      "! The filter value is used as a regex
      regex TYPE ty_filter_value_type VALUE 'R',

    END OF co_filter_value_type.

  TYPES:
    "! <p class="shorttext">Signature Item Details</p>
    "! Signature item details
    BEGIN OF ty_signature_item,

      "! <p class="shorttext">Parameter Name</p>
      "! Parameter name
      parameter_name      TYPE string,

      "! <p class="shorttext">Rename Parameter To</p>
      "! Rename parameter to
      rename_parameter_to TYPE string,

      "! <p class="shorttext">Default Value</p>
      "! Default value
      default_value       TYPE string,

      "! <p class="shorttext">Filter Value</p>
      "! Filter value
      filter_value        TYPE string,

      "! <p class="shorttext">Filter Value Type</p>
      "! Filter value type
      filter_value_type   TYPE ty_filter_value_type,

      "! <p class="shorttext">Required</p>
      "! Whether the parameter is required
      required            TYPE abap_bool,

    END OF ty_signature_item,

    ty_signature_items TYPE STANDARD TABLE OF ty_signature_item WITH DEFAULT KEY.

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
      "! Additional parameters are allowed.
      allowed     TYPE ty_additional_param_handling VALUE 'A',

      "! <p class="shorttext">Ignored</p>
      "! Additional parameters are ignored.
      ignored     TYPE ty_additional_param_handling VALUE 'I',

      "! <p class="shorttext">Not Allowed</p>
      "! Additional parameters are not allowed.
      not_allowed TYPE ty_additional_param_handling VALUE 'N',

    END OF co_additional_param_handling.

  TYPES:
    "! <p class="shorttext">Navigation Details</p>
    "! Navigation details
    BEGIN OF ty_navigation,

      "! <p class="shorttext">Target Mapping ID</p>
      "! Target mapping ID
      target_mapping_id             TYPE c LENGTH 50,

      "! <p class="shorttext">Target Url</p>
      "! Target url used for 'Tile only' and 'Url app' apps
      target_url                    TYPE string,

      "! <p class="shorttext">Desktop</p>
      "! Desktop is supported as device type
      "! $required
      desktop                       TYPE abap_bool,

      "! <p class="shorttext">Tablet</p>
      "! Tablet is supported as device type
      "! $required
      tablet                        TYPE abap_bool,

      "! <p class="shorttext">Phone</p>
      "! Phone is supported as device type
      "! $required
      phone                         TYPE abap_bool,

      "! <p class="shorttext">Semantic Object</p>
      "! Semantic object of the target mapping
      semantic_object               TYPE c LENGTH 30,

      "! <p class="shorttext">Action</p>
      "! Action of the target mapping
      action                        TYPE c LENGTH 60,

      "! <p class="shorttext">Signature Items</p>
      "! Signature describing the parameters of the target mapping
      signature                     TYPE ty_signature_items,

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
      "! Static Tile
      static  TYPE ty_tile_type VALUE 'S',

      "! <p class="shorttext">Dynamic</p>
      "! Dynamic Tile
      dynamic TYPE ty_tile_type VALUE 'D',

      "! <p class="shorttext">Custom</p>
      "! Custom Tile
      custom  TYPE ty_tile_type VALUE 'C',

    END OF co_tile_type.

  TYPES:
    "! <p class="shorttext">Dynamic Tile Details</p>
    "! Dynamic tile specific details
    BEGIN OF ty_dynamic_tile_details,

      "! <p class="shorttext">Service Base Url</p>
      "! Service base url
      service_base_url TYPE string,

      "! <p class="shorttext">Service Path</p>
      "! Service path
      service_path     TYPE string,

      "! <p class="shorttext">Refresh Interval</p>
      "! Timeout until the tile is refreshed
      refresh_interval TYPE i,

      "! <p class="shorttext">Number Unit</p>
      "! Number unit
      number_unit      TYPE string,

    END OF ty_dynamic_tile_details.

  TYPES:
    "! <p class="shorttext">Tile Parameter</p>
    "! Tile parameter
    BEGIN OF ty_tile_navigation_parameter,

      "! <p class="shorttext">Name</p>
      "! Parameter name
      name  TYPE string,

      "! <p class="shorttext">Value</p>
      "! Parameter value
      value TYPE string,

    END OF ty_tile_navigation_parameter,

    ty_tile_navigation_parameters TYPE STANDARD TABLE OF ty_tile_navigation_parameter WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Standard Tile Details</p>
    "! Standard tile specific details
    BEGIN OF ty_standard_tile_details,

      "! <p class="shorttext">Reuse Text From App</p>
      "! Reuse text defined as part of the app
      reuse_text_from_app        TYPE abap_bool,

      "! <p class="shorttext">Title</p>
      "! Tile title
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
      "! Dynamic tile specific details
      dynamic                    TYPE ty_dynamic_tile_details,

      "! <p class="shorttext">Tile Navigation Parameters</p>
      "! Tile navigation parameters of the tile intent
      tile_navigation_parameters TYPE ty_tile_navigation_parameters,

    END OF ty_standard_tile_details.

  TYPES:
    "! <p class="shorttext">CHIP Bag Property</p>
    "! Property of a CHIP bag
    BEGIN OF ty_chip_bag_property,

      "! <p class="shorttext">Name</p>
      "! Property name
      name         TYPE c LENGTH 100,

      "! <p class="shorttext">Value</p>
      "! Property value
      value        TYPE string,

      "! <p class="shorttext">Translatable</p>
      "! Whether the property is translatable
      translatable TYPE abap_bool,

    END OF ty_chip_bag_property,

    ty_chip_bag_properties TYPE STANDARD TABLE OF ty_chip_bag_property WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Bag</p>
    "! CHIP bag
    BEGIN OF ty_chip_bag,

      "! <p class="shorttext">ID</p>
      "! Bag ID
      id         TYPE c LENGTH 100,

      "! <p class="shorttext">Properties</p>
      "! CHIP bag properties
      properties TYPE ty_chip_bag_properties,

    END OF ty_chip_bag,

    ty_chip_bags TYPE STANDARD TABLE OF ty_chip_bag WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Custom Tile Details</p>
    "! Custom tile specific details
    BEGIN OF ty_custom_tile_details,

      "! <p class="shorttext">Base CHIP ID</p>
      "! Base CHIP ID
      base_chip_id  TYPE c LENGTH 255,

      "! <p class="shorttext">Configuration</p>
      "! Configuration string of the CHIP
      configuration TYPE string,

      "! <p class="shorttext">Bags</p>
      "! CHIP bags
      bags          TYPE ty_chip_bags,

    END OF ty_custom_tile_details.

  TYPES:
    "! <p class="shorttext">Tile Details</p>
    "! Details of a tile
    BEGIN OF ty_tile,

      "! <p class="shorttext">ID</p>
      "! Tile ID
      "! $required
      id         TYPE c LENGTH 50,

      "! <p class="shorttext">Is Default Tile</p>
      "! Whether the tile is chosen by default
      is_default TYPE abap_bool,

      "! <p class="shorttext">Is Legacy Tile</p>
      "! Whether the tile is stored as legacy tile
      is_legacy  TYPE abap_bool,

      "! <p class="shorttext">Tile Type</p>
      "! Tile type
      "! $required
      tile_type  TYPE ty_tile_type,

      "! <p class="shorttext">Standard Details</p>
      "! Standard tile specific details
      standard   TYPE ty_standard_tile_details,

      "! <p class="shorttext">Custom Details</p>
      "! Custom tile specific details
      custom     TYPE ty_custom_tile_details,

    END OF ty_tile,

    ty_tiles TYPE STANDARD TABLE OF ty_tile WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Lifecycle</p>
    "! Lifecycle state of the app
    BEGIN OF ty_lifecycle,

      "! <p class="shorttext">Deprecated</p>
      "! Whether the app is deprecated
      deprecated TYPE abap_bool,

      "! <p class="shorttext">Successor</p>
      "! LADI ID of the successor app
      successor  TYPE c LENGTH 32,

    END OF ty_lifecycle.

  TYPES:
    "! <p class="shorttext">LADI</p>
    "! Launchpad app descriptor item
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

      "! <p class="shorttext">UI5 App Details</p>
      "! UI5 specific app details
      ui5_app_details          TYPE ty_app_details_ui5,

      "! <p class="shorttext">Web Dynpro App Details</p>
      "! Web Dynpro specific app details
      web_dynpro_app_details   TYPE ty_app_details_web_dynpro,

      "! <p class="shorttext">Web Client App Details</p>
      "! Web Client specific app details
      web_client_app_details   TYPE ty_app_details_web_client,

      "! <p class="shorttext">Url Template App Details</p>
      "! Url Template specific app details
      url_template_app_details TYPE ty_app_details_url_template,

      "! <p class="shorttext">Navigation Details</p>
      "! Navigation details
      "! $required
      navigation               TYPE ty_navigation,

      "! <p class="shorttext">Tiles</p>
      "! Tiles related to the LADI
      "! $required
      tiles                    TYPE ty_tiles,

      "! <p class="shorttext">Lifecycle</p>
      "! Lifecycle state of the app
      lifecycle                TYPE ty_lifecycle,

    END OF ty_main.

ENDINTERFACE.
