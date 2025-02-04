INTERFACE zif_aff_edoi_v1 PUBLIC.

  "! <p class="shorttext">Interface Direction</p>
  "! Interface direction
  "! $values {@link zif_aff_edoi_v1.data:co_edoc_int_direction}
  "! $default {@link zif_aff_edoi_v1.data:co_edoc_int_direction.outbound}
  TYPES ty_int_direction TYPE c LENGTH 1.
  TYPES:
    "! <p class="shorttext">Interface Version</p>
    "! eDocument interface version
    BEGIN OF ty_edoc_interface_version,
      "! <p class="shorttext">Interface Version</p>
      "! Interface version
      "! $required
      int_version      TYPE c LENGTH 4,
      "! <p class="shorttext">Interface Version Description</p>
      "! Interface dersion description
      "! $required
      int_version_desc TYPE c LENGTH 30,
      "! <p class="shorttext">Active From</p>
      "! Active from
      "! $required
      active_from      TYPE sy-datum,
    END OF ty_edoc_interface_version.
  "! <p class="shorttext">Interface Versions</p>
  "! eDocument interface versions
  TYPES ty_edoc_interface_versions TYPE SORTED TABLE OF ty_edoc_interface_version WITH UNIQUE KEY int_version.
  TYPES:
    "! <p class="shorttext">Attribute Determination for Communication with Cloud Edition</p>
    "! Attribute determination for communication with cloud edition
    BEGIN OF ty_edoc_int_drc_attr,
      "! <p class="shorttext">Process Type</p>
      "! DRC process type
      "! $required
      process_type      TYPE c LENGTH 50,
      "! <p class="shorttext">Process Version</p>
      "! DRC process version
      "! $required
      process_version   TYPE c LENGTH 20,
      "! <p class="shorttext">Process Subtype</p>
      "! DRC process subtype
      "! $required
      process_subtype   TYPE c LENGTH 50,
      "! <p class="shorttext">Action</p>
      "! DRC process action
      "! $required
      drc_action        TYPE c LENGTH 30,
      "! <p class="shorttext">Response Interface</p>
      "! eDoc response interface
      "! $required
      resp_interface_id TYPE c LENGTH 30,
      "! <p class="shorttext">Response Interface Version</p>
      "! Response interface version
      "! $required
      resp_int_version  TYPE c LENGTH 4,

    END OF ty_edoc_int_drc_attr.
  "! <p class="shorttext">Interface Versions</p>
  "! eDocument interface versions
  TYPES ty_edoc_int_drc_attributes TYPE SORTED TABLE OF ty_edoc_int_drc_attr WITH UNIQUE KEY process_type.
  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_edoc_interface,
      "! <p class="shorttext">Interface Direction</p>
      "! Interface direction.
      "! $required
      interface_direction        TYPE ty_int_direction,
      "! <p class="shorttext">Interface Version</p>
      "! Interface version
      "! $required
      interface_version          TYPE ty_edoc_interface_versions,
      "! <p class="shorttext">Attribute Determination for Communication with Cloud Edition</p>
      "! Attribute determination for communication with cloud edition
      "! $required
      edoc_spec_additional_table TYPE ty_edoc_int_drc_attributes,
    END OF ty_edoc_interface.
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
      general_information TYPE ty_edoc_interface,

    END OF ty_main.

  CONSTANTS:
    "! <p class="shorttext">Interface Direction</p>
    "! Interface direction
    BEGIN OF co_edoc_int_direction,
      "! <p class="shorttext">Outbound</p>
      "! Outbound
      outbound TYPE ty_int_direction VALUE 'O',
      "! <p class="shorttext">Inbound</p>
      "! Inbound
      inbound  TYPE ty_int_direction VALUE 'I',
    END OF co_edoc_int_direction.
ENDINTERFACE.
