INTERFACE zif_aff_evto_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">SAP Object Type</p>
      "! SAP Object Type
      "! $required
      sap_object_type TYPE c LENGTH 30,

      "! <p class="shorttext">Major Version</p>
      "! Major version
      "! $minimum 1
      "! $required
      major_version   TYPE i,

      "! <p class="shorttext">Minor Version</p>
      "! Minor version
      "! $minimum 0
      "! $required
      minor_version   TYPE i,

      "! <p class="shorttext">Patch Version</p>
      "! Patch version
      "! $minimum 0
      "! $required
      patch_version   TYPE i,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Event Object</p>
    "! Event Object
    BEGIN OF ty_main,
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
