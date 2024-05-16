INTERFACE zif_aff_apob_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Application Object Description Type</p>
    "! Attributes of Application Object Description Type
    BEGIN OF ty_apob_text,
      "! <p class="shorttext">Language Code</p>
      "! Language Code
      "! $required
      lang    TYPE c LENGTH 1,
      "! <p class="shorttext">Application Object</p>
      "! Application Object Name
      "! $required
      ao_name TYPE c LENGTH 30,
      "! <p class="shorttext">Application Object Description</p>
      "! Application Object Description
      ao_desc TYPE c LENGTH 80,
    END OF ty_apob_text,

    "! <p class="shorttext">Application Object Description Table Type</p>
    "! Table of all Application Object Description (may be empty)
    ty_app_object_description TYPE SORTED TABLE OF ty_apob_text WITH UNIQUE KEY lang ao_name.



  TYPES:
    "! <p class="shorttext">Application Object</p>
    "! Application Object
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version                 TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Application Object</p>
      "! Application Object Name
      "! $required
      ao_name                        TYPE c LENGTH 30,
      "! <p class="shorttext">Key Table / Structure</p>
      "! Key Table / Structure For Application Object
      ao_key_struct                  TYPE c LENGTH 30,
      "! <p class="shorttext">SAP Object</p>
      "! SAP Object
      sap_object_type                TYPE c LENGTH 30,
      "! <p class="shorttext">Data Category</p>
      "! Data Category
      categ_name                     TYPE c LENGTH 30,
      "! <p class="shorttext">ILM Object</p>
      "! ILM Object
      ilm_object                     TYPE c LENGTH 30,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP Language Version
      "! $required
      abap_language_version          TYPE zif_aff_types_v1=>ty_abap_language_version,
      "! <p class="shorttext">Application Object Description</p>
      "! Table of all Application Object Description (may be empty)
      "! $required
      application_object_description TYPE ty_app_object_description,
    END OF ty_main.



ENDINTERFACE.
