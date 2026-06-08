INTERFACE zif_aff_sxtg_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Transaction Codes</p>
    "! Transaction codes
    BEGIN OF ty_transaction_code,
      "! <p class="shorttext">Name</p>
      "! Name of transaction code
      name TYPE c LENGTH 20,
    END OF ty_transaction_code.

  "! <p class="shorttext">Transaction Codes</p>
  "! Transaction codes
  TYPES ty_transaction_codes TYPE STANDARD TABLE OF ty_transaction_code WITH KEY name.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Extension Include</p>
      "! Extension include with persisted custom fields
      "! $required
      extension_include          TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">Application Data Structure</p>
      "! Structure with application data
      "! $required
      application_data_structure TYPE zif_aff_types_v1=>ty_object_name_30,

      "! <p class="shorttext">UI Extension Entity</p>
      "! Abstract entity with ui definition
      "! $required
      ui_extension_entity        TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">SAP GUI Extension Point</p>
    "! SAP GUI extension point for developer extensibility
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_no_abap_lv,

      "! <p class="shorttext">General Information</p>
      "! General information
      general_information TYPE ty_general_information,

      "! <p class="shorttext">Transaction Codes</p>
      "! Transaction codes of extensible application
      transaction_codes   TYPE ty_transaction_codes,
    END OF ty_main.

ENDINTERFACE.
