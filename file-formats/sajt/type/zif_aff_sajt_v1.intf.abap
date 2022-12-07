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
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version_cloud,
    END OF ty_header.

  TYPES:
    "! <p class="shorttext">Application Job Catalog Entry</p>
    "! Name of the application job catalog entry
    ty_catalog_name TYPE c LENGTH 40.

  TYPES:
    "! <p class="shorttext">Entry of Ranges Table</p>
    "! Entry of ranges table
    BEGIN OF ty_value_range_entry,
      "! <p class="shorttext">Sign</p>
      "! Include/exclude values (I/E)
      "! $required
      sign   TYPE  zif_aff_types_v1=>ty_sign,
      "! <p class="shorttext">Option</p>
      "! Operator of the ranges condition (EQ/NE/GE/GT/LE/LT/CP/NP/BT/NB)
      "! $required
      option TYPE  zif_aff_types_v1=>ty_option,
      "! <p class="shorttext">Low Value</p>
      "! Low value of the ranges condition
      "! $showAlways
      low    TYPE  c LENGTH 255,
      "! <p class="shorttext">High Value</p>
      "! High value of the ranges condition
      high   TYPE  c LENGTH 255,
    END OF ty_value_range_entry.
  TYPES:
    "! <p class="shorttext">Parameter Values</p>
    "! Parameter values as ranges table
    ty_value_ranges_table TYPE STANDARD TABLE OF ty_value_range_entry WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Parameter Details</p>
    "! Name of the parameter and its value
    BEGIN OF ty_single_value_parameter,
      "! <p class="shorttext">Name</p>
      "! Name of the parameter
      "! $required
      name  TYPE  c LENGTH 8,
      "! <p class="shorttext">Value</p>
      "! Value of the parameter
      "! $required
      value TYPE  c LENGTH 255,
    END OF ty_single_value_parameter.
  TYPES:
    "! <p class="shorttext">Table of Parameters with Single Value</p>
    "! Table of parameters with single value
    ty_single_value_param_table TYPE STANDARD TABLE OF ty_single_value_parameter WITH KEY name.

  TYPES:
    "! <p class="shorttext">Parameter Details</p>
    "! Name of the parameter and its values as ranges table
    BEGIN OF ty_value_ranges_parameter,
      "! <p class="shorttext">Name</p>
      "! Name of the parameter
      "! $required
      name         TYPE  c LENGTH 8,
      "! <p class="shorttext">Values</p>
      "! Values of the parameter as ranges table
      "! $required
      value_ranges TYPE ty_value_ranges_table,
    END OF ty_value_ranges_parameter.
  TYPES:
    "! <p class="shorttext">Table of Parameters with Value Ranges</p>
    "! Table of parameters with value ranges
    ty_value_ranges_param_table TYPE STANDARD TABLE OF ty_value_ranges_parameter WITH KEY name.

  TYPES:
    "! <p class="shorttext">Parameters</p>
    "! List of parameters
    BEGIN OF ty_parameters,
      "! <p class="shorttext">Parameters with Single Value</p>
      "! List of parameters with single value
      single_value_parameters TYPE ty_single_value_param_table,
      "! <p class="shorttext">Parameters with Value Ranges</p>
      "! List of parameters with value ranges
      value_ranges_parameters TYPE ty_value_ranges_param_table,
    END OF ty_parameters.

  TYPES:
    "! <p class="shorttext">Application Job Template</p>
    "! Attributes of the application job template
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE ty_header,
      "! <p class="shorttext">Job Catalog Entry</p>
      "! Name of the application job catalog entry to which the template refers
      "! $required
      catalog_name   TYPE ty_catalog_name,
      "! <p class="shorttext">Parameters</p>
      "! Parameters of the class which runs within the job
      parameters     TYPE ty_parameters,
    END OF ty_main.
ENDINTERFACE.
