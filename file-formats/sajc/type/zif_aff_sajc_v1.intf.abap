INTERFACE zif_aff_sajc_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Header for SAJC Object</p>
    "! The header for an application job catalog entry
    BEGIN OF ty_header,
      "! <p class="shorttext">Description</p>
      "! Description of the application job catalog entry
      "! $required
      description           TYPE c LENGTH 120,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the application job catalog entry
      "! $required
      original_language     TYPE sy-langu,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP language version
      "! $values {@link zif_aff_types_v1.data:co_abap_language_version_cloud}
      "! $default {@link zif_aff_types_v1.data:co_abap_language_version_cloud.standard}
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version_cloud,
    END OF ty_header.

  "! <p class="shorttext">Program Name</p>
  "! Name of the program
  TYPES ty_program_name TYPE c LENGTH 40.

  TYPES:
    "! <p class="shorttext">Exit Classes</p>
    "! Classes which contain the exits of the job scheduling and processing
    BEGIN OF ty_exit_classes,
      "! <p class="shorttext">Check</p>
      "! Name of the class which contains the check exit
      check        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Value Help</p>
      "! Name of the class which contains the value help exit
      value_help   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Notification</p>
      "! Name of the class which contains the notification exit
      notification TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_exit_classes.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Class with Execute Method</p>
      "! Name of the class which contains the execute-method to run within the job
      "! $required
      class_name   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Executed Program</p>
      "! Name of the program which is executed within the job
      program_name TYPE ty_program_name,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Application Job Catalog Entry</p>
    "! Attributes of the application job catalog entry
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE ty_header,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Exit Classes</p>
      "! Classes which contain the exits of the job scheduling and processing
      exit_classes        TYPE ty_exit_classes,
    END OF ty_main.
ENDINTERFACE.
