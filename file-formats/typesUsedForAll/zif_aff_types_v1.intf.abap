INTERFACE zif_aff_types_v1 PUBLIC.

  "! <p class="shorttext">ABAP Language Version (Source Code Objects)</p>
  "! ABAP language version for source code objects
  "! $values {@link zif_aff_types_v1.data:co_abap_language_version_src}
  TYPES ty_abap_language_version_src TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">ABAP Language Version (Source Code Objects)</p>
    "! ABAP language version for source code objects. For non-source-code objects use
    "! {@link zif_aff_types_v1.data:ty_abap_language_version }
    BEGIN OF co_abap_language_version_src,
      "! <p class="shorttext">Standard</p>
      "! Standard
      standard          TYPE ty_abap_language_version_src VALUE 'X',
      "! <p class="shorttext">ABAP for Key Users</p>
      "! ABAP for key user extensibility
      key_user          TYPE ty_abap_language_version_src VALUE '2',
      "! <p class="shorttext">ABAP Cloud Development</p>
      "! ABAP cloud development
      cloud_development TYPE ty_abap_language_version_src VALUE '5',
    END OF co_abap_language_version_src.

  "! <p class="shorttext">ABAP Language Version</p>
  "! ABAP language version
  "! $values {@link zif_aff_types_v1.data:co_abap_language_version}
  TYPES ty_abap_language_version TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">ABAP Language Version (Non-Source Code Objects)</p>
    "! ABAP language version for non-source code objects
    BEGIN OF co_abap_language_version,
      "! <p class="shorttext">Standard</p>
      "! Standard
      standard          TYPE ty_abap_language_version VALUE space,
      "! <p class="shorttext">ABAP for Key Users</p>
      "! ABAP for key user extensibility
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
    BEGIN OF ty_header_60_src,
      "! <p class="shorttext">Description</p>
      "! Description of the ABAP object
      "! $required
      description           TYPE ty_description_60,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the ABAP object
      "! $required
      original_language     TYPE sy-langu,
      "! <p class="shorttext">ABAP Language Version (source code object)</p>
      "! ABAP language version for source code objects
      "! $required
      abap_language_version TYPE ty_abap_language_version_src,
    END OF ty_header_60_src.

  TYPES:
    "! <p class="shorttext">Header for Non-Source Code Objects</p>
    "! The header for an ABAP main object (without source code) with a description of 60 characters
    BEGIN OF ty_header_60,
      "! <p class="shorttext">Description</p>
      "! Description of the ABAP object
      "! $required
      description           TYPE ty_description_60,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the ABAP object
      "! $required
      original_language     TYPE sy-langu,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP language version
      "! $required
      abap_language_version TYPE ty_abap_language_version,
    END OF ty_header_60.

  TYPES:
    "! <p class="shorttext">Header for Subobjects</p>
    "! The header for an ABAP  subobject with a description of 60 characters
    BEGIN OF ty_header_only_description,
      "! <p class="shorttext">Description</p>
      "! Description of the ABAP object
      "! $required
      description           TYPE ty_description_60,
    END OF ty_header_only_description.

ENDINTERFACE.
