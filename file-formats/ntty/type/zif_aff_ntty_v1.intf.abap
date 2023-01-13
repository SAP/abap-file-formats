interface zif_aff_ntty_v1
  public .


  types:
    "! $values { @link zif_aff_ntty_v1.data:co_profile }
    "! $default { @link zif_aff_ntty_v1.data:co_profile.text }
    tv_profile type c length 20,

    "! <p class="shorttext">General Information</p>
    "! General information
    begin of ts_general_information,
      "! <p class="shorttext">Language Dependent</p>
      "! Language dependent
      "! $showAlways
      language_dependency type abap_bool,
      "! <p class="shorttext">Multiple Notes</p>
      "! Multiple notes possible
      "! $showAlways
      multiple            type abap_bool,
      "! <p class="shorttext">Hide Title</p>
      "! Hides the title
      no_subject          type abap_bool,
    end of ts_general_information,

    "! <p class="shorttext">Content Settings</p>
    "! Content settings
    begin of ts_content_settings,
      "! <p class="shorttext">Maximum Length</p>
      "! Maximum length
      max_length type nte_maxlength,
      "! <p class="shorttext">Formatting Profile</p>
      "! Formatting profile
      profile    type tv_profile,
    end of ts_content_settings,

    "! <p class="shorttext">Notetype</p>
    "! Notetype
    begin of ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version    type zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header            type zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information type ts_general_information,
      "! <p class="shorttext">Content Settings</p>
      "! Content settings
      content_settings     type ts_content_settings,
    end of ty_main.

  constants:
    begin of co_profile,
     "! <p class="shorttext">Text Only</p>
     "! Plain text content (text/plain)
      text      type tv_profile value 'TEXT',
     "! <p class="shorttext">Simple Formatting</p>
     "! simple formatted content (text/html)
      rte_basic type tv_profile value 'RTE_BASIC',
    end of co_profile.

endinterface.
