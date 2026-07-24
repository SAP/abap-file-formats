interface zif_aff_chke_v1
  public .

  types:
    begin of ty_header_without_description,
      original_language     type if_aff_types_v1=>ty_original_language,
      abap_language_version type if_aff_types_v1=>ty_abap_language_version,
    end of ty_header_without_description.
  types:
    begin of ty_processing_info,
      "! <p class="shorttext">Exemption State</p>
      "! State in the approval workflow (e.g. open/approved/rejected)
      "! $required
      state             type satc_ci_adt_exemp_proc_state,
      "! <p class="shorttext">Notification Type</p>
      "! Defines when e-mail notifications are sent to the requester
      notification_type type satc_ci_adt_exemp_notification,
      "! <p class="shorttext">Exemption ID</p>
      "! Technical ID within the ATC framework
      "! $minLength 16
      exemption_id      type x length 16,
    end of ty_processing_info.
  types:
    begin of ty_request_info,
      "! <p class="shorttext">Requester</p>
      "! The ABAP username of the user who requested the exemption (in the original system)
      "! $required
      requester       type satc_ci_adt_exemp_requester,
      "! <p class="shorttext">Requester email</p>
      "! The email of the user who requested the exemption
      requester_email type satc_ci_adt_exemp_reqstr_email,
      "! <p class="shorttext">Reason</p>
      "! A broad categorization of the reason for the exemption
      "! $required
      reason          type satc_ci_adt_exemp_reason,
      "! <p class="shorttext">Justification</p>
      "! A detailed justification for why the ATC finding will not be fixed
      justification   type satc_ci_adt_exemp_justific,
    end of ty_request_info.
  types:
    begin of ty_assessment_info,
      "! <p class="shorttext">Approver</p>
      "! The ABAP username of the user who assessed the exemption (in the original system)
      "! $required
      approver       type satc_ci_adt_exemp_approver,
      "! <p class="shorttext">Approver Email</p>
      "! The email of the user who assessed the exemption
      approver_email type satc_ci_adt_exemp_apprvr_email,
      "! <p class="shorttext">Assessment</p>
      "! A free-text assessment of the justification
      assessment     type satc_ci_adt_exemp_assessment,
    end of ty_assessment_info.
  types:
    begin of ty_object_validity,
      "! <p class="shorttext">Object scope</p>
      "! The scope of the exemption at the object level (for example, a single finding or an entire object)
      "! $required
      object_scope     type satc_ci_obj_scope,
      "! <p class="shorttext">Main Object Name</p>
      "! Main (i.e. TADIR)  object name
      "! $required
      objname          type satc_ci_adt_exemp_obj_name,
      "! <p class="shorttext">Main Object Type</p>
      "! Main (i.e. TADIR) object type
      "! $required
      objtype          type satc_ci_adt_exemp_obj_type,
      "! <p class="shorttext">Subobject Name </p>
      "! Subobject name (if applicable)
      subobjname       type seocpdname,
      "! <p class="shorttext">Subobject Type</p>
      "! Subobject type (if applicable)
      subobjtype       type trobjtype,
      "! <p class="shorttext">Checksum Version</p>
      "! Version of the checksum (set by check)
      checksum_version type int1,
      "! <p class="shorttext">Checksum</p>
      "! Checksum used to uniquely identify a specific finding
      "! $required
      checksum         type satc_d_ac_checksum_finding,
    end of ty_object_validity.
  types:
    begin of ty_check_validity,
      "! <p class="shorttext">Check Scope</p>
      "! The scope of the exemption at the check level (for example, a message code or an entire check)
      "! $required
      check_scope type satc_ci_check_scope,
      "! <p class="shorttext">Check Class</p>
      "! The check class that emitted the finding being exempted
      "! $required
      chkclass    type seoclsname,
      "! <p class="shorttext">Message Code</p>
      "! The message code of the finding being exempted
      chkcode     type satc_ci_message_code,
    end of ty_check_validity.
  types:
    begin of ty_constraints,
      "! <p class="shorttext">Expiration Date</p>
      "! Expiration date for this exemption
      valid_until                 type satc_ci_adt_exemp_valid_to_d,
      "! <p class="shorttext">Software Component</p>
      "! The software component to which the exemption is restricted
      affected_software_component type satc_ci_software_component,
      "! <p class="shorttext">Release</p>
      "! The release to which the exemption is restricted
      valid_release               type satc_ci_valid_release,
      "! <p class="shorttext">Support Package</p>
      "! The support package to which the exemption is restricted
      valid_support_package       type satc_ci_valid_support_package,
    end of ty_constraints.
  "! <p class="shorttext">Field Name</p>
  "! Field name
  types ty_fieldname type c length 30.
  types ty_fieldnames type standard table of ty_fieldname with empty key.
  types:
    "! <p class="shorttext">ATC Exemption</p>
    "! ATC exemption object information
    "! $required
    begin of ty_main,
      "! $required
      format_version  type if_aff_types_v1=>ty_format_version,
      "!<p class="shorttext">Header</p>
      "! Header
      "! $required
      header          type ty_header_without_description,
      "! <p class="shorttext">Processing State</p>
      "! The exemption's state inside the ATC exemption workflow
      "! $required
      process_info    type ty_processing_info,
      "! <p class="shorttext">Request Information</p>
      "! Information about or provided by the user who requested the exemption
      "! $required
      request_info    type ty_request_info,
      "! <p class="shorttext">Assessment Information</p>
      "! Information about or provided by the user who assessed the exemption
      assessment_info type ty_assessment_info,
      "! <p class="shorttext">Object Information</p>
      "! Information about the object or finding to which the exemption applies
      "! $required
      object_validity type ty_object_validity,
      "! <p class="shorttext">Check Information</p>
      "! Information about the check or check message to which the exemption applies
      "! $required
      check_validity  type ty_check_validity,
      "! <p class="shorttext">Constraints</p>
      "! Additional constraints that limit the applicability of the exemption
      "! $required
      constraints     type ty_constraints,
    end of ty_main.

endinterface.
