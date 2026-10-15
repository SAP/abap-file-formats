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
      object_class TYPE c LENGTH 4,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Authorization Fields</p>
    "! Authorization fields
    BEGIN OF ty_authorization_field,
      "! <p class="shorttext">Authorization Field</p>
      "! Name of the authorization field. An authorization object can contain up to 10 authorization fields.
      "! $required
      authorization_field TYPE zif_aff_auth_types_v1=>ty_auth_field,
      "! <p class="shorttext">Activity Field</p>
      "! By selecting this option, an authorization field can be flagged that can contain activity-related values.
      "! The ACTVT field is always an activity field.
      "! Organizational levels always represent organizational responsibilities, but never activities. Therefore, they
      "! cannot be declared as activity fields.
      "! If fields do not have a search help, it is very difficult to tell whether or not they can contain
      "! activity-related values. Therefore, they cannot be declared as activity fields.
      "! This field is only relevant in cloud systems.
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
  "! $maxItems 10
  TYPES ty_authorization_fields TYPE STANDARD TABLE OF ty_authorization_field WITH DEFAULT KEY.

  "! $values {@link zif_aff_suso_v1.data:co_access_category}
  TYPES ty_access_category      TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Access Category</p>
    "! Access category
    BEGIN OF co_access_category,
      "! <p class="shorttext">Read</p>
      "! Read
      read       TYPE ty_access_category VALUE 'R',
      "! <p class="shorttext">Write</p>
      "! Write
      write      TYPE ty_access_category VALUE 'W',
      "! <p class="shorttext">Value Help</p>
      "! Value help
      value_help TYPE ty_access_category VALUE 'F',
    END OF co_access_category.

  TYPES:
    "! <p class="shorttext">Permitted Activities</p>
    "! Permitted activities can only be defined for authorization field ACTVT if it is contained in the
    "! authorization fields list or for authorization fields that are flagged as activity field.
    BEGIN OF ty_permitted_activity,
      "! <p class="shorttext">Activity</p>
      "! Activity
      "! $required
      activity        TYPE c LENGTH 2,
      "! <p class="shorttext">Access Category</p>
      "! The purpose is to store additional information directly on the authorization field about how the authorization
      "! object should be used when generating business roles.
      "! This classification is used during the generation of roles in order to generate roles that contain read
      "! authorizations only.
      "! This field is only relevant in cloud systems.
      "! $required
      access_category TYPE ty_access_category,
    END OF ty_permitted_activity.

  "! <p class="shorttext">Permitted Activities</p>
  "! Permitted activities
  TYPES ty_permitted_activities TYPE STANDARD TABLE OF ty_permitted_activity WITH DEFAULT KEY.

  "! $values {@link zif_aff_suso_v1.data:co_criticality}
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
      "! $required
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

  "! $values {@link zif_aff_suso_v1.data:co_usage_in_own_context}
  TYPES ty_usage_in_own_context TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Classification for Usage in the OWN Authorization Context</p>
    "! Classification for usage in OWN authorization context
    BEGIN OF co_usage_in_own_context,
      "! <p class="shorttext">Not Allowed</p>
      "! The authorization object must not be used in the OWN authorization context.
      not_allowed                TYPE ty_usage_in_own_context VALUE 'N',
      "! <p class="shorttext">Allowed</p>
      "! The authorization object can be used in the OWN authorization context.
      allowed                    TYPE ty_usage_in_own_context VALUE 'A',
      "! <p class="shorttext">BDEF and authorization object in the same software component</p>
      "! The authorization object can be used in the OWN authorization context if the CDS behavior definition of the RAP
      "! business object and the authorization object both belong to the same software component.
      in_same_software_component TYPE c LENGTH 1              VALUE 'S',
    END OF co_usage_in_own_context.

  "! $values {@link zif_aff_suso_v1.data:co_usage_in_privil_bdef_mode}
  TYPES ty_usage_in_privil_bdef_mode TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Classification for Usage in privileged BDEF Mode</p>
    "! Classification for usage in privileged ABAP CDS behavior definition mode
    BEGIN OF co_usage_in_privil_bdef_mode,
      "! <p class="shorttext">Not Allowed</p>
      "! Authorization object cannot be used in authorization context 'ContextName'. Critical authorization objects are
      "! automatically set to this value.
      not_allowed TYPE ty_usage_in_privil_bdef_mode VALUE 'N',
      "! <p class="shorttext">Allowed</p>
      "! Authorization object can be used in authorization context 'ContextName'.
      allowed     TYPE ty_usage_in_privil_bdef_mode VALUE 'A',
    END OF co_usage_in_privil_bdef_mode.

  TYPES:
    "! <p class="shorttext">Classification for ABAP CDS Behavior Definition</p>
    "! Classification for ABAP CDS behavior definition
    BEGIN OF ty_classification_for_cds_bdef,
      "! <p class="shorttext">Usage in the OWN Authorization Context</p>
      "! In the header of a CDS behavior definition in a RAP business object, an OWN authorization context is specified
      "! using the statement define own authorization context. This statement documents which authorization objects are
      "! checked by the implementation of the RAP business object.
      "! Value is set automatically during creation of the authorization object or when an already existing
      "! authorization without a value for this field is edited.
      "! The explicit selection or change of this value is only possible in SAP internal systems and only in transaction
      "! SU21. For objects with ABAP language version 'ABAP for Cloud Development', no changes can be made.
      "! $required
      usage_in_own_auth_context     TYPE ty_usage_in_own_context,
      "! <p class="shorttext">Usage in the privileged BDEF Mode</p>
      "! In the header part of a ABAP CDS behavior definition of a managed or unmanaged RAP business object, it is
      "! possible to specify 'with privileged mode disabling ContextName'. This causes authorization context
      "! 'ContextName' to be automatically disabled when a RAP business object consumer uses privileged access to the
      "! RAP business object in question.
      "! This classification defines whether an authorization object can be used in authorization context 'ContextName'.
      "! Value is set automatically during creation of the authorization object or when an already existing
      "! authorization without a value for this field is edited.
      "! The explicit selection or change of this value is only possible in SAP internal systems and only in transaction
      "! SU21. For objects with ABAP language version 'ABAP for Cloud Development', no changes can be made.
      "! $required
      usage_in_privileged_bdef_mode TYPE ty_usage_in_privil_bdef_mode,
    END OF ty_classification_for_cds_bdef.

  TYPES:
    "! <p class="shorttext">Authorization Object</p>
    "! Authorization object
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version              TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                      TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information         TYPE ty_general_information,
      "! <p class="shorttext">Authorization Fields</p>
      "! Authorization fields
      authorization_fields        TYPE ty_authorization_fields,
      "! <p class="shorttext">Permitted Activities</p>
      "! Permitted activities. This structure is only relevant if one of the authorization fields is ACTVT or if one
      "! other authorization field is flagged as activity field.
      permitted_activities        TYPE ty_permitted_activities,
      "! <p class="shorttext">Object Attributes</p>
      "! Object attributes
      object_attributes           TYPE ty_object_attributes,
      "! <p class="shorttext">SAP New Relevance</p>
      "! SAP new relevance
      sap_new_relevance           TYPE ty_sap_new_relevance,
      "! <p class="shorttext">Classification for ABAP CDS Behavior Definitions</p>
      "! Classification for ABAP CDS behavior definitions
      classification_for_cds_bdef TYPE ty_classification_for_cds_bdef,
    END OF ty_main.
ENDINTERFACE.
