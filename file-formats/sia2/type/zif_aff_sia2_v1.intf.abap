interface zif_aff_sia2_v1
  public.

  types:
    "! <p class="shorttext">Restriction Field</p>
    "! Restriction field assigned to the restriction type
    begin of ty_field,

      "! <p class="shorttext">Field Name</p>
      "! Name of the restriction field
      field_name      type c length 30,

      "! <p class="shorttext">PFCG Field Name</p>
      "! Name of the corresponding PFCG authorization field
      pfcg_field_name type c length 30,

      "! <p class="shorttext">Sort Order</p>
      "! Sort order of the restriction field, with leading zeros
      sort_order      type n length 2,

      "! <p class="shorttext">Text</p>
      "! Description text of the restriction field
      description     type c length 80,

      "! <p class="shorttext">Is Selected</p>
      "! Indicates whether the restriction field is selected
      is_selected     type abap_bool,

    end of ty_field.

  "! <p class="shorttext">Restriction Fields</p>
  "! Restriction fields assigned to the restriction type
  types ty_fields type sorted table of ty_field with unique key field_name.

  types:
    "! <p class="shorttext">Authorization Object Extension</p>
    "! Authorization object extension of the restriction type
    begin of ty_auth_object,

      "! <p class="shorttext">Object ID</p>
      "! ID of the authorization object extension
      auth_object_id type c length 30,

      "! <p class="shorttext">Authorization Object</p>
      "! ID of the assigned authorization object
      auth_object    type c length 10,

      "! <p class="shorttext">Object Text</p>
      "! Description text of the authorization object extension
      description    type c length 80,

    end of ty_auth_object.

  "! <p class="shorttext">Authorization Object Extensions</p>
  "! Authorization object extensions of the restriction type
  types ty_auth_objects type sorted table of ty_auth_object with unique key auth_object_id.

  types:

    "! <p class="shorttext">Restriction Type</p>
    "! Restriction Type (SIA2) main type
    begin of ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version type zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         type zif_aff_types_v1=>ty_header_60,

      "! <p class="shorttext">Create Fields</p>
      "! Indicates whether the restriction fields are created automatically
      create_fields  type abap_bool,

      "! <p class="shorttext">Restriction Fields</p>
      "! Restriction fields assigned to the restriction type
      fields         type ty_fields,

      "! <p class="shorttext">Authorization Object Extensions</p>
      "! Authorization object extensions of the restriction type
      auth_objects   type ty_auth_objects,

    end of ty_main.

endinterface.
