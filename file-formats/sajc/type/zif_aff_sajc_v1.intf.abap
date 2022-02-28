INTERFACE zif_aff_sajc_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">SAJC Object Type</p>
    "! Object type SAJC
    BEGIN OF ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                TYPE zif_aff_types_v1=>ty_header_120,
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
