INTERFACE zif_aff_aifr_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Recipient Details</p>
    "! Recipient details
    BEGIN OF ty_recipient_details,
      "! <p class="shorttext">Namespace</p>
      "! Namespace of the recipient
      "! $required
      namespace TYPE c LENGTH 15,
    END OF ty_recipient_details,

    "! <p class="shorttext">Recipient</p>
    "! Recipient
    BEGIN OF ty_main,
      "! $required
      format_version    TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header            TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Recipient Details</p>
      "! Recipient details
      "! $required
      recipient_details TYPE ty_recipient_details,
    END OF ty_main.
ENDINTERFACE.
