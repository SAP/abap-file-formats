INTERFACE zif_aff_scp1_v1
  PUBLIC.

  "! <p class="shorttext">Type</p>
  TYPES ty_type TYPE c LENGTH 3.

  CONSTANTS:
    "! <p class="shxorttext">Type</p>
    BEGIN OF co_type,
      "! <p class="shorttext">BC Set With Direct Value Assignment</p>
      "! A BC Set contains selected data from any number of Customizing Objects/Tables
      simple       TYPE ty_type VALUE 'TMV',
      "! <p class="shorttext">Hierarchical BC Sets</p>
      "! A hierarchical BC Set comprises several other BC Sets, which can also be hierarchical.
      "! The hierarchy can have any number of levels
      hierarchical TYPE ty_type VALUE 'TMP',
    END OF co_type.

  "! <p class="shorttext">Release</p>
  TYPES ty_release TYPE c LENGTH 10.

  CONSTANTS:
    "! <p class="shorttext">Validity</p>
    BEGIN OF co_validity,
      "! <p class="shorttext">All Releases</p>
      all_releases TYPE ty_release VALUE '*',
    END OF co_validity.

  TYPES:
    "! <p class="shorttext">Attribute</p>
    "! Attributes of BC Set
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Type</p>
      "! Type of BC Set i.e. a simple BC Set or Hierarchical BC Set, which contains several other BC Sets
      "! $values {@link zif_aff_scp1_v1.data:co_type}
      "! $default {@link zif_aff_scp1_v1.data:co_type.simple}
      type               TYPE ty_type,
      "! <p class="shorttext">Software Component</p>
      "! BC Set is assigned to a Software Component. If the Software Component is not installed in the system,
      "! then activation of BC Set is aborted
      software_component TYPE c LENGTH 30,
      "! <p class="shorttext">Minimum Release</p>
      "! To activate the BC Set successfully, installed Software Component must be atleast at this Release
      "! $default {@link zif_aff_scp1_v1.data:co_validity.all_releases}
      minimum_release    TYPE ty_release,
      "! <p class="shorttext">Maximum Release</p>
      "! To activate the BC Set successfully, installed Software Component must be within this Release
      "! $default {@link zif_aff_scp1_v1.data:co_validity.all_releases}
      maximum_release    TYPE ty_release,
    END OF ty_attributes.

  "! <p class="shorttext">Customizing Object Type</p>
  TYPES ty_object_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Allowed Customizing Object Types</p>
    BEGIN OF co_object_type,
      "! <p class="shorttext">Viewcluster</p>
      "! A view cluster is a group of maintenance dialogs which are collected in one maintenance unit
      view_cluster                  TYPE ty_object_type VALUE 'C',
      "! <p class="shorttext">Logical Transport Object</p>
      "! Different tables can be grouped together as logical transport objects. Always entire object is exported,
      "! not only explicitly specified table key
      logical_transport_object      TYPE ty_object_type VALUE 'L',
      "! <p class="shorttext">Table (with Text Table)</p>
      "! All tables must have a generated table maintenance dialog
      table_with_text_table         TYPE ty_object_type VALUE 'S',
      "! <p class="shorttext">Individual Transaction Object</p>
      "! Different tables can be grouped together as individual transport objects.
      "! Only explicitly specified table keys are exported
      individual_transaction_object TYPE ty_object_type VALUE 'T',
      "! <p class="shorttext">View</p>
      "! All maintenance views must have a generated table maintenance dialog
      view                          TYPE ty_object_type VALUE 'V',
    END OF co_object_type.

  "! <p class="shorttext">Record is incomplete</p>
  TYPES ty_incomplete TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Record is incomplete</p>
    BEGIN OF co_incomplete,
      "! <p class="shorttext">Record is complete</p>
      "! BC Sets created using Transport or any API, puts all fields of a data record or data records.
      "! Such data records are flagged as complete
      complete   TYPE ty_incomplete VALUE ' ',
      "! <p class="shorttext">Record is incomplete</p>
      "! Automatic Customizing Recording only puts the key fields of a data record or
      "! data records, in the BC Set. Such BC Sets must be post-processed.
      "! Such data records are flagged as incomplete
      incomplete TYPE ty_incomplete VALUE 'U',
    END OF co_incomplete.

  "! <p class="shorttext">Data Record Operation at Activation</p>
  TYPES ty_operation_at_activation TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Data Record Operation at Activation</p>
    BEGIN OF co_operation_at_activation,
      "! <p class="shorttext">Insert/Update</p>
      "! Data records which are to be inserted/updated at activation are flagged with value ''
      insert_or_update TYPE ty_operation_at_activation VALUE '',
      "! <p class="shorttext">Delete</p>
      "! Data records which are to be deleted at activation are flagged with value 'L'
      delete           TYPE ty_operation_at_activation VALUE 'L',
    END OF co_operation_at_activation.

  "! <p class="shorttext">Attribute of a field in a data record</p>
  TYPES ty_additional_info TYPE c LENGTH 3.

  CONSTANTS:
    "! <p class="shorttext">Attribute of a field in a data record</p>
    BEGIN OF co_field_attribute,
      "! <p class="shorttext">Key field that is relevant and has Fixed value</p>
      "! Fixed value for a key field. The value can not be changed after activation
      fixed_key_field TYPE ty_additional_info VALUE 'FKY',
      "! <p class="shorttext">Key field must be specified at activation</p>
      "! Key field in which the user can change the value of the field when activating the data
      key_field       TYPE ty_additional_info VALUE 'KEY',
      "! <p class="shorttext">Value taken from BC Set at activation</p>
      "! Default value of a data field
      default_value   TYPE ty_additional_info VALUE 'USE',
      "! <p class="shorttext">Value from BC Set is not modifiable in source table</p>
      "! The value of this data field can no longer be changed after an activation
      fixed_value     TYPE ty_additional_info VALUE 'FIX',
      "! <p class="shorttext">Value must be specified at activation</p>
      "! Data field whose value the user can change when activating
      variable        TYPE ty_additional_info VALUE 'VAR',
    END OF co_field_attribute.

  TYPES:
    "! <p class="shorttext">Data</p>
    "! Data record represented in Field-Value pair
    BEGIN OF ty_data,
      "! <p class="shorttext">Field Name</p>
      "! Name of data record field
      "! $required
      field_name  TYPE c LENGTH 30,
      "! <p class="shorttext">Value</p>
      "! Value of data record field
      field_value TYPE string,
    END OF ty_data.

  "! <p class="shorttext">Data</p>
  TYPES tt_data TYPE SORTED TABLE OF ty_data WITH UNIQUE KEY field_name.

  TYPES:
    "! <p class="shorttext">Selected Language</p>
    "! Details of selected language
    BEGIN OF ty_translations,
      "! <p class="shorttext">Language</p>
      "! Language in which the data record is translated
      language    TYPE c LENGTH 1,
      "! <p class="shorttext">Field Name</p>
      "! Name of data record field
      field_name  TYPE c LENGTH 30,
      "! <p class="shorttext">Value</p>
      "! Value of data record field
      field_value TYPE string,
    END OF ty_translations.

  "! <p class="shorttext">Translations</p>
  TYPES tt_translations TYPE SORTED TABLE OF ty_translations WITH UNIQUE KEY language field_name.

  TYPES:
    "! <p class="shorttext">Data Record</p>
    "! Details of selected record
    BEGIN OF ty_record,
      "! <p class="shorttext">Key Value</p>
      "! Key value of a record
      "! $required
      key_value               TYPE string,
      "! <p class="shorttext">Record is incomplete</p>
      "! Automatic Customizing Recording only puts the key fields of a data record or
      "! data records, in the BC Set. Such BC Sets must be post-processed.
      "! Such data reocrds are flagged as incomplete
      "! $values {@link zif_aff_scp1_v1.data:co_incomplete}
      incomplete              TYPE abap_bool,
      "! <p class="shorttext">Operation at Activation</p>
      "! Data records which are to be deleted at activation are flagged with value 'L'
      "! $values {@link zif_aff_scp1_v1.data:co_operation_at_activation}
      operation_at_activation TYPE ty_operation_at_activation,
      "! <p class="shorttext">Data</p>
      "! Complete data record of selected key value
      "! $required
      data                    TYPE tt_data,
      "! <p class="shorttext">Translations</p>
      "! Translated data records of Table or View included in a BC Set
      translations            TYPE tt_translations,
    END OF ty_record.

  "! <p class="shorttext">Data Records</p>
  TYPES tt_records TYPE SORTED TABLE OF ty_record WITH UNIQUE KEY key_value.

  TYPES:
    "! <p class="shorttext">Attributes of Table/View Field</p>
    "! You can define the behavior for field of table/view during activation
    BEGIN OF ty_field_attribute,
      "! <p class="shorttext">Field Name</p>
      "! Name of field in Table/View
      "! $required
      field_name      TYPE c LENGTH 30,
      "! <p class="shorttext">Field Attribute</p>
      "! Defines the attribute of field like during BC Set activation, the field value must be copied to database
      "! table or not
      "! $values {@link zif_aff_scp1_v1.data:co_field_attribute}
      "! $required
      additional_info TYPE ty_additional_info,
    END OF ty_field_attribute.

  TYPES tt_field_attributes TYPE SORTED TABLE OF ty_field_attribute WITH UNIQUE KEY field_name.

  TYPES:
    "! <p class="shorttext">Entity</p>
    "! Details of selected View or Table
    BEGIN OF ty_entity,
      "! <p class="shorttext">Entity Name</p>
      "! Table name of each data record
      "! $required
      table_name       TYPE c LENGTH 30,
      "! <p class="shorttext">Field Attributes</p>
      "! You can define the behavior for field of table/view during activation
      "! $required
      field_attributes TYPE tt_field_attributes,
      "! <p class="shorttext">Data Records</p>
      "! Data records of Table or View included in a BC Set
      "! $required
      data_records     TYPE tt_records,
    END OF ty_entity.

  "! <p class="shorttext">Tables and Views for Selected Customizing Object</p>
  TYPES tt_entities TYPE SORTED TABLE OF ty_entity WITH UNIQUE KEY table_name.

  TYPES:
    "! <p class="shorttext">Customizing Object</p>
    "! Details of selected customizing object
    BEGIN OF ty_customizing_object,
      "! <p class="shorttext">Name</p>
      "! Collections of tables which constitute logical business entities,
      "! and must therefore be maintained and exported together.
      "! $required
      object_name  TYPE c LENGTH 30,
      "! <p class="shorttext">Type</p>
      "! Object type is used to classify customizing objects
      "! $values {@link zif_aff_scp1_v1.data:co_object_type}
      "! $required
      object_type  TYPE ty_object_type,
      "! <p class="shorttext">IMG Activity</p>
      "! Customizing object assigned to an IMG Activity
      img_activity TYPE c LENGTH 20,
      "! <p class="shorttext">Entities(Tables or Views)</p>
      "! Involved Tables or Views of a Customizing Object
      "! $required
      entities     TYPE tt_entities,
    END OF ty_customizing_object.

  "! <p class="shorttext">Customizing Objects/Tables</p>
  "! Customizing Objects or Tables included in the BC Set
  TYPES tt_customizing_objects TYPE SORTED TABLE OF ty_customizing_object WITH UNIQUE KEY object_name object_type img_activity.

  TYPES:
    "! <p class="shorttext">Sub-BC Sets</p>
    "! A hierarchical BC Set comprises several other BC Sets, which can also be hierarchical.
    "! The hierarchy can have any number of levels.
    BEGIN OF ty_sub_bcset,
      "! <p class="shorttext">Business Configuration Sets</p>
      "! Name of the BC Set
      bc_set TYPE c LENGTH 32,
    END OF ty_sub_bcset.

  "! <p class="shorttext">Sub-BC Sets</p>
  "! A hierarchical BC Set comprises several other BC Sets, which can also be hierarchical.
  "! The hierarchy can have any number of levels.
  TYPES tt_sub_bcsets TYPE SORTED TABLE OF ty_sub_bcset WITH UNIQUE KEY bc_set.

  TYPES:
    "! <p class="shorttext">Business Configuration Set</p>
    "! Business Configuration Set Definition
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Attributes</p>
      "! Attributes of BC Set
      "! $required
      attributes          TYPE ty_attributes,
      "! <p class="shorttext">Sub-BC Sets</p>
      "! A hierarchical BC Set comprises several other BC Sets, which can also be hierarchical.
      "! The hierarchy can have any number of levels.
      sub_bcsets        TYPE tt_sub_bcsets,
      "! <p class="shorttext">Customizing Objects</p>
      "! Customizing Objects or Tables included in the BC Set
      customizing_objects TYPE tt_customizing_objects,
    END OF ty_main.

ENDINTERFACE.
