INTERFACE zif_aff_dtel_v1 PUBLIC.

  TYPES:
    "! <p class="shorttext">Data Element</p>
    "! Data Element (DTEL)
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,

      " TODO, the actual type:
      " reference domain
      " predefined type
      " reference type type
      " reference predefined type

      " TODO: search help name
      " TODO: search help parameters
      " TODO: parameter id
      " TODO: default component name
      " TODO: change document indicator
      " TODO: no input history indicator
      " TODO: bi directional left to right indicator
      " TODO: no bidi filtering
      " TODO: field lablels: short, medium, long, heading
    END OF ty_main.


ENDINTERFACE.
