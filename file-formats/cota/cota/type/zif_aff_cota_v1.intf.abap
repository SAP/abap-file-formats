INTERFACE zif_aff_cota_v1
  PUBLIC.

  "! <p class="shorttext">RFY Type</p>
  "! $values {@link zif_aff_cota_v1.data:co_rfctype}
  TYPES ty_rfctype TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Buffering</p>
    "! Choose a buffer type for no buffering, for buffering via main memory or for parallel buffering.
    BEGIN OF co_rfctype,
      "! <p class="shorttext">Synchronous</p>
      "! Synchronous
      synchronous  TYPE ty_rfctype VALUE 'X',
      "! <p class="shorttext">Asynchronous</p>
      "! Asynchronous
      asynchronous TYPE ty_rfctype VALUE 'S',
    END OF co_rfctype.



  TYPES:
    "! <p class="shorttext">RFC Settings</p>
    "! RFC Settings
    BEGIN OF ty_rfc_settings,
      "! <p class="shorttext">Enforce Classic RFC</p>
      "! Enforce classic RFC
      "! $required
      enforce_classic_rfc          TYPE abap_bool,
      "! <p class="shorttext">RFC Type</p>
      "! RFC Type
      "! $required
      "! $default {@link zif_aff_cota_v1.data:co_rfctype.synchronous}
      rfc_type                     TYPE ty_rfctype,
      "! <p class="shorttext">Enforce Fast Serialization</p>
      "! Enforce fast serialization
      "! $required
      enforce_fast_serialization   TYPE abap_bool,
      "! <p class="shorttext">Default Compression Mode</p>
      "! Default compression mode
      "! $required
      usage_of_default_compression TYPE abap_bool,
    END OF ty_rfc_settings.

  TYPES:
    "! <p class="shorttext">Configuration</p>
    "! Configuration
    BEGIN OF ty_configuration,
      "! <p class="shorttext">Connection Target Name</p>
      "! Connection target name
      conn_id                     TYPE c LENGTH 30,
      "! <p class="shorttext">Multiple Application Destinations Allowed</p>
      "! Multiple application destinations allowed
      "! $required
      allow_multiple_destinations TYPE abap_bool,
      "! <p class="shorttext">Client Dependent Object</p>
      "! Client dependent object
      "! "! $required
      client_dependant            TYPE abap_bool,
      "! <p class="shorttext">Connection Target Class</p>
      "! Connection target class
      connection_target_class     TYPE c LENGTH 30,
    END OF ty_configuration.


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
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">RFC Settings</p>
      "! RFC Settings
      rfc_settings   TYPE ty_rfc_settings,
      configuration  TYPE ty_configuration,
    END OF ty_main.
ENDINTERFACE.
