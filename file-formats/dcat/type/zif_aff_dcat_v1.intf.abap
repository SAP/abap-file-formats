INTERFACE zif_aff_dcat_v1
  PUBLIC.

  CONSTANTS:
    "! <p class="shorttext">Sensitivity Level</p>
    "! Data category sensitivity level
    BEGIN OF co_categ_senst_lvl,
      "! <p class="shorttext">Personal Data</p>
      "! Personal data
      personal_data           TYPE c LENGTH 1 VALUE '',
      "! <p class="shorttext">Sensitive Personal Data</p>
      "! Sensitive personal data
      sensitive_personal_data TYPE c LENGTH 1 VALUE 'S',
    END OF co_categ_senst_lvl.

  TYPES:
    "! <p class="shorttext">Data Category Type</p>
    "! $required
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Sensitivity Level</p>
      "! Sensitivity level for data category
      "! $values { @link zif_aff_dcat_v1.data:co_categ_senst_lvl }
      "! $default { @link zif_aff_dcat_v1.data:co_categ_senst_lvl.personal_data }
      sensitivity_level TYPE c LENGTH 1,
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
