INTERFACE zif_aff_sfpf_v1
  PUBLIC.
  TYPES:
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Data Provider</p>
      "! RAP Service Definition that implements the business context for this form template
      data_provider          TYPE c LENGTH 40,
      "! <p class="shorttext">Font Embed</p>
      "! Automatically embed font files into the output.
      "! Useful if your output uses fonts that are not delivered by default,
      "! for asian fonts or to include your own branding.
      font_embed            TYPE abap_bool,
      "! <p class="shorttext">Layout Mirroring</p>
      "! When activated if your form template is designed in an LTR language
      "! and your target output is an RTL language,
      "! layout will be automatically mirrored in the output.
      layout_mirroring      TYPE abap_bool,
      "! <p class="shorttext">Reduce Data Volume</p>
      "! Reduce data input volume based on the form design
      reduce_data_volume    TYPE abap_bool,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Object Type SFPF</p>
    "! Object type SFPF
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General Information
      "! $required
      general_information   TYPE ty_general_information,
    END OF ty_main.
ENDINTERFACE.
