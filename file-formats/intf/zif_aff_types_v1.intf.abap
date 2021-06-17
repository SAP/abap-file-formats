INTERFACE zif_aff_types_v1 PUBLIC.

  "! Language
  TYPES ty_language TYPE c LENGTH 2.

  "! ABAP language version
  "!
  "! $values {@link zif_aff_types_v1.data:co_abap_language_version}
  TYPES ty_abap_language_version TYPE c LENGTH 1.

  CONSTANTS:
    "! ABAP language version
    BEGIN OF co_abap_language_version,
      "! Standard
      standard          TYPE ty_abap_language_version VALUE ' ',
      "! ABAP cloud development
      cloud_development TYPE ty_abap_language_version VALUE '5',
    END OF co_abap_language_version.

  TYPES:
    "! The header for an ABAP main object
    BEGIN OF ty_header,
      "! Description of the ABAP object
      description        TYPE string,
      "! Original language of the ABAP object
      master_language    TYPE ty_language,
      "! ABAP language version
      abap_langu_version TYPE ty_abap_language_version,
    END OF ty_header.

  "! Description with 60 characters
  TYPES ty_description_60 TYPE c LENGTH 60.

  "! Object name with max. length 30
  TYPES ty_object_name_30 TYPE c LENGTH 30.

ENDINTERFACE.
