INTERFACE zif_aff_sush_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Authorization Default Properties</p>
    "! Authorization default (SUSH) properties
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
      "! General information
      "! $required
      general_information   TYPE zif_aff_auth_types_v1=>ty_general_info_sush_susi,
      "! <p class="shorttext">Authorization Objects</p>
      "! Authorization objects with maintenance status and field values
      authorization_objects TYPE zif_aff_auth_types_v1=>ty_authorization_object_t,
    END OF ty_main.

ENDINTERFACE.
