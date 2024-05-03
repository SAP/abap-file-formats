INTERFACE zif_aff_aifd_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">AIF Interface</p>
    "! AIF interface
    "! $required
    BEGIN OF ty_aif_interface,
      "! <p class="shorttext">Interface Object Name</p>
      "! Interface Object Name
      "! $required
      object_name       TYPE c LENGTH 40,
      "! <p class="shorttext">Namespace</p>
      "! Namespace
      namespace         TYPE c LENGTH 6,
      "! <p class="shorttext">Interface Name</p>
      "! Interface Name
      interface_name    TYPE c LENGTH 10,
      "! <p class="shorttext">Interface Version</p>
      "! Interface Version
      interface_version TYPE c LENGTH 5,
    END OF ty_aif_interface,

    "! <p class="shorttext">AIF Interfaces</p>
    "! AIF Interfaces
    ty_aif_interfaces TYPE STANDARD TABLE OF ty_aif_interface WITH DEFAULT KEY,

    "! <p class="shorttext">AIFD Object Type</p>
    "! Object type AIFD
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">General</p>
      "! AIF interfaces
      "! $required
      aif_interfaces TYPE ty_aif_interfaces,
    END OF ty_main.
ENDINTERFACE.
