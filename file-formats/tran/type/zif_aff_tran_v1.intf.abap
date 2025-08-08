INTERFACE zif_aff_tran_v1
  PUBLIC.


  "! <p class="shorttext">Transaction Code</p>
  "! Transaction code
  TYPES ty_transaction_code TYPE c LENGTH 20.

  "! $values {@link zif_aff_tran_v1.data:co_transaction_type}
  "! $default {@link zif_aff_tran_v1.data:co_transaction_type.parameter_transaction}
  TYPES ty_transaction_type TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Transaction Type</p>
    "! The transaction type defines which object will be started at runtime when the transaction is called.
    "! Depending on the transaction type, other type of object can be started and different fields become relevant.
    "! {@link zif_aff_tran_v1.data:ty_transaction_type }
    BEGIN OF co_transaction_type,
      "! <p class="shorttext">Dialog Transaction</p>
      "! The runtime calls a dynpro of a function group, module pool or report.
      "! The dynpro specified as initial screen must not be a selection screen.
      "! The program logic defines which screens are displayed after the initial screen.
      dialog_transaction    TYPE ty_transaction_type VALUE 'D',
      "! <p class="shorttext">OO Transaction</p>
      "! At runtime, the system calls a class method. The transaction links to either the ABAP Object
      "! Services Transaction Service (for persistent objects) or to a public method of a class.
      "! For instance methods, the system auto-creates a class instance.
      oo_transaction        TYPE ty_transaction_type VALUE 'O',
      "! <p class="shorttext">Parameter Transaction</p>
      "! Parameter transactions specialize dialog or report transactions by presetting initial screen values.
      "! You can also skip the initial screen to prevent users from changing these predefined values.
      parameter_transaction TYPE ty_transaction_type VALUE 'P',
      "! <p class="shorttext">Report Transaction</p>
      "! The runtime calls a dynpro of a report.
      "! The dynpro specified as initial screen must be a selection screen.
      "! The execution of a report usually has three stages: data entry, data processing, and data output.
      report_transaction    TYPE ty_transaction_type VALUE 'R',
      "! <p class="shorttext">Variant Transaction</p>
      "! Variant transactions customize dialog or report transactions by adapting menus and screens at runtime.
      "! They let you preset field values, set field attributes, or hide screens to streamline user interaction.
      variant_transaction   TYPE ty_transaction_type VALUE 'V',
    END OF co_transaction_type.

  "! <p class="shorttext">Program</p>
  "! Program name
  TYPES ty_program_name  TYPE c LENGTH 40.
  "! <p class="shorttext">Dynpro</p>
  "!   Transaction Start Dynpro Number for Dialog Transaction
  TYPES ty_program_dynnr TYPE c LENGTH 4.

  "! $values {@link zif_aff_tran_v1.data:co_lock_status}
  "! $default {@link zif_aff_tran_v1.data:co_lock_status.Not_Locked}
  TYPES ty_lock_status   TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Lock Status</p>
    BEGIN OF co_lock_status,
      "! <p class="shorttext">Locked</p>
      "! Locked
      locked     TYPE ty_lock_status VALUE 'X',
      "! <p class="shorttext">Not Locked</p>
      "! Not locked
      not_locked TYPE ty_lock_status VALUE ' ',
    END OF co_lock_status.

  "! $values {@link zif_aff_tran_v1.data:co_skip_initial_screen_mode}
  "! $default {@link zif_aff_tran_v1.data:co_skip_initial_screen_mode.show}
  TYPES ty_skip_initial_screen_mode TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Skip Initial Screen Mode</p>
    BEGIN OF co_skip_initial_screen_mode,
      "! <p class="shorttext">Skip</p>
      "! Skip Initial Screen
      skip TYPE ty_skip_initial_screen_mode VALUE 'Y',
      "! <p class="shorttext">Show</p>
      "! Show Initial Screen
      show TYPE ty_skip_initial_screen_mode VALUE 'N',
    END OF co_skip_initial_screen_mode.

  "! $values {@link zif_aff_tran_v1.data:co_stv_maintenance_mode}
  "! $default {@link zif_aff_tran_v1.data:co_stv_maintenance_mode.not_allowed}
  TYPES ty_stv_maintenance_mode TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Editing of standard transaction variant</p>
    BEGIN OF co_stv_maintenance_mode,
      "! <p class="shorttext">Allowed</p>
      "! Allowed
      allowed     TYPE ty_stv_maintenance_mode VALUE 'A',
      "! <p class="shorttext">Not Allowed</p>
      "! Not Allowed
      not_allowed TYPE ty_stv_maintenance_mode VALUE 'N',
    END OF co_stv_maintenance_mode.

  "! $values {@link zif_aff_tran_v1.data:co_update_mode}
  "! $default {@link zif_aff_tran_v1.data:co_update_mode.asynchronous}
  TYPES ty_update_mode TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Update Mode</p>
    "! Update Mode for OO Transactions
    BEGIN OF co_update_mode,
      "! <p class="shorttext">Asynchronous</p>
      "! Asynchronous
      asynchronous TYPE ty_update_mode VALUE 'U',
      "! <p class="shorttext">Synchronous</p>
      "! Synchronous
      synchronous  TYPE ty_update_mode VALUE 'S',
      "! <p class="shorttext">Local</p>
      "! Local
      local        TYPE ty_update_mode VALUE 'L',
    END OF co_update_mode.

  TYPES:
    BEGIN OF ty_dialog_transaction,
      "! <p class="shorttext">Program</p>
      "! Program name for dialog transaction
      program_name         TYPE ty_program_name,
      "! <p class="shorttext">Dynpro</p>
      "! Transaction start dynpro number for dialog transaction
      program_dynnr        TYPE ty_program_dynnr,
      "! <p class="shorttext">Standard Transaction Variant Maintenance</p>
      "! If the standard transaction variant maintenance mode is allowed, activating
      "! a transaction variant as standard transaction variant is enabled in the
      "! transaction variant maintenance.
      stv_maintenance_mode TYPE ty_stv_maintenance_mode,
    END OF ty_dialog_transaction.

  "! <p class="shorttext">Report</p>
  "! Report name
  TYPES ty_report_name         TYPE c LENGTH 40.
  "! <p class="shorttext">Selection Screen</p>
  "! Transaction Start Selection Screen for Report Transaction
  TYPES ty_report_dynnr        TYPE c LENGTH 4.

  "! <p class="shorttext">Variant</p>
  "! Variant name
  TYPES ty_report_variant_name TYPE c LENGTH 14.
  TYPES:
    BEGIN OF ty_report_transaction,
      "! <p class="shorttext">Report</p>
      "! Report name for the report transaction
      report_name         TYPE ty_report_name,
      "! <p class="shorttext">Screen</p>
      "! Transaction start selection screen for the report transaction
      report_dynnr        TYPE ty_report_dynnr,
      "! <p class="shorttext">Variant</p>
      "! Variant name for the report transaction
      report_variant_name TYPE ty_report_variant_name,
    END OF ty_report_transaction.

  "! <p class="shorttext">Program Name</p>
  "! Program name
  TYPES ty_class_program_name TYPE c LENGTH 40.
  "! <p class="shorttext">Class</p>
  "! Class name
  TYPES ty_class_name         TYPE c LENGTH 30.
  "! <p class="shorttext">Method</p>
  "! Method name
  TYPES ty_method_name        TYPE c LENGTH 61.
  TYPES:
    BEGIN OF ty_oo_transaction,
      "! <p class="shorttext">Local in Program</p>
      "! If this indicator is set, the OO transaction uses a local ABAP class within this specified ABAP program.
      "! Otherwise it uses a global ABAP class.
      local_in_program_indi     TYPE abap_bool,
      "! <p class="shorttext">Program</p>
      "! Name of the program for the OO transacton
      class_program_name        TYPE ty_class_program_name,
      "! <p class="shorttext">Class</p>
      "! Name of the ABAP class
      "! $required
      class_name                TYPE ty_class_name,
      "! <p class="shorttext">Method</p>
      "! Name of the method of the ABAP class
      "! $required
      method_name               TYPE ty_method_name,
      "! <p class="shorttext">OO Transaction Model</p>
      "! If this indicator is set, the OO transaction follows the object-oriented transaction model.
      "! See the interface IF_OS_TRANSACTION_MANAGER for more information.
      oo_transaction_model_indi TYPE abap_bool,
      "! <p class="shorttext">Update Mode</p>
      "! The update mode for an OO transaction defines how data changes are processed: synchronously,
      "! asynchronously, or immediately.
      update_mode               TYPE ty_update_mode,
    END OF ty_oo_transaction.

  "! <p class="shorttext">Parameter Name</p>
  "! Parameter name
  TYPES ty_parameter_name  TYPE c LENGTH 132.
  "! <p class="shorttext">Parameter Value</p>
  "! Parameter value
  TYPES ty_parameter_value TYPE c LENGTH 50.
  TYPES:
    "! <p class="shorttext">Parameter Value</p>
    "! Parameter transaction parameter value
    BEGIN OF ty_par_pv,
      "! <p class="shorttext">Parameter Name</p>
      "! Name of the parameter for the parameter transaction
      "! $required
      parameter_name  TYPE ty_parameter_name,
      "! <p class="shorttext">Parameter Value</p>
      "! Value for the parameter of the parameter transaction
      parameter_value TYPE ty_parameter_value,
    END OF ty_par_pv.
  TYPES ty_par_pv_t                    TYPE STANDARD TABLE OF ty_par_pv WITH DEFAULT KEY.

  "! <p class="shorttext">Parent Transaction</p>
  "! Name of parent transaction
  TYPES ty_par_parent_transaction_code TYPE ty_transaction_code.
  TYPES:
    BEGIN OF ty_parameter_transaction,
      "! <p class="shorttext">Parent Transaction</p>
      "! The parent transaction code of the parameter transaction defines the transaction that provides
      "! the program and the dynpro number that are started when the transaction is called.
      "! The parent transaction can be a dialog or a report transaction.
      "! $required
      par_parent_transaction_code TYPE ty_par_parent_transaction_code,
      "! <p class="shorttext">Skip Initial Screen</p>
      "! Skip initial screen mode allows bypassing the first screen of the parent
      "! transaction by using predefined values.
      skip_initial_screen_mode    TYPE ty_skip_initial_screen_mode,
      "! <p class="shorttext">Parameter values</p>
      "! Parameter values
      parameter_values            TYPE ty_par_pv_t,
    END OF ty_parameter_transaction.

  "! <p class="shorttext">Parent Transaction</p>
  "! Name of parent transaction
  TYPES ty_var_parent_transaction_code TYPE ty_transaction_code.
  "! <p class="shorttext">Cross-Client Transaction Variant</p>
  "! Name of cross-client transaction variant
  TYPES ty_transaction_ci_variant_name TYPE c LENGTH 30.
  "! <p class="shorttext">Transaction Variant</p>
  "! Name of transaction variant
  TYPES ty_transaction_variant_name    TYPE c LENGTH 30.
  TYPES:
    BEGIN OF ty_variant_transaction,
      "! <p class="shorttext">Parent Transaction</p>
      "! The parent transaction code links related transaction to its original (parent) transaction.
      "! It enables inheritance of settings like UI attributes or authorizations,
      "! ensuring consistency and reducing duplication in configuration.
      "! $required
      var_parent_transaction_code TYPE ty_var_parent_transaction_code,
      "! <p class="shorttext">Cross-Client</p>
      "! If the indicator is set, the transaction variant is cross-client. If the switch is not set,
      "! the transaction variant is client-specific.
      transaction_variant_ci_indi TYPE abap_bool,
      "! <p class="shorttext">Transaction Variant</p>
      "! Name of the cross-client transaction variant.
      "! A cross-client transaction variant is available in the system regardless of which client is currently active,
      "! and the field contents used in the transaction variant must be available in all clients.
      transaction_ci_variant_name TYPE ty_transaction_ci_variant_name,
      "! <p class="shorttext">Transaction Variant</p>
      "! Name of the client-specific transaction variant.
      "! A client-specific transaction variant exists only in the client where it was created,
      "! and the field contents used in the transaction variant must be available in that client.
      transaction_variant_name    TYPE ty_transaction_variant_name,
    END OF ty_variant_transaction.

  TYPES:
    BEGIN OF ty_implementation,
      "! <p class="shorttext">Transaction Type</p>
      "! The transaction type defines which object will be started at runtime when the transaction is called.
      "! Depending on the transaction type, other type of object can be started and different fields become relevant.
      "! $required
      transaction_type      TYPE ty_transaction_type,
      "! <p class="shorttext">Lock Status</p>
      "! Transaction lock status indicates whether a transaction is currently blocked from execution.
      "! It helps prevent unauthorized or unintended use, especially during maintenance, development,
      "! or when a transaction is obsolete or being phased out.
      lock_status           TYPE ty_lock_status,
      "! <p class="shorttext">Dialog Transaction</p>
      "! The runtime calls a dynpro of a function group, module pool or report.
      "! The dynpro specified as initial screen must not be a selection screen.
      "! The program logic defines which screens are displayed after the initial screen.
      dialog_transaction    TYPE ty_dialog_transaction,
      "! <p class="shorttext">Parameter Transaction</p>
      "! Parameter transactions specialize dialog or report transactions by presetting initial screen values.
      "! You can also skip the initial screen to prevent users from changing these predefined values.
      parameter_transaction TYPE ty_parameter_transaction,
      "! <p class="shorttext">Report Transaction</p>
      "! The runtime calls a dynpro of a report.
      "! The dynpro specified as initial screen must be a selection screen.
      "! The execution of a report usually has three stages: data entry, data processing, and data output.
      report_transaction    TYPE ty_report_transaction,
      "! <p class="shorttext">OO Transaction</p>
      "! At runtime, the system calls a class method. The transaction links to either the ABAP Object
      "! Services Transaction Service (for persistent objects) or to a public method of a class.
      "! For instance methods, the system auto-creates a class instance.
      oo_transaction        TYPE ty_oo_transaction,
      "! <p class="shorttext">Variant Transaction</p>
      "! Variant transactions customize dialog or report transactions by adapting menus and screens at runtime.
      "! They let you preset field values, set field attributes, or hide screens to streamline user interaction.
      variant_transaction   TYPE ty_variant_transaction,
    END OF ty_implementation.

  "! <p class="shorttext">Maintenance Mode</p>
  "! Maintenance modes for applications define how applications can be modified.
  "! $values {@link zif_aff_tran_v1.data:co_maintenance_mode}
  "! $default {@link zif_aff_tran_v1.data:co_maintenance_mode.manual}
  TYPES ty_maintenance_mode   TYPE c LENGTH 1.
  "! <p class="shorttext">Maintenance Status</p>
  "! The maintenance status of an authorization object controls if AUTHORITY-CHECK runs for it
  "! in its application andwhether an authorization default is added to a data of role
  "! by the profile generator when the app is in the role menu.
  "! $values {@link zif_aff_tran_v1.data:co_maintenance_status}
  "! $default {@link zif_aff_tran_v1.data:co_maintenance_status.default_with_values}
  TYPES ty_maintenance_status TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Maintenance Mode</p>
    "! Maintenance modes for applications define how applications can be modified.
    BEGIN OF co_maintenance_mode,
      "! <p class="shorttext">Manual Maintenance</p>
      "! This mode is appropriate as long as maintenance of default data has not been completed yet.
      "! New objects whose check has been detected by the authorization trace are added
      "! to the object list in change mode with the maintenance status Not maintained.
      manual                  TYPE ty_maintenance_mode VALUE space,
      "! <p class="shorttext">Automatic Maintenance (All Objects)</p>
      "! In change mode, all authorization objects added from the authorization trace are
      "! automatically assigned the default status No Default.
      automatic               TYPE ty_maintenance_mode VALUE 'A',
      "! <p class="shorttext">Automatic Maintenance (Basis Authorization Objects Only)</p>
      "! Only authorization objects from the application areas Basis (S_*) and HR (P_* and PLOG) are
      "! automatically added with the default status No Default.
      "! All other new objects are given the status Unmaintained, which must be changed.
      automatic_basis_objects TYPE ty_maintenance_mode VALUE 'B',
      "! <p class="shorttext">Application Does Not Require Default Values</p>
      "! This modus is given to all applications for whose execution only the start authorization is required.
      no_default_values       TYPE ty_maintenance_mode VALUE 'I',
      "! <p class="shorttext">Application Is Deprecated</p>
      "! It is used to classify applications that are not being developed any more but that can still be used.
      "! In the case of transactions, it is possible to designate successor transactions.
      deprecated              TYPE ty_maintenance_mode VALUE 'D',
      "! <p class="shorttext">Application Is Obsolete</p>
      "! This mode is used to classify applications that are not being developed any more and because of
      "! this do not meet important functional requirements or
      "! are not needed any more.
      obsolete                TYPE ty_maintenance_mode VALUE 'O',
    END OF co_maintenance_mode.

  CONSTANTS:
    "! <p class="shorttext">Maintenance Status</p>
    "! The maintenance status of an authorization object controls if AUTHORITY-CHECK runs for it in its application and
    "! whether an authorization default is added to a data of role by the profile
    "! generator when the app is in the role menu.
    BEGIN OF co_maintenance_status,
      "! <p class="shorttext">Undefined</p>
      "! The maintenance status is undefined and must be specified.
      undefined              TYPE ty_maintenance_status VALUE ' ',
      "! <p class="shorttext">No Default</p>
      "! This status is given to all objects that are not required for the execution
      "! of functions in the application. The authorization check is executed in exactly
      "! the same way the statuses described above.
      no_default             TYPE ty_maintenance_status VALUE 'X',
      "! <p class="shorttext">Default With Field Values</p>
      "! This default status is assigned to all objects that are used to protect functions
      "! within the associated application and for which the delivery of fixed values in one
      "! or more authorization fields would help to simplify authorization maintenance in roles.
      default_with_values    TYPE ty_maintenance_status VALUE 'Y',
      "! <p class="shorttext">Default Without Field Values</p>
      "! This status is suitable for objects whose authorizations are required for using an application,
      "! but all of whose authorization fields have to be maintained by the role
      "! administrator with customer-specific values.
      default_without_values TYPE ty_maintenance_status VALUE 'V',
      "! <p class="shorttext">Default Inactive</p>
      "! For objects with this status, the authorization check always returns the value sy-subrc = 0 regardless
      "! of which authorizations the user actually has. For objects belonging to the application areas
      "! Basis (S_*) and HR (P_* and PLOG), it is forbidden.
      inactive_values        TYPE ty_maintenance_status VALUE 'I',
    END OF co_maintenance_status.

  "! $values {@link zif_aff_tran_v1.data:co_inheritance_mode}
  "! $default {@link zif_aff_tran_v1.data:co_inheritance_mode.active}
  TYPES ty_inheritance_mode TYPE c LENGTH 10.
  CONSTANTS:
    "! <p class="shorttext">Authorization Defaults Inheritance Mode</p>
    "! The inheritance mode control if the authorization defaults of the parent
    "! transaction are used, of if the parameter transaction uses own authorization defaults.
    BEGIN OF co_inheritance_mode,
      "! <p class="shorttext">Active</p>
      "! Active
      active   TYPE ty_inheritance_mode VALUE 'ACTIVE',
      "! <p class="shorttext">Inactive</p>
      "! Inactive
      inactive TYPE ty_inheritance_mode VALUE 'INACTIVE',
    END OF co_inheritance_mode.

  "! <p class="shorttext">Authorization Field</p>
  "! Authorization field
  TYPES ty_auth_field TYPE c LENGTH 10.
  "! <p class="shorttext">Authorization Value</p>
  "! Authorization value
  TYPES ty_auth_value TYPE c LENGTH 40.

  TYPES:
    "! <p class="shorttext">Start Authorization Object Field Value</p>
    "! A start authorization object controls who may run a transaction. It is checked at transaction start.
    "! Fields must have single or empty values. Empty fields trigger a DUMMY check.
    "! This object is auto-assigned in the authorization defaults of transaction.
    BEGIN OF ty_sao_afv,
      "! <p class="shorttext">Authorization Field</p>
      "! Name of the authorization field of the start authorization object
      "! $required
      auth_field_name  TYPE ty_auth_field,
      "! <p class="shorttext">Authorization Value</p>
      "! Value for the authorization field
      auth_field_value TYPE ty_auth_value,
    END OF ty_sao_afv.

  "! <p class="shorttext">Start Authorization Object Field Value</p>
  "! A start authorization object controls who may run a transaction. It is checked at transaction start.
  "! Fields must have single or empty values. Empty fields trigger a DUMMY check.
  "! This object is auto-assigned in the authorization defaults transaction.
  TYPES ty_sao_afv_t        TYPE STANDARD TABLE OF ty_sao_afv WITH DEFAULT KEY.

  "! <p class="shorttext">Authorization Object</p>
  "! Name of authorization object
  TYPES ty_auth_object_name TYPE c LENGTH 10.

  "! <p class="shorttext">Start Authorization Object</p>
  "! Name of start authorization object
  TYPES ty_sao_name         TYPE ty_auth_object_name.

  TYPES:
    "! <p class="shorttext">Start Authorization Object</p>
    "! A start authorization object controls who may run a transaction. It is checked at transaction start.
    "! Fields must have single or empty values. Empty fields trigger a DUMMY check.
    "! This object is auto-assigned in the authorization defaults transaction.
    BEGIN OF ty_sao,
      "! <p class="shorttext">Start Authorization Object Name</p>
      "! Name of the start authorization object
      "! $required
      auth_object_name         TYPE ty_sao_name,
      "! <p class="shorttext">Start Authorization Object Field Values</p>
      "! Fields with values for the start authorization object
      auth_object_field_values TYPE ty_sao_afv_t,
    END OF ty_sao.

  TYPES:
    "! <p class="shorttext">Authorization Defaults Authorization Field Value</p>
    "! Authorization defaults authorization field value
    BEGIN OF ty_ad_afv,
      "! <p class="shorttext">Authorization Field</p>
      "! Authorization field
      auth_field_name       TYPE ty_auth_field,
      "! <p class="shorttext">From</p>
      "! From value
      "! $showAlways
      auth_field_low_value  TYPE ty_auth_value,
      "! <p class="shorttext">To</p>
      "! To value
      auth_field_high_value TYPE ty_auth_value,
    END OF ty_ad_afv.
  "! <p class="shorttext">Authorization Defaults Authorization Field Values</p>
  "! Authorization defaults authorization field values
  TYPES ty_ad_afv_t TYPE STANDARD TABLE OF ty_ad_afv WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Defaults Authorization Object Details</p>
    "! Authorization default values define which authorization objects and field values are automatically
    "! proposed when creating roles for a transaction,
    "! simplifying role maintenance and ensuring consistent security settings across users and roles.
    BEGIN OF ty_ad_ao,
      "! <p class="shorttext">Authorization Object Name</p>
      "! Name of the authorization object
      auth_object_name         TYPE ty_auth_object_name,
      "! <p class="shorttext">Maintenance Status</p>
      "! The maintenance status of an authorization object controls if AUTHORITY-CHECK runs for
      "! it in its application and whether an authorization default is added to a data of role data by
      "! the profile generator when the app is in the role menu.
      maintenance_status       TYPE ty_maintenance_status,
      "! <p class="shorttext">Authorization Defaults Documentation for Object</p>
      "! Authorization defaults documentation for object
      documentation            TYPE string,
      "! <p class="shorttext">Authorization Defaults Authorization Field Value</p>
      "! Authorization defaults authorization field value
      auth_object_field_values TYPE ty_ad_afv_t,
    END OF ty_ad_ao.

  "! <p class="shorttext">Authorization Defaults Authorization Objects</p>
  "! Authorization default values define which authorization objects and field values are automatically
  "! proposed when creating roles for a transaction, simplifying role maintenance and ensuring consistent
  "! security settings across users and roles.
  TYPES ty_ad_ao_t TYPE STANDARD TABLE OF ty_ad_ao WITH KEY auth_object_name.

  TYPES:
    BEGIN OF ty_ad,
      "! <p class="shorttext">Maintenance Mode</p>
      "! Maintenance modes for applications define how applications can be modified.
      maintenance_mode TYPE ty_maintenance_mode,
      "! <p class="shorttext">Inheritance Mode</p>
      "! Authorization defaults inheritance mode controls how authorization settings are passed from
      "! a parent transaction to its variants,
      "! ensuring consistent access rights and roles across related transactions.
      inheritance_mode TYPE ty_inheritance_mode,
      "! <p class="shorttext">Authorization Defaults Documentation for Application</p>
      "! Authorization defaults documentation for application.
      documentation    TYPE string,
      "! <p class="shorttext">Authorization Defaults Authorization Objects</p>
      "! Authorization default values define which authorization objects and field values are automatically
      "! proposed when creating roles for a transaction, simplifying role maintenance and ensuring consistent
      "! security settings across users and roles.
      auth_objects     TYPE ty_ad_ao_t,
    END OF ty_ad.


  "! $values {@link zif_aff_tran_v1.data:co_ui_classification}
  "! $default {@link zif_aff_tran_v1.data:co_ui_classification.professional_user_transaction}
  TYPES ty_ui_classification TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">UI Classification</p>
    "! The UI classification indicates the target user group of the transaction.
    BEGIN OF co_ui_classification,
      "! <p class="shorttext">Professional User Transaction</p>
      "! Professional User Transactions are designed for experienced, frequent users of the SAP System
      "! who mainly run highly complex transactions.
      professional_user_transaction TYPE ty_ui_classification VALUE 'P',
      "! <p class="shorttext">Easy Web Transaction</p>
      "! Easy Web Transactions are the logical further development of Internet Application Components (IACs).
      "! You must specify a service name for an Easy Web Transactions, if one exists and is different
      "! from the name of the transaction.
      easy_web_transaction          TYPE ty_ui_classification VALUE 'E',
    END OF co_ui_classification.

  "! $values {@link zif_aff_tran_v1.data:co_ua_inheritance_mode}
  "! $default {@link zif_aff_tran_v1.data:co_ua_inheritance_mode.inactive}
  TYPES ty_ua_inheritance_mode TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">UI Attributes Inheritance Mode</p>
    "! UI attributes inheritance mode
    BEGIN OF co_ua_inheritance_mode,
      "! <p class="shorttext">Active</p>
      "! Active
      active   TYPE ty_ua_inheritance_mode VALUE 'A',
      "! <p class="shorttext">Inactive</p>
      "! Inactive
      inactive TYPE ty_ua_inheritance_mode VALUE 'I',
    END OF co_ua_inheritance_mode.

  "! $values {@link zif_aff_tran_v1.data:co_ua_pervasive_mode}
  "! $default {@link zif_aff_tran_v1.data:co_ua_pervasive_mode.enabled}
  TYPES ty_ua_pervasive_mode TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">UI Attributes Inheritance Mode</p>
    "! UI attributes inheritance mode
    BEGIN OF co_ua_pervasive_mode,
      "! <p class="shorttext">Disabled</p>
      "! Disabled
      disabled TYPE ty_ua_pervasive_mode VALUE 'D',
      "! <p class="shorttext">Enabled</p>
      "! Enabled
      enabled  TYPE ty_ua_pervasive_mode VALUE 'E',
    END OF co_ua_pervasive_mode.

  "! $values {@link zif_aff_tran_v1.data:co_ua_support_mode}
  "! $default {@link zif_aff_tran_v1.data:co_ua_support_mode.supported}
  TYPES ty_ua_support_mode TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">SAP GUI Support</p>
    "! SAP GUI support
    BEGIN OF co_ua_support_mode,
      "! <p class="shorttext">Supported</p>
      "! Supported
      supported     TYPE ty_ua_support_mode VALUE 'X',
      "! <p class="shorttext">Not Supported</p>
      "! Not Supported
      not_supported TYPE ty_ua_support_mode VALUE ' ',
    END OF co_ua_support_mode.

  "! <p class="shorttext">SAP GUI for Java</p>
  "! SAP GUI for Java
  "! $values {@link zif_aff_tran_v1.data:co_ua_support_mode}
  "! $default {@link zif_aff_tran_v1.data:co_ua_support_mode.supported}
  TYPES ty_ua_platin_mode TYPE ty_ua_support_mode.
  "! <p class="shorttext">SAP GUI for HTML</p>
  "! SAP GUI for HTML
  "! $values {@link zif_aff_tran_v1.data:co_ua_support_mode}
  "! $default {@link zif_aff_tran_v1.data:co_ua_support_mode.supported}
  TYPES ty_ua_webgui_mode TYPE ty_ua_support_mode.
  "! <p class="shorttext">SAP GUI for Windows</p>
  "! SAP GUI for Windows
  "! $values {@link zif_aff_tran_v1.data:co_ua_support_mode}
  "! $default {@link zif_aff_tran_v1.data:co_ua_support_mode.supported}
  TYPES ty_ua_win32_mode  TYPE ty_ua_support_mode.

  TYPES:
    BEGIN OF ty_ui_attributes,
      "! <p class="shorttext">Inherit UI Attributes</p>
      "! Transaction UI Attributes Inheritance Mode controls how UI settings like screen variants
      "! or field attributes are inherited from a parent transaction to its variants, ensuring
      "! consistent user interfaces across related transactions.
      inheritance_mode  TYPE ty_ua_inheritance_mode,
      "! <p class="shorttext">UI Classification</p>
      "! Professional User Transactions emulate SAP GUI for Windows, suited for expert users handling complex tasks.
      "! Easy Web Transactions offer a simplified, web-friendly UI via SAP GUI for HTML, ideal for casual users,
      "! without menus or toolbars.
      ui_classification TYPE ty_ui_classification,
      "! <p class="shorttext">Service</p>
      "! The Service Name of an Internet Application Component (IAC) links a transaction to a web service,
      "! enabling its execution via a browser. It's required for Easy Web Transactions if the service
      "! name differs from the transaction name.
      iac_service_name  TYPE c LENGTH 14,
      "! <p class="shorttext">Pervasive Enabled</p>
      "! Transaction Pervasive Mode enables a simplified, responsive UI for transactions on various devices,
      "! like tablets or smartphones. It's designed for casual users needing quick, intuitive access to core
      "! functions with minimal screen complexity.
      pervasive_mode    TYPE ty_ua_pervasive_mode,
      "! <p class="shorttext">SAP GUI for HTML</p>
      "! The transaction supports the start from SAP GUI for HTML.
      webgui_mode       TYPE ty_ua_webgui_mode,
      "! <p class="shorttext">SAP GUI for Java</p>
      "! The transaction supports the start from SAP GUI for Java.
      platin_mode       TYPE ty_ua_platin_mode,
      "! <p class="shorttext">SAP GUI for Windows</p>
      "! The transaction supports the start from SAP GUI for Windows.
      win32_mode        TYPE ty_ua_win32_mode,
    END OF ty_ui_attributes.



  TYPES:
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Implementation</p>
      "! The implementation contains details about the transaction, depending on the transaction type.
      implementation TYPE ty_implementation,
    END OF ty_general_information.

  TYPES:
    BEGIN OF ty_authorizations,
      "! <p class="shorttext">Start Authorization Object</p>
      "! A start authorization object controls who may run a transaction. It is checked at transaction start.
      "! Fields must have single or empty values. Empty fields trigger a DUMMY check.
      "! This object is auto-assigned in the authorization defaults transaction.
      start_authorization_object TYPE ty_sao,
      "! <p class="shorttext">Authorization Default Values</p>
      "! Authorization default values define which authorization objects and field values are automatically proposed
      "! when creating roles for a transaction, simplifying role maintenance and ensuring consistent security
      "! settings across users and roles.
      "! $required
      authorization_defaults     TYPE ty_ad,
    END OF ty_authorizations.

  TYPES:
    BEGIN OF ty_user_interface,
      "! <p class="shorttext">UI Attributes</p>
      "! UI attributes manage UI classification and GUI support
      ui_attributes TYPE ty_ui_attributes,
    END OF ty_user_interface.

  TYPES:
    "! <p class="shorttext">Transaction</p>
    "! Transaction
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_80,
      "! <p class="shorttext">General Information</p>
      "! The general information contains details about the transaction, depending on the transaction type.
      "! $required
      general_information TYPE ty_general_information,
      "! <p class="shorttext">User Interface</p>
      "! User Interface manage UI classification and GUI support
      user_interface      TYPE ty_user_interface,
      "! <p class="shorttext">Authorizations</p>
      "! Authorizations contain settings related to security and access control:
      "! Start Authorization Object and
      "! Authorization Default Values
      authorizations      TYPE ty_authorizations,
    END OF ty_main.

ENDINTERFACE.
