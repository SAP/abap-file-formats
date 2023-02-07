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
      "! $enumValue 'CLAS'
      clas TYPE ty_caller_object_type VALUE 'CLAS',
      "! <p class="shorttext">Function Group</p>
      "! Function group
      "! $enumValue 'FUGR'
      fugr TYPE ty_caller_object_type VALUE 'FUGR',
      "! <p class="shorttext">Program</p>
      "! Program
      "! $enumValue 'PROG'
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

  TYPES:
   "! <p class="shorttext">Start Type</p>
   "! Start type
   "! $values {@link zif_aff_dmon_v1.data:co_start_type}
   "! $default {@link zif_aff_dmon_v1.data:co_start_type.automatically_started}
    ty_start_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">start Type</p>
    "! start type
    BEGIN OF co_start_type,
      "! <p class="shorttext">Automatically Started Daemon</p>
      "! Automatically started Daemon
      automatically_started       TYPE ty_start_type VALUE 'A',
      "! <p class="shorttext">Explicitly Started Daemon (same user)</p>
      "! Explicitly started Daemon (same user)
      explicitly_started_sameuser TYPE ty_start_type VALUE 'H',
      "! <p class="shorttext">Explicitly Started Daemon (different user, deprecated)</p>
      "! Explicitly started Daemon (different user, deprecated)
      explicitly_started_diffuser TYPE ty_start_type VALUE 'D',
    END OF co_start_type.

  CONSTANTS:
    "! <p class="shorttext">Daemon Type</p>
    "! Daemon type
    BEGIN OF co_daemon_type,
      "! <p class="shorttext">Application Daemon</p>
      "! Application Daemon
      application TYPE ty_daemon_type VALUE 'A',
      "! <p class="shorttext">System Daemon</p>
      "! System Daemon
      system      TYPE ty_daemon_type VALUE 'S',
    END OF co_daemon_type.

  TYPES:

    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Class</p>
      "! Class name
      "! $required
      class_name     TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Caller Object</p>
      "! Caller object
      "! $required
      caller_object  TYPE ty_caller_object,
      "! <p class="shorttext">Daemon Type</p>
      "! Daemon type
      daemon_type    TYPE ty_daemon_type,
      "! <p class="shorttext">Start Type</p>
      "! Start type
      start_type     TYPE ty_start_type,

    END OF ty_main.

ENDINTERFACE.
