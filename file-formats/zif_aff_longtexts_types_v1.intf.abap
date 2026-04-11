"! <p class="shorttext synchronized" lang="en">Long text types</p>
"! Types for AFF long texts
INTERFACE zif_aff_longtexts_types_v1 PUBLIC.

  TYPES:
    "! <p class="shorttext">Long Text Line</p>
    "! Long text line with format and content
    BEGIN OF ty_line,
      "! <p class="shorttext">Format</p>
      "! Paragraph format, max. length 2
      "! $required
      format TYPE c LENGTH 2,
      "! <p class="shorttext">Line</p>
      "! Long text line content, max. length 72
      "! $required
      line   TYPE c LENGTH 72,
    END OF ty_line,
    "! <p class="shorttext">Long Text Lines</p>
    "! Long text lines
    ty_lines TYPE STANDARD TABLE OF ty_line WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">ABAP Daemon</p>
    "! ABAP daemon
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Start Type</p>
      "! Start type
      lines          TYPE ty_lines,
    END OF ty_main.

ENDINTERFACE.
