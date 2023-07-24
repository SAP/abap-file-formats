INTERFACE zif_aff_cota_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Connection Target Object</p>
    "! Creation of connection target object
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Connection Target Object ID</p>
      "! Connection target object ID
      conn_id               TYPE c LENGTH 30,
      "! <p class="shorttext">Version</p>
      "! Version
      version               TYPE c LENGTH 1,
      "! <p class="shorttext">Multiple Application Destinations Allowed</p>
      "! Multiple application destinations allowed
      "! $required
      allow_multiple_destinations     TYPE c LENGTH 1,
      "! <p class="shorttext">Client Dependent Object</p>
      "! Client dependent object
      "! "! $required
      client_dependant      TYPE c LENGTH 1,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP language version
      "! $required
      abap_language_version TYPE c LENGTH 1,
      "! <p class="shorttext">Enforce Classic RFC</p>
      "! Enforce classic RFC
      "! $required
      enforce_classic_rfc      TYPE c LENGTH 1,
      "! <p class="shorttext">RFC Type</p>
      "! RFC type
      "! $required
      rfc_type              TYPE c LENGTH 1,
      "! <p class="shorttext">Enforce Fast Serialization</p>
      "! Enforce fast serialization
      "! $required
      enforce_fast_serialization      TYPE c LENGTH 1,
      "! <p class="shorttext">Default Compression Mode</p>
      "! Default compression mode
      "! $required
      usage_of_default_compression      TYPE c LENGTH 1,
      "! <p class="shorttext">Language</p>
      "! Language
      lang                  TYPE c LENGTH 1,
      "! <p class="shorttext">Short text</p>
      "! Short text
      "! $required
      shorttext             TYPE c LENGTH 255,
      "! <p class="shorttext">Connection Target Class</p>
      "! Connection target class
      connection_target_class             TYPE c LENGTH 30,

    END OF ty_main.
ENDINTERFACE.
