INTERFACE zif_aff_dmon_v1
  PUBLIC.

  TYPES:
  "! <p class="shorttext">Caller Object Type</p>
  "! Caller object type
  "! $values {@link zif_aff_dmon_v1.data:co_caller_object_type}
    ty_caller_object_type TYPE c LENGTH 4.

  CONSTANTS:
    "! <p class="shorttext">Caller Object Type</p>
    "! Caller object type
    BEGIN OF co_caller_object_type,
      "! <p class="shorttext">Class</p>
      "! Class
      clas TYPE ty_caller_object_type VALUE 'CLAS',
      "! <p class="shorttext">Function Group</p>
      "! Function group
      fugr TYPE ty_caller_object_type VALUE 'FUGR',
      "! <p class="shorttext">Program</p>
      "! Program
      prog TYPE ty_caller_object_type VALUE 'PROG',
    END OF co_caller_object_type.

  TYPES:
    BEGIN OF ty_caller_object,
      "! <p class="shorttext">Type</p>
      "! type
      "! $required
      type TYPE ty_caller_object_type,
      "! <p class="shorttext">Name</p>
      "! name
      "! $required
      name TYPE c LENGTH 40,
    END OF ty_caller_object,

     "! <p class="shorttext">Daemon Type</p>
     "! Daemon type
     "! $values {@link zif_aff_dmon_v1.data:co_daemon_type}
     "! $default {@link zif_aff_dmon_v1.data:co_daemon_type.application}
     ty_daemon_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Daemon Type</p>
    "! Daemon type
    BEGIN OF co_daemon_type,
      "! <p class="shorttext">Application Daemon</p>
      "! Application daemon
      application TYPE ty_daemon_type VALUE 'A',
      "! <p class="shorttext">System Daemon</p>
      "! System daemon
      system      TYPE ty_daemon_type VALUE 'S',
    END OF co_daemon_type.

  TYPES:

    BEGIN OF ty_main,
      "! $required
      format_version    TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header            TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Class</p>
      "! Class name
      "! $required
      class_name TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Caller Object</p>
      "! Caller object
      "! $required
      caller_object    TYPE ty_caller_object,
      "! <p class="shorttext">Type</p>
      "! Daemon type
      daemon_type       TYPE ty_daemon_type,
    END OF ty_main.

ENDINTERFACE.
