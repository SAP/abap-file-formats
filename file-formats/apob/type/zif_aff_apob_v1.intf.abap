INTERFACE zif_aff_apob_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Application object description type</p>
    "! Attributes of Application object description type
    BEGIN OF ty_apob_text,
      "! <p class="shorttext">Language code</p>
      "! Name of language code
      "! $required
      language_code TYPE c LENGTH 1,
      "! <p class="shorttext">Application object description</p>
      "! Description of application object
      description   TYPE c LENGTH 80,
    END OF ty_apob_text,

    "! <p class="shorttext">Application object description table type</p>
    "! Table of all application object description (may be empty)
    ty_app_object_description TYPE SORTED TABLE OF ty_apob_text WITH UNIQUE KEY language_code.



  TYPES:
    "! <p class="shorttext">Application object</p>
    "! Type of application object
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version                 TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Key table / structure</p>
      "! Name of key table or structure for application object
      ao_key_structure               TYPE c LENGTH 30,
      "! <p class="shorttext">SAP object</p>
      "! Name of SAP object
      sap_object_type                TYPE c LENGTH 30,
      "! <p class="shorttext">Data category</p>
      "! Name of data category
      data_category_name             TYPE c LENGTH 30,
      "! <p class="shorttext">ILM object</p>
      "! Name of ILM object
      ilm_object                     TYPE c LENGTH 30,
      "! <p class="shorttext">Application object description</p>
      "! Table of all application object description (may be empty)
      application_object_description TYPE ty_app_object_description,
    END OF ty_main.



ENDINTERFACE.
