INTERFACE zif_aff_iwng_v1
  PUBLIC.

  TYPES:
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Provider ID</p>
      "! Provider ID
      "! $required
      provider_id    TYPE c LENGTH 32,
      "! <p class="shorttext">Provider Class Name</p>
      "! Provider Class Name
      "! $required
      provider_class TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Notification Provider Object</p>
    "! Create Notification provider object
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
      "! General Information
      general_information TYPE ty_general_information,
    END OF ty_main.
ENDINTERFACE.
