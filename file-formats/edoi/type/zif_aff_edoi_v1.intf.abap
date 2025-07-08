INTERFACE zif_aff_edoi_v1 PUBLIC.

  "! <p class="shorttext">Interface Direction</p>
  "! Interface direction
  "! $values {@link zif_aff_edoi_v1.data:co_interface_direction}
  "! $default {@link zif_aff_edoi_v1.data:co_interface_direction.outbound}
  TYPES ty_interface_direction TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Interface Direction</p>
    "! Interface direction
    BEGIN OF co_interface_direction,
      "! <p class="shorttext">Outbound</p>
      "! Outbound
      outbound TYPE ty_interface_direction VALUE 'O',
      "! <p class="shorttext">Inbound</p>
      "! Inbound
      inbound  TYPE ty_interface_direction VALUE 'I',
    END OF co_interface_direction.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Interface Direction</p>
      "! Interface direction
      "! $required
      interface_direction TYPE ty_interface_direction,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Communication Integration Attributes</p>
    "! Communication integration attributes
    BEGIN OF ty_communication_attribute,
      "! <p class="shorttext">Process Type</p>
      "! DRC process type
      process_type               TYPE c LENGTH 50,
      "! <p class="shorttext">Process Version</p>
      "! DRC process version
      process_version            TYPE c LENGTH 20,
      "! <p class="shorttext">Process Subtype</p>
      "! DRC process subtype
      process_subtype            TYPE c LENGTH 50,
      "! <p class="shorttext">Action</p>
      "! DRC process action
      drc_action                 TYPE c LENGTH 30,
      "! <p class="shorttext">Response Interface</p>
      "! eDoc response interface
      response_interface         TYPE c LENGTH 30,
      "! <p class="shorttext">Response Interface Version</p>
      "! Response interface version
      "! $minimum 1
      "! $maximum 9999
      response_interface_version TYPE i,
    END OF ty_communication_attribute.

  TYPES:
    "! <p class="shorttext">Interface Version</p>
    "! eDocument interface version
    BEGIN OF ty_interface_version,
      "! <p class="shorttext">Version</p>
      "! Version
      "! $required
      "! $minimum 1
      "! $maximum 9999
      version                 TYPE i,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description             TYPE c LENGTH 30,
      "! <p class="shorttext">Active From</p>
      "! Active from
      "! $required
      active_from             TYPE sy-datum,
      "! <p class="shorttext">Communication Integration Attributes</p>
      "! Communication integration attributes
      "! $required
      communication_attribute TYPE ty_communication_attribute,
    END OF ty_interface_version.

  "! <p class="shorttext">Interface Versions</p>
  "! Interface versions
  TYPES ty_interface_versions       TYPE SORTED TABLE OF ty_interface_version WITH UNIQUE KEY version.

  TYPES:
    "! <p class="shorttext">eDocument Interface</p>
    "! eDocument interface
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_100_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Interface Versions</p>
      "! Interface versions
      "! $required
      interface_versions  TYPE ty_interface_versions,

    END OF ty_main.

ENDINTERFACE.
