INTERFACE zif_aff_apob_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Application Object Type</p>
    "! $required
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Key Table or Structure</p>
      "! Name of key table or structure for application object
      ao_key_structure TYPE c LENGTH 30,
      "! <p class="shorttext">SAP Object</p>
      "! Name of the SAP object
      sap_object       TYPE c LENGTH 30,
      "! <p class="shorttext">Data Category</p>
      "! Name of the data category
      data_category    TYPE c LENGTH 30,
      "! <p class="shorttext">ILM Object</p>
      "! Name of the ILM object
      ilm_object       TYPE c LENGTH 30,
    END OF ty_attributes.

  TYPES:
    "! <p class="shorttext">Application Object</p>
    "! Type of application object
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Attributes</p>
      "! Attributes of the application object
      "! $required
      attributes     TYPE ty_attributes,
    END OF ty_main.

ENDINTERFACE.
