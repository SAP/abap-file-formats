INTERFACE zif_aff_dmon_v1
  PUBLIC.

  TYPES:
  "! <p class="shorttext">Caller Program Type</p>
  "! Caller Program Type
  "! $values {@link zif_aff_dmon_v1.data:co_caller_program_type}
    ty_caller_program_type TYPE c LENGTH 4 .

  TYPES:
    "! <p class="shorttext">ABAP Daemon Settings</p>
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Daemon Class Name</p>
      "! ABAP Daemon Class Name
      "! $required
      daemon_class_name   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Caller Program Type</p>
      "! Caller Program Type
      "! $required
      caller_program_type TYPE ty_caller_program_type,
      "! <p class="shorttext">Caller Program Name</p>
      "! Caller Program Name
      "! $required
      caller_program_name TYPE c LENGTH 40,
    END OF ty_main .

  CONSTANTS:
    "! <p class="shorttext">Caller Program Type</p>
    "! Caller Program Type
    BEGIN OF co_caller_program_type,
      "! <p class="shorttext">Class</p>
      "! Class Name
      clas TYPE ty_caller_program_type VALUE 'CLAS',
      "! <p class="shorttext">Function Group</p>
      "! Function Group Name
      fugr TYPE ty_caller_program_type VALUE 'FUGR',
      "! <p class="shorttext">Program</p>
      "! Program Name
      prog TYPE ty_caller_program_type VALUE 'PROG',
    END OF co_caller_program_type .
ENDINTERFACE.
