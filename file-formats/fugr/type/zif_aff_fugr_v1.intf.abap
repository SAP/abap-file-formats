INTERFACE zif_aff_fugr_v1
  PUBLIC.

  "! <p class="shorttext">Status</p>
  "! Status
  "! $values {@link zif_aff_fugr_v1.data:co_status}
  "! $default {@link zif_aff_fugr_v1.data:co_status.not_classified}
  TYPES ty_status TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Status</p>
    "! status
    BEGIN OF co_status,
      "! <p class="shorttext">Not Classified</p>
      "! Not classified
      not_classified   TYPE ty_status VALUE space,
      "! <p class="shorttext">SAP Program</p>
      "! SAP program
      sap_program      TYPE ty_status VALUE 'P',
      "! <p class="shorttext">Customer Program</p>
      "! Customer production program
      customer_program TYPE ty_status VALUE 'K',
      "! <p class="shorttext">System Program</p>
      "! System program
      system_program   TYPE ty_status VALUE 'S',
      "! <p class="shorttext">Test Program</p>
      "! Test program
      test_program     TYPE ty_status VALUE 'T',
    END OF co_status.

  TYPES:
    "! <p class="shorttext">Object Type FUGR</p>
    "! FUGR object type
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">Fix Point Arithmetic</p>
      "! Fix point arithmetic
      "! $required
      fix_point_arithmetic TYPE abap_bool,
      "! <p class="shorttext">Status</p>
      "! Status
      status               TYPE ty_status,
    END OF ty_main.

ENDINTERFACE.
