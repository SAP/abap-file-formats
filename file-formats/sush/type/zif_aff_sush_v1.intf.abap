INTERFACE zif_aff_sush_v1
  public .

  types:
    "! <p class="shorttext">Maintenance Mode</p>
    "! Maintenance Mode
    "! $values {@link zif_aff_sush_v1.data:co_usob_status_flag}
    ty_usob_status_flag type c length 1,
    "! <p class="shorttext">Maintenance Status</p>
    "! Maintenance Status
    "! $values {@link zif_aff_sush_v1.data:co_okflag}
    "! $default {@link zif_aff_sush_v1.data:co_okflag.y_flag}
    ty_okflag           type c length 1.

  constants:
    "! <p class="shorttext">Maintenance Mode</p>
    "! Maintenance Mode
    begin of co_usob_status_flag,
      "! <p class="shorttext">Manual Maintenance</p>
      "! Manual Maintenance
      manual type ty_usob_status_flag value space,
      "! <p class="shorttext">Autom. Maintenance (All Objects)</p>
      "! Autom. Maintenance (All Objects)
      a_flag type ty_usob_status_flag value 'A',
      "! <p class="shorttext">Automatic Maintenance (Basis Authorization Objects Only)</p>
      "! Automatic Maintenance (Basis Authorization Objects Only)
      b_flag type ty_usob_status_flag value 'B',
      "! <p class="shorttext">Application Does Not Require Default Values</p>
      "! Application Does Not Require Default Values
      i_flag type ty_usob_status_flag value 'I',
      "! <p class="shorttext">Application is Deprecated</p>
      "! Application is Deprecated
      d_flag type ty_usob_status_flag value 'D',
      "! <p class="shorttext">Application Is Obsolete</p>
      "! Application Is Obsolete
      o_flag type ty_usob_status_flag value 'O',
    end of co_usob_status_flag,

    "! <p class="shorttext">Maintenance Status</p>
    "! Maintenance Status
    begin of co_okflag,
      "! <p class="shorttext">No Default</p>
      "! No Default
      x_flag type ty_okflag value 'X',
      "! <p class="shorttext">Default With Field Values</p>
      "! Default With Field Values
      y_flag type ty_okflag value 'Y',
      "! <p class="shorttext">Default Without Field Values</p>
      "! Default Without Field Values
      v_flag type ty_okflag value 'V',
      "! <p class="shorttext">Default Inactive</p>
      "! Default Inactive
      i_flag type ty_okflag value 'I',
      "! <p class="shorttext">Unmaintained Object Status</p>
      "! Unmaintained Object Status
      u_flag type ty_okflag value 'U',
      "! <p class="shorttext">Authorization Check Inactive</p>
      "! Authorization Check Inactive
      n_flag type ty_okflag value 'N',
    end of co_okflag.

  types:
    "! <p class="shorttext">Application Name</p>
    "! Name of Application
    ty_name type c length 30,
    "! <p class="shorttext">Application Type</p>
    "! Type of Application
    ty_type type c length 2.

  types:
    "! <p class="shorttext">General</p>
    "! General
    "! $required
    begin of ty_general,
      "! <p class="shorttext">Application Name</p>
      "! Application Name of Authorization Default Value.
      "! $required
      name   type ty_name,
      "! <p class="shorttext">Type</p>
      "! Type of Authorization Default Value.
      "! $required
      type   type ty_type,
      "! <p class="shorttext">Maintenance Mode</p>
      "! Maintenance Mode.
      "! $values {@link zif_aff_sush_v1.data:co_usob_status_flag}
      "! $required
      okflag type ty_usob_status_flag,
    end of ty_general .

  types:
    "! <p class="shorttext">Authorization Value</p>
    "! Authorization Value
    ty_val type c length 40.

  types:
    "! <p class="shorttext">Default Authorization Values</p>
    "! Default Authorization Values
    begin of ty_value,
      "! <p class="shorttext">From</p>
      "! From Value
      "! $showAlways
      low  type ty_val,
      "! <p class="shorttext">To</p>
      "! To Values
      "! $showAlways
      high type ty_val,
    end of ty_value .

  types:
    "! <p class="shorttext">Authorization Fields</p>
    "! Authorization Fields
    ty_values  type standard table of ty_value with default key.

  types:
    "! <p class="shorttext">Authorization Field</p>
    "! Authorization Field
    ty_field type c length 10.

  types:
    "! <p class="shorttext">Authorization Field Details</p>
    "! Authorization Field Details
    begin of ty_fldtablestruc,
      "! <p class="shorttext">Field</p>
      "! Name of Authorization Field
      "! $required
      field  type ty_field,
      "! <p class="shorttext">Values</p>
      "! Name of Authorization Field Value
      values type ty_values,
    end of ty_fldtablestruc .

  types:
    "! <p class="shorttext">Authorization Fields</p>
    "! Authorization Fields
    ty_authorization_fields  type standard table of ty_fldtablestruc with default key.

  types:
    "! <p class="shorttext">Authorization Objects Details</p>
    "! Authorization Objects Details
    begin of ty_objtablestruc,
      "! <p class="shorttext">Object</p>
      "! Name of Authorization Object
      "! $required
      object type c length 10,
      "! <p class="shorttext">Object Description</p>
      "! Authorization Object Description
      "! $showAlways
      ttext  type zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Maintenance Status</p>
      "! Maintenance Status
            "! $values {@link zif_aff_sush_v1.data:co_okflag}
      "! $default {@link zif_aff_sush_v1.data:co_okflag.y_flag}
      "! $showAlways
      okflag type ty_okflag,
      "! <p class="shorttext">Fields</p>
      "! Authorization Fields.
      "! $showAlways
      fields type ty_authorization_fields,

    end of ty_objtablestruc .

  types:
  "! <p class="shorttext">Authorization Objects</p>
  "! Authorization Objects
    ty_authorization_objects type standard table of ty_objtablestruc with default key.

  types:
    "! <p class="shorttext">SUSH Object Type</p>
    "! Object type SUSH
    begin of  ty_main,
      "! $required
      format_version        type zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                type zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">General</p>
      "! General
      "! $required
      general               type ty_general,
      "! <p class="shorttext">Authorization objects</p>
      "! Authorization objects
      authorization_objects type ty_authorization_objects,
    end of ty_main .

endinterface.
