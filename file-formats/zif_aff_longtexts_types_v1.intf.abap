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

ENDINTERFACE.
