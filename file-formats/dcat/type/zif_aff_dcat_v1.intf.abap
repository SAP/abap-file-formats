INTERFACE zif_aff_dcat_v1
  PUBLIC.
  CONSTANTS:
    "! <p class="shorttext">Sensitivity Level</p>
    "! Data category sensitivity Level
    BEGIN OF co_categ_senst_lvl,
      "! <p class="shorttext">Sensitive Personal Data</p>
      "! Sensitive Personal Data
      sensitive_personal_data TYPE c LENGTH 1 VALUE 'S',
      "! <p class="shorttext">Business Secret</p>
      "! Business Secret
      business_secret TYPE c LENGTH 1 VALUE 'B',
    END OF co_categ_senst_lvl.

  TYPES:
    "! <p class="shorttext">Data Category Description Type</p>
    "! Attributes of data category description type
    BEGIN OF ty_dcat_text,
      "! <p class="shorttext">Language Code</p>
      "! Language code
      "! $required
      language_code TYPE c LENGTH 1,
      "! <p class="shorttext">Data Category Description</p>
      "! Description of the Data category in selected language
      description   TYPE c LENGTH 80,
    END OF ty_dcat_text,

    "! <p class="shorttext">Data Category Description</p>
    "! Table of all Data Category description
    ty_dcat_description TYPE SORTED TABLE OF ty_dcat_text WITH UNIQUE KEY language_code.

  TYPES:
    "! <p class="shorttext">Data Category Type</p>
    "! $required
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Sensitivity Level</p>
      "! Sensitivity level for data category
      "! $values {@link zif_aff_dcat_v1.data:co_categ_senst_lvl}
      sensitivity_level         TYPE c LENGTH 1,
      "! <p class="shorttext">Data Category Description</p>
      "! Table of all data category description
      data_category_description TYPE ty_dcat_description,
    END OF ty_attributes.

  TYPES:
    "! <p class="shorttext">Data Category</p>
    "! Data Category
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
      "! Attributes of the data category
      "! $required
      attributes     TYPE ty_attributes,
    END OF ty_main.


ENDINTERFACE.
