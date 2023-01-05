interface zif_aff_sush_v1
  public .
  types:
    "! <p class="shorttext">General</p>
    "! General
    "! $required
    begin of ty_general,
      "! <p class="shorttext">Application Name</p>
      "! Application Name of Authorization Default Value.
      "! $required
      name   type usobx-name,
      "! <p class="shorttext">Type</p>
      "! Type of Authorization Default Value.
      "! $required
      type   type usobx-type,
      "! <p class="shorttext">Maintenance Mode</p>
      "! Maintenance Mode.
      "! $required
      okflag type usob_status_flag,
    end of ty_general .

  types:
    "! <p class="shorttext">Default Authorization Values</p>
    "! Default Authorization Values
    begin of ty_value,
      "! <p class="shorttext">From</p>
      "! From Value
      "! $showAlways
      low  type usobt-low,
      "! <p class="shorttext">To</p>
      "! To Values
      "! $showAlways
      high type usobt-high,
    end of ty_value .

  types:
    "! <p class="shorttext">Authorization Fields</p>
    "! Authorization Fields
    ty_values  type standard table of ty_value with default key.

  types:
    "! <p class="shorttext">Authorization Field Details</p>
    "! Authorization Field Details
    begin of ty_fldtablestruc,
      "! <p class="shorttext">Field</p>
      "! Name of Authorization Field
      "! $required
      field  type usobt-field,
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
      object type usobx-object,
      "! <p class="shorttext">Object Description</p>
      "! Authorization Object Description
      "! $showAlways
      ttext  type tobjt-ttext,
      "! <p class="shorttext">Maintenance Status</p>
      "! Maintenance Status
      "! $showAlways
      okflag type usobx-okflag,
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
