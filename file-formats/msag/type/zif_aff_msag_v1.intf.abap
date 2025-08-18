INTERFACE zif_aff_msag_v1
 PUBLIC.

  TYPES:
    BEGIN OF ty_message,
      number TYPE msgnr,
      text   TYPE natxt,
    END OF ty_message.

  TYPES tt_messages TYPE STANDARD TABLE OF ty_message WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Message class Properties</p>
    "! Message class properties
    BEGIN OF ty_main,
      "! $required
      format_version TYPE if_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE if_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Message class Object</p>
      "! messages
      "! $required
      messages       TYPE tt_messages,
    END OF ty_main.

endinterface.