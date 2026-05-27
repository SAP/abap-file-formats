INTERFACE zif_aff_bdef_v1 PUBLIC.

  TYPES:
    "! <p class="shorttext">Extended Behavior Definition</p>
    "! Extended Behavior Definition
    BEGIN OF ty_extended_behavior_def,
      "! <p class="shorttext">Name</p>
      "! Name
      name TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_extended_behavior_def.

  TYPES:
    "! <p class="shorttext">Object Type BDEF</p>
    "! Bdef object type
    BEGIN OF ty_main,
      "! $required
      format_version              TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                      TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">Extended Behavior Definition</p>
      "! Extended Behavior Definition
      extended_behavior_defintion TYPE ty_extended_behavior_def,
    END OF ty_main.

ENDINTERFACE.
