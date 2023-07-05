INTERFACE zif_aff_swcr_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Header</p>
    "! Header
    BEGIN OF ty_header,
      "! $required
      original_language     TYPE zif_aff_types_v1=>ty_original_language,
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version_cloud,
    END OF ty_header.

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
    "! <p class="shorttext">Related Software Component</p>
    "! Related Software Component
    BEGIN OF ty_relation,
      "! <p class="shorttext">Related Software Component</p>
      "! Related Software Component
      "! $required
      software_component TYPE c LENGTH 30,
      "! <p class="shorttext">Relation Type</p>
      "! Relation Type
      "! $required
      type               TYPE ty_relation_type,
    END OF ty_relation.

  "! <p class="shorttext">Relations</p>
  "! Relations
  TYPES ty_relations TYPE SORTED TABLE OF ty_relation WITH UNIQUE KEY software_component.

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
      header         TYPE ty_header,
      "! <p class="shorttext">Relations</p>
      "! Relations
      "! $required
      relations      TYPE ty_relations,
    END OF ty_main.

ENDINTERFACE.
