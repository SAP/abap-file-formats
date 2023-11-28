INTERFACE zif_aff_sfpf_v1
  PUBLIC .
  TYPES:
    "! <p class="shorttext">Header for SFPF Objects</p>
    BEGIN OF ty_header,
      "! <p class="shorttext">Description</p>
      "! Description of the Form Template
      description           TYPE c LENGTH 60,
      "! <p class="shorttext">Original language</p>
      "! $required
      original_language     TYPE zif_aff_types_v1=>ty_original_language,
      "! $values {@link zif_aff_types_v1.data:co_abap_language_version_cloud}
      "! $default {@link zif_aff_types_v1.data:co_abap_language_version_cloud.cloud_development}
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version,
    END OF ty_header,

    BEGIN OF ty_properties,
      "! <p class="shorttext">Name</p>
      "! Name of the Form Template
      "! $required
      name            TYPE c LENGTH 30,
      "! <p class="shorttext">Dataprovider</p>
      "! RAP Service Definition that implements the business context for this form template
      dataprovider    TYPE c LENGTH 40,
      "! <p class="shorttext">Font Embed</p>
      "! Automatically embed font files into the output. Useful if your output uses fonts that are not delivered by default, for asian fonts or to include your own branding.
      embed           TYPE abap_boolean,
      "! <p class="shorttext">Mirror in RTL</p>
      "! When your form template is designed in an LTR language and your target output is an RTL language, should fields be automatically be mirrord in the output?
      mirroring       TYPE abap_boolean,
      "! <p class="shorttext">FDP Data Optimization</p>
      "! When your form template is designed in an LTR language and your target output is an RTL language, should fields be automatically be mirrord in the output?
      optimize       TYPE abap_boolean,
    END OF ty_properties.

  TYPES:
    "! <p class="shorttext">Object Type SFPF</p>
    "! Object type SFPF
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version  TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header          TYPE ty_header,
      "! <p class="shorttext">Properties</p>
      "! Form Template Properties
      "! $required
      properties      TYPE ty_properties,
    END OF ty_main.
ENDINTERFACE.
