INTERFACE zif_aff_siad_v1
  PUBLIC.

  TYPES:

    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,

      "! <p class="shorttext">Business Role Template ID</p>
      "! Business role template ID
      "! $required
      business_role_template_id   TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Launchpad Space Template ID</p>
      "! Launchpad space template ID
      "! $required
      launchpad_space_template_id TYPE c LENGTH 35,

    END OF ty_general_information,

    "! <p class="shorttext">Business Role Template Launchpad Space Template Assignment</p>
    "! Business role template launchpad space template assignment
    BEGIN OF ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,

    END OF ty_main.

ENDINTERFACE.
