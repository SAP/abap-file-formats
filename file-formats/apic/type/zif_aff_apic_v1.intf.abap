INTERFACE if_aff_apic_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">API Catalog Properties</p>
    "! API Catalog properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Format version</p>
      "! Format version
      "! $required
      format_version TYPE if_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE if_aff_types_v1=>ty_header_60_cloud,
    END OF ty_main.
ENDINTERFACE.
