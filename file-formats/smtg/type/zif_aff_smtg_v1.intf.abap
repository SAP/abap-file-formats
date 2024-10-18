interface zif_aff_smtg_v1
  public.

  types:
    "! <p class="shorttext">General Information</p>
    "! Combines template header and administrative data.
    begin of ty_general_information,
      "! <p class="shorttext">Template Description</p>
      "! Long description to that email template
      long_description            type c length 255,
      "! <p class="shorttext">Predelivered</p>
      "! Indicator if the template is predelivered
      is_predelivered             type abap_bool,
      "! <p class="shorttext">Generate Plain Text from HTML</p>
      "! Indicator if the template text body is generated automatically from html body
      is_plaintext_auto_generated type abap_bool,
      "! <p class="shorttext">CDS View</p>
      "! The corresponding CDS view name for the template
      "! $required
      cds_view                    type zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Subject</p>
      "! The subject of the email template
      email_subject               type c length 255,
    end of ty_general_information.
  " Corresponding content ist stored in a separate file and implemented as action


  types:
    "! <p class="shorttext">Email Template</p>
    "! Email Template
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
    end of ty_main.

endinterface.
