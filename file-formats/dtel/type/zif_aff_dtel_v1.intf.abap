INTERFACE zif_aff_dtel_v1 PUBLIC.

  TYPES:
    "! <p class="shorttext">Data Element</p>
    "! Data Element (DTEL)
    BEGIN OF ty_main,
      "! $required
      format_version           TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                   TYPE zif_aff_types_v1=>ty_header_60_cloud,

      " TODO, the actual type:
      " reference domain
      " predefined type
      " reference type type
      " reference predefined type

      " TODO: field lablels: short, medium, long, heading

      "! <p class="shorttext">Search help name</p>
      "! Search help name
      search_help_name         TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Search help parameters</p>
      "! Search help parameters
      search_help_parameters   TYPE c LENGTH 30,

      "! <p class="shorttext">Set/Get parameter ID</p>
      "! Set/Get parameter ID
      parameter_id             TYPE c LENGTH 20,

      "! <p class="shorttext">Default component name</p>
      "! Default component name
      default_commponent_name  TYPE c LENGTH 30,

      "! <p class="shorttext">Change document relevant</p>
      "! Change document relevant
      change_document_relevant TYPE abap_bool,

      "! <p class="shorttext">No input history</p>
      "! No input history
      no_input_history         TYPE abap_bool,

      "! <p class="shorttext">Bidirectional direction is LTR</p>
      "! Bidirectional direction is LTR
      bidi_direction_ltr       TYPE abap_bool,

      "! <p class="shorttext">Bidirectional no filtering</p>
      "! Bidirectional no filtering
      bidi_no_filtering        TYPE abap_bool,
    END OF ty_main.

ENDINTERFACE.
