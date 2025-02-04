"! <p class="shorttext synchronized" lang="en">eDocument Type</p>
"! eDocument types that can be used in eInvoice process
INTERFACE zif_aff_edot_v1 PUBLIC.

  TYPES:
    "! <p class="shorttext">SRAL Configuration Type</p>
    "! SRAL configuration type
    BEGIN OF ty_sral_configuration,
      "! <p class="shorttext">File Type</p>
      "! File type
      "! $required
      file_type         TYPE c LENGTH 10,
      "! <p class="shorttext">File Structure Type</p>
      "! File structure type
      "! $required
      file_structure    TYPE c LENGTH 30,
      "! <p class="shorttext">File Description</p>
      "! File description
      file_description  TYPE c LENGTH 60,
      "! <p class="shorttext">File Cloud Relevancy</p>
      "! File cloud relevancy type
      is_cloud_relevant TYPE abap_bool,
    END OF ty_sral_configuration.
  "! <p class="shorttext">SRAL Configuration</p>
  "! SRAL configuration
  TYPES ty_sral_configurations TYPE SORTED TABLE OF ty_sral_configuration WITH UNIQUE KEY file_type.

  TYPES:
    "! <p class="shorttext">eDocument Type Specific Additional Tables</p>
    "! eDocument type specific additional tables
    BEGIN OF ty_additional_table,
      "! <p class="shorttext">Sequence Number</p>
      "! Sequence number
      "! $required
      sequence_number TYPE c LENGTH 10,
      "! <p class="shorttext">Table Name</p>
      "! Table name
      "! $required
      table_name      TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_additional_table.
  "! <p class="shorttext">eDocument Type Specific Additional Tables</p>
  "! eDocument type specific additional tables
  TYPES ty_additional_tables TYPE SORTED TABLE OF ty_additional_table WITH UNIQUE KEY sequence_number.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_edoc_information,
      "! <p class="shorttext">eDocument Local Table Name</p>
      "! eDocument local table name
      table_name                   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Created in Contingency Mode</p>
      "! Created in contingency mode
      contingency                  TYPE abap_bool,
      "! <p class="shorttext">eDocument Type Created Using Contingency</p>
      "! eDocument type created using contingency
      contingency_type             TYPE c LENGTH 10,
      "! <p class="shorttext">Preprocess Before Archiving</p>
      "! Preprocess before archiving
      archive_prep_req             TYPE abap_bool,
      "! <p class="shorttext">Additional Selection Fields</p>
      "! Additional selection fields of validation report
      edocument_sral_configuration TYPE ty_sral_configurations,
      "! <p class="shorttext">eDocument Type Specific Additional Tables</p>
      "! eDocument type specific additional tables
      edoc_spec_additional_table   TYPE ty_additional_tables,
    END OF ty_edoc_information.
  TYPES:
    "! <p class="shorttext">Header</p>
    "! The header for an ABAP main object (without source code) with a description of 30 characters (no key user)
    BEGIN OF ty_header_30_cloud,
      "! $required
      description           TYPE c LENGTH 30,
      "! $required
      original_language     TYPE zif_aff_types_v1=>ty_original_language,
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version_cloud,
    END OF ty_header_30_cloud.

  TYPES:
    "! <p class="shorttext">eDocument Type</p>
    "! eDocument type
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE ty_header_30_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_edoc_information,

    END OF ty_main.
ENDINTERFACE.
