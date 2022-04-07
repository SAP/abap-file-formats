INTERFACE zif_aff_evtb_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Event</p>
    BEGIN OF ty_event,
      "! <p class="shorttext">Event Version</p>
      "! Event version
      event_version             TYPE n LENGTH 4,

      "! <p class="shorttext">Event Minor Version</p>
      "! Event minor version
      "! $minimum 0
      event_minor_version       TYPE i,

      "! <p class="shorttext">Event Patch Version</p>
      "! Event patch version
      "! $minimum 0
      event_patch_version       TYPE i,

      "! <p class="shorttext">Root Entity Name</p>
      "! Root entity name
      "! $required
      entity_name               TYPE c LENGTH 30,

      "! <p class="shorttext">Entity Event Name</p>
      "! Entity event name
      "! $required
      entity_event_name         TYPE c LENGTH 30,
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

      "! <p class="shorttext">Namespace</p>
      "! Namespace
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

      "! <p class="shorttext">Business Object</p>
      "! Business object
      "! $required
      bo_name            TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Business Object Operation</p>
      "! Business object operation
      "! $required
      bo_operation       TYPE c LENGTH 18,

      "! <p class="shorttext">Type</p>
      "! Type
      producer_type      TYPE c LENGTH 83,

      "! <p class="shorttext">Events</p>
      "! $required
      events             TYPE SORTED TABLE OF ty_event WITH NON-UNIQUE KEY event_version,
    END OF ty_main.

ENDINTERFACE.
