INTERFACE zif_aff_chke_v1
  PUBLIC.

  TYPES ty_user_name     TYPE c LENGTH 12.
  TYPES ty_email_address TYPE c LENGTH 241.
  "! <p class="shorttext">Exemption State</p>
  "! State in the approval workflow (e.g. open/approved/rejected)
  "! $values {@link zif_aff_chke_v1.data:co_state}
  TYPES ty_state TYPE c LENGTH 4.
  CONSTANTS:
    "! <p class="shorttext">Exemption State</p>
    "! State in the approval workflow
    BEGIN OF co_state,
      "! <p class="shorttext">Open</p>
      "! The exemption is awaiting assessment
      open     TYPE ty_state VALUE 'OPEN',
      "! <p class="shorttext">Approved</p>
      "! The exemption was approved
      approved TYPE ty_state VALUE 'OK',
      "! <p class="shorttext">Rejected</p>
      "! The exemption was rejected
      rejected TYPE ty_state VALUE 'REJ',
    END OF co_state.
  "! <p class="shorttext">Notification Type</p>
  "! Defines when email notifications are sent to the requester
  "! $values {@link zif_aff_chke_v1.data:co_notification_type}
  TYPES ty_notification_type TYPE c LENGTH 4.
  CONSTANTS:
    "! <p class="shorttext">Notification Type</p>
    "! Defines when email notifications are sent to the requester
    BEGIN OF co_notification_type,
      "! <p class="shorttext">On Rejection</p>
      "! On rejection
      on_rejection              TYPE ty_notification_type VALUE 'REJ',
      "! <p class="shorttext">On Approval and Rejection</p>
      "! On approval and rejection
      on_approval_and_rejection TYPE ty_notification_type VALUE 'ALWS',
      "! <p class="shorttext">No Email Notification</p>
      "! No email notification
      no_email_notification     TYPE ty_notification_type VALUE 'NEVR',
    END OF co_notification_type.
  "! <p class="shorttext">Object Scope</p>
  "! The scope of the exemption at the object level
  "! $values {@link zif_aff_chke_v1.data:co_object_scope}
  "! $default {@link zif_aff_chke_v1.data:co_object_scope.finding}
  TYPES ty_object_scope TYPE c LENGTH 4.
  CONSTANTS:
    "! <p class="shorttext">Object Scope</p>
    "! The scope of the exemption at the object level
    BEGIN OF co_object_scope,
      "! <p class="shorttext">Finding</p>
      "! A single finding
      finding TYPE ty_object_scope VALUE 'FND',
    END OF co_object_scope.
  "! <p class="shorttext">Check Scope</p>
  "! The scope of the exemption at the check level
  "! $values {@link zif_aff_chke_v1.data:co_check_scope}
  "! $default {@link zif_aff_chke_v1.data:co_check_scope.finding}
  TYPES ty_check_scope TYPE c LENGTH 3.
  CONSTANTS:
    "! <p class="shorttext">Check Scope</p>
    "! The scope of the exemption at the check level
    BEGIN OF co_check_scope,
      "! <p class="shorttext">Finding</p>
      "! A single finding
      finding TYPE ty_check_scope VALUE 'FND',
    END OF co_check_scope.
  TYPES:
    "! <p class="shorttext">Header</p>
    "! Header information
    BEGIN OF ty_header_without_description,
      original_language     TYPE zif_aff_types_v1=>ty_original_language,
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version,
    END OF ty_header_without_description.
  TYPES:
    "! <p class="shorttext">Processing Information</p>
    "! Information about the exemption's processing within the ATC workflow
    BEGIN OF ty_process_info,
      "! <p class="shorttext">Exemption State</p>
      "! State in the approval workflow (e.g. open/approved/rejected)
      "! $required
      state             TYPE ty_state,
      "! <p class="shorttext">Notification Type</p>
      "! Defines when email notifications are sent to the requester
      "! $required
      notification_type TYPE ty_notification_type,
      "! <p class="shorttext">Exemption ID</p>
      "! Technical ID within the ATC framework
      "! $minLength 32
      exemption_id      TYPE c LENGTH 32,
    END OF ty_process_info.
  TYPES:
    "! <p class="shorttext">Request Information</p>
    "! Information about or provided by the user who requested the exemption
    BEGIN OF ty_request_info,
      "! <p class="shorttext">Requester</p>
      "! The ABAP username of the user who requested the exemption (in the original system)
      "! $required
      requester       TYPE ty_user_name,
      "! <p class="shorttext">Requester Email</p>
      "! The email of the user who requested the exemption
      requester_email TYPE ty_email_address,
      "! <p class="shorttext">Reason</p>
      "! A broad categorization of the reason for the exemption
      "! $required
      reason          TYPE c LENGTH 4,
      "! <p class="shorttext">Justification</p>
      "! A detailed justification for why the ATC finding will not be fixed
      justification   TYPE string,
    END OF ty_request_info.
  TYPES:
    "! <p class="shorttext">Assessment Information</p>
    "! Information about or provided by the user who assessed the exemption
    BEGIN OF ty_assessment_info,
      "! <p class="shorttext">Approver</p>
      "! The ABAP username of the user who assessed the exemption (in the original system)
      approver       TYPE ty_user_name,
      "! <p class="shorttext">Approver Email</p>
      "! The email of the user who assessed the exemption
      approver_email TYPE ty_email_address,
      "! <p class="shorttext">Assessment</p>
      "! A free-text assessment of the justification
      assessment     TYPE string,
    END OF ty_assessment_info.
  TYPES:
    "! <p class="shorttext">Object Validity</p>
    "! Object-related validity constraints of the exemption
    BEGIN OF ty_object_validity,
      "! <p class="shorttext">Object Scope</p>
      "! The scope of the exemption at the object level (for example, a single finding or an entire object)
      "! $required
      object_scope     TYPE ty_object_scope,
      "! <p class="shorttext">Main Object Name</p>
      "! Main (i.e. TADIR) object name
      "! $required
      object_name      TYPE zif_aff_types_v1=>ty_object_name_40,
      "! <p class="shorttext">Main Object Type</p>
      "! Main (i.e. TADIR) object type
      "! $required
      object_type      TYPE c LENGTH 4,
      "! <p class="shorttext">Subobject Name</p>
      "! Subobject name (if applicable)
      subobject_name   TYPE c LENGTH 61,
      "! <p class="shorttext">Subobject Type</p>
      "! Subobject type (if applicable)
      subobject_type   TYPE c LENGTH 4,
      "! <p class="shorttext">Checksum Version</p>
      "! Version of the checksum (set by check)
      "! $minimum 0
      "! $maximum 255
      checksum_version TYPE i,
      "! <p class="shorttext">Checksum</p>
      "! Checksum used to uniquely identify a specific finding
      "! $required
      "! $minimum -2147483648
      "! $maximum 2147483647
      checksum         TYPE i,
    END OF ty_object_validity.
  TYPES:
    "! <p class="shorttext">Check Validity</p>
    "! Check-related validity constraints of the exemption
    BEGIN OF ty_check_validity,
      "! <p class="shorttext">Check Scope</p>
      "! The scope of the exemption at the check level (for example, a message code or an entire check)
      "! $required
      check_scope TYPE ty_check_scope,
      "! <p class="shorttext">Check Class</p>
      "! The check class that emitted the finding being exempted
      "! $required
      check_class TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Message Code</p>
      "! The message code of the finding being exempted
      message_code  TYPE c LENGTH 25,
    END OF ty_check_validity.
  TYPES:
    "! <p class="shorttext">Constraints</p>
    "! Additional constraints that limit the applicability of the exemption
    BEGIN OF ty_constraints,
      "! <p class="shorttext">Expiration Date</p>
      "! Expiration date for this exemption
      expiration_date             TYPE d,
      "! <p class="shorttext">Software Component</p>
      "! The software component to which the exemption is restricted
      affected_software_component TYPE c LENGTH 30,
      "! <p class="shorttext">Release</p>
      "! The release to which the exemption is restricted
      valid_release               TYPE c LENGTH 10,
      "! <p class="shorttext">Support Package</p>
      "! The support package to which the exemption is restricted
      valid_support_package       TYPE c LENGTH 10,
    END OF ty_constraints.
  TYPES:
    "! <p class="shorttext">ATC Exemption</p>
    "! ATC exemption object information
    "! $required
    BEGIN OF ty_main,
      "! $required
      format_version  TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header information
      "! $required
      header          TYPE ty_header_without_description,
      "! <p class="shorttext">Processing Information</p>
      "! Information about the exemption's processing within the ATC workflow
      "! $required
      process_info    TYPE ty_process_info,
      "! <p class="shorttext">Request Information</p>
      "! Information about or provided by the user who requested the exemption
      "! $required
      request_info    TYPE ty_request_info,
      "! <p class="shorttext">Assessment Information</p>
      "! Information about or provided by the user who assessed the exemption
      assessment_info TYPE ty_assessment_info,
      "! <p class="shorttext">Object Validity</p>
      "! Object-related validity constraints of the exemption
      "! $required
      object_validity TYPE ty_object_validity,
      "! <p class="shorttext">Check Validity</p>
      "! Check-related validity constraints of the exemption
      "! $required
      check_validity  TYPE ty_check_validity,
      "! <p class="shorttext">Constraints</p>
      "! Additional constraints that limit the applicability of the exemption
      "! $required
      constraints     TYPE ty_constraints,
    END OF ty_main.

ENDINTERFACE.
