INTERFACE zif_aff_apis_v1
  PUBLIC.

  "! <p class="shorttext">Object Type in Object Directory</p>
  "! Object type in object directory
  TYPES ty_directory_object_type  TYPE c LENGTH 4.

  "! <p class="shorttext">Object Name in Object Directory</p>
  "! Object name in object directory
  TYPES ty_directory_object_name  TYPE c LENGTH 40.

  "! <p class="shorttext">Object Type of Releasable Object</p>
  "! Object type of releasable object
  TYPES ty_releasable_object_type TYPE c LENGTH 20.

  "! <p class="shorttext">Object Name of Releasable Object</p>
  "! Object name of releasable object
  TYPES ty_releasable_object_name TYPE c LENGTH 120.

  "! <p class="shorttext">Release Contract</p>
  "! Release contract
  "! $values {@link zif_aff_apis_v1.data:co_release_contract}
  "! $default {@link zif_aff_apis_v1.data:co_release_contract.c1}
  TYPES ty_release_contract       TYPE c LENGTH 2.

  "! <p class="shorttext">Release State</p>
  "! Release state
  "! $values {@link zif_aff_apis_v1.data:co_release_state}
  "! $default {@link zif_aff_apis_v1.data:co_release_state.released}
  TYPES ty_release_state          TYPE c LENGTH 30.

  "! <p class="shorttext">Feature Toggle ID</p>
  "! Feature toggle ID
  TYPES ty_feature_toggle_id      TYPE c LENGTH 40.

  "! <p class="shorttext">Planned Decommissioning Date</p>
  "! Planned decommissioning date as year month (i.e. YYYY-MM)
  "! $pattern '<[0-9]{4}-[0-9]{2}>'
  TYPES ty_decommissioning_date   TYPE c LENGTH 7.

  "! <p class="shorttext">Successor Concept Name</p>
  "! Successor concept name
  TYPES ty_successor_concept_name TYPE c LENGTH 50.

  "! <p class="shorttext">Local Comment</p>
  "! Local comment
  TYPES ty_local_comment          TYPE string.

  CONSTANTS:
    "! <p class="shorttext">Release Contract</p>
    "! Release contract
    BEGIN OF co_release_contract,
      "! <p class="shorttext">C0 (Extend)</p>
      "! C0 (extend)
      c0 TYPE ty_release_contract VALUE 'C0',
      "! <p class="shorttext">C1 (Use System-Internally)</p>
      "! C1 (Use system-internally)
      c1 TYPE ty_release_contract VALUE 'C1',
      "! <p class="shorttext">C2 (Use as Remote API)</p>
      "! C2 (Use as remote API)
      c2 TYPE ty_release_contract VALUE 'C2',
      "! <p class="shorttext">C3 (Manage Configuration Content)</p>
      "! C3 (Manage configuration content)
      c3 TYPE ty_release_contract VALUE 'C3',
      "! <p class="shorttext">C4 (Use in ABAP-Managed Database Procedures)</p>
      "! C4 (Use in ABAP-managed database procedures)
      c4 TYPE ty_release_contract VALUE 'C4',
    END OF co_release_contract.

  CONSTANTS:
    "! <p class="shorttext">Release State</p>
    "! Release state
    BEGIN OF co_release_state,
      "! <p class="shorttext">Released</p>
      "! Released
      released                     TYPE ty_release_state VALUE 'RELEASED',
      "! <p class="shorttext">Deprecated</p>
      "! Deprecated
      deprecated                   TYPE ty_release_state VALUE 'DEPRECATED',
      "! <p class="shorttext">Decommissioned</p>
      "! Decommissioned
      decommissioned               TYPE ty_release_state VALUE 'DECOMMISSIONED',
      "! <p class="shorttext">Released with Feature Toggle</p>
      "! Released with feature toggle
      released_with_feature_toggle TYPE ty_release_state VALUE 'RELEASED_WITH_FEATURE_TOGGLE',
      "! <p class="shorttext">Not to Be Released</p>
      "! Not to be released
      not_to_be_released           TYPE ty_release_state VALUE 'NOT_TO_BE_RELEASED',
      "! <p class="shorttext">Not to Be Released, Stable</p>
      "! Not to be released, stable
      not_to_be_released_stable    TYPE ty_release_state VALUE 'NOT_TO_BE_RELEASED_STABLE',
    END OF co_release_state.

  TYPES:
    "! <p class="shorttext">Visibility</p>
    "! Visibility
    BEGIN OF ty_visibility,
      "! <p class="shorttext">Use in Cloud Development</p>
      "! Use in cloud development
      use_in_cloud_development TYPE abap_bool,
      "! <p class="shorttext">Use in Key User Apps</p>
      "! Use in key user apps
      use_in_key_user_apps     TYPE abap_bool,
    END OF ty_visibility.

  TYPES:
    "! <p class="shorttext">Directory Object Key</p>
    "! Directory object key
    BEGIN OF ty_directory_object_key,
      "! <p class="shorttext">Object Type in Object Directory</p>
      "! Object type in object directory
      "! $required
      type TYPE ty_directory_object_type,
      "! <p class="shorttext">Object Name in Object Directory</p>
      "! Object name in object directory
      "! $required
      name TYPE ty_directory_object_name,
    END OF ty_directory_object_key.

  TYPES:
    "! <p class="shorttext">Releasable Object Key</p>
    "! Releasable object key
    BEGIN OF ty_releasable_object_key,
      "! <p class="shorttext">Object Type of Releasable Object</p>
      "! Object type of releasable object
      "! $required
      type TYPE ty_releasable_object_type,
      "! <p class="shorttext">Object Name of Releasable Object</p>
      "! Object name of releasable object
      "! $required
      name TYPE ty_releasable_object_name,
    END OF ty_releasable_object_key.

  TYPES:
    "! <p class="shorttext">Successor</p>
    "! Successor
    BEGIN OF ty_successor_api,
      "! <p class="shorttext">Object Type in Object Directory</p>
      "! Object type in object directory
      "! $required
      directory_object_type  TYPE ty_directory_object_type,
      "! <p class="shorttext">Object Name in Object Directory</p>
      "! Object name in object directory
      "! $required
      directory_object_name  TYPE ty_directory_object_name,
      "! <p class="shorttext">Object Type of Releasable Object</p>
      "! Object type of releasable object
      "! $required
      releasable_object_type TYPE ty_releasable_object_type,
      "! <p class="shorttext">Object Name of Releasable Object</p>
      "! Object name of releasable object
      "! $required
      releasable_object_name TYPE ty_releasable_object_name,
    END OF ty_successor_api.

  "! <p class="shorttext">Successors</p>
  "! Successors
  TYPES ty_successor_apis TYPE SORTED TABLE OF ty_successor_api WITH UNIQUE KEY directory_object_type
    directory_object_name releasable_object_type releasable_object_name.

  TYPES:
    "! <p class="shorttext">Successor Information</p>
    "! Successor information
    BEGIN OF ty_successor_information,
      "! <p class="shorttext">Successor Concept Name</p>
      "! Successor concept name
      successor_concept_name TYPE ty_successor_concept_name,
      "! <p class="shorttext">Successor APIs</p>
      "! Successor APIs
      successor_apis         TYPE ty_successor_apis,
    END OF ty_successor_information.

  TYPES:
    "! <p class="shorttext">API Release State</p>
    "! API release state
    BEGIN OF ty_api_release_state,
      "! <p class="shorttext">Release Contract</p>
      "! Release contract
      "! $required
      release_contract             TYPE ty_release_contract,
      "! <p class="shorttext">Release State</p>
      "! Release state
      "! $required
      release_state                TYPE ty_release_state,
      "! <p class="shorttext">Local Comment</p>
      "! Local comment
      local_comment                TYPE ty_local_comment,
      "! <p class="shorttext">Visibility</p>
      "! Visibility
      visibility                   TYPE ty_visibility,
      "! <p class="shorttext">Feature Toggle ID</p>
      "! Feature toggle ID
      feature_toggle_id            TYPE ty_feature_toggle_id,
      "! <p class="shorttext">Planned Decommissioning Date</p>
      "! Planned decommissioning date
      planned_decommissioning_date TYPE ty_decommissioning_date,
      "! <p class="shorttext">Successor Information</p>
      "! Successor information
      successor_information        TYPE ty_successor_information,
    END OF ty_api_release_state.

  "! <p class="shorttext">API Release States</p>
  "! API release states
  TYPES ty_api_release_states TYPE SORTED TABLE OF ty_api_release_state WITH UNIQUE KEY release_contract.

  TYPES:
    "! <p class="shorttext">API</p>
    "! API
    BEGIN OF ty_api,
      "! <p class="shorttext">Releasable Object Key</p>
      "! Releasable object key
      "! $required
      releasable_object_key TYPE ty_releasable_object_key,
      "! <p class="shorttext">API Release States</p>
      "! API release states
      "! $required
      api_release_states    TYPE ty_api_release_states,
    END OF ty_api.

  "! <p class="shorttext">APIs</p>
  "! APIs
  TYPES ty_apis TYPE SORTED TABLE OF ty_api WITH UNIQUE KEY releasable_object_key.

  TYPES:
    "! <p class="shorttext">API Release State of Objects</p>
    "! API release state of objects
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60_no_abap_lv,
      "! <p class="shorttext">Directory Object Key</p>
      "! Directory object key
      "! $required
      directory_object_key TYPE ty_directory_object_key,
      "! <p class="shorttext">APIs</p>
      "! APIs
      apis                 TYPE ty_apis,
    END OF ty_main.

ENDINTERFACE.
