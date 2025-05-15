INTERFACE zif_aff_aifd_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Application Interface</p>
    "! Application interface
    BEGIN OF ty_application_interface,
      "! <p class="shorttext">Application Interface</p>
      "! Application interface
      "! $required
      application_interface TYPE c LENGTH 40,
    END OF ty_application_interface,

    "! <p class="shorttext">Application Interfaces</p>
    "! Application interfaces
    ty_application_interfaces TYPE STANDARD TABLE OF ty_application_interface WITH DEFAULT KEY,

    "! <p class="shorttext">Deployment Scenario</p>
    "! Deployment scenario
    BEGIN OF ty_main,
      "! $required
      format_version         TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                 TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Application Interfaces</p>
      "! Application interfaces
      "! $required
      application_interfaces TYPE ty_application_interfaces,
    END OF ty_main.
ENDINTERFACE.
