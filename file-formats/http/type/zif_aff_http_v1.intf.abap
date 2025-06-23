INTERFACE zif_aff_http_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    "! $required
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Handler Class</p>
      "! Handler class
      handler_class TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">HTTP Service</p>
    "! HTTP Service
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
