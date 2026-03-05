INTERFACE zif_aff_dtel_v1 PUBLIC.

  TYPES:
    "! <p class="shorttext">Predefined Type</p>
    "! Predefined ABAP type
    BEGIN OF ty_predefined_type,
      "! <p class="shorttext">Data Type</p>
      "! Data type
      "! $required
      data_type TYPE zif_aff_ddic_types_v1=>ty_data_type,
      "! <p class="shorttext">Length</p>
      "! Length
      "! $required
      length    TYPE zif_aff_ddic_types_v1=>ty_length,
      "! <p class="shorttext">Decimals</p>
      "! Decimals
      decimals  TYPE zif_aff_ddic_types_v1=>ty_decimals,
    END OF ty_predefined_type.

  TYPES:
    "! <p class="shorttext">Field Labels</p>
    "! Field labels
    BEGIN OF ty_field_labels,
      "! <p class="shorttext">Short</p>
      "! Short field label
      short   TYPE c LENGTH 10,
      "! <p class="shorttext">Medium</p>
      "! Medium field label
      medium  TYPE c LENGTH 20,
      "! <p class="shorttext">Long</p>
      "! Long field label
      long    TYPE c LENGTH 40,
      "! <p class="shorttext">Heading</p>
      "! Heading field label
      heading TYPE c LENGTH 55,
    END OF ty_field_labels.

  TYPES:
    "! <p class="shorttext">Data Element</p>
    "! Data Element (DTEL)
    BEGIN OF ty_main,
      "! $required
      format_version            TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                    TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">Domain Name</p>
      "! Reference domain name
      domain_name               TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Predefined Type</p>
      "! Predefined ABAP type
      predefined_type           TYPE ty_predefined_type,

      "! <p class="shorttext">Reference Type</p>
      "! Reference to an ABAP type
      reference_type            TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Reference Predefined Type</p>
      "! Reference to a predefined ABAP type
      reference_predefined_type TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Field Labels</p>
      "! Field labels
      field_labels              TYPE ty_field_labels,

      "! <p class="shorttext">Search help name</p>
      "! Search help name
      search_help_name          TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Search help parameters</p>
      "! Search help parameters
      search_help_parameters    TYPE c LENGTH 30,

      "! <p class="shorttext">Set/Get parameter ID</p>
      "! Set/Get parameter ID
      parameter_id              TYPE c LENGTH 20,

      "! <p class="shorttext">Default component name</p>
      "! Default component name
      default_commponent_name   TYPE c LENGTH 30,

      "! <p class="shorttext">Change document relevant</p>
      "! Change document relevant
      change_document_relevant  TYPE abap_bool,

      "! <p class="shorttext">No input history</p>
      "! No input history
      no_input_history          TYPE abap_bool,

      "! <p class="shorttext">Bidirectional direction is LTR</p>
      "! Bidirectional direction is LTR
      bidi_direction_ltr        TYPE abap_bool,

      "! <p class="shorttext">Bidirectional no filtering</p>
      "! Bidirectional no filtering
      bidi_no_filtering         TYPE abap_bool,
    END OF ty_main.

ENDINTERFACE.
