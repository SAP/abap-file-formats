INTERFACE zif_aff_aifs_v1
  PUBLIC.

  "! $values { @link zif_aff_aifs_v1.data:co_error_handling }
  "! $default { @link zif_aff_aifs_v1.data:co_error_handling.ignore_data }
  TYPES ty_error_handling_type TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_error_handling,
      "! <p class="shorttext">Treat As Error</p>
      "! Treat as error if check is not successful
      trigger_error TYPE ty_error_handling_type VALUE '',
      "! <p class="shorttext">Ignore Data</p>
      "! Ignore data if check is not successful
      ignore_data   TYPE ty_error_handling_type VALUE 'I',
    END OF co_error_handling.

  "! $values { @link zif_aff_aifs_v1.data:co_condition_type }
  "! $default { @link zif_aff_aifs_v1.data:co_condition_type.alt_fld }
  TYPES ty_condition_type TYPE c LENGTH 5.
  CONSTANTS:
    BEGIN OF co_condition_type,
      "! <p class="shorttext">Use Alternative Field Name(s) for Field Name(s) or Value Mapping</p>
      "! Use alternative field name(s) for field name(s) or value mapping
      alt_fld      TYPE ty_condition_type VALUE 'ALTFN',
      "! <p class="shorttext">Use Alternative Value Mapping</p>
      "! Use alternative value mapping
      alt_vmap     TYPE ty_condition_type VALUE 'ALTVM',
      "! <p class="shorttext">Use Alternative Value Mapping with Alternative Field Name(s)</p>
      "! Use alternative value mapping with alternative field name(s)
      alt_vmap_fld TYPE ty_condition_type VALUE 'ALTVF',
      "! <p class="shorttext">Ignore Value Mapping - Use Alternative Field Name</p>
      "! Ignore value mapping and use alternative field name
      ignore_vmap  TYPE ty_condition_type VALUE 'IGNVM',
      "! <p class="shorttext">Empty Value</p>
      "! Empty value
      empty_value  TYPE ty_condition_type VALUE 'EMPTY',
    END OF co_condition_type.

  "! $values { @link zif_aff_aifs_v1.data:co_check_ba }
  "! $default { @link zif_aff_aifs_v1.data:co_check_ba.before }
  TYPES ty_check_ba TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_check_ba,
      "! <p class="shorttext">Before</p>
      "! Check before
      before TYPE c LENGTH 1 VALUE 'B',
      "! <p class="shorttext">After</p>
      "! Check after
      after  TYPE c LENGTH 1 VALUE 'A',
    END OF co_check_ba.

  TYPES:
    "! <p class="shorttext">Structure Mapping Details</p>
    "! Structure mapping details
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Namespace</p>
      "! Namespace of the structure mapping
      "! $required
      namespace             TYPE c LENGTH 15,
      " (type /aif/if_ddic_struct_raw)
      "! <p class="shorttext">Data Structure</p>
      "! Data structure
      "! $required
      data_structure        TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type /aif/if_ddic_struct)
      "! <p class="shorttext">Mapped Data Structure</p>
      "! Mapped data structure
      mapped_data_structure TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Check Fieldlist</p>
    "! Check fieldlist
    BEGIN OF ty_field,
      "! <p class="shorttext">Number</p>
      "! Number
      "! $required
      number     TYPE n LENGTH 3,
      "! <p class="shorttext">Field Path</p>
      "! Field path
      "! $required
      field_path TYPE string,
    END OF ty_field.

  TYPES:
     "! <p class="shorttext">Check Fieldlist</p>
     "! Check fieldlist
     ty_fieldlist TYPE STANDARD TABLE OF ty_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Condition Field</p>
    "! Condition field
    BEGIN OF ty_condition_field,
      "! <p class="shorttext">Number</p>
      "! Number
      "! $required
      number TYPE n LENGTH 3,
      " Specifies a field in the source or destination structure which will be handover to the check
      "! <p class="shorttext">Field</p>
      "! Field
      "! $required
      field  TYPE string,
    END OF ty_condition_field.

  TYPES:
     "! <p class="shorttext">Condition Fields</p>
     "! Condition fields
     ty_condition_fields TYPE STANDARD TABLE OF ty_condition_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Alternative Field</p>
    "! Alternative field
    BEGIN OF ty_alternative_field,
      "! <p class="shorttext">Number</p>
      "! Number
      "! $required
      number       TYPE n LENGTH 3,
      "! <p class="shorttext">Field</p>
      "! Field
      "! $required
      field        TYPE string,
      "! <p class="shorttext">Offset</p>
      "! Offset
      offset       TYPE n LENGTH 4,
      "! <p class="shorttext">Field Length</p>
      "! Field length
      field_length TYPE n LENGTH 4,
    END OF ty_alternative_field.

  TYPES:
   "! <p class="shorttext">Alternative Fields</p>
   "! Alternative fields
    ty_alternative_fields TYPE STANDARD TABLE OF ty_alternative_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Condition</p>
    "! Condition
    BEGIN OF ty_condition,
      "! <p class="shorttext">Check</p>
      "! Check
      "! $required
      check                     TYPE c LENGTH 40,
      "! <p class="shorttext">Numeric ID</p>
      "! Numeric ID
      "! $required
      numeric_id                TYPE n LENGTH 3,
      "! <p class="shorttext">Condition Scenario</p>
      "! Condition scenario
      condition_scenario        TYPE c LENGTH 5,
      "! <p class="shorttext">Condition Type</p>
      "! Condition type
      "! $required
      condition_type            TYPE ty_condition_type,
      "! <p class="shorttext">Alternative Value Mapping</p>
      "! Alternative value mapping
      alternative_value_mapping TYPE c LENGTH 40,
      "! <p class="shorttext">Field Name for Data Link</p>
      "! Field name for data link
      fieldname_link            TYPE c LENGTH 120,
      "! <p class="shorttext">Condition Fields</p>
      "! Fieldlist of condition fields
      condition_fields          TYPE ty_condition_fields,
      "! <p class="shorttext">Alternative Fields</p>
      "! Alternative fields
      alternative_fields        TYPE ty_alternative_fields,
    END OF ty_condition.

  TYPES:
     "! <p class="shorttext">Conditions</p>
     "! Conditions
     ty_conditions TYPE STANDARD TABLE OF ty_condition WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Indirect Mapping Selection</p>
    "! Indirect mapping selection
    BEGIN OF ty_indirect_mapping_selection,
      "! <p class="shorttext">Selection Field</p>
      "! Selection field
      selection_field  TYPE c LENGTH 120,
      "! <p class="shorttext">Operator</p>
      "! Operator
      operator         TYPE zif_aff_types_v1=>ty_option,
      "! <p class="shorttext">Field for Comparison</p>
      "! Comparison field
      comparison_field TYPE c LENGTH 120,
      "! <p class="shorttext">AIF Fix Value For Selection</p>
      "! AIF fix value for selection
      aif_fixvalue     TYPE c LENGTH 40,
    END OF ty_indirect_mapping_selection.

  TYPES:
    "! <p class="shorttext">Indirect Mapping</p>
    "! Indirect mapping
    BEGIN OF ty_indirect_mapping,
      "! <p class="shorttext">Table</p>
      "! Table
      table                        TYPE c LENGTH 45,
      "! <p class="shorttext">Indirect Mapping Selection 1</p>
      "! Indirect mapping selection
      indirect_mapping_selection_1 TYPE ty_indirect_mapping_selection,
      "! <p class="shorttext">Indirect Mapping Selection 2</p>
      "! Indirect mapping selection
      indirect_mapping_selection_2 TYPE ty_indirect_mapping_selection,
      "! <p class="shorttext">Indirect Mapping Selection 3</p>
      "! Indirect mapping selection
      indirect_mapping_selection_3 TYPE ty_indirect_mapping_selection,
    END OF ty_indirect_mapping.


  TYPES:
    "! <p class="shorttext">Source Field</p>
    "! Source field
    BEGIN OF ty_field_mapping_field,
      "! <p class="shorttext">Field Number</p>
      "! Field number
      "! $required
      field_number TYPE n LENGTH 3,
      "! <p class="shorttext">Field</p>
      "! Field
      "! $required
      field        TYPE string,
      "! <p class="shorttext">Offset</p>
      "! Offset
      offset       TYPE n LENGTH 4,
      "! <p class="shorttext">Field Length</p>
      "! Field length
      field_length TYPE n LENGTH 4,
      "! <p class="shorttext">Check Before/After</p>
      "! Check before or after
      check_ba     TYPE ty_check_ba,
    END OF ty_field_mapping_field.

  TYPES:
     "! <p class="shorttext">Source Fields</p>
     "! Fieldlist of source fields
     ty_field_mapping_fields TYPE STANDARD TABLE OF ty_field_mapping_field WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Field Mapping</p>
    "! Field mapping
    BEGIN OF ty_field_mapping,
      "! <p class="shorttext">Mapped Data Structure Field</p>
      "! Field in mapped data structure
      "! $required
      mapped_field           TYPE string,
      "! <p class="shorttext">Numeric ID</p>
      "! Numeric ID
      "! $required
      numeric_id             TYPE n LENGTH 3,
      "! <p class="shorttext">Offset</p>
      "! Offset
      field_offset           TYPE n LENGTH 4,
      "! <p class="shorttext">Field Length</p>
      "! Field length
      field_length           TYPE n LENGTH 4,
      "! <p class="shorttext">Separator</p>
      "! Separator
      separator              TYPE c LENGTH 20,
      "! <p class="shorttext">Data Element for Conversion</p>
      "! Data element for conversion
      conversion_dataelement TYPE c LENGTH 30,
      "! <p class="shorttext">Conversion Routine</p>
      "! Conversion routine
      conversion_routine     TYPE c LENGTH 5,
      "! <p class="shorttext">Direction of Conversion</p>
      "! Direction of conversion
      conversion_direction   TYPE c LENGTH 1,
      "! <p class="shorttext">Field Name for Data Link</p>
      "! Field name for data link
      fieldname_link         TYPE c LENGTH 120,
      "! <p class="shorttext">Fix Value</p>
      "! Fix value
      fix_value              TYPE c LENGTH 40,
      "! <p class="shorttext">Value Mapping</p>
      "! Value mapping
      value_mapping          TYPE c LENGTH 40,
      "! <p class="shorttext">Indirect Mapping</p>
      "! Indirect mapping
      indirect_mapping       TYPE ty_indirect_mapping,
      "! <p class="shorttext">Source Fields</p>
      "! Fieldlist of source fields
      source_fieldlist       TYPE ty_field_mapping_fields,
      "! <p class="shorttext">Conditions</p>
      "! Conditions
      conditions             TYPE ty_conditions,
    END OF ty_field_mapping.

  TYPES:
     "! <p class="shorttext">Field Mappings</p>
     "! Field mappings
     ty_field_mappings TYPE STANDARD TABLE OF ty_field_mapping WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Check</p>
    "! Check
    BEGIN OF ty_check,
      "! <p class="shorttext">Check</p>
      "! Check
      "! $required
      check             TYPE c LENGTH 40,
      "! <p class="shorttext">Numeric ID</p>
      "! Numeric ID
      "! $required
      numeric_id        TYPE n LENGTH 3,
      "! <p class="shorttext">Check Source Data</p>
      "! Check source data
      check_source_data TYPE abap_bool,
      "! <p class="shorttext">Check Behavior</p>
      "! Check behavior
      check_behaviour   TYPE ty_error_handling_type,
      "! <p class="shorttext">Field Name for Data Link</p>
      "! Field name for data link
      fieldname_link    TYPE c LENGTH 120,
      "! <p class="shorttext">Check Fieldlist</p>
      "! Check fieldlist
      check_fieldlist   TYPE ty_fieldlist,
    END OF ty_check.

  TYPES:
     "! <p class="shorttext">Checks</p>
     "! Checks
     ty_checks TYPE STANDARD TABLE OF ty_check WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Mapping Information</p>
    "! Structure mapping information
    BEGIN OF ty_mapping_information,
      "! <p class="shorttext">Display Name</p>
      "! Display name
      "! $required
      name                  TYPE string,
      "! <p class="shorttext">Numeric ID</p>
      "! Numeric ID
      "! $required
      numeric_id            TYPE n LENGTH 3,
      " (type /aif/if_ddic_struct_raw)
      "! <p class="shorttext">Data Structure</p>
      "! Data structure
      "! $required
      data_structure        TYPE zif_aff_types_v1=>ty_object_name_30,
      " (type /aif/if_ddic_struct)
      "! <p class="shorttext">Mapped Data Structure</p>
      "! Mapped data structure
      "! $required
      mapped_data_structure TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Move Corresponding Fields</p>
      "! Move corresponding fields
      move_corresponding    TYPE abap_bool,
      "! <p class="shorttext">Copy Fields Only</p>
      "! Copy fields only
      copy_fields           TYPE abap_bool,
      "! <p class="shorttext">Indirect Mapping</p>
      "! Indirect mapping
      indirect_mapping      TYPE abap_bool,
      "! <p class="shorttext">Class Executed Before Mapping</p>
      "! Class executed before mapping
      class_before_mapping  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Class Executed After Mapping</p>
      "! Class executed after mapping
      class_after_mapping   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Checks</p>
      "! Checks
      checks                TYPE ty_checks,
      "! <p class="shorttext">Field Mapping</p>
      "! Field mapping
      field_mapping         TYPE ty_field_mappings,
    END OF ty_mapping_information.

  TYPES:
     "! <p class="shorttext">Mapping Informations</p>
     "! Mapping informations
     ty_mapping_informations TYPE STANDARD TABLE OF ty_mapping_information WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Structure Mapping</p>
    "! Structure mapping
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Mapping Information</p>
      "! Mapping information
      "! $required
      mapping_information TYPE ty_mapping_informations,
    END OF ty_main.
ENDINTERFACE.
