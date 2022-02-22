"! <p class="shorttext synchronized" lang="en">Event Consumption Model</p>
INTERFACE zif_aff_eeec_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Event Type</p>
    ty_event_type TYPE string.

  TYPES:
    "! <p class="shorttext synchronized" lang="en">Event Type</p>
    "! View information of the specific event type
    BEGIN OF ty_s_event_type,
      "! <p class="shorttext synchronized" lang="en">Event Type</p>
      "! Event Type
      type  TYPE ty_event_type,
      "! <p class="shorttext synchronized" lang="en">Entity Name</p>
      "! Entity Name
      entity_name TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_s_event_type,
    ty_t_event_type TYPE SORTED TABLE OF ty_s_event_type WITH UNIQUE KEY type.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! View information of the Event Consumption Model
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header           TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext synchronized" lang="en">Consumer Class</p>
      "! Consumer class
      "! $required
      consumer_class   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext synchronized" lang="en">Descriptor Class</p>
      "! Descriptor class
      "! $required
      descriptor_class TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext synchronized" lang="en">Event Types</p>
      "! View information on the Event Types
      event_types       TYPE ty_t_event_type,
    END OF ty_main.

ENDINTERFACE.
