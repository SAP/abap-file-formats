INTERFACE zif_aff_sxtg_v1
  PUBLIC.

  TYPES ty_extension_include          TYPE c LENGTH 30.
  TYPES ty_application_data_structure TYPE c LENGTH 30.
  TYPES ty_ui_extension_entity        TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">Transaction Code</p>
    "! Transaction Code
    BEGIN OF ty_transaction_code,
      "! <p class="shorttext">Transaction Code</p>
      "! Transaction Codes
      transaction_code TYPE c LENGTH 20,
    END OF ty_transaction_code.

  "! <p class="shorttext">Transaction Codes</p>
  "! Transaction Codes
  TYPES ty_transaction_codes TYPE STANDARD TABLE OF ty_transaction_code WITH KEY transaction_code.

  TYPES:
    "! <p class="shorttext">Extension Point Details</p>
    "! Details for SAP gui extension point
    BEGIN OF ty_extension_point_details,
      "! <p class="shorttext">Extension Include</p>
      "! Extension include with persisted custom fields
      "! $required
      extension_include          TYPE ty_extension_include,

      "! <p class="shorttext">Application Data Structure</p>
      "! Structure with application data
      "! $required
      application_data_structure TYPE ty_application_data_structure,

      "! <p class="shorttext">UI Extension Entity</p>
      "! Abstract entity with ui definition
      "! $required
      ui_extension_entity        TYPE ty_ui_extension_entity,
    END OF ty_extension_point_details.

  TYPES:
    "! <p class="shorttext">SAP GUI Extension Point</p>
    "! SAP gui extension point for developer extensibility
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version          TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                  TYPE zif_aff_types_v1=>ty_header_60,

      "! <p class="shorttext">Extension Point Details</p>
      "! Details for SAP gui extension point
      extension_point_details TYPE ty_extension_point_details,

      "! <p class="shorttext">Transaction Codes</p>
      "! Transaction codes of extensible application
      transaction_codes       TYPE ty_transaction_codes,
    END OF ty_main.

ENDINTERFACE.
