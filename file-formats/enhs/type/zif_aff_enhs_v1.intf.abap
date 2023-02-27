INTERFACE zif_aff_enhs_v1
  PUBLIC.

  "! <p class="shorttext">BAdI Enhancement Spot Tool Type</p>
  "! Tool type of the BAdI Enhancement Spot
  "! $values {@link zif_aff_enhs_v1.data:co_tool}
  "! $default {@link zif_aff_enhs_v1.data:co_tool.badi_definition}
  TYPES ty_tool TYPE c LENGTH 10.

  CONSTANTS:
    "! <p class="shorttext">Tool Type</p>
    "! Enhancement Spot tool type
    BEGIN OF co_tool,
      "! <p class="shorttext">BAdI Definition</p>
      "! BAdI definition
      badi_definition TYPE ty_tool VALUE 'BADI_DEF',
    END OF co_tool.

  "! <p class="shorttext">Instantiation of the BAdI Definition</p>
  "! Instantiation of the BAdI definition
  "! $values {@link zif_aff_enhs_v1.data:co_instantiation}
  "! $default {@link zif_aff_enhs_v1.data:co_instantiation.creating_new_instances}
  TYPES ty_instantiation TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Instantiation of the BAdI Definition</p>
    "! Instantiation of the BAdI definition
    BEGIN OF co_instantiation,
      "! <p class="shorttext">Creating New Instances</p>
      "! Creating new instances
      creating_new_instances     TYPE ty_instantiation VALUE 'N',
      "! <p class="shorttext">Reuse Instances</p>
      "! Reuse instances
      reuse_instances            TYPE ty_instantiation VALUE 'S',
      "! <p class="shorttext">Context-Specific Instances</p>
      "! Context-specific instances
      context_specific_instances TYPE ty_instantiation VALUE 'Y',
    END OF co_instantiation.

  "! <p class="shorttext">Filter Type</p>
  "! Type of a badi filter
  "! $values {@link zif_aff_enhs_v1.data:co_filter_type}
  "! $default {@link zif_aff_enhs_v1.data:co_filter_type.string}
  TYPES ty_filter_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Filter Type</p>
    "! Type of the filter
    BEGIN OF co_filter_type,
      "! <p class="shorttext">Integer</p>
      "! Integer
      integer        TYPE ty_filter_type VALUE 'I',
      "! <p class="shorttext">Character-Like</p>
      "! Character-like
      character_like TYPE ty_filter_type VALUE 'C',
      "! <p class="shorttext">String</p>
      "! String
      string         TYPE ty_filter_type VALUE 'S',
      "! <p class="shorttext">Numeric</p>
      "! Numeric
      numeric        TYPE ty_filter_type VALUE 'N',
      "! <p class="shorttext">Packed</p>
      "! Packed
      packed         TYPE ty_filter_type VALUE 'P',
    END OF co_filter_type.

  "! <p class="shorttext">Type of the Value Check Object</p>
  "! Type of the value check object
  "! $values {@link zif_aff_enhs_v1.data:co_value_check_object_type}
  "! $default {@link zif_aff_enhs_v1.data:co_value_check_object_type.data_element}
  TYPES ty_value_check_object_type TYPE string.

  CONSTANTS:
    "! <p class="shorttext">Type of the Value Check Object</p>
    "! Type of the value check object
    BEGIN OF co_value_check_object_type,
      "! <p class="shorttext">Domain</p>
      "! Domain
      domain       TYPE ty_value_check_object_type VALUE 'DOMADD',
      "! <p class="shorttext">Data Element</p>
      "! Data element
      data_element TYPE ty_value_check_object_type VALUE 'DTELDE',
    END OF co_value_check_object_type.

  TYPES:
    "! <p class="shorttext">Value Check Ddic</p>
    "! Value check via domain or data element
    BEGIN OF ty_value_check_ddic,
      "! <p class="shorttext">Type of the Value Check Object</p>
      "! Type of the value check object
      "! $required
      type        TYPE ty_value_check_object_type,
      "! <p class="shorttext">Name of the Value Check Object</p>
      "! Name of the value check object
      "! $required
      object_name TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_value_check_ddic.

  TYPES:
    "! <p class="shorttext">Value Check Class</p>
    "! Value check via class
    BEGIN OF ty_value_check_class,
      "! <p class="shorttext">Name of the Value Check Class</p>
      "! Name of the value check class
      "! $required
      object_name    TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Length of the Value Check</p>
      "! Length of the value check
      length         TYPE i,
      "! <p class="shorttext">Decimal Places of the Value Check</p>
      "! Decimal places of the value check
      decimal_places TYPE i,
    END OF ty_value_check_class.

  TYPES:
    "! <p class="shorttext">Filter</p>
    "! Information about this filter
    BEGIN OF ty_badi_def_filter,
      "! <p class="shorttext">Name of the Filter</p>
      "! Name of the filter
      "! $required
      name                 TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description of the Filter</p>
      "! Description of the filter
      "! $required
      description          TYPE c LENGTH 255,
      "! <p class="shorttext">Type of the Filter</p>
      "! Type of the filter
      "! $required
      type                 TYPE ty_filter_type,
      "! <p class="shorttext">Only constant Filter Values</p>
      "! The filter has only constant filter values
      only_constant_values TYPE abap_bool,
      "! <p class="shorttext">Value Check Ddic</p>
      "! Value check via domain or data element
      value_check_ddic     TYPE ty_value_check_ddic,
      "! <p class="shorttext">Value Check Class</p>
      "! Value check via class
      value_check_class    TYPE ty_value_check_class,
    END OF ty_badi_def_filter.

  TYPES ty_badi_def_filters TYPE STANDARD TABLE OF ty_badi_def_filter WITH DEFAULT KEY.

  "! <p class="shorttext">Example Class</p>
  "! Example class
  TYPES ty_example_class TYPE zif_aff_types_v1=>ty_object_name_30.

  TYPES ty_example_classes TYPE STANDARD TABLE OF ty_example_class WITH DEFAULT KEY.


  TYPES:
    "! <p class="shorttext">BAdI Definition</p>
    "! Information about this BAdI definition
    BEGIN OF ty_badi_def,
      "! <p class="shorttext">Name of the BAdI Definition</p>
      "! Name of the BAdI definition
      "! $required
      name               TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description of the BAdI Definition</p>
      "! Description of the BAdI definition
      "! $required
      description        TYPE c LENGTH 255,
      "! <p class="shorttext">Interface of the BAdI Definition</p>
      "! Interface of the BAdI definition
      "! $required
      interface          TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Instantiation of the BAdI Definition</p>
      "! Instantiation of the BAdI definition
      "! $required
      instantiation      TYPE ty_instantiation,
      "! <p class="shorttext">Single- or Multiple Use BAdI</p>
      "! Indicator whether the BAdI definition is single- or multiple usable
      "! $showAlways
      multiple_use       TYPE abap_bool,
      "! <p class="shorttext">SAP Internal</p>
      "! SAP internal
      sap_internal       TYPE abap_bool,
      "! <p class="shorttext">Example Classes of the BAdI Definition</p>
      "! Example classes of the BAdI definition
      example_classes    TYPE ty_example_classes,
      "! <p class="shorttext">Name of the Default/Fallback Class</p>
      "! Name of the default/fallback class.
      "! The fallback class is executed if no BAdI implementation exists.
      fallback_class     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Limited Filter Use</p>
      "! Limited filter use
      filter_limitation  TYPE abap_bool,
      "! <p class="shorttext">Documentation Id</p>
      "! Documentation Id
      documentation_id   TYPE c LENGTH 60,
      "! <p class="shorttext">Amdp BAdI</p>
      "! BADI is an AMDP BAdI
      amdp               TYPE abap_bool,
      "! <p class="shorttext">Filters of the BAdI Definition</p>
      "! Filters of the BAdI definition
      filters            TYPE ty_badi_def_filters,
    END OF ty_badi_def.

  TYPES ty_badi_defs TYPE STANDARD TABLE OF ty_badi_def WITH DEFAULT KEY.

  TYPES:
    BEGIN OF ty_configuration,
      "! <p class="shorttext">SAP Internal</p>
      "! SAP internal
      sap_internal TYPE abap_bool,
      "! <p class="shorttext">BAdI Enhancement Spot Tool Type</p>
      "! Tool type of the BAdI Enhancement Spot
      "! $required
      tool         TYPE ty_tool,
    END OF ty_configuration,

    "! <p class="shorttext">ENHS Object Type</p>
    "! Object type ENHS
    BEGIN OF ty_main,
      "! $required
      format_version   TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header           TYPE zif_aff_types_v1=>ty_header_100,
      "! <p class="shorttext">Configuration</p>
      "! Configuration-specific fields
      "! $required
      configuration    TYPE ty_configuration,
      "! <p class="shorttext">BAdI Definitions of the BAdI Enhancement Spot</p>
      "! BAdI definitions of the BAdI Enhancement Spot
      badi_definitions TYPE ty_badi_defs,
    END OF ty_main.

ENDINTERFACE.
