interface zob_aff_smtg_v1
  public.

  " Email Template Metadata --------------------------------------------------------------------------------------------
  types:
    "! <p class="shorttext">Administrative Data</p>
    "! Contains administrative details such as creation and last change information.
    begin of ty_administrative_data,
      "! <p class="shorttext">Created By</p>
      "! Created by
      "! $showAlways
      created_by      type string,
      "! <p class="shorttext">Last Changed By</p>
      "! last changed by
      "! $showAlways
      last_changed_by type string,
    end of ty_administrative_data.

  types:
    "! <p class="shorttext">Header</p>
    "! Contains identifying and descriptive information about the template.
    begin of ty_template_header,
      "! <p class="shorttext">Template Name</p>
      "! Unique identifier for the template
      "! $required
      template_id  type smtg_tmpl_name,
      "! <p class="shorttext">CDS View</p>
      "! The corresponding CDS view name for the template
      "! $required
      cds_view     type smtg_cds_view,
      "! <p class="shorttext">Description</p>
      "! Brief description of the template
      description  type smtg_tmpl_description,
      "! <p class="shorttext">Predelivered</p>
      "! Indicator if the template is pre-delivered
      predelivered type abap_bool,
    end of ty_template_header.

  types:
    "! <p class="shorttext">General Information</p>
    "! Combines template header and administrative data.
    begin of ty_general_information,
      "! <p class="shorttext">Template Header</p>
      "! Contains basic template identifiers and description
      "! $required
      template_header     type ty_template_header,
      "! <p class="shorttext">Administrative Data</p>
      "! Contains info about template creation and modification
      "! $required
      administrative_data type ty_administrative_data,
    end of ty_general_information.


  " Email Template Body --------------------------------------------------------------------------------------------

  types:
    "! <p class="shorttext">Template Content</p>
    "! Holds the actual content of the email template.
    begin of ty_template_content,
      "! <p class="shorttext">Body HTML</p>
      "! The HTML body content of the email template
      body_html       type string,
      "! <p class="shorttext">Body Plain Text</p>
      "! The plain text body content of the email template
      body_plain_text type string,
    end of ty_template_content.


  " Email Template body options --------------------------------------------------------------------------------------------

  types:
    "! <p class="shorttext">Template Language</p>
    "! Language options for the template
    begin of ty_template_language,
      "! <p class="shorttext">Language</p>
      "! Language code
      "! $required
      country type string,
      "! <p class="shorttext">HTML</p>
      "! Indicates if HTML format is available
      html    type abap_bool,
      "! <p class="shorttext">Plain</p>
      "! Indicates if plain text is available
      Plain   type abap_bool,
      "! <p class="shorttext">Auto</p>
      "! Indicates if automatic plain text update is enabled
      Auto    type abap_bool,
    end of ty_template_language.

  "! <p class="shorttext">Languages</p>
  "! List of available languages
  types ty_temp_languages type standard table of ty_template_language with empty key.

  types:
    "! <p class="shorttext">Input Field</p>
    "! Input field
    begin of ty_input_field,
      "! <p class="shorttext">Name</p>
      "! Name of the input field
      "! $required
      name type string,
      "! <p class="shorttext">Text</p>
      "! Text asscociated with the input field
      "! $required
      text type string,
    end of ty_input_field.

  "! <p class="shorttext">Input Fields</p>
  "! List of all input fields
  types ty_input_fields type standard table of ty_input_field with key name.

  types:
    "! <p class="shorttext">Template Options</p>
    "! Variants of the template content plus CDS input fields
    begin of ty_content_options,
      "! <p class="shorttext">Languages</p>
      "! Available languages for the template
      "! $required
      languages    type ty_temp_languages,
      "! <p class="shorttext">Input Fields</p>
      "! Input fields for the template from corresponding CDS view
      input_fields type ty_input_fields,
    end of ty_content_options.


  " Main View --------------------------------------------------------------------------------------------------------

  types:
    "! <p class="shorttext">Demo Object Type SMTG</p>
    "! Demo object type SMTG
    begin of ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      type zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              type zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information type ty_general_information,
      "! <p class="shorttext">Options</p>
      "! Options
      "! $required
      template_options    type ty_content_options,
      "! <p class="shorttext">Text</p>
      "! Text
      "! $required
      template_content    type ty_template_content,
    end of ty_main.



endinterface.
