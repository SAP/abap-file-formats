INTERFACE zif_aff_siad_v1
  PUBLIC.

  TYPES:

    "! <p class="shorttext">Assignment</p>
    "! Assignment
    BEGIN OF ty_assignment,

      "! <p class="shorttext">Business Role Template ID</p>
      "! Business role template ID
      "! $required
      business_role_template_id   TYPE c LENGTH 30,

      "! <p class="shorttext">Launchpad Space Template ID</p>
      "! Launchpad space template ID
      "! $required
      launchpad_space_template_id TYPE c LENGTH 35,

    END OF ty_assignment,

    "! <p class="shorttext">Business Role Template Launchpad Space Template Assignment</p>
    "! Business role template launchpad space template assignment
    BEGIN OF ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">General</p>
      "! General
      "! $required
      assignment     TYPE ty_assignment,

    END OF ty_main.

ENDINTERFACE.
