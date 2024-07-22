INTERFACE zif_aff_evtb_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Event</p>
    BEGIN OF ty_event,
      "! <p class="shorttext"> Major Version</p>
      "! Major version
      event_version       TYPE n LENGTH 4,

      "! <p class="shorttext">Minor Version</p>
      "! Minor version
      "! $minimum 0
      event_minor_version TYPE i,

      "! <p class="shorttext">Patch Version</p>
      "! Patch version
      "! $minimum 0
      event_patch_version TYPE i,

      "! <p class="shorttext">Entity Name</p>
      "! Entity name
      "! $required
      entity_name         TYPE c LENGTH 30,

      "! <p class="shorttext">Entity Event Name</p>
      "! Entity event name
      "! $required
      entity_event_name   TYPE c LENGTH 30,
    END OF ty_event.

  TYPES:
    "! <p class="shorttext">General Information</p>
    BEGIN OF ty_main,
      "! $required
      format_version     TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header             TYPE zif_aff_types_v1=>ty_header_60_cloud,

      "! <p class="shorttext">Type Namespace</p>
      "! Type namespace
      "! $required
      producer_namespace TYPE c LENGTH 15,

      "! <p class="shorttext">Producer Legacy</p>
      "! Producer legacy
      producer_legacy    TYPE abap_bool,

      "! <p class="shorttext">Producer</p>
      "! Producer
      producer           TYPE c LENGTH 36,

      "! <p class="shorttext">Producer Version</p>
      "! Producer version
      producer_version   TYPE n LENGTH 4,

      "! <p class="shorttext">SAP Object Type</p>
      "! SAP Object Type
      "! $required
      bo_name            TYPE c LENGTH 30,

      "! <p class="shorttext">Operation</p>
      "! Operation
      "! $required
      bo_operation       TYPE c LENGTH 30,

      "! <p class="shorttext">Type</p>
      "! Type
      producer_type      TYPE c LENGTH 83,

      "! <p class="shorttext">Event Versions</p>
      "! $required
      events             TYPE SORTED TABLE OF ty_event WITH NON-UNIQUE KEY event_version,
    END OF ty_main.

ENDINTERFACE.
