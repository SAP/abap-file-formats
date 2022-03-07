INTERFACE zif_aff_sajc_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Header for SACJ Objects</p>
    BEGIN OF ty_header,
      "! <p class="shorttext">Description</p>
      "! Description of the ABAP object
      "! $required
      description           TYPE c LENGTH 120,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the development object.
      "! $required
      original_language     TYPE sy-langu,
      "! $values {@link zif_aff_types_v1.data:co_abap_language_version_cloud}
      "! $default {@link zif_aff_types_v1.data:co_abap_language_version_cloud.standard}
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.

  TYPES:
    "! <p class="shorttext">SAJC Object Type</p>
    "! Object type SAJC
    BEGIN OF ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE ty_header,
      "! <p class="shorttext">Class with Execute Method</p>
      "! Name of the class which contains the execute-method to run within the job
      "! $required
      class_name            TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Class with Check Exit</p>
      "! Name of the class which contains the check exit
      check_exit_class      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Class with Value Help Exit</p>
      "! Name of the class which contains the value help exit
      value_help_exit_class TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_main.
ENDINTERFACE.
