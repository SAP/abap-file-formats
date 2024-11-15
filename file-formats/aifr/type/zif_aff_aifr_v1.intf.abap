INTERFACE zif_aff_aifr_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Recipient Details</p>
    "! Recipient details
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Namespace</p>
      "! Namespace of the recipient
      "! $required
      namespace     TYPE c LENGTH 15,
      "! <p class="shorttext">AIF Recipient</p>
      "! SAP Application Interface recipient
      "! $required
      aif_recipient TYPE c LENGTH 25,
    END OF ty_general_information,

    "! <p class="shorttext">Recipient</p>
    "! Recipient
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
    END OF ty_main.
ENDINTERFACE.
