INTERFACE zif_aff_sia2_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Restriction Field</p>
    "! Restriction field assigned to the restriction type
    BEGIN OF ty_field,

      "! <p class="shorttext">Field Name</p>
      "! Name of the restriction field
      "! $required
      name        TYPE c LENGTH 30,

      "! <p class="shorttext">Text</p>
      "! Description text of the restriction field
      description TYPE c LENGTH 80,

    END OF ty_field.

  "! <p class="shorttext">Restriction Fields</p>
  "! Restriction fields assigned to the restriction type
  TYPES ty_fields TYPE SORTED TABLE OF ty_field WITH UNIQUE KEY name.

  TYPES:
    "! <p class="shorttext">Authorization Object Extension</p>
    "! Authorization object extension of the restriction type
    BEGIN OF ty_auth_object_extension,

      "! <p class="shorttext">Authorization Object Extension ID</p>
      "! ID of the authorization object extension
      "! $required
      id                      TYPE c LENGTH 30,

      "! <p class="shorttext">Authorization Object ID</p>
      "! ID of the assigned authorization object
      authorization_object_id TYPE c LENGTH 10,

      "! <p class="shorttext">Authorization Object Extension Description</p>
      "! Description text of the authorization object extension
      description             TYPE c LENGTH 80,

    END OF ty_auth_object_extension.

  "! <p class="shorttext">Authorization Object Extensions</p>
  "! Authorization object extensions of the restriction type
  TYPES ty_auth_object_extensions TYPE SORTED TABLE OF ty_auth_object_extension WITH UNIQUE KEY id.

  TYPES:

    "! <p class="shorttext">Restriction Type</p>
    "! Restriction Type (SIA2) main type
    BEGIN OF ty_main,

      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version         TYPE zif_aff_types_v1=>ty_format_version,

      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                 TYPE zif_aff_types_v1=>ty_header_60,

      "! <p class="shorttext">Restriction Fields</p>
      "! Restriction fields assigned to the restriction type
      fields                 TYPE ty_fields,

      "! <p class="shorttext">Authorization Object Extensions</p>
      "! Authorization object extensions of the restriction type
      auth_object_extensions TYPE ty_auth_object_extensions,

    END OF ty_main.

ENDINTERFACE.
