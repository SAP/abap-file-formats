INTERFACE zif_aff_aifd_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">AIF Interface</p>
    "! AIF interface
    BEGIN OF ty_aif_interface,
      "! <p class="shorttext">Interface Object Name</p>
      "! Interface object name
      "! $required
      interface_object_name TYPE c LENGTH 40,
    END OF ty_aif_interface,

    "! <p class="shorttext">AIF Interfaces</p>
    "! AIF interfaces
    ty_aif_interfaces TYPE STANDARD TABLE OF ty_aif_interface WITH DEFAULT KEY,

    "! <p class="shorttext">Deployment Scenario</p>
    "! Deployment scenario
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">AIF Interfaces</p>
      "! AIF interfaces
      "! $required
      aif_interfaces TYPE ty_aif_interfaces,
    END OF ty_main.
ENDINTERFACE.
