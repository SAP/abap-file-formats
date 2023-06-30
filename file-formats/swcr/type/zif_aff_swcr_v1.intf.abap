INTERFACE zif_aff_swcr_v1
  PUBLIC.

  "! <p class="shorttext">Relation Type</p>
  "! Relation Type
  "! $values {@link zif_aff_swcr_v1.data:co_relation_type}
  TYPES ty_relation_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Relation Type</p>
    "! Relation Type
    BEGIN OF co_relation_type,
      "! <p class="shorttext">Unrestricted Usage</p>
      "! Unrestricted Usage
      unrestricted                 TYPE ty_relation_type VALUE '1',
      "! <p class="shorttext">Key User Extensibility Usage</p>
      "! Key User Extensibility Usage
      key_user_extensibility_usage TYPE ty_relation_type VALUE '2',
    END OF co_relation_type.

  TYPES:
    "! <p class="shorttext">Relation</p>
    "! Relation
    BEGIN OF ty_relation,
      "! <p class="shorttext">Related Software Component</p>
      "! Related Software Component
      "! $required
      related_software_component TYPE c LENGTH 30,
      "! <p class="shorttext">Relation Type</p>
      "! Relation Type
      "! $required
      relation_type              TYPE ty_relation_type,
    END OF ty_relation.

  "! <p class="shorttext">Relations</p>
  "! Relations
  TYPES ty_relations TYPE SORTED TABLE OF ty_relation WITH UNIQUE KEY related_software_component.

  TYPES:
    "! <p class="shorttext">Software Component Relations</p>
    "! Software Component Relations
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Relations</p>
      "! Relations
      "! $required
      relations      TYPE ty_relations,
    END OF ty_main.

ENDINTERFACE.
