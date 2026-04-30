INTERFACE zif_aff_ttyp_v1 PUBLIC.

  "! <p class="shorttext">Row Type Kind</p>
  "! Kind of the row type definition
  "! $values {@link zif_aff_ttyp_v1.data:co_row_type_kind}
  "! $default {@link zif_aff_ttyp_v1.data:co_row_type_kind.dictionary_type}
  TYPES ty_row_type_kind TYPE c LENGTH 30.

  CONSTANTS:
    "! <p class="shorttext">Row Type Kind</p>
    "! Kind of the row type definition
    BEGIN OF co_row_type_kind,
      "! <p class="shorttext">Dictionary Type</p>
      "! Line type is a named dictionary type (structure, table type, data element, etc.)
      dictionary_type                TYPE ty_row_type_kind VALUE 'dictionaryType',
      "! <p class="shorttext">Reference to Dictionary Type</p>
      "! Line type is a reference to a named dictionary type
      ref_to_dictionary_type         TYPE ty_row_type_kind VALUE 'refToDictionaryType',
      "! <p class="shorttext">Reference to Class or Interface</p>
      "! Line type is a reference to a class or interface type
      ref_to_class_or_interface_type TYPE ty_row_type_kind VALUE 'refToClassOrInterfaceType',
      "! <p class="shorttext">Range Type on Data Element</p>
      "! Line type is a ranges table based on a data element
      range_type_on_dataelement      TYPE ty_row_type_kind VALUE 'rangeTypeOnDataelement',
      "! <p class="shorttext">Range Type on Predefined Type</p>
      "! Line type is a ranges table based on a predefined ABAP type
      range_type_on_predefined_type  TYPE ty_row_type_kind VALUE 'rangeTypeOnPredefinedType',
      "! <p class="shorttext">Predefined ABAP Type</p>
      "! Line type is a predefined ABAP built-in type
      predefined_abap_type           TYPE ty_row_type_kind VALUE 'predefinedAbapType',
      "! <p class="shorttext">Reference to Predefined ABAP Type</p>
      "! Line type is a reference to a predefined ABAP built-in type
      ref_to_predefined_abap_type    TYPE ty_row_type_kind VALUE 'refToPredefinedAbapType',
    END OF co_row_type_kind.

  "! <p class="shorttext">Access Type</p>
  "! Internal table access type
  "! $values {@link zif_aff_ttyp_v1.data:co_access_type}
  "! $default {@link zif_aff_ttyp_v1.data:co_access_type.standard}
  TYPES ty_access_type TYPE c LENGTH 12.

  CONSTANTS:
    "! <p class="shorttext">Access Type</p>
    "! Internal table access type
    BEGIN OF co_access_type,
      "! <p class="shorttext">Standard</p>
      "! Standard table (access by index or key)
      standard      TYPE ty_access_type VALUE 'standard',
      "! <p class="shorttext">Sorted</p>
      "! Sorted table (access by key with binary search)
      sorted        TYPE ty_access_type VALUE 'sorted',
      "! <p class="shorttext">Hashed</p>
      "! Hashed table (access by unique hash key only)
      hashed        TYPE ty_access_type VALUE 'hashed',
      "! <p class="shorttext">Index</p>
      "! Any index table type (standard or sorted, determined at usage)
      index         TYPE ty_access_type VALUE 'index',
      "! <p class="shorttext">Not Specified</p>
      "! Access type not specified (fully generic table type)
      not_specified TYPE ty_access_type VALUE 'notSpecified',
    END OF co_access_type.

  "! <p class="shorttext">Primary Key Definition</p>
  "! How the primary table key fields are determined
  "! $values {@link zif_aff_ttyp_v1.data:co_prim_key_definition}
  "! $default {@link zif_aff_ttyp_v1.data:co_prim_key_definition.row_type}
  TYPES ty_primary_key_definition TYPE c LENGTH 14.

  CONSTANTS:
    "! <p class="shorttext">Primary Key Definition</p>
    "! How the primary table key fields are determined
    BEGIN OF co_prim_key_definition,
      "! <p class="shorttext">Row Type (All Non-Reference Fields)</p>
      "! Key consists of all non-reference fields of the row type (classic default)
      row_type       TYPE ty_primary_key_definition VALUE 'rowType',
      "! <p class="shorttext">Key Components</p>
      "! Key fields are listed explicitly in key components
      key_components TYPE ty_primary_key_definition VALUE 'keyComponents',
      "! <p class="shorttext">Standard (Empty Key)</p>
      "! Empty primary key; used for standard tables without explicit key definition
      standard       TYPE ty_primary_key_definition VALUE 'standard',
    END OF co_prim_key_definition.

  "! <p class="shorttext">Key Uniqueness</p>
  "! Uniqueness of the primary table key
  "! $values {@link zif_aff_ttyp_v1.data:co_key_kind}
  "! $default {@link zif_aff_ttyp_v1.data:co_key_kind.not_specified}
  TYPES ty_key_kind TYPE c LENGTH 12.

  CONSTANTS:
    "! <p class="shorttext">Key Uniqueness</p>
    "! Uniqueness of the primary table key
    BEGIN OF co_key_kind,
      "! <p class="shorttext">Unique</p>
      "! Duplicate key values are not allowed
      unique        TYPE ty_key_kind VALUE 'unique',
      "! <p class="shorttext">Non-Unique</p>
      "! Duplicate key values are allowed
      non_unique    TYPE ty_key_kind VALUE 'nonUnique',
      "! <p class="shorttext">Not Specified</p>
      "! Uniqueness not specified
      not_specified TYPE ty_key_kind VALUE 'notSpecified',
    END OF co_key_kind.

  "! <p class="shorttext">Secondary Key Access</p>
  "! Access type of a secondary table key
  "! $values {@link zif_aff_ttyp_v1.data:co_sec_key_access}
  "! $default {@link zif_aff_ttyp_v1.data:co_sec_key_access.unique_hashed}
  TYPES ty_sec_key_access TYPE c LENGTH 15.

  CONSTANTS:
    "! <p class="shorttext">Secondary Key Access</p>
    "! Access type of a secondary table key
    BEGIN OF co_sec_key_access,
      "! <p class="shorttext">Unique Hashed</p>
      "! Secondary key is a unique hashed key
      unique_hashed     TYPE ty_sec_key_access VALUE 'uniqueHashed',
      "! <p class="shorttext">Unique Sorted</p>
      "! Secondary key is a unique sorted key
      unique_sorted     TYPE ty_sec_key_access VALUE 'uniqueSorted',
      "! <p class="shorttext">Non-Unique Sorted</p>
      "! Secondary key is a non-unique sorted key
      non_unique_sorted TYPE ty_sec_key_access VALUE 'nonUniqueSorted',
    END OF co_sec_key_access.

  "! <p class="shorttext">Secondary Key Definition</p>
  "! How secondary key fields are determined
  "! $values {@link zif_aff_ttyp_v1.data:co_sec_key_definition}
  "! $default {@link zif_aff_ttyp_v1.data:co_sec_key_definition.row_type}
  TYPES ty_sec_key_definition TYPE c LENGTH 14.

  CONSTANTS:
    "! <p class="shorttext">Secondary Key Definition</p>
    "! How secondary key fields are determined
    BEGIN OF co_sec_key_definition,
      "! <p class="shorttext">Row Type (All Fields)</p>
      "! All fields of the row type are secondary key fields
      row_type       TYPE ty_sec_key_definition VALUE 'rowType',
      "! <p class="shorttext">Key Components</p>
      "! Key fields are listed explicitly in key components
      key_components TYPE ty_sec_key_definition VALUE 'keyComponents',
    END OF co_sec_key_definition.

  "! <p class="shorttext">Further Secondary Keys</p>
  "! Whether additional secondary keys beyond those defined are permitted
  "! $values {@link zif_aff_ttyp_v1.data:co_sec_keys_allowed}
  "! $default {@link zif_aff_ttyp_v1.data:co_sec_keys_allowed.not_allowed}
  TYPES ty_sec_keys_allowed TYPE c LENGTH 12.

  CONSTANTS:
    "! <p class="shorttext">Further Secondary Keys</p>
    "! Whether additional secondary keys are permitted at usage
    BEGIN OF co_sec_keys_allowed,
      "! <p class="shorttext">Not Allowed</p>
      "! No further secondary keys may be defined at usage
      not_allowed TYPE ty_sec_keys_allowed VALUE 'notAllowed',
      "! <p class="shorttext">Allowed</p>
      "! Further secondary keys may be defined at usage
      allowed     TYPE ty_sec_keys_allowed VALUE 'allowed',
    END OF co_sec_keys_allowed.

  TYPES:
    "! <p class="shorttext">Key Components</p>
    "! Explicitly named key field components
    ty_key_components TYPE STANDARD TABLE OF zif_aff_types_v1=>ty_object_name_30 WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Built-In Type</p>
    "! Properties of a predefined ABAP built-in row type
    BEGIN OF ty_built_in_type,
      "! <p class="shorttext">Data Type</p>
      "! ABAP built-in data type
      "! $values {@link zif_aff_ddic_types_v1.data:co_data_type}
      "! $required
      data_type TYPE zif_aff_ddic_types_v1=>ty_data_type,
      "! <p class="shorttext">Length</p>
      "! Length of the built-in type (relevant for length-variable types such as CHAR, NUMC)
      length    TYPE zif_aff_ddic_types_v1=>ty_length,
      "! <p class="shorttext">Decimals</p>
      "! Number of decimal places (relevant for DEC, CURR, QUAN)
      decimals  TYPE zif_aff_ddic_types_v1=>ty_decimals,
    END OF ty_built_in_type.

  TYPES:
    "! <p class="shorttext">Row Type</p>
    "! Definition of the table line type
    BEGIN OF ty_row_type,
      "! <p class="shorttext">Type Kind</p>
      "! Type kind
      "! $required
      type_kind     TYPE ty_row_type_kind,
      "! <p class="shorttext">Type Name</p>
      "! Name of the referenced dictionary type, class, interface, or data element.
      "! Relevant when typeKind is dictionaryType, refToDictionaryType,
      "! refToClassOrInterfaceType, or rangeTypeOnDataelement.
      type_name     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Built-In Type</p>
      "! Details of the built-in ABAP type used as row type.
      "! Relevant when typeKind is predefinedAbapType or refToPredefinedAbapType.
      built_in_type TYPE ty_built_in_type,
      "! <p class="shorttext">Range Type</p>
      "! Name of the predefined ABAP type for the RANGES row.
      "! Relevant when typeKind is rangeTypeOnPredefinedType.
      "! $values {@link zif_aff_ddic_types_v1.data:co_data_type}
      range_type    TYPE zif_aff_ddic_types_v1=>ty_data_type,
    END OF ty_row_type.

  TYPES:
    "! <p class="shorttext">Initialization and Access</p>
    "! Initialization and access
    BEGIN OF ty_initialization_and_access,
      "! <p class="shorttext">Access Type</p>
      "! Internal table access type
      access_type       TYPE ty_access_type,
      "! <p class="shorttext">Initial Row Count</p>
      "! Expected initial number of rows; used for memory pre-allocation
      "! $minimum 0
      initial_row_count TYPE i,
    END OF ty_initialization_and_access.

  TYPES:
    "! <p class="shorttext">Secondary Key</p>
    "! Definition of a single secondary table key
    BEGIN OF ty_secondary_key,
      "! <p class="shorttext">Identifier</p>
      "! Name of the secondary key (up to 30 characters)
      "! $required
      identifier  TYPE c LENGTH 30,
      "! <p class="shorttext">Description</p>
      "! Short description of the secondary key
      description TYPE zif_aff_types_v1=>ty_description_80,
      "! <p class="shorttext">Access Type</p>
      "! Access type of the secondary key
      access_type TYPE ty_sec_key_access,
      "! <p class="shorttext">Key Definition</p>
      "! Key definition
      definition  TYPE ty_sec_key_definition,
      "! <p class="shorttext">Key Components</p>
      "! Explicitly named key fields; relevant when definition is keyComponents
      components  TYPE ty_key_components,
    END OF ty_secondary_key,

    "! <p class="shorttext">Secondary Keys</p>
    "! List of secondary table keys
    ty_secondary_keys TYPE STANDARD TABLE OF ty_secondary_key WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Primary Key</p>
    "! Primary key definition
    BEGIN OF ty_primary_key,
      "! <p class="shorttext">Key Definition</p>
      "! Key definition
      definition TYPE ty_primary_key_definition,
      "! <p class="shorttext">Key Uniqueness</p>
      "! Key uniqueness
      kind       TYPE ty_key_kind,
      "! <p class="shorttext">Alias</p>
      "! Optional alias name for the primary key;
      "! only relevant for sorted or hashed tables
      alias      TYPE c LENGTH 30,
      "! <p class="shorttext">Key Components</p>
      "! Explicitly named key fields; relevant when definition is keyComponents
      components TYPE ty_key_components,
    END OF ty_primary_key.

  TYPES:
    "! <p class="shorttext">Key Settings</p>
    "! Primary and secondary key definitions
    BEGIN OF ty_key_settings,
      "! <p class="shorttext">Primary Key</p>
      "! Primary key definition
      primary_key            TYPE ty_primary_key,
      "! <p class="shorttext">Secondary Keys allowed</p>
      "! Whether additional secondary keys may be defined at usage
      secondary_keys_allowed TYPE ty_sec_keys_allowed,
      "! <p class="shorttext">Secondary Keys</p>
      "! Defined secondary keys
      secondary_keys         TYPE ty_secondary_keys,
    END OF ty_key_settings.

  TYPES:
    "! <p class="shorttext">Table Type</p>
    "! ABAP dictionary table type (TTYP)
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version            TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                    TYPE zif_aff_types_v1=>ty_header_60_no_abap_lv,
      "! <p class="shorttext">Row Type</p>
      "! Definition of the table line type
      "! $required
      row_type                  TYPE ty_row_type,
      "! <p class="shorttext">Initialization and Access</p>
      "! Access type and initial fill size
      initialization_and_access TYPE ty_initialization_and_access,
      "! <p class="shorttext">Key Settings</p>
      "! Primary and secondary key definitions
      key_settings              TYPE ty_key_settings,
    END OF ty_main.

ENDINTERFACE.
