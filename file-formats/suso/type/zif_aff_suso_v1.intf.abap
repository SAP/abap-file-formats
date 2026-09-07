"! AFF type for object SUSO
INTERFACE zif_aff_suso_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Object Class</p>
      "! Name of the authorization object class with a length of up to four characters. An authorization object class
      "! contains authorization objects from a given application area. Every object is assigned to exactly one class.
      "! This assignment has no functional meaning. It is required however in order to display an object in role
      "! maintenance.
      "! For authorization objects with ABAP language version 'ABAP for Cloud Development', the authorization object
      "! class will be set to 'CPAE' and cannot be changed.
      "! Caution: Authorization objects that should not be used any more, regardless of which application area they are
      "! from, should be assigned to object class 'AAAA' (obsolete authorization objects). This only applies to
      "! authorization objects with ABAP language version 'Standard ABAP'.
      "! $required
      object_class             TYPE c LENGTH 4,
      "! <p class="shorttext">Object Class Description</p>
      "! Description of the authorization object class
      object_class_description TYPE c LENGTH 60,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Authorization Fields</p>
    "! Authorization fields
    BEGIN OF ty_authorization_field,
      "! <p class="shorttext">Authorization Field</p>
      "! Name of the authorization field. An authorization object can contain up to 10 authorization fields.
      "! $required
      authorization_field TYPE if_aff_auth_types_v1=>ty_auth_field,
      "! <p class="shorttext">Activity Field</p>
      "! By selecting this option, an authorization field can be flagged that can contain activity-related values.
      "! The ACTVT field is always an activity field.
      "! Organizational levels always represent organizational responsibilities, but never activities. Therefore, they
      "! cannot be declared as activity fields.
      "! If fields do not have a search help, it is very difficult to tell whether or not they can contain
      "! activity-related values. Therefore, they cannot be declared as activity fields.
      is_activity_field   TYPE abap_bool,
      "! <p class="shorttext">Search Help</p>
      "! If the search help for the authorization field returns unsuitable selection results in the current
      "! authorization object, an alternative search help can be maintained for the field, in order to select suitable
      "! values for the object/field combination. This object/field search help always has priority over the search help
      "! for the field.
      search_help         TYPE c LENGTH 30,
    END OF ty_authorization_field.

  "! <p class="shorttext">Authorization Fields</p>
  "! Authorization fields
  TYPES ty_authorization_fields TYPE SORTED TABLE OF ty_authorization_field WITH UNIQUE KEY authorization_field.

  "! $values {@link zif_aff_suso_v1.data:co_access_category}
  "! $default {@link zif_aff_suso_v1.data:co_access_category.not_classified}
  TYPES ty_access_category      TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Access Category</p>
    "! Access category
    BEGIN OF co_access_category,
      "! <p class="shorttext">Read</p>
      "! Read
      read           TYPE ty_access_category VALUE 'R',
      "! <p class="shorttext">Write</p>
      "! Write
      write          TYPE ty_access_category VALUE 'W',
      "! <p class="shorttext">Value Help</p>
      "! Value help
      value_help     TYPE ty_access_category VALUE 'F',
      "! <p class="shorttext">Others</p>
      "! Others
      others         TYPE ty_access_category VALUE 'O',
      "! <p class="shorttext">Not Classified</p>
      "! Not classified
      not_classified TYPE ty_access_category VALUE ' ',
    END OF co_access_category.

  TYPES:
    "! <p class="shorttext">Permitted Activities</p>
    "! Permitted activities
    BEGIN OF ty_permitted_activity,
      "! <p class="shorttext">Activity</p>
      "! Activity
      activity        TYPE c LENGTH 2,
      "! <p class="shorttext">Description</p>
      "! Description of the activity
      description     TYPE c LENGTH 30,
      "! <p class="shorttext">Access Category</p>
      "! The purpose is to store additional information directly on the authorization field about how the authorization
      "! object should be used when generating business roles.
      "! This classification is used during the generation of roles in order to generate roles that contain read
      "! authorizations only.
      "! This function is only supported in SAP S/4HANA Cloud Public Edition and SAP BTP ABAP Environment.
      access_category TYPE ty_access_category,
    END OF ty_permitted_activity.

  "! <p class="shorttext">Permitted Activities</p>
  "! Permitted activities
  TYPES ty_permitted_activities TYPE SORTED TABLE OF ty_permitted_activity WITH UNIQUE KEY activity.

  "! $values {@link zif_aff_suso_v1.data:co_criticality}
  "! $default {@link zif_aff_suso_v1.data:co_criticality.not_critical}
  TYPES ty_criticality          TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Criticality</p>
    "! Criticality
    BEGIN OF co_criticality,
      "! <p class="shorttext">Critical</p>
      "! Critical
      critical     TYPE ty_criticality VALUE 'C',
      "! <p class="shorttext">Not Critical</p>
      "! Not critical
      not_critical TYPE ty_criticality VALUE 'N',
    END OF co_criticality.

  "! $values {@link zif_aff_suso_v1.data:co_class_copy_to_default_data}
  "! $default {@link zif_aff_suso_v1.data:co_class_copy_to_default_data.without_restriction}
  TYPES ty_class_copy_to_default_data TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Classification for Copy to Default Data</p>
    "! Classification for copy to default data
    BEGIN OF co_class_copy_to_default_data,
      "! <p class="shorttext">Without Restriction</p>
      "! Without restriction
      without_restriction           TYPE ty_class_copy_to_default_data VALUE ' ',
      "! <p class="shorttext">If Application and Object are in the same Application Component</p>
      "! If application and object are in the same application component
      if_in_same_appl_component     TYPE ty_class_copy_to_default_data VALUE 'A',
      "! <p class="shorttext">If Application and Object are in the same Software Component</p>
      "! If application and object are in the same software component
      if_in_same_software_component TYPE ty_class_copy_to_default_data VALUE 'S',
      "! <p class="shorttext">If Application and Object are in the same Software Package</p>
      "! If application and object are in the same software package
      if_in_same_software_package   TYPE ty_class_copy_to_default_data VALUE 'P',
      "! <p class="shorttext">Not Copied from Trace Data</p>
      "! Not copied from trace data
      not_copied_from_trace_data    TYPE ty_class_copy_to_default_data VALUE 'N',
    END OF co_class_copy_to_default_data.

  TYPES:
    "! <p class="shorttext">Object Attributes</p>
    "! Object attributes
    BEGIN OF ty_object_attributes,
      "! <p class="shorttext">Criticality</p>
      "! The classification in this field determines whether the default status of the authorization object can be set
      "! to 'No Authorization Check'.
      "! This default status is rejected for all objects that are considered to be critical. Authorization objects from
      "! the application areas Basis (S_*) and HR (P_* and PLOG*) are generally considered to be critical. Their
      "! classification cannot be changed. This also applies for objects that have already been delivered.
      "! For authorization objects with ABAP language version 'ABAP for Cloud Development', this function is not
      "! supported.
      criticality                TYPE ty_criticality,
      "! <p class="shorttext">Classification for Copy to Default Data</p>
      "! When switching to change mode in transaction SU22 or press the 'Retrieve' button in the ADT editors for SUSH,
      "! SUSI or TRAN, all authorization objects that the authorization trace registered in the context of the
      "! application currently being processed and from the data model of the application (not available for all
      "! applications), are added to the object list if they are not already in it.
      "! Adding objects to the object list of any application does not make sense for all objects however. A condition
      "! can therefore be defined for adding objects or in order to prevent them from being added.
      "! For authorization objects with ABAP language version 'ABAP for Cloud Development', this function is not
      "! supported.
      class_copy_to_default_data TYPE ty_class_copy_to_default_data,
    END OF ty_object_attributes.

  TYPES:
    "! <p class="shorttext">SAP_NEW Relevance</p>
    "! SAP_NEW relevance
    BEGIN OF ty_sap_new_relevance,
      "! <p class="shorttext">Authorization Object is relevant to SAP_NEW</p>
      "! The role 'SAP_NEW' contains authorization objects that are checked additionally in a new release in existing
      "! applications. This ensures that users with SAP_NEW assignment will still be able to use their usual
      "! applications without authorization problems after an upgrade has taken place, and before the authorization
      "! default values and roles have been updated in transaction SU25, steps 2a to 2d.
      "! If the object being edited is used for additional authorization checks in existing applications, it is
      "! necessary to select the checkbox in order to mark the object as relevant for SAP_NEW. Otherwise the SAP_NEW
      "! role would be incomplete.
      "! For authorization objects with ABAP language version 'ABAP for Cloud Development', this function is not
      "! supported.
      is_relevant_to_sap_new TYPE abap_bool,
    END OF ty_sap_new_relevance.

  TYPES:
    "! <p class="shorttext">Authorization Object</p>
    "! Authorization object
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information  TYPE ty_general_information,
      "! <p class="shorttext">Authorization Fields</p>
      "! Authorization fields
      authorization_fields TYPE ty_authorization_fields,
      "! <p class="shorttext">Permitted Activities</p>
      "! Permitted activities
      permitted_activities TYPE ty_permitted_activities,
      "! <p class="shorttext">Object Attributes</p>
      "! Object attributes
      object_attributes    TYPE ty_object_attributes,
      "! <p class="shorttext">SAP New Relevance</p>
      "! SAP new relevance
      sap_new_relevance    TYPE ty_sap_new_relevance,
    END OF ty_main.
ENDINTERFACE.
