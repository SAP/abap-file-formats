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

  "! <p class="shorttext">Application Type</p>
  "! LADI application type
  "! $values {@link zif_aff_uiad_v1.data:co_app_type}
  "! $default {@link zif_aff_uiad_v1.data:co_app_type.ui5}
  types ty_app_type type c length 1.

  constants:
    "! <p class="shorttext">Application Type</p>
    "! LADI application type
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

      "! <p class="shorttext">SAPUI5 Fiori Application</p>
      "! SAPUI5 Fiori application
      ui5          type ty_app_type value 'U',

      "! <p class="shorttext">SAPUI5 Fiori Application on SAP BTP (Deprecated)</p>
      "! SAPUI5 Fiori application on SAP BTP (deprecated)
      legacy_ui5   type ty_app_type value 'S',

      "! <p class="shorttext">URL Application</p>
      "! URL application
      url          type ty_app_type value 'R',

      "! <p class="shorttext">Tile Only</p>
      "! Tile only
      tile_only    type ty_app_type value 'O',

      "! <p class="shorttext">URL Template</p>
      "! URL template
      url_template type ty_app_type value 'G',

    end of co_app_type.

  types:
    "! <p class="shorttext">General Information</p>
    "! General information
    begin of ty_general_information,

      "! <p class="shorttext">Application Type</p>
      "! Application type
      "! $required
      app_type          type ty_app_type,

      "! <p class="shorttext">Technical Catalog</p>
      "! Technical catalog
      "! $required
      catalog_id        type c length 40,

      "! <p class="shorttext">SAP Fiori ID</p>
      "! SAP Fiori ID
      fiori_id          type c length 20,

      "! <p class="shorttext">Transaction Code</p>
      "! Transaction code
      transaction       type c length 20,

      "! <p class="shorttext">Target Mapping Information</p>
      "! Target mapping information
      information       type c length 255,

      "! <p class="shorttext">Application Component (ACH)</p>
      "! Application component (ACH)
      support_component type c length 24,

      "! <p class="shorttext">Suppress Tiles</p>
      "! Suppress tiles
      suppress_tiles    type abap_bool,

    end of ty_general_information.

  types:
    "! <p class="shorttext">SAPUI5 Fiori Application Information</p>
    "! SAPUI5 Fiori application information
    begin of ty_app_details_ui5,

      "! <p class="shorttext">SAPUI5 Component ID</p>
      "! SAPUI5 Component ID
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
    "! <p class="shorttext">Web Dynpro Integration Mode</p>
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
    "! <p class="shorttext">Web Dynpro Application Inforation</p>
    "! Web Dynpro application information
    begin of ty_app_details_web_dynpro,

      "! <p class="shorttext">Web Dynpro Application</p>
      "! Web Dynpro application
      "! $required
      app_id             type c length 30,

      "! <p class="shorttext">Application Configuration</p>
      "! Application configuration
      config_id          type c length 32,

      "! <p class="shorttext">Flavor ID</p>
      "! Flavor ID (deprecated)
      flavor_id          type c length 32,

      "! <p class="shorttext">Integration Mode</p>
      "! Integration mode (deprecated)
      integration_mode   type ty_web_dynpro_integration_mode,

      "! <p class="shorttext">Compatibility Mode</p>
      "! Compatibility mode (deprecated)
      compatibility_mode type abap_bool,

    end of ty_app_details_web_dynpro.

  types:
    "! <p class="shorttext">Web Client Application Information</p>
    "! Web Client application information
    begin of ty_app_details_web_client,

      "! <p class="shorttext">Target ID</p>
      "! Target ID
      "! $required
      target_id type c length 10,

    end of ty_app_details_web_client.

  types:
    "! <p class="shorttext">URL Template Parameter</p>
    "! URL template parameter
    begin of ty_url_template_parameter,

      "! <p class="shorttext">Name</p>
      "! Parameter name
      "! $required
      name  type string,

      "! <p class="shorttext">Value</p>
      "! Parameter value
      value type string,

    end of ty_url_template_parameter,

    ty_url_template_parameters type standard table of ty_url_template_parameter with default key.

  types:
    "! <p class="shorttext">URL Template Application Information</p>
    "! URL template application information
    begin of ty_app_details_url_template,

      "! <p class="shorttext">URL Template</p>
      "! URL template
      "! $required
      template_id type c length 32,

      "! <p class="shorttext">URL Template Parameters</p>
      "! URL template parameters
      parameters  type ty_url_template_parameters,

    end of ty_app_details_url_template.

  "! <p class="shorttext">Filter Type</p>
  "! Type of the filter value
  "! $values {@link zif_aff_uiad_v1.data:co_filter_type}
  "! $default {@link zif_aff_uiad_v1.data:co_filter_type.plain}
  types ty_filter_type type c length 1.

  constants:
    "! <p class="shorttext">Filter Type</p>
    "! Type of the filter value
    begin of co_filter_type,

      "! <p class="shorttext">Plain</p>
      "! The filter value is used as is
      plain type ty_filter_type value ' ',

      "! <p class="shorttext">Regex</p>
      "! The filter value is used as a regular expression
      regex type ty_filter_type value 'R',

    end of co_filter_type.

  types:
    "! <p class="shorttext">Navigation Parameter</p>
    "! Navigation parameter
    begin of ty_parameter_item,

      "! <p class="shorttext">Parameter Name</p>
      "! Parameter name
      "! $required
      name          type string,

      "! <p class="shorttext">Parameter in Target Application</p>
      "! Parameter in target application
      rename_to     type string,

      "! <p class="shorttext">Default Value</p>
      "! Default value
      default_value type string,

      "! <p class="shorttext">Filter Value</p>
      "! Filter value
      filter_value  type string,

      "! <p class="shorttext">Filter Type</p>
      "! Filter type
      filter_type   type ty_filter_type,

      "! <p class="shorttext">Required</p>
      "! Whether the parameter is required
      required      type abap_bool,

    end of ty_parameter_item,

    ty_parameter_items type standard table of ty_parameter_item with default key.

  "! <p class="shorttext">Additional Parameter Handling</p>
  "! How additional parameters are handled
  "! $values {@link zif_aff_uiad_v1.data:co_additional_param_handling}
  "! $default {@link zif_aff_uiad_v1.data:co_additional_param_handling.allowed}
  types ty_additional_param_handling type c length 1.

  constants:
    "! <p class="shorttext">Additional Parameter Handling</p>
    "! How additional parameters are handled
    begin of co_additional_param_handling,

      "! <p class="shorttext">Allowed</p>
      "! Additional parameters are allowed
      allowed     type ty_additional_param_handling value 'A',

      "! <p class="shorttext">Ignored</p>
      "! Additional parameters are ignored
      ignored     type ty_additional_param_handling value 'I',

      "! <p class="shorttext">Not Allowed</p>
      "! Additional parameters are not allowed
      not_allowed type ty_additional_param_handling value 'N',

    end of co_additional_param_handling.

  types:
    "! <p class="shorttext">Navigation Information</p>
    "! Navigation information
    begin of ty_navigation,

      "! <p class="shorttext">Target Mapping ID</p>
      "! Target mapping ID
      "! $required
      target_mapping_id             type c length 50,

      "! <p class="shorttext">Semantic Object</p>
      "! Semantic object of the target mapping
      "! $required
      semantic_object               type c length 30,

      "! <p class="shorttext">Action</p>
      "! Action of the target mapping
      "! $required
      action                        type c length 60,

      "! <p class="shorttext">Target URL</p>
      "! Target URL used for apps of type 'Tile Only' and 'URL Application'
      target_url                    type string,

      "! <p class="shorttext">System Alias</p>
      "! System alias
      system_alias                  type c length 32,

      "! <p class="shorttext">Desktop</p>
      "! Desktop is supported as device type
      desktop                       type abap_bool,

      "! <p class="shorttext">Tablet</p>
      "! Tablet is supported as device type
      tablet                        type abap_bool,

      "! <p class="shorttext">Phone</p>
      "! Phone is supported as device type
      phone                         type abap_bool,

      "! <p class="shorttext">Navigation Parameters</p>
      "! Navigation parameters of the target mapping
      parameters                    type ty_parameter_items,

      "! <p class="shorttext">Additional Parameter Handling</p>
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
      "! Static tile
      static  type ty_tile_type value 'S',

      "! <p class="shorttext">Dynamic</p>
      "! Dynamic tile
      dynamic type ty_tile_type value 'D',

      "! <p class="shorttext">Custom</p>
      "! Custom tile
      custom  type ty_tile_type value 'C',

    end of co_tile_type.

  types:
    "! <p class="shorttext">Dynamic Tile Details</p>
    "! Dynamic tile details
    begin of ty_dynamic_tile_details,

      "! <p class="shorttext">Service URL</p>
      "! Service URL
      service_base_url type string,

      "! <p class="shorttext">Service Path</p>
      "! Service path
      service_path     type string,

      "! <p class="shorttext">Refresh Interval</p>
      "! Duration until the tile is refreshed
      refresh_interval type i,

      "! <p class="shorttext">Number Unit</p>
      "! Number unit
      number_unit      type string,

    end of ty_dynamic_tile_details.

  types:
    "! <p class="shorttext">Tile Navigation Parameter</p>
    "! Tile navigation parameter
    begin of ty_tile_navigation_parameter,

      "! <p class="shorttext">Name</p>
      "! Parameter name
      "! $required
      name  type string,

      "! <p class="shorttext">Value</p>
      "! Parameter value
      value type string,

    end of ty_tile_navigation_parameter,

    ty_tile_navigation_parameters type standard table of ty_tile_navigation_parameter with default key.

  types:
    "! <p class="shorttext">Standard Tile Details</p>
    "! Standard tile details
    begin of ty_standard_tile_details,

      "! <p class="shorttext">Reuse Text From Application</p>
      "! Reuse text defined as part of the app
      reuse_text_from_app        type abap_bool,

      "! <p class="shorttext">Title</p>
      "! Tile title
      "! $required
      title                      type c length 255,

      "! <p class="shorttext">Subtitle</p>
      "! Tile subtitle
      subtitle                   type c length 255,

      "! <p class="shorttext">Information</p>
      "! Tile information
      information                type c length 255,

      "! <p class="shorttext">Keywords</p>
      "! Tile keywords
      keywords                   type c length 255,

      "! <p class="shorttext">Icon</p>
      "! Tile icon
      icon                       type string,

      "! <p class="shorttext">Dynamic Tile Details</p>
      "! Dynamic tile details
      dynamic                    type ty_dynamic_tile_details,

      "! <p class="shorttext">Tile Navigation Parameters</p>
      "! Tile navigation parameters
      tile_navigation_parameters type ty_tile_navigation_parameters,

    end of ty_standard_tile_details.

  types:
    "! <p class="shorttext">CHIP Bag Property</p>
    "! Property of a CHIP bag
    begin of ty_chip_bag_property,

      "! <p class="shorttext">Bag ID</p>
      "! Bag ID
      "! $required
      bag_id       type c length 100,

      "! <p class="shorttext">Name</p>
      "! Property name
      "! $required
      name         type c length 100,

      "! <p class="shorttext">Value</p>
      "! Property value
      value        type string,

      "! <p class="shorttext">Translatable</p>
      "! Property is translatable
      translatable type abap_bool,

    end of ty_chip_bag_property,

    ty_chip_bag_properties type standard table of ty_chip_bag_property with default key.

  types:
    "! <p class="shorttext">Custom Tile Details</p>
    "! CHIP based Custom tile details
    begin of ty_custom_tile_details,

      "! <p class="shorttext">Base CHIP</p>
      "! Base CHIP
      base_chip_id   type c length 255,

      "! <p class="shorttext">Configuration</p>
      "! Configuration string of the CHIP
      configuration  type string,

      "! <p class="shorttext">Bag Properties</p>
      "! These Bags are available in the Javascript Frontend via the CHIP API "bag" Contract
      bag_properties type ty_chip_bag_properties,

    end of ty_custom_tile_details.

  types:
    "! <p class="shorttext">Tile Details</p>
    "! Details of a tile
    begin of ty_tile,

      "! <p class="shorttext">ID</p>
      "! Tile ID
      "! $required
      id         type c length 50,

      "! <p class="shorttext">Tile Type</p>
      "! Tile type
      "! $required
      tile_type  type ty_tile_type,

      "! <p class="shorttext">Is Default Tile</p>
      "! Tile is chosen by default
      is_default type abap_bool,

      "! <p class="shorttext">Is Legacy Tile</p>
      "! Tile is stored as legacy tile
      is_legacy  type abap_bool,

      "! <p class="shorttext">Standard Details</p>
      "! Standard tile details
      standard   type ty_standard_tile_details,

      "! <p class="shorttext">Custom Details</p>
      "! Custom tile details
      custom     type ty_custom_tile_details,

    end of ty_tile,

    ty_tiles type standard table of ty_tile with default key.

  "! <p class="shorttext">Life Cycle Deprecation Status</p>
  "! Life cycle deprecation status
  "! $values {@link zif_aff_uiad_v1.data:co_life_cycle_status}
  "! $default {@link zif_aff_uiad_v1.data:co_life_cycle_status.active}
  types ty_life_cycle_status type c length 1.

  constants:
    "! <p class="shorttext">Life Cycle Status</p>
    "! Life cycle deprecation status
    begin of co_life_cycle_status,

      "! <p class="shorttext">Active</p>
      "! LADI is active
      active     type ty_life_cycle_status value ' ',

      "! <p class="shorttext">Deprecated</p>
      "! LADI is deprecated and should no longer be used
      deprecated type ty_life_cycle_status value 'D',

      "! <p class="shorttext">Obsolete</p>
      "! LADI is obsolete and must no longer be used
      obsolete   type ty_life_cycle_status value 'O',

    end of co_life_cycle_status.


  types:
    "! <p class="shorttext">Life Cycle</p>
    "! Life cycle
    begin of ty_life_cycle,

      "! <p class="shorttext">Status</p>
      "! Life cycle status
      status    type ty_life_cycle_status,

      "! <p class="shorttext">Successor</p>
      "! LADI of the successor application
      successor type c length 32,

    end of ty_life_cycle.

  types:
    "! <p class="shorttext">LADI</p>
    "! Launchpad application descriptor item (LADI)
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

      "! <p class="shorttext">SAPUI5 Application Information</p>
      "! SAPUI5 application information
      ui5_app_details          type ty_app_details_ui5,

      "! <p class="shorttext">Web Dynpro Application Information</p>
      "! Web Dynpro application information
      web_dynpro_app_details   type ty_app_details_web_dynpro,

      "! <p class="shorttext">Web Client Application Information</p>
      "! Web Client application information
      web_client_app_details   type ty_app_details_web_client,

      "! <p class="shorttext">URL Template Application Information</p>
      "! URL Template application information
      url_template_app_details type ty_app_details_url_template,

      "! <p class="shorttext">Navigation Information</p>
      "! Navigation information
      "! $required
      navigation               type ty_navigation,

      "! <p class="shorttext">Tiles</p>
      "! Tiles
      "! $required
      tiles                    type ty_tiles,

      "! <p class="shorttext">Life Cycle</p>
      "! Life cycle
      life_cycle               type ty_life_cycle,

    end of ty_main.

  constants co_format_version type zif_aff_types_v1=>ty_format_version value '1'.

endinterface.
