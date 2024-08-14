INTERFACE zif_aff_smtg_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! Combines template header and administrative data.
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Template ID</p>
      "! Unique identifier for the template
      "! $required
      template_id          TYPE c LENGTH 60,
      "! <p class="shorttext">Template Name</p>
      "! Name of an Email Template
      template_name        TYPE c LENGTH 60,
      "! <p class="shorttext">Template Description</p>
      "! Description of an Email Template
      template_description TYPE c LENGTH 255,
      "! <p class="shorttext">CDS View</p>
      "! The corresponding CDS view name for the template
      "! $required
      cds_view             TYPE c LENGTH 30,
      "! <p class="shorttext">Predelivered</p>
      "! Indicator if the template is pre-delivered
      is_predelivered      TYPE abap_bool,
      "! <p class="shorttext">Subject</p>
      "! The subject of the email template
      email_subject        TYPE c LENGTH 1024,
      "! <p class="shorttext">Automatic Text Generation</p>
      "! Indicator if the template text body is generated automatically from html body
      autogenerate                 TYPE abap_bool,
    END OF ty_general_information.


  TYPES:
    "! <p class="shorttext">Demo Object Type SMTG</p>
    "! Demo object type SMTG
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
    END OF ty_main.

ENDINTERFACE.
