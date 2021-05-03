INTERFACE zif_aff_types_v1 PUBLIC .

  types:
    begin of enum abap_language_version ,
      standard,
      cloud_development,
    end of enum abap_language_version.


  TYPES:
    "! Head to be included in each object type
    BEGIN OF head,
      "! Location of the corresponding JSON schema
      schema TYPE string,
      "! The header for an ABAP main object
      BEGIN OF header,
        "! Description of the ABAP main object
        description        TYPE string,
        "! Master language of the ABAP main object
        master_language    TYPE syst_langu,
        "! ABAP language version (standard, keyUser or cloudDevelopment)
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
