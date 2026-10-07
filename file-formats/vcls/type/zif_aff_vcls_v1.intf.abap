INTERFACE zif_aff_vcls_v1
  PUBLIC.

  "! <p class="shorttext">Hierarchical Operation Dependent Handling</p>
  TYPES ty_hier_oper_dep_handling TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Hierarchical Operation Dependent Handling</p>
    BEGIN OF co_hier_oper_dep_handling,
      "! <p class="shorttext">With Confirmation</p>
      "! Dependent entries will be processed with user confirmation via a popup
      with_confirmation TYPE ty_hier_oper_dep_handling VALUE ' ',
      "! <p class="shorttext">Disabled</p>
      "! Hierarchical operations are performed without processing dependent objects
      skip_dependents   TYPE ty_hier_oper_dep_handling VALUE 'X',
      "! <p class="shorttext">Automatic</p>
      "! Dependent entries are automatically included and processed without user confirmation
      automatic         TYPE ty_hier_oper_dep_handling VALUE 'A',
    END OF co_hier_oper_dep_handling.

  "! <p class="shorttext">Data Read Type</p>
  TYPES ty_data_read_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Data Read Type</p>
    BEGIN OF co_data_read_type,
      "! <p class="shorttext">Complete</p>
      "! All objects in the view cluster are read when data loading is triggered
      complete TYPE ty_data_read_type VALUE ' ',
      "! <p class="shorttext">Subtree</p>
      "! Only the subtree containing the current navigation target is read
      subtree  TYPE ty_data_read_type VALUE 'T',
    END OF co_data_read_type.

  "! <p class="shorttext">View Cluster Entry Selection Type</p>
  TYPES ty_vc_entry_selection_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">View Cluster Entry Selection Type</p>
    BEGIN OF co_vc_entry_selection_type,
      "! <p class="shorttext">Header</p>
      "! Root entry of the view cluster. No parent selection is required for navigation.
      header   TYPE ty_vc_entry_selection_type VALUE 'R',
      "! <p class="shorttext">Multiple Selection</p>
      "! Multiple parent entries can be selected to navigate into this dependent object
      multiple TYPE ty_vc_entry_selection_type VALUE 'M',
      "! <p class="shorttext">Single Selection</p>
      "! Exactly one parent entry must be selected to navigate into this dependent object
      single   TYPE ty_vc_entry_selection_type VALUE 'S',
    END OF co_vc_entry_selection_type.

  "! <p class="shorttext">Field Dependency Type</p>
  TYPES ty_field_dependency_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Field Dependency Type</p>
    BEGIN OF co_field_dependency_type,
      "! <p class="shorttext">Navigation Relationship (Foreign Key Relationship)</p>
      "! Gets dependent entries in navigation and hierarchical operations (delete, copy) for
      "! a higher-level entry.
      navigation_key_relationship   TYPE ty_field_dependency_type VALUE ' ',
      "! <p class="shorttext">Check for Allowed Field Value in Function Part</p>
      "! Foreign key check for fields not hierarchically dependent on each other.
      check_allowed_value_func_part TYPE ty_field_dependency_type VALUE 'C',
      "! <p class="shorttext">Read-Only Field Read Relationship</p>
      "! The field is a read-only or subset field and not a key field.
      read_only_field_relationship  TYPE ty_field_dependency_type VALUE 'S',
      "! <p class="shorttext">Copy Initial Subset Field Selection Conditions</p>
      "! Copies the initial selection condition for a common subset field shared between
      "! two views/tables.
      copy_initial_subset_selection TYPE ty_field_dependency_type VALUE 'I',
    END OF co_field_dependency_type.

  "! <p class="shorttext">Event Code</p>
  TYPES ty_event_code TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Event Codes</p>
    "! Predefined hook points in the view cluster maintenance framework (domain VCLMEVENT)
    BEGIN OF co_event_code,
      "! <p class="shorttext">Instead of the Standard 'Locking/Unlocking' Routine</p>
      "! Event EQ - Instead of the Standard 'Locking/Unlocking' Routine
      replace_std_lock_unlock        TYPE ty_event_code VALUE 'EQ',
      "! <p class="shorttext">Instead of the Standard 'Specify Selection Conditions' Routine</p>
      "! Event GR - Instead of the Standard 'Specify Selection Conditions' Routine
      replace_std_get_selection      TYPE ty_event_code VALUE 'GR',
      "! <p class="shorttext">Instead of the Standard 'Cluster Data Read' Routine</p>
      "! Event RE - Instead of the Standard 'Cluster Data Read' Routine
      replace_std_read               TYPE ty_event_code VALUE 'RE',
      "! <p class="shorttext">Instead of the Standard 'Cluster Data Save' Routine</p>
      "! Event SV - Instead of the Standard 'Cluster Data Save' Routine
      replace_std_save               TYPE ty_event_code VALUE 'SV',
      "! <p class="shorttext">Instead of the Standard 'New or Changed Entries check' Routine</p>
      "! Event CK - Instead of the Standard 'New or Changed Entries check' Routine
      replace_std_check              TYPE ty_event_code VALUE 'CK',
      "! <p class="shorttext">After Initializing Global Variables, Field Symbols, Etc.</p>
      "! Event 01 - After Initializing Global Variables, Field Symbols, Etc.
      after_init_globals             TYPE ty_event_code VALUE '01',
      "! <p class="shorttext">After Reading or Specifying the Selection Conditions</p>
      "! Event 02 - After Reading or Specifying the Selection Conditions
      after_get_sel_conditions       TYPE ty_event_code VALUE '02',
      "! <p class="shorttext">Before Navigation to Another Object</p>
      "! Event 03 - Before Navigation to the View Maintenance Dialog for an Object
      before_view_maintenance        TYPE ty_event_code VALUE '03',
      "! <p class="shorttext">Before Saving the Data in the Database</p>
      "! Event 04 - Before Saving the Data in the Database
      before_save                    TYPE ty_event_code VALUE '04',
      "! <p class="shorttext">After Saving the Data in the Database</p>
      "! Event 05 - After Saving the Data in the Database
      after_save                     TYPE ty_event_code VALUE '05',
      "! <p class="shorttext">After Lock or Unlock in the Main Function Module</p>
      "! Event 06 - After Lock or Unlock in the Main Function Module
      after_lock_unlock              TYPE ty_event_code VALUE '06',
      "! <p class="shorttext">After Leaving the View Maintenance Dialog for an Object</p>
      "! Event 07 - After Leaving the View Maintenance Dialog for an Object
      after_view_maintenance         TYPE ty_event_code VALUE '07',
      "! <p class="shorttext">End of Processing (Leave the Main Function Module)</p>
      "! Event 08 - End of Maintenance process.
      "! Use to reset user-defined variables or perform any post-processing activities.
      end_of_maintenance             TYPE ty_event_code VALUE '08',
      "! <p class="shorttext">Before Navigation Popup for Missing Subset Entries</p>
      "! Event 09 - Before Navigation Popup for Missing Subset Entries
      before_navigation_subset_popup TYPE ty_event_code VALUE '09',
      "! <p class="shorttext">During Navigation After the Target Object Is Determined</p>
      "! Event 10 - During Navigation After the Target Object Is Determined
      navigation_target_determined   TYPE ty_event_code VALUE '10',
      "! <p class="shorttext">Get Dependent Entries for Hierarchical Operations</p>
      "! Event 11 - Get Dependent Entries for Hierarchical Operations
      get_dependent_entries          TYPE ty_event_code VALUE '11',
      "! <p class="shorttext">Get Superior Entries for Hierarchical Operations</p>
      "! Event 12 - Get Superior Entries for Hierarchical Operations
      get_superior_entries           TYPE ty_event_code VALUE '12',
    END OF co_event_code.

  TYPES:
    "! <p class="shorttext">Cluster Object Level Text</p>
    "! Language-dependent description of a cluster level object
    BEGIN OF ty_cluster_obj_level_text,
      "! <p class="shorttext">Language</p>
      "! Language key for the object text
      "! $required
      language    TYPE sy-langu,
      "! <p class="shorttext">Object Text</p>
      "! Description for the cluster level objects
      "! Overrides the DDIC short text when present.
      object_text TYPE c LENGTH 50,
    END OF ty_cluster_obj_level_text.

  "! <p class="shorttext">Object Level Texts</p>
  TYPES ty_cluster_obj_level_texts TYPE SORTED TABLE OF ty_cluster_obj_level_text WITH UNIQUE KEY language.

  "! <p class="shorttext">Field Name</p>
  TYPES ty_field_name TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">Field Dependency</p>
    "! Defines how a field in a dependent object receives its value from a predecessor object.
    "! Controls navigation and key propagation between cluster objects
    BEGIN OF ty_field_dependency,
      "! <p class="shorttext">Object Field</p>
      "! Field name in the dependent object that receives its value or constraint from the predecessor
      "! $required
      object_field       TYPE ty_field_name,
      "! <p class="shorttext">Predecessor Object</p>
      "! The parent object that provides the value. Must be the root object for copySelectionCondition Type.
      predecessor_object TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Predecessor Field</p>
      "! Field in the predecessor object whose current value is propagated to objectField.
      "! Blank for root self-reference rows.
      predecessor_field  TYPE ty_field_name,
      "! <p class="shorttext">Field Dependency Type</p>
      "! Classifies the type of field dependency and determines how it is used at runtime
      "! $values {@link zif_aff_vcls_v1.data:co_field_dependency_type}
      "! $default {@link zif_aff_vcls_v1.data:co_field_dependency_type.navigation_key_relationship}
      dependency_type    TYPE ty_field_dependency_type,
    END OF ty_field_dependency.

  "! <p class="shorttext">Field Dependencies</p>
  TYPES ty_field_dependencies TYPE SORTED TABLE OF ty_field_dependency WITH UNIQUE KEY object_field.

  "! <p class="shorttext">Switch ID</p>
  TYPES ty_switch_id TYPE c LENGTH 30.

  TYPES:
    "! <p class="shorttext">Cluster Level</p>
    "! One object (view or table) participating in the view cluster hierarchy.
    "! Each level defines its parent, navigation behavior, and field dependency mappings.
    BEGIN OF ty_cluster_level,
      "! <p class="shorttext">Object Name</p>
      "! Technical name of the DDIC view or table at this hierarchy level.
      "! $required
      object_name             TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Predecessor Object</p>
      "! Parent object one level up. Equals object_name for root objects (self-reference).
      "! Drives all tree traversal, both downward recursion and upward root search.
      predecessor_object      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Position</p>
      "! Display position within the cluster hierarchy. Must be unique within the cluster.
      "! $minimum 1
      "! $maximum 50
      position                TYPE i,
      "! <p class="shorttext">View Cluster Entry Selection Type</p>
      "! Defines how many parent entries must be marked to navigate into this cluster level.
      "! $required
      "! $values {@link zif_aff_vcls_v1.data:co_vc_entry_selection_type}
      vc_entry_selection_type TYPE ty_vc_entry_selection_type,
      "! <p class="shorttext">Is Start Object</p>
      "! Marks the entry point shown when cluster maintenance opens.
      "! Exactly one level should have this set. BACK from the start object ends maintenance.
      "! $showAlways
      is_start_object         TYPE abap_bool,
      "! <p class="shorttext">Is Suppressed</p>
      "! Hides this level from the navigation display. The level is still read and saved.
      "! Can be overridden at runtime by the Switch Framework or SSCUI adaptation.
      "! $showAlways
      is_suppressed           TYPE abap_bool,
      "! <p class="shorttext">Has N:M Cardinality</p>
      "! When true, multiple parent entries can point to the same dependent entry.
      "! The system checks for shared ownership before deleting or copying dependent entries.
      "! $showAlways
      has_nm_cardinality      TYPE abap_bool,
      "! <p class="shorttext">Switch ID</p>
      "! Switch Framework switch name (SFW5). If set, the level is automatically suppressed
      "! when the switch status is OFF or STAND_BY at runtime.
      switch_id               TYPE ty_switch_id,
      "! <p class="shorttext">Object Texts</p>
      "! Language-dependent labels for this cluster level.
      "! Overrides the DDIC short text when present.
      object_texts            TYPE ty_cluster_obj_level_texts,
      "! <p class="shorttext">Field Dependencies</p>
      "! Field-level mappings between this level and its predecessor.
      "! Controls key propagation, selection list population, and hierarchical operation matching.
      field_dependencies      TYPE ty_field_dependencies,
    END OF ty_cluster_level.

  "! <p class="shorttext">Cluster Levels</p>
  TYPES ty_cluster_levels TYPE SORTED TABLE OF ty_cluster_level WITH UNIQUE KEY object_name.

  "! <p class="shorttext">Subroutine Name</p>
  TYPES ty_subroutine_name TYPE c LENGTH 40.

  TYPES:
    "! <p class="shorttext">View Cluster Maintenance Event</p>
    "! ABAP subroutine registered for a specific view cluster maintenance event
    BEGIN OF ty_event,
      "! <p class="shorttext">Event Code</p>
      "! Two-character event code identifying the hook point in the maintenance framework
      "! $required
      "! $values {@link zif_aff_vcls_v1.data:co_event_code}
      event      TYPE ty_event_code,
      "! <p class="shorttext">Subroutine</p>
      "! Name of the ABAP subroutine in the maintenance program called when the event fires
      "! $required
      subroutine TYPE ty_subroutine_name,
    END OF ty_event.

  "! <p class="shorttext">View Cluster Maintenance Events</p>
  "! Extended maintenance events registered for this view cluster
  TYPES ty_event_list TYPE SORTED TABLE OF ty_event WITH UNIQUE KEY event.

  "! <p class="shorttext">Program Name</p>
  TYPES ty_program_name TYPE zif_aff_types_v1=>ty_object_name_40.

  TYPES:
    "! <p class="shorttext">Maintenance Events</p>
    "! Maintenance program and registered event handlers for this view cluster
    BEGIN OF ty_events,
      "! <p class="shorttext">Program Name</p>
      "! Name of the ABAP subroutine pool (type S) containing the event handler routines.
      "! Must exist in TRDIR and must not be an include (type I) or function group include (type F).
      "! $required
      program_name TYPE ty_program_name,
      "! <p class="shorttext">Event List</p>
      "! ABAP subroutines registered for specific maintenance lifecycle events (table VCLMF)
      "! $required
      event_list   TYPE ty_event_list,
    END OF ty_events.

  TYPES:
    "! <p class="shorttext">View Cluster Attributes</p>
    "! Behavioural configuration of the view cluster
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Hierarchical Operation Dependent Handling</p>
      "! Controls whether dependent sub-objects are included in hierarchical operations
      "! (copy, delete, undo, transport) and whether the user is prompted.
      "! $default {@link zif_aff_vcls_v1.data:co_hier_oper_dep_handling.with_confirmation}
      "! $required
      "! $values {@link zif_aff_vcls_v1.data:co_hier_oper_dep_handling}
      hier_oper_dep_handling TYPE ty_hier_oper_dep_handling,
      "! <p class="shorttext">Data Read Type</p>
      "! Controls whether all cluster objects are read at once or only the subtree
      "! relevant to the current navigation target (performance optimization for large clusters).
      "! $default {@link zif_aff_vcls_v1.data:co_data_read_type.complete}
      "! $required
      "! $values {@link zif_aff_vcls_v1.data:co_data_read_type}
      data_read_type         TYPE ty_data_read_type,
      "! <p class="shorttext">Base View Cluster</p>
      "! Name of the base view cluster this variant is derived from.
      "! Only relevant when this cluster is a variant derived from the base view cluster.
      base_view_cluster      TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">View Cluster</p>
    "! Definition of a View Cluster (VCLS) repository object.
    "! A view cluster groups multiple SVIM maintenance dialogs into a single hierarchical
    "! maintenance unit maintained via SM34 and SE54.
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Version of the AFF format used to serialize this object
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! Behavioural configuration of the view cluster
      "! $required
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Cluster Levels</p>
      "! The objects (views or tables) participating in this cluster, their hierarchy,
      "! navigation behavior, and field dependency mappings
      "! $required
      cluster_levels      TYPE ty_cluster_levels,
      "! <p class="shorttext">Maintenance Events</p>
      "! Maintenance program and registered event handlers for this view cluster.
      events              TYPE ty_events,
    END OF ty_main.

ENDINTERFACE.
