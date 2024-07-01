INTERFACE zif_aff_func_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Component with description</p>
    "! Component with description
    BEGIN OF ty_parameter,
      "! <p class="shorttext">Component Name</p>
      "! Component name
      "! $required
      name        TYPE c LENGTH 30,
      "! <p class="shorttext">Component Description</p>
      "! Component description
      "! $required
      description TYPE c LENGTH 79,
    END OF ty_parameter.


  "! <p class="shorttext">Components with description</p>
  "! Components with description
  TYPES ty_parameters TYPE SORTED TABLE OF ty_parameter WITH UNIQUE KEY name.


  "! <p class="shorttext">Processing Type</p>
  "! Processing type
  "! $values {@link zif_aff_func_v1.data:co_processing_type}
  "! $default {@link zif_aff_func_v1.data:co_processing_type.normal}
  TYPES ty_processing_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Processing Type</p>
    "! Processing type
    BEGIN OF co_processing_type,
      "! <p class="shorttext">Normal</p>
      "! normal
      normal TYPE ty_processing_type VALUE 'N',
      "! <p class="shorttext">RFC</p>
      "! rfc
      rfc    TYPE ty_processing_type VALUE 'R',
      "! <p class="shorttext">Update</p>
      "! update
      update TYPE ty_processing_type VALUE 'U',
    END OF co_processing_type.


  "! <p class="shorttext">RFC Scope</p>
  "! Indicates the scope of function module calls
  "! $values {@link zif_aff_func_v1.data:co_rfc_scope}
  "! $default {@link zif_aff_func_v1.data:co_rfc_scope.not_classified}
  TYPES ty_rfc_scope TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">RFC Scope</p>
    "! Indicates the scope of function module calls
    BEGIN OF co_rfc_scope,
      "! <p class="shorttext">From Same Client And User</p>
      "! From same client and user
      from_same_client_and_user TYPE ty_rfc_scope VALUE 'I',
      "! <p class="shorttext">From Same System</p>
      "! From same system
      from_same_system          TYPE ty_rfc_scope VALUE 'C',
      "! <p class="shorttext">From Any System</p>
      "! From any system
      from_any_system           TYPE ty_rfc_scope VALUE 'E',
      "! <p class="shorttext">Not Classified</p>
      "! Not classified
      not_classified            TYPE ty_rfc_scope VALUE ' ',
    END OF co_rfc_scope.

  "! <p class="shorttext">RFC Version</p>
  "! Indicates the permitted serializations for the function module
  "! $values {@link zif_aff_func_v1.data:co_rfc_version}
  "! $default {@link zif_aff_func_v1.data:co_rfc_version.any}
  TYPES ty_rfc_version TYPE c LENGTH 10.

  CONSTANTS:
    "! <p class="shorttext">RFC Version</p>
    "! Indicates the permitted serializations for the function module
    BEGIN OF co_rfc_version,
      "! <p class="shorttext">Fast Serialization Required</p>
      "! Fast serialization required
      fast_serialization_required TYPE ty_rfc_version VALUE '1',
      "! <p class="shorttext">Any</p>
      "! Any
      any                         TYPE ty_rfc_version VALUE ' ',
    END OF co_rfc_version.


  TYPES:
    "! <p class="shorttext">RFC specific fields</p>
    "! Specific fields for rfc function modules
    BEGIN OF ty_rfc_properties,
      "! <p class="shorttext">BasXml Enabled</p>
      "! When this indicator is set, it shows that the function module for the classic RFC protocol
      "! and the basXML protocol behaves in the same way, from a semantic point of view.
      "! The classic RFC protocol uses a position logic, while the basXML protocol uses a name identification.
      "! $required
      basxml_enabled TYPE abap_bool,
      "! <p class="shorttext">RFC Scope</p>
      "! Indicates the scope of function module calls. Modules whose call scope is not defined explicitly
      "! can be called from anywhere
      "! $required
      rfc_scope      TYPE ty_rfc_scope,
      "! <p class="shorttext">RFC Version</p>
      "! Indicates which serializations are permitted for the function module.
      "! Among other things, the selected serializations determine where the function module can be enhanced
      "! $required
      rfc_version    TYPE ty_rfc_version,
      "! <p class="shorttext">ABAP From Java</p>
      "! ABAP from Java
      abap_from_java TYPE abap_bool,
      "! <p class="shorttext">Java From ABAP</p>
      "! Java from ABAP
      java_from_abap TYPE abap_bool,
      "! <p class="shorttext">Java Remote</p>
      "! Java remote
      java_remote    TYPE abap_bool,
    END OF ty_rfc_properties.

  "! <p class="shorttext">Update Task Kind</p>
  "! Update task kind
  "! $values {@link zif_aff_func_v1.data:co_update_task_kind}
  "! $default {@link zif_aff_func_v1.data:co_update_task_kind.start_immediately}
  TYPES ty_update_task_kind TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Update Task Kind</p>
    "! Update task kind
    BEGIN OF co_update_task_kind,
      "! <p class="shorttext">Start Immediately</p>
      "! Start immediately
      start_immediately            TYPE ty_update_task_kind VALUE '1',
      "! <p class="shorttext">Start Delayed</p>
      "! Start delayed
      start_delayed                TYPE ty_update_task_kind VALUE '2',
      "! <p class="shorttext">Start Immediately No Restart</p>
      "! Start immediately no restart
      start_immediately_no_restart TYPE ty_update_task_kind VALUE '3',
      "! <p class="shorttext">Collective run</p>
      "! Collective Run
      collective_run               TYPE ty_update_task_kind VALUE '5',
      "! <p class="shorttext">Unsupported kind</p>
      "! Unsupported Kind
      unsupported_kind             TYPE ty_update_task_kind VALUE '6',
    END OF co_update_task_kind.

  "! <p class="shorttext">Release State</p>
  "! Release state
  "! $values {@link zif_aff_func_v1.data:co_release_state}
  "! $default {@link zif_aff_func_v1.data:co_release_state.not_released}
  TYPES ty_release_state TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Release State</p>
    "! Release state
    BEGIN OF co_release_state,
      "! <p class="shorttext">Not Released</p>
      "! Function module is not released
      not_released          TYPE ty_release_state VALUE 'N',
      "! <p class="shorttext">Released</p>
      "! Function module is released
      released              TYPE ty_release_state VALUE 'E',
      "! <p class="shorttext">Released SAP-Internally</p>
      "! Function module is released SAP-internally
      released_sap_internal TYPE ty_release_state VALUE 'I',
      "! <p class="shorttext">Obsolete/Deprecated</p>
      "! Function module is obsolete/deprecated
      obsolete              TYPE ty_release_state VALUE 'O',
      "! <p class="shorttext">Planned To Be Released [Obsolete]</p>
      "! Function module is planned to be released [obsolete]
      release_planned       TYPE ty_release_state VALUE 'M',
    END OF co_release_state.

  TYPES:
    "! <p class="shorttext">Update Specific Fields</p>
    "! Specific fields for update function modules
    BEGIN OF ty_update_properties,
      "! <p class="shorttext">Update Task Kind</p>
      "! Update task kind
      "! $required
      update_task_kind TYPE ty_update_task_kind,
    END OF ty_update_properties.


  TYPES:
    "! <p class="shorttext">Object Type FUNC</p>
    "! FUNC object type
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_only_description,
      "! <p class="shorttext">Processing Type</p>
      "! Processing type
      "! $required
      processing_type      TYPE ty_processing_type,
      "! <p class="shorttext">RFC Specific Fields</p>
      "! Specific fields for rfc function modules
      rfc_properties       TYPE ty_rfc_properties,
      "! <p class="shorttext">Update Specific Fields</p>
      "! Specific fields for update function modules
      update_properties    TYPE ty_update_properties,
      "! <p class="shorttext">Release State</p>
      "! Release state
      release_state        TYPE ty_release_state,
      "! <p class="shorttext">Release Date</p>
      "! Release date
      release_date         TYPE sy-datum,
      "! <p class="shorttext">Global</p>
      "! The parameters of this function module are global visible within the function group
      global               TYPE abap_bool,
      "! <p class="shorttext">Exception Classes</p>
      "! Exception classes
      "! $showAlways
      exception_classes    TYPE abap_bool,
      "! <p class="shorttext">Application Of Function Module</p>
      "! Application to which function module is assigned
      application          TYPE c LENGTH 1,
      "! <p class="shorttext">Client</p>
      "! This field is obsolete and should not be filled
      client               TYPE sy-mandt,
      "! <p class="shorttext">Function Exit Active</p>
      "! This function module is registered as function module exit (see SMOD/CMOD)
      "! and the function module exit is active
      active_function_exit TYPE abap_bool,
      "! <p class="shorttext">Include Number</p>
      "! Include number
      "! $required
      include_number       TYPE n LENGTH 2,
      "! <p class="shorttext">Not Executable</p>
      "! If this flag is set, the function module cannot be called.
      "! It is deactivated in the function group
      not_executable       TYPE abap_bool,
      "! <p class="shorttext">Edit-Locked</p>
      "! The function module is not editable
      edit_locked          TYPE abap_bool,
      "! <p class="shorttext">Parameter Descriptions</p>
      "! Parameter descriptions of the function module
      parameters           TYPE ty_parameters,
      "! <p class="shorttext">Exception Descriptions</p>
      "! Exception descriptions of the function module
      exceptions           TYPE ty_parameters,
    END OF ty_main.

ENDINTERFACE.
