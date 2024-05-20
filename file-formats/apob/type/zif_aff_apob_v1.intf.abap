INTERFACE zif_aff_apob_v1
  PUBLIC .
  TYPES:
    "! <p class="shorttext">Application Object description type</p>
    "! Attributes of Application Object description type
    BEGIN OF ty_apob_text,
      "! <p class="shorttext">Language Code</p>
      "! Language Code
      "! $required
      language_code TYPE c LENGTH 1,
      "! <p class="shorttext">Application Object description</p>
      "! Application Object description
      description   TYPE c LENGTH 80,
    END OF ty_apob_text,

    "! <p class="shorttext">Application Object description table type</p>
    "! Table of all Application Object description (may be empty)
    ty_app_object_description TYPE SORTED TABLE OF ty_apob_text WITH UNIQUE KEY language_code.



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
      "! <p class="shorttext">Key Table / Structure</p>
      "! Key Table / Structure For Application Object
      ao_key_structure               TYPE c LENGTH 30,
      "! <p class="shorttext">SAP Object</p>
      "! SAP Object
      sap_object_type                TYPE c LENGTH 30,
      "! <p class="shorttext">Data Category</p>
      "! Data Category
      data_category_name                  TYPE c LENGTH 30,
      "! <p class="shorttext">ILM Object</p>
      "! ILM Object
      ilm_object                     TYPE c LENGTH 30,
      "! <p class="shorttext">Application Object description</p>
      "! Table of all Application Object description (may be empty)
      "! $required
      application_object_description TYPE ty_app_object_description,
    END OF ty_main.



ENDINTERFACE.
