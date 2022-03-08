INTERFACE zif_aff_sajt_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Header for SAJT Object</p>
    "! The header for an application job template
    BEGIN OF ty_header,
      "! <p class="shorttext">Description</p>
      "! Description of the application job template
      "! $required
      description           TYPE c LENGTH 120,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the application job template
      "! $required
      original_language     TYPE sy-langu,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP language version
      "! $values {@link zif_aff_types_v1.data:co_abap_language_version_cloud}
      "! $default {@link zif_aff_types_v1.data:co_abap_language_version_cloud.standard}
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.

  TYPES:
    "! <p class="shorttext">Application Job Catalog Entry</p>
    "! Name of the application job catalog entry
    ty_catalog_name TYPE c LENGTH 40.

  "! <p class="shorttext">Sign</p>
  "! Include/exclude values (I/E)
  "! $values {@link zif_aff_sajt_v1.data:co_sign}
  TYPES ty_sign TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Sign</p>
    "! Include/exclude values (I/E)
    BEGIN OF co_sign,
      "! <p class="shorttext">Exclude</p>
      "! Exclude values
      exclude TYPE ty_sign VALUE 'E',
      "! <p class="shorttext">Include</p>
      "! Include values
      include TYPE ty_sign VALUE 'I',
    END OF co_sign.

  TYPES:
    "! <p class="shorttext">Entry of Ranges Table</p>
    "! Entry of ranges table
    BEGIN OF ty_value_range_entry,
      "! <p class="shorttext">Sign</p>
      "! Include/exclude values (I/E)
      sign      TYPE  ty_sign,
      "! <p class="shorttext">Option</p>
      "! Operator of the ranges condition (EQ/NE/GE/GT/LE/LT/CP/NP/BT/NB)
      option    TYPE  zif_aff_types_v1=>ty_option,
      "! <p class="shorttext">Low Value</p>
      "! Low value of the ranges condition
      low       TYPE  c LENGTH 255,
      "! <p class="shorttext">High Value</p>
      "! High value of the ranges condition
      high      TYPE  c LENGTH 255,
    END OF ty_value_range_entry.

  TYPES:
    "! <p class="shorttext">Parameter Values</p>
    "! Parameter values as ranges table
    ty_value_ranges_table TYPE STANDARD TABLE OF ty_value_range_entry WITH EMPTY KEY.

  TYPES:
    "! <p class="shorttext">Parameter Name and Values</p>
    "! Name of the parameter and it value as ranges table
    BEGIN OF ty_parameter,
      "! <p class="shorttext">Parameter Name</p>
      "! Name of the parameter
      name         TYPE  c LENGTH 8,
      "! <p class="shorttext">Values</p>
      "! Values of the parameter as ranges table
      value_ranges TYPE ty_value_ranges_table,
    END OF ty_parameter.

  TYPES:
    "! <p class="shorttext">Parameter Table</p>
    "! Table of parameters
    ty_parameter_table TYPE STANDARD TABLE OF ty_parameter WITH KEY name.

  TYPES:
    "! <p class="shorttext">SAJC Object Type</p>
    "! Object type SAJC
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE ty_header,
      "! <p class="shorttext">Application Job Catalog Entry</p>
      "! Name of the application job catalog entry to which the template refers
      "! $required
      catalog_name   TYPE ty_catalog_name,
      "! <p class="shorttext">Parameter Values</p>
      "! Values of the parameters of the class which runs within the job
      parameters     TYPE ty_parameter_table,
    END OF ty_main.
ENDINTERFACE.
