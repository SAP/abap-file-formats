INTERFACE zif_aff_sush_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">General</p>
    "! General
    "! $required
    BEGIN OF ty_general,
      "! <p class="shorttext">Application Name</p>
      "! Application Name of Authorization Default Value.
      "! $required
      obj_name TYPE string,
      "! <p class="shorttext">Type</p>
      "! Type of Authorization Default Value.
      "! $required
      type     TYPE usobtype,
      "! <p class="shorttext">Maintenance Mode</p>
      "! Maintenance Mode.
      "! $required
      okflag   TYPE usob_status_flag,
    END OF ty_general.

  TYPES:
    "! <p class="shorttext">Default Authorization Values</p>
    "! Default Authorization Values
    BEGIN OF ty_value,
      "! <p class="shorttext">From</p>
      "! From Value
      "! $showAlways
      low  TYPE xuval,
      "! <p class="shorttext">To</p>
      "! To Values
      "! $showAlways
      high TYPE xuval,
    END OF ty_value.

  "! <p class="shorttext">Authorization Fields</p>
  "! Authorization Fields
  TYPES ty_values  TYPE STANDARD TABLE OF ty_value WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Field Details</p>
    "! Authorization Field Details
    BEGIN OF ty_fldtablestruc,
      "! <p class="shorttext">Field</p>
      "! Name of Authorization Field
      "! $required
      field  TYPE xufield,
      "! <p class="shorttext">Values</p>
      "! Name of Authorization Field Value
      values TYPE ty_values,
    END OF ty_fldtablestruc.

  "! <p class="shorttext">Authorization Fields</p>
  "! Authorization Fields
  TYPES ty_authorization_fields  TYPE STANDARD TABLE OF ty_fldtablestruc WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Authorization Objects Details</p>
    "! Authorization Objects Details
    BEGIN OF ty_objtablestruc,
      "! <p class="shorttext">Object</p>
      "! Name of Authorization Object
      "! $required
      object TYPE xuobject,
      "! <p class="shorttext">Object Description</p>
      "! Authorization Object Description
      "! $showAlways
      ttext  TYPE xutext,
      "! <p class="shorttext">Maintenance Status</p>
      "! Maintenance Status
      "! $showAlways
      okflag TYPE xuokflag,
      "! <p class="shorttext">Fields</p>
      "! Authorization Fields.
      "! $showAlways
      fields TYPE ty_authorization_fields,

    END OF ty_objtablestruc.

  "! <p class="shorttext">Authorization Objects</p>
  "! Authorization Objects
  TYPES ty_authorization_objects TYPE STANDARD TABLE OF ty_objtablestruc WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">SUSH Object Type</p>
    "! Object type SUSH
    BEGIN OF  ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">General</p>
      "! General
      "! $required
      general               TYPE ty_general,
      "! <p class="shorttext">Authorization objects</p>
      "! Authorization objects
      authorization_objects TYPE ty_authorization_objects,
    END OF ty_main.

ENDINTERFACE.
