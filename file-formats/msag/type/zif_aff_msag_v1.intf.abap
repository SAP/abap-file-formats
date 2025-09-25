INTERFACE zif_aff_msag_v1
 PUBLIC.

  TYPES:
    "! <p class="shorttext">Message Properties</p>
    "! Message properties
    BEGIN OF ty_message,
      "! <p class="shorttext">Message Number</p>
      "! Message number
      number TYPE c LENGTH 3,
      "! <p class="shorttext">Short Text</p>
      "! Short text
      text   TYPE c LENGTH 73,
    END OF ty_message.

  "! <p class="shorttext">Internal table to store messages</p>
  "! Internal table to store messages
  TYPES tt_messages TYPE STANDARD TABLE OF ty_message WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Message Class Properties</p>
    "! Message class properties
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Messages</p>
      "! Messages
      "! $required
      messages       TYPE tt_messages,
    END OF ty_main.

ENDINTERFACE.
