"! <p class="shorttext synchronized" lang="en">Create eDocument Types</p>
"! eDocument types that can be used in eInvoice Process
INTERFACE zif_aff_edot_v1 PUBLIC.

  "! <p class="shorttext">eDocument Type</p>
  "! Specify eDocument types
  TYPES ty_edoc_type         TYPE c LENGTH 10.

  "! <p class="shorttext">Description</p>
  "! Description
  TYPES ty_short_description TYPE c LENGTH 30.
  TYPES:
    "! <p class="shorttext">SRAL Configuration Type</p>
    "! eDocument SRAL Configuration type
    BEGIN OF ty_sral_configuration,
      "! <p class="shorttext">File Type</p>
      "! File Type
      "! $required
      file_type               TYPE c LENGTH 10,
      "! <p class="shorttext">File Structure Type</p>
      "! File Structure type
      "! $required
      file_structure_type     TYPE c LENGTH 30,
      "! <p class="shorttext">File Description</p>
      "! File Description type
      file_description_type   TYPE c LENGTH 60,
      "! <p class="shorttext">File Cloud Relevancy</p>
      "! File Cloud Relevancy type
      not_cloud_relevant_type TYPE abap_bool,
    END OF ty_sral_configuration.
  "! <p class="shorttext">SRAL Configuration Types</p>
  "! SRAL Configuration types
  TYPES ty_sral_configurations TYPE SORTED TABLE OF ty_sral_configuration WITH UNIQUE KEY file_type.

  TYPES:
    "! <p class="shorttext">eDocument Type Specific Additional Table Type</p>
    "! eDocument Type Specific Additional Table type
    BEGIN OF ty_additional_table,
      "! <p class="shorttext">Sequence Number Type</p>
      "! Sequence Number
      "! $required
      sequence_number_type TYPE c LENGTH 10,
      "! <p class="shorttext">Table Name</p>
      "! Table name
      "! $required
      table_name           TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_additional_table.
  "! <p class="shorttext">eDocument Type Specific Additional Table Types</p>
  "! eDocument Type Specific Additional Table types
  TYPES ty_additional_tables TYPE SORTED TABLE OF ty_additional_table WITH UNIQUE KEY sequence_number_type.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! eDocument Type
    BEGIN OF ty_edoc_information,
      "! <p class="shorttext">eDocument Type</p>
      "! eDoc Type
      "! $required
      edocument_type               TYPE ty_edoc_type,
      "! <p class="shorttext">Description</p>
      "! eDocument Type Description
      "! $required
      edoc_type_desc               TYPE ty_short_description,
      "! <p class="shorttext">Created in Contingency Mode</p>
      "! Contingency
      contingency                  TYPE abap_bool,
      "! <p class="shorttext">eDocument Type Created Using Contingency</p>
      "! Contingency Type
      contingency_type             TYPE c LENGTH 10,
      "! <p class="shorttext">Table Name</p>
      "! Table name
      table_name                   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Preprocess Before Archiving</p>
      "! Archive Prep Req Type
      "! $required
      archive_prep_req_type        TYPE abap_bool,
      "! <p class="shorttext">Additional Selection Fields</p>
      "! Additional selection fields of validation report
      edocument_sral_configuration TYPE ty_sral_configurations,
      "! <p class="shorttext">eDocument Type Specific Additional Tables</p>
      "! eDocument Type Specific Additional Tables
      edoc_spec_additional_table   TYPE ty_additional_tables,
    END OF ty_edoc_information.

  TYPES:
    "! <p class="shorttext">eDocument Type</p>
    "! eDocument Type
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">eDocument Type</p>
      "! eDocument Type
      "! $required
      general_information TYPE ty_edoc_information,

    END OF ty_main.
ENDINTERFACE.
