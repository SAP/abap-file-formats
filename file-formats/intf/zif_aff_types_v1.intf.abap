INTERFACE zif_aff_types_v1 PUBLIC .


  types:
    "! Language
    language type c length 2.

  types:
    "! ABAP language version
    begin of enum abap_language_version ,
      "! Standard
      standard value is initial,
      "! ABAP cloud development
      cloud_development value '5',
    end of enum abap_language_version.


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

  types:
    "! Description with 60 characters
    description_60    type c length 60.

  types:
    "! Object name with max. length 30
    object_name_30 type c length 30.

ENDINTERFACE.