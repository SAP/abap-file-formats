INTERFACE zif_aff_cota_v1
  PUBLIC.

  "! <p class="shorttext">Communication Type</p>
  "! $values {@link zif_aff_cota_v1.data:co_comm_type}
  TYPES ty_comm_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Communication Type</p>
    "! Communication type
    BEGIN OF co_comm_type,
      "! <p class="shorttext">RFC</p>
      "! RFC
      rfc  TYPE ty_comm_type VALUE 'R',
      "! <p class="shorttext">HTTP</p>
      "! HTTP
      http TYPE ty_comm_type VALUE 'H',
    END OF co_comm_type.

  TYPES:
    "! <p class="shorttext">Configuration</p>
    "! Configuration
    "! $required
    BEGIN OF ty_configuration,
      "! <p class="shorttext">Communication Type</p>
      "! Communication type
      "! $default {@link zif_aff_cota_v1.data:co_comm_type.http}
      communication_type          TYPE ty_comm_type,
      "! <p class="shorttext">Communication Target Class</p>
      "! Communication target class
      communication_target_class     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Allow Multiple Application Destinations</p>
      "! Allow multiple application destinations
      allow_multiple_destinations TYPE abap_bool,
      "! <p class="shorttext">Allow Client Independent Application Destinations</p>
      "! Allow client independent application destinations
      client_independent          TYPE abap_bool,
    END OF ty_configuration.

  "! <p class="shorttext">Default Compression Mode</p>
  "! $values {@link zif_aff_cota_v1.data:co_compress_mode}
  TYPES ty_comp_mode TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Default Compression Mode</p>
    "! Default compression mode
    BEGIN OF co_compress_mode,
      "! <p class="shorttext">Fast</p>
      "! Fast
      fast TYPE ty_comp_mode VALUE 'F',
      "! <p class="shorttext">High</p>
      "! High
      high TYPE ty_comp_mode VALUE 'H',
    END OF co_compress_mode.

  TYPES:
    "! <p class="shorttext">RFC Settings</p>
    "! RFC settings
    "! $required
    BEGIN OF ty_rfc_settings,
      "! <p class="shorttext">Enforce SAP GUI Support</p>
      "! Enforce SAP GUI support
      enforce_sap_gui_support        TYPE abap_bool,
      "! <p class="shorttext">Enforce Fast Serialization</p>
      "! Enforce fast serialization
      enforce_fast_serialization TYPE abap_bool,
      "! <p class="shorttext">Default Compression Mode</p>
      "! Default compression mode
      "! $default {@link zif_aff_cota_v1.data:co_compress_mode.fast}
      default_compression_mode   TYPE ty_comp_mode,
    END OF ty_rfc_settings.

  TYPES:
    "! <p class="shorttext">HTTP Settings</p>
    "! HTTP settings
    "! $required
    BEGIN OF ty_http_settings,
      "! <p class="shorttext">Path Prefix</p>
      "! Path prefix
      path_prefix TYPE zif_aff_types_v1=>ty_description_100,
    END OF ty_http_settings.


  TYPES:
    "! <p class="shorttext">Communication Target Object</p>
    "! Creation of communication target object
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Configuration</p>
      "! Configuration
      "! $required
      configuration  TYPE ty_configuration,
      "! <p class="shorttext">HTTP Settings</p>
      "! HTTP settings
      http_settings  TYPE ty_http_settings,
      "! <p class="shorttext">RFC Settings</p>
      "! RFC settings
      rfc_settings   TYPE ty_rfc_settings,
    END OF ty_main.

ENDINTERFACE.
