INTERFACE zif_aff_scp1_v1
  PUBLIC.

  "! <p class="shorttext">Type</p>
  TYPES ty_type TYPE c LENGTH 3.


  CONSTANTS:
    "! <p class="shorttext">Type</p>
    BEGIN OF co_type,
      "! <p class="shorttext">BC Set With Direct Value Assignment</p>
      "! A BC Set contains selected data from any number of Customizing objects/tables
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
      "! Type of BC Set i.e. a simple BC Set or hierarchical BC Set, which contains several other BC Sets
      "! $values {@link zif_aff_scp1_v1.data:co_type}
      "! $default {@link zif_aff_scp1_v1.data:co_type.simple}
      type               TYPE ty_type,
      "! <p class="shorttext">Software Component</p>
      "! BC Set is assigned to a software component. If the software component is not installed in the system,
      "! then activation of BC Set is aborted
      software_component TYPE c LENGTH 30,
      "! <p class="shorttext">Minimum Release</p>
      "! To activate the BC Set successfully, installed software component must be at least at this release
      minimum_release    TYPE ty_release,
      "! <p class="shorttext">Maximum Release</p>
      "! To activate the BC Set successfully, installed software component must be within this release
      maximum_release    TYPE ty_release,
    END OF ty_attributes.

  "! <p class="shorttext">Customizing Object Type</p>
  TYPES ty_object_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Allowed Object Types</p>
    BEGIN OF co_object_type,
      "! <p class="shorttext">View Cluster</p>
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

  "! <p class="shorttext">Field Attribute Value</p>
  "! $values {@link zif_aff_scp1_v1.data:co_field_attribute}
  TYPES ty_field_attribute_value TYPE c LENGTH 3.

  CONSTANTS:
    "! <p class="shorttext">Field Attribute</p>
    BEGIN OF co_field_attribute,
      "! <p class="shorttext">Fixed Key Field Value</p>
      "! Fixed value for a key field. The value can not be changed after activation
      fixed_key_field TYPE ty_field_attribute_value VALUE 'FKY',
      "! <p class="shorttext">Changed Key Field Value</p>
      "! Key field in which the user can change the value of the field when activating the data
      key_field       TYPE ty_field_attribute_value VALUE 'KEY',
      "! <p class="shorttext">Default Field Value</p>
      "! Default value of a data field
      default_value   TYPE ty_field_attribute_value VALUE 'USE',
      "! <p class="shorttext">Fixed Field Value</p>
      "! The value of this data field can no longer be changed after an activation
      fixed_value     TYPE ty_field_attribute_value VALUE 'FIX',
      "! <p class="shorttext">Changed Field Value</p>
      "! Data field whose value the user can change when activating
      variable        TYPE ty_field_attribute_value VALUE 'VAR',
    END OF co_field_attribute.

  TYPES:
    "! <p class="shorttext">Data</p>
    "! Data record represented as field-value pair
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
  TYPES ty_row_data TYPE SORTED TABLE OF ty_data WITH UNIQUE KEY field_name.

  "! <p class="shorttext">Language</p>
  TYPES ty_language TYPE sy-langu.

  TYPES:
    "! <p class="shorttext">Selected Language</p>
    "! Details of selected language
    BEGIN OF ty_translation,
      "! <p class="shorttext">Language</p>
      "! Language in which the data record is translated
      language    TYPE ty_language,
      "! <p class="shorttext">Field Name</p>
      "! Name of data record field
      field_name  TYPE c LENGTH 30,
      "! <p class="shorttext">Value</p>
      "! Value of data record field
      field_value TYPE string,
    END OF ty_translation.

  "! <p class="shorttext">Translations</p>
  TYPES ty_translations TYPE SORTED TABLE OF ty_translation WITH UNIQUE KEY language field_name.

  TYPES:
    "! <p class="shorttext">Data Record</p>
    "! Details of selected record
    BEGIN OF ty_record,
      "! <p class="shorttext">Key Value</p>
      "! Key value of a record
      "! $required
      key_value               TYPE string,
      "! <p class="shorttext">Record Is Incomplete</p>
      "! Automatic customizing recording only puts the key fields of a data record or
      "! data records, in the BC Set. Such BC Sets must be post-processed.
      "! Such data records are flagged as incomplete
      incomplete              TYPE abap_bool,
      "! <p class="shorttext">Operation at Activation</p>
      "! Data records which are to be deleted at activation are flagged with value 'L'
      "! $values {@link zif_aff_scp1_v1.data:co_operation_at_activation}
      operation_at_activation TYPE ty_operation_at_activation,
      "! <p class="shorttext">Data</p>
      "! Complete data record of selected key value
      "! $required
      data                    TYPE ty_row_data,
      "! <p class="shorttext">Translations</p>
      "! Translated data records of table or view included in a BC Set
      translations            TYPE ty_translations,
    END OF ty_record.

  "! <p class="shorttext">Data Records</p>
  TYPES ty_records TYPE SORTED TABLE OF ty_record WITH UNIQUE KEY key_value.

  TYPES:
    "! <p class="shorttext">Attributes of Table/View Field</p>
    "! You can define the behavior for field of table/view during activation
    BEGIN OF ty_field_attribute,
      "! <p class="shorttext">Field Name</p>
      "! Name of field in table/view
      "! $required
      field_name            TYPE c LENGTH 30,
      "! <p class="shorttext">Field Attribute</p>
      "! Defines the attribute of field like during BC Set activation, the field value must be copied to database
      "! table or not
      "! $required
      field_attribute_value TYPE ty_field_attribute_value,
    END OF ty_field_attribute.

  TYPES ty_field_attributes TYPE SORTED TABLE OF ty_field_attribute WITH UNIQUE KEY field_name.

  TYPES:
    "! <p class="shorttext">Entity</p>
    "! Details of selected view or table
    BEGIN OF ty_entity,
      "! <p class="shorttext">Entity Name</p>
      "! Table name of each data record
      "! $required
      name             TYPE c LENGTH 30,
      "! <p class="shorttext">Field Attributes</p>
      "! You can define the behavior for field of table/view during activation
      field_attributes TYPE ty_field_attributes,
      "! <p class="shorttext">Data Records</p>
      "! Data records of table or view included in a BC Set
      "! $required
      data_records     TYPE ty_records,
    END OF ty_entity.

  "! <p class="shorttext">Tables and Views for Selected Customizing Object</p>
  TYPES ty_entities TYPE SORTED TABLE OF ty_entity WITH UNIQUE KEY name.

  TYPES:
    "! <p class="shorttext">Customizing Object</p>
    "! Details of selected customizing object
    BEGIN OF ty_customizing_object,
      "! <p class="shorttext">Name</p>
      "! Collections of tables which constitute logical business entities,
      "! and must therefore be maintained and exported together.
      "! $required
      object_name  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Type</p>
      "! Object type is used to classify customizing objects
      "! $values {@link zif_aff_scp1_v1.data:co_object_type}
      "! $required
      object_type  TYPE ty_object_type,
      "! <p class="shorttext">IMG Activity</p>
      "! Customizing object assigned to an IMG Activity
      img_activity TYPE c LENGTH 20,
      "! <p class="shorttext">Entities</p>
      "! Involved tables or views of a Customizing object
      "! $required
      entities     TYPE ty_entities,
    END OF ty_customizing_object.

  "! <p class="shorttext">Customizing Objects/Tables</p>
  "! Customizing objects or tables included in the BC Set
  TYPES ty_customizing_objects TYPE SORTED TABLE OF ty_customizing_object
                               WITH UNIQUE KEY object_name object_type img_activity.

  TYPES:
    "! <p class="shorttext">Sub-BC Set</p>
    "! A hierarchical BC Set comprises several other BC Sets, which can also be hierarchical.
    "! The hierarchy can have any number of levels.
    BEGIN OF ty_sub_bcset,
      "! <p class="shorttext">Name</p>
      "! Name of the BC Set
      name TYPE c LENGTH 32,
    END OF ty_sub_bcset.

  "! <p class="shorttext">Sub-BC Sets</p>
  "! A hierarchical BC Set comprises several other BC Sets, which can also be hierarchical.
  "! The hierarchy can have any number of levels.
  TYPES ty_sub_bcsets TYPE SORTED TABLE OF ty_sub_bcset WITH UNIQUE KEY name.

  TYPES:
    "! <p class="shorttext">Business Configuration Set</p>
    "! Metadata information of BC Set
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Attributes</p>
      "! Header information of BC Set
      "! $required
      attributes          TYPE ty_attributes,
      "! <p class="shorttext">Sub-BC Sets</p>
      "! A hierarchical BC Set comprises several other BC Sets, which can also be hierarchical.
      "! The hierarchy can have any number of levels.
      sub_bc_sets         TYPE ty_sub_bcsets,
      "! <p class="shorttext">Customizing Objects</p>
      "! Customizing objects or tables included in the BC Set
      customizing_objects TYPE ty_customizing_objects,
    END OF ty_main.

ENDINTERFACE.
