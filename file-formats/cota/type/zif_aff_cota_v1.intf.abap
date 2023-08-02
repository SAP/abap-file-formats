INTERFACE zif_aff_cota_v1
  PUBLIC.

  "! <p class="shorttext">Communication Type</p>
  "! $values {@link zif_aff_cota_v1.data:co_comm_type}
  TYPES ty_comm_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Communication Type</p>
    "! Communication Type
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
      "! <p class="shorttext">Connection Target Class</p>
      "! Connection target class
      "! $required
      connection_target_class     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Allow Multiple Application Destinations</p>
      "! Allow multiple application destinations
      allow_multiple_destinations TYPE abap_bool,
      "! <p class="shorttext">Allow Client Independent Application Destinations</p>
      "! Alow client independent application destinations
      client_independent          TYPE abap_bool,
    END OF ty_configuration.

  "! <p class="shorttext">RFY Type</p>
  "! $values {@link zif_aff_cota_v1.data:co_rfctype}
  TYPES ty_rfctype TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">RFC Type</p>
    "! RFC Type
    BEGIN OF co_rfctype,
      "! <p class="shorttext">Synchronous</p>
      "! Synchronous
      synchronous TYPE ty_rfctype VALUE 'X',
    END OF co_rfctype.

  TYPES:
    "! <p class="shorttext">RFC Settings</p>
    "! RFC Settings
    "! $required
    BEGIN OF ty_rfc_settings,
      "! <p class="shorttext">RFC Type</p>
      "! RFC type
      "! $default {@link zif_aff_cota_v1.data:co_rfctype.synchronous}
      rfc_type                   TYPE ty_rfctype,
      "! <p class="shorttext">Enforce Classic RFC</p>
      "! Enforce classic RFC
      enforce_classic_rfc        TYPE abap_bool,
      "! <p class="shorttext">Enforce Fast Serialization</p>
      "! Enforce fast serialization
      enforce_fast_serialization TYPE abap_bool,
      "! <p class="shorttext">Use Default Compression Mode</p>
      "! Use default compression mode
      "! $required
      default_compression_mode   TYPE abap_bool,
    END OF ty_rfc_settings.

  TYPES:
    "! <p class="shorttext">Connection Target Object</p>
    "! Creation of connection target object
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
      "! <p class="shorttext">RFC Settings</p>
      "! RFC settings
      rfc_settings   TYPE ty_rfc_settings,
    END OF ty_main.

ENDINTERFACE.
