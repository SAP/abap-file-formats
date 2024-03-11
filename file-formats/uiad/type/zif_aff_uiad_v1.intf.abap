interface zif_aff_uiad_v1
  public.

  types:
    "! <p class="shorttext">Header</p>
    "! The header for an ABAP main object (without source code) with a description of 255 characters
    begin of ty_header,
      "! <p class="shorttext">Description</p>
      "! Description of the ABAP object
      "! $required
      description           type c length 255,

      "! $required
      original_language     type zif_aff_types_v1=>ty_original_language,

      abap_language_version type zif_aff_types_v1=>ty_abap_language_version,
    end of ty_header.

  "! <p class="shorttext">App Type</p>
  "! LADI app type
  "! $values {@link zif_aff_uiad_v1.data:co_app_type}
  types ty_app_type type c length 1.

  constants:
    "! <p class="shorttext">App Type</p>
    "! LADI app type
    begin of co_app_type,

      "! <p class="shorttext">Transaction</p>
      "! Transaction
      transaction  type ty_app_type value 'T',

      "! <p class="shorttext">Web Dynpro Application</p>
      "! Web Dynpro application
      web_dynpro   type ty_app_type value 'W',

      "! <p class="shorttext">Web Client UI Application</p>
      "! Web Client UI application
      web_client   type ty_app_type value 'C',

      "! <p class="shorttext">UI5</p>
      "! SAPUI5 Fiori app
      ui5          type ty_app_type value 'U',

      "! <p class="shorttext">SAPUI5 Fiori App on SAP BTP</p>
      "! SAPUI5 Fiori app on SAP BTP (Deprecated)
      legacy_ui5   type ty_app_type value 'S',

      "! <p class="shorttext">URL App</p>
      "! URL app
      url          type ty_app_type value 'R',

      "! <p class="shorttext">Tile Only</p>
      "! Tile only
      tile         type ty_app_type value 'O',

      "! <p class="shorttext">Url Template</p>
      "! Url Template
      url_template type ty_app_type value 'G',

    end of co_app_type.

  types:
    "! <p class="shorttext">General Information</p>
    "! General information
    begin of ty_general_information,

      "! <p class="shorttext">Information</p>
      "! LADI information text
      information       type c length 255,

      "! <p class="shorttext">Catalog ID</p>
      "! Catalog ID
      catalog_id        type c length 40,

      "! <p class="shorttext">Transaction</p>
      "! Transaction
      transaction       type c length 20,

      "! <p class="shorttext">Fiori ID</p>
      "! Fiori ID
      fiori_id          type c length 20,

      "! <p class="shorttext">Support Component</p>
      "! Support component
      support_component type c length 24,

      "! <p class="shorttext">Suppress Tiles</p>
      "! Suppress tiles
      suppress_tiles    type abap_bool,

      "! <p class="shorttext">App Type</p>
      "! LADI app type
      "! $required
      app_type          type ty_app_type,

      "! <p class="shorttext">System Alias</p>
      "! System alias
      system_alias      type c length 32,

    end of ty_general_information.

  types:
    "! <p class="shorttext">UI5 App Details</p>
    "! UI5 specific app details
    begin of ty_app_details_ui5,

      "! <p class="shorttext">App ID</p>
      "! SAP UI5 component ID
      "! $required
      app_id   type c length 70,

      "! <p class="shorttext">ICF Path</p>
      "! ICF path
      icf_path type string,

    end of ty_app_details_ui5.

  "! Web Dynpro integration mode
  "! $values {@link zif_aff_uiad_v1.data:co_web_dynpro_integration_mode}
  "! $default {@link zif_aff_uiad_v1.data:co_web_dynpro_integration_mode.system_default}
  types ty_web_dynpro_integration_mode type c length 1.

  constants:
    "! <p class="shorttext">Integration Mode</p>
    "! Web Dynpro integration mode
    begin of co_web_dynpro_integration_mode,

      "! <p class="shorttext">System Default</p>
      "! System default
      system_default type ty_web_dynpro_integration_mode value ' ',

      "! <p class="shorttext">Direct</p>
      "! Direct
      direct         type ty_web_dynpro_integration_mode value 'D',

      "! <p class="shorttext">Compatible</p>
      "! Compatible
      compatible     type ty_web_dynpro_integration_mode value 'C',

    end of co_web_dynpro_integration_mode.

  types:
    "! <p class="shorttext">Web Dynpro App Details</p>
    "! Web Dynpro specific app details
    begin of ty_app_details_web_dynpro,

      "! <p class="shorttext">App ID</p>
      "! App ID
      "! $required
      app_id             type c length 30,

      "! <p class="shorttext">Config ID</p>
      "! Config ID
      config_id          type c length 32,

      "! <p class="shorttext">Flavor ID</p>
      "! Flavor ID
      flavor_id          type c length 32,

      "! <p class="shorttext">Integration Mode</p>
      "! Integration mode
      integration_mode   type ty_web_dynpro_integration_mode,

      "! <p class="shorttext">Compatibility Mode</p>
      "! Compatibility mode
      compatibility_mode type abap_bool,

    end of ty_app_details_web_dynpro.

  types:
    "! <p class="shorttext">Web Client App Details</p>
    "! Web Client specific app details
    begin of ty_app_details_web_client,

      "! <p class="shorttext">Target ID</p>
      "! Target ID
      "! $required
      target_id type c length 10,

    end of ty_app_details_web_client.

  types:
    "! <p class="shorttext">Url Template Parameter</p>
    "! Url Template parameter
    begin of ty_url_template_parameter,

      "! <p class="shorttext">Name</p>
      "! Parameter name
      name  type string,

      "! <p class="shorttext">Value</p>
      "! Parameter value
      value type string,

    end of ty_url_template_parameter,

    ty_url_template_parameters type standard table of ty_url_template_parameter with default key.

  types:
    "! <p class="shorttext">Url Template App Details</p>
    "! Url Template specific app details
    begin of ty_app_details_url_template,

      "! <p class="shorttext">Template ID</p>
      "! Url Template ID
      "! $required
      template_id type c length 32,

      "! <p class="shorttext">Parameters</p>
      "! Url Template parameters
      parameters  type ty_url_template_parameters,

    end of ty_app_details_url_template.

  "! <p class="shorttext">Filter Value Type</p>
  "! Type of the filter value
  "! $values {@link zif_aff_uiad_v1.data:co_filter_value_type}
  "! $default {@link zif_aff_uiad_v1.data:co_filter_value_type.plain}
  types ty_filter_value_type type c length 1.

  constants:
    "! <p class="shorttext">Filter Value Type</p>
    "! Type of the filter value
    begin of co_filter_value_type,

      "! <p class="shorttext">Plain</p>
      "! The filter value is used as is
      plain type ty_filter_value_type value ' ',

      "! <p class="shorttext">Regex</p>
      "! The filter value is used as a regex
      regex type ty_filter_value_type value 'R',

    end of co_filter_value_type.

  types:
    "! <p class="shorttext">Signature Item</p>
    "! Signature item
    begin of ty_signature_item,

      "! <p class="shorttext">Parameter Name</p>
      "! Parameter name
      parameter_name      type string,

      "! <p class="shorttext">Rename Parameter To</p>
      "! Rename parameter to
      rename_parameter_to type string,

      "! <p class="shorttext">Default Value</p>
      "! Default value
      default_value       type string,

      "! <p class="shorttext">Filter Value</p>
      "! Filter value
      filter_value        type string,

      "! <p class="shorttext">Filter Value Type</p>
      "! Filter value type
      filter_value_type   type ty_filter_value_type,

      "! <p class="shorttext">Required</p>
      "! Whether the parameter is required
      required            type abap_bool,

    end of ty_signature_item,

    ty_signature_items type standard table of ty_signature_item with default key.

  "! <p class="shorttext">Additional Param Handling</p>
  "! How additional parameters are handled
  "! $values {@link zif_aff_uiad_v1.data:co_additional_param_handling}
  "! $default {@link zif_aff_uiad_v1.data:co_additional_param_handling.allowed}
  types ty_additional_param_handling type c length 1.

  constants:
    "! <p class="shorttext">Additional Param Handling</p>
    "! How additional parameters are handled
    begin of co_additional_param_handling,

      "! <p class="shorttext">Allowed</p>
      "! Additional parameters are allowed.
      allowed     type ty_additional_param_handling value 'A',

      "! <p class="shorttext">Ignored</p>
      "! Additional parameters are ignored.
      ignored     type ty_additional_param_handling value 'I',

      "! <p class="shorttext">Not Allowed</p>
      "! Additional parameters are not allowed.
      not_allowed type ty_additional_param_handling value 'N',

    end of co_additional_param_handling.

  types:
    "! <p class="shorttext">Navigation Details</p>
    "! Navigation details
    begin of ty_navigation,

      "! <p class="shorttext">Target Mapping ID</p>
      "! Target mapping ID
      target_mapping_id             type c length 50,

      "! <p class="shorttext">Target Url</p>
      "! Target url used for 'Tile only' and 'Url app' apps
      target_url                    type string,

      "! <p class="shorttext">Desktop</p>
      "! Desktop is supported as device type
      "! $required
      desktop                       type abap_bool,

      "! <p class="shorttext">Tablet</p>
      "! Tablet is supported as device type
      "! $required
      tablet                        type abap_bool,

      "! <p class="shorttext">Phone</p>
      "! Phone is supported as device type
      "! $required
      phone                         type abap_bool,

      "! <p class="shorttext">Semantic Object</p>
      "! Semantic object of the target mapping
      semantic_object               type c length 30,

      "! <p class="shorttext">Action</p>
      "! Action of the target mapping
      action                        type c length 60,

      "! <p class="shorttext">Signature Items</p>
      "! Signature describing the parameters of the target mapping
      signature                     type ty_signature_items,

      "! <p class="shorttext">Additional Param Handling</p>
      "! How additional parameters are handled
      additional_parameter_handling type ty_additional_param_handling,

    end of ty_navigation.

  "! <p class="shorttext">Tile Type</p>
  "! Tile type
  "! $values {@link zif_aff_uiad_v1.data:co_tile_type}
  "! $default {@link zif_aff_uiad_v1.data:co_tile_type.static}
  types ty_tile_type type c length 1.

  constants:
    "! <p class="shorttext">Tile Type</p>
    "! Tile type
    begin of co_tile_type,

      "! <p class="shorttext">Static</p>
      "! Static Tile
      static  type ty_tile_type value 'S',

      "! <p class="shorttext">Dynamic</p>
      "! Dynamic Tile
      dynamic type ty_tile_type value 'D',

      "! <p class="shorttext">Custom</p>
      "! Custom Tile
      custom  type ty_tile_type value 'C',

    end of co_tile_type.

  types:
    "! <p class="shorttext">Dynamic Tile Details</p>
    "! Dynamic tile specific details
    begin of ty_dynamic_tile_details,

      "! <p class="shorttext">Service Base Url</p>
      "! Service base url
      service_base_url type string,

      "! <p class="shorttext">Service Path</p>
      "! Service path
      service_path     type string,

      "! <p class="shorttext">Refresh Interval</p>
      "! Timeout until the tile is refreshed
      refresh_interval type i,

      "! <p class="shorttext">Number Unit</p>
      "! Number unit
      number_unit      type string,

    end of ty_dynamic_tile_details.

  types:
    "! <p class="shorttext">Tile Parameter</p>
    "! Tile parameter
    begin of ty_tile_navigation_parameter,

      "! <p class="shorttext">Name</p>
      "! Parameter name
      name  type string,

      "! <p class="shorttext">Value</p>
      "! Parameter value
      value type string,

    end of ty_tile_navigation_parameter,

    ty_tile_navigation_parameters type standard table of ty_tile_navigation_parameter with default key.

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

  types:
    "! <p class="shorttext">CHIP Bag Property</p>
    "! Property of a CHIP bag
    begin of ty_chip_bag_property,

      "! <p class="shorttext">Name</p>
      "! Property name
      name         type c length 100,

      "! <p class="shorttext">Value</p>
      "! Property value
      value        type string,

      "! <p class="shorttext">Translatable</p>
      "! Whether the property is translatable
      translatable type abap_bool,

    end of ty_chip_bag_property,

    ty_chip_bag_properties type standard table of ty_chip_bag_property with default key.

  types:
    "! <p class="shorttext">Bag</p>
    "! CHIP bag
    begin of ty_chip_bag,

      "! <p class="shorttext">ID</p>
      "! Bag ID
      id         type c length 100,

      "! <p class="shorttext">Properties</p>
      "! CHIP bag properties
      properties type ty_chip_bag_properties,

    end of ty_chip_bag,

    ty_chip_bags type standard table of ty_chip_bag with default key.

  types:
    "! <p class="shorttext">Custom Tile Details</p>
    "! Custom tile specific details
    begin of ty_custom_tile_details,

      "! <p class="shorttext">Base CHIP ID</p>
      "! Base CHIP ID
      base_chip_id  type c length 255,

      "! <p class="shorttext">Configuration</p>
      "! Configuration string of the CHIP
      configuration type string,

      "! <p class="shorttext">Bags</p>
      "! CHIP bags
      bags          type ty_chip_bags,

    end of ty_custom_tile_details.

  types:
    "! <p class="shorttext">Tile</p>
    "! Details of a tile
    begin of ty_tile,

      "! <p class="shorttext">ID</p>
      "! Tile ID
      "! $required
      id        type c length 50,

      "! <p class="shorttext">default</p>
      "! Whether the tile is chosen by default
      "! $required
      default   type abap_bool,

      "! <p class="shorttext">legacy</p>
      "! Whether the tile is stored as legacy tile
      "! $required
      legacy    type abap_bool,

      "! <p class="shorttext">Tile Type</p>
      "! Tile type
      "! $required
      tile_type type ty_tile_type,

      "! <p class="shorttext">Standard Tile Details</p>
      "! Standard tile specific details
      standard  type ty_standard_tile_details,

      "! <p class="shorttext">Custom Tile Details</p>
      "! Custom tile specific details
      custom    type ty_custom_tile_details,

    end of ty_tile,

    ty_tiles type standard table of ty_tile with default key.

  types:
    "! <p class="shorttext">Lifecycle</p>
    "! Lifecycle state of the app
    begin of ty_lifecycle,

      "! <p class="shorttext">Deprecated</p>
      "! Whether the app is deprecated
      deprecated type abap_bool,

      "! <p class="shorttext">Successor</p>
      "! LADI ID of the successor app
      successor  type c length 32,

    end of ty_lifecycle.

  types:
    "! <p class="shorttext">LADI</p>
    "! Launchpad app descriptor item
    begin of ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version           type zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                   type ty_header,

      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information      type ty_general_information,

      "! <p class="shorttext">UI5 App Details</p>
      "! UI5 specific app details
      app_details_ui5          type ty_app_details_ui5,

      "! <p class="shorttext">Web Dynpro App Details</p>
      "! Web Dynpro specific app details
      app_details_web_dynpro   type ty_app_details_web_dynpro,

      "! <p class="shorttext">Web Client App Details</p>
      "! Web Client specific app details
      app_details_web_client   type ty_app_details_web_client,

      "! <p class="shorttext">Url Template App Details</p>
      "! Url Template specific app details
      app_details_url_template type ty_app_details_url_template,

      "! <p class="shorttext">Navigation Details</p>
      "! Navigation details
      "! $required
      navigation               type ty_navigation,

      "! <p class="shorttext">Tiles</p>
      "! Tiles related to the LADI
      "! $required
      tiles                    type ty_tiles,

      "! <p class="shorttext">Lifecycle</p>
      "! Lifecycle state of the app
      lifecycle                type ty_lifecycle,

    end of ty_main.

endinterface.
