INTERFACE zif_aff_types_v1 PUBLIC.

  "! Language
  TYPES language TYPE c LENGTH 2.

  TYPES:
    "! ABAP language version
    BEGIN OF ENUM abap_language_version,
      "! Standard
      standard VALUE IS INITIAL,
      "! ABAP cloud development
      cloud_development VALUE '5',
    END OF ENUM abap_language_version.

  TYPES:
    "! Head to be included in each object type
    BEGIN OF head,
      "! Location of the corresponding JSON schema
      schema TYPE string,
      "! The header for an ABAP main object
      BEGIN OF header,
        "! Description of the ABAP object
        description        TYPE string,
        "! Original language of the ABAP object
        master_language    TYPE language,
        "! ABAP language version
        abap_langu_version TYPE abap_language_version,
      END OF header,
    END OF head.

  "! Description with 60 characters
  TYPES description_60 TYPE c LENGTH 60.

  "! Object name with max. length 30
  TYPES object_name_30 TYPE c LENGTH 30.

ENDINTERFACE.