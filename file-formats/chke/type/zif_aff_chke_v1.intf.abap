INTERFACE zif_aff_chke_v1
  PUBLIC .

  TYPES:
    BEGIN OF ty_header_without_description,
      original_language     TYPE if_aff_types_v1=>ty_original_language,
      abap_language_version TYPE if_aff_types_v1=>ty_abap_language_version,
    END OF ty_header_without_description.
  TYPES:
    BEGIN OF ty_processing_info,
      "! <p class="shorttext">Exemption State</p>
      "! State in the approval workflow (e.g. open/approved/rejected)
      "! $required
      state             TYPE satc_ci_adt_exemp_proc_state,
      "! <p class="shorttext">Notification Type</p>
      "! Defines when e-mail notifications are sent to the requester
      notification_type TYPE satc_ci_adt_exemp_notification,
      "! <p class="shorttext">Exemption ID</p>
      "! Technical ID within the ATC framework
      "! $minLength 16
      exemption_id      TYPE x LENGTH 16,
    END OF ty_processing_info.
  TYPES:
    BEGIN OF ty_request_info,
      "! <p class="shorttext">Requester</p>
      "! The ABAP username of the user who requested the exemption (in the original system)
      "! $required
      requester       TYPE satc_ci_adt_exemp_requester,
      "! <p class="shorttext">Requester email</p>
      "! The email of the user who requested the exemption
      requester_email TYPE satc_ci_adt_exemp_reqstr_email,
      "! <p class="shorttext">Reason</p>
      "! A broad categorization of the reason for the exemption
      "! $required
      reason          TYPE satc_ci_adt_exemp_reason,
      "! <p class="shorttext">Justification</p>
      "! A detailed justification for why the ATC finding will not be fixed
      justification   TYPE satc_ci_adt_exemp_justific,
    END OF ty_request_info.
  TYPES:
    BEGIN OF ty_assessment_info,
      "! <p class="shorttext">Approver</p>
      "! The ABAP username of the user who assessed the exemption (in the original system)
      approver       TYPE satc_ci_adt_exemp_approver,
      "! <p class="shorttext">Approver Email</p>
      "! The email of the user who assessed the exemption
      approver_email TYPE satc_ci_adt_exemp_apprvr_email,
      "! <p class="shorttext">Assessment</p>
      "! A free-text assessment of the justification
      assessment     TYPE satc_ci_adt_exemp_assessment,
    END OF ty_assessment_info.
  TYPES:
    BEGIN OF ty_object_validity,
      "! <p class="shorttext">Object scope</p>
      "! The scope of the exemption at the object level (for example, a single finding or an entire object)
      "! $required
      object_scope     TYPE satc_ci_obj_scope,
      "! <p class="shorttext">Main Object Name</p>
      "! Main (i.e. TADIR)  object name
      "! $required
      objname          TYPE satc_ci_adt_exemp_obj_name,
      "! <p class="shorttext">Main Object Type</p>
      "! Main (i.e. TADIR) object type
      "! $required
      objtype          TYPE satc_ci_adt_exemp_obj_type,
      "! <p class="shorttext">Subobject Name </p>
      "! Subobject name (if applicable)
      subobjname       TYPE seocpdname,
      "! <p class="shorttext">Subobject Type</p>
      "! Subobject type (if applicable)
      subobjtype       TYPE trobjtype,
      "! <p class="shorttext">Checksum Version</p>
      "! Version of the checksum (set by check)
      checksum_version TYPE int1,
      "! <p class="shorttext">Checksum</p>
      "! Checksum used to uniquely identify a specific finding
      "! $required
      checksum         TYPE satc_d_ac_checksum_finding,
    END OF ty_object_validity.
  TYPES:
    BEGIN OF ty_check_validity,
      "! <p class="shorttext">Check Scope</p>
      "! The scope of the exemption at the check level (for example, a message code or an entire check)
      "! $required
      check_scope TYPE satc_ci_check_scope,
      "! <p class="shorttext">Check Class</p>
      "! The check class that emitted the finding being exempted
      "! $required
      chkclass    TYPE seoclsname,
      "! <p class="shorttext">Message Code</p>
      "! The message code of the finding being exempted
      chkcode     TYPE satc_ci_message_code,
    END OF ty_check_validity.
  TYPES:
    BEGIN OF ty_constraints,
      "! <p class="shorttext">Expiration Date</p>
      "! Expiration date for this exemption
      valid_until                 TYPE satc_ci_adt_exemp_valid_to_d,
      "! <p class="shorttext">Software Component</p>
      "! The software component to which the exemption is restricted
      affected_software_component TYPE satc_ci_software_component,
      "! <p class="shorttext">Release</p>
      "! The release to which the exemption is restricted
      valid_release               TYPE satc_ci_valid_release,
      "! <p class="shorttext">Support Package</p>
      "! The support package to which the exemption is restricted
      valid_support_package       TYPE satc_ci_valid_support_package,
    END OF ty_constraints.
  TYPES:
    "! <p class="shorttext">ATC Exemption</p>
    "! ATC exemption object information
    "! $required
    BEGIN OF ty_main,
      "! $required
      format_version  TYPE if_aff_types_v1=>ty_format_version,
      "!<p class="shorttext">Header</p>
      "! Header
      "! $required
      header          TYPE ty_header_without_description,
      "! <p class="shorttext">Processing State</p>
      "! The exemption's state inside the ATC exemption workflow
      "! $required
      process_info    TYPE ty_processing_info,
      "! <p class="shorttext">Request Information</p>
      "! Information about or provided by the user who requested the exemption
      "! $required
      request_info    TYPE ty_request_info,
      "! <p class="shorttext">Assessment Information</p>
      "! Information about or provided by the user who assessed the exemption
      assessment_info TYPE ty_assessment_info,
      "! <p class="shorttext">Object Information</p>
      "! Information about the object or finding to which the exemption applies
      "! $required
      object_validity TYPE ty_object_validity,
      "! <p class="shorttext">Check Information</p>
      "! Information about the check or check message to which the exemption applies
      "! $required
      check_validity  TYPE ty_check_validity,
      "! <p class="shorttext">Constraints</p>
      "! Additional constraints that limit the applicability of the exemption
      "! $required
      constraints     TYPE ty_constraints,
    END OF ty_main.

ENDINTERFACE.
