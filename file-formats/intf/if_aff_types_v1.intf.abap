INTERFACE if_aff_types_v1 PUBLIC.

  "! <p class="shorttext">Language</p>
  "! Language
  TYPES ty_language TYPE c LENGTH 1.

  "! <p class="shorttext">ABAP Language Version (Source Code Objects)</p>
  "! ABAP language version for source code objects
  "! $values {@link if_aff_types_v1.data:co_abap_language_version_sco}
  TYPES ty_abap_language_version_sco TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">ABAP Language Version (Source Code Objects)</p>
    "! ABAP language version for source code objects
    BEGIN OF co_abap_language_version_sco,
      "! <p class="shorttext">Standard</p>
      "! Standard
      standard          TYPE ty_abap_language_version_sco VALUE 'X',
      "! <p class="shorttext">Key User</p>
      "! Key user
      key_user          TYPE ty_abap_language_version_sco VALUE '2',
      "! <p class="shorttext">ABAP Cloud Development</p>
      "! ABAP cloud development
      cloud_development TYPE ty_abap_language_version_sco VALUE '5',
    END OF co_abap_language_version_sco.

  "! <p class="shorttext">ABAP Language Version (Non-Source Code Objects)</p>
  "! ABAP language version for non-source code objects
  "! $values {@link if_aff_types_v1.data:co_abap_language_version}
  TYPES ty_abap_language_version TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">ABAP Language Version (Non-Source Code Objects)</p>
    "! ABAP language version for non-source code objects
    BEGIN OF co_abap_language_version,
      "! <p class="shorttext">Standard</p>
      "! Standard
      standard          TYPE ty_abap_language_version VALUE ' ',
      "! <p class="shorttext">Key User</p>
      "! Key user
      key_user          TYPE ty_abap_language_version VALUE '2',
      "! <p class="shorttext">ABAP Cloud Development</p>
      "! ABAP cloud development
      cloud_development TYPE ty_abap_language_version VALUE '5',
    END OF co_abap_language_version.

  "! <p class="shorttext">Description</p>
  "! Description with 60 characters
  TYPES ty_description_60 TYPE c LENGTH 60.

  "! <p class="shorttext">Object Name</p>
  "! Object name with max. length 30
  TYPES ty_object_name_30 TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">Header for Source Code Objects</p>
    "! The header for an ABAP main object (with source code) with a description of 60 characters
    BEGIN OF ty_header_60_sco,
      "! <p class="shorttext">Description</p>
      "! Description of the ABAP object
      "! $required
      description        TYPE ty_description_60,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the ABAP object
      "! $required
      master_language    TYPE ty_language,
      "! <p class="shorttext">ABAP Language Version (source code object)</p>
      "! ABAP language version for source code objects
      "! $required
      abap_language_version TYPE ty_abap_language_version_sco,
    END OF ty_header_60_sco.

  TYPES:
    "! <p class="shorttext">Header for Non-Source Code Objects</p>
    "! The header for an ABAP main object (without source code) with a description of 60 characters
    BEGIN OF ty_header_60,
      "! <p class="shorttext">Description</p>
      "! Description of the ABAP object
      "! $required
      description        TYPE ty_description_60,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the ABAP object
      "! $required
      master_language    TYPE ty_language,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP language version
      "! $required
      abap_language_version TYPE ty_abap_language_version,
    END OF ty_header_60.

ENDINTERFACE.
