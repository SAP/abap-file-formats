INTERFACE zif_aff_xslt_v1 PUBLIC .

  "! <p class="shorttext">Transformation Type</p>
  "! Transformation type
  "! $values {@link zif_aff_xslt_v1.data:co_transformation_type}
  "! $default {@link zif_aff_xslt_v1.data:co_transformation_type.xslt_program}
  TYPES ty_transformation_type TYPE c LENGTH 20.

  CONSTANTS:
    "! <p class="shorttext">Transformation Type</p>
    "! Transformation type
    BEGIN OF co_transformation_type,
      "! <p class="shorttext">XSLT Program</p>
      "! XSLT Program
      xslt_program          TYPE ty_transformation_type VALUE 'XSLTProgram',
      "! <p class="shorttext">Simple Transformation</p>
      "! Simple Transformation
      simple_transformation TYPE ty_transformation_type VALUE 'SimpleTransformation',
    END OF co_transformation_type.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Transformation Type</p>
      "! Transformation type
      transformation_type TYPE ty_transformation_type,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Transformation</p>
    "! Transformation
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information TYPE ty_general_information,
    END OF ty_main.

ENDINTERFACE.
