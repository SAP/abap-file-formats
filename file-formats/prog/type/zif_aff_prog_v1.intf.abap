INTERFACE zif_aff_prog_v1 PUBLIC.

  "! <p class="shorttext">Program Type</p>
  "! Program type
  "! $values {@link zif_aff_prog_v1.data:co_program_type}
  "! $default {@link zif_aff_prog_v1.data:co_program_type.executable_program}
  TYPES ty_program_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Program Type</p>
    "! Program type
    BEGIN OF co_program_type,
      "! <p class="shorttext">Executable Program</p>
      "! Executable program
      executable_program TYPE ty_program_type VALUE '1',
      "! <p class="shorttext">Module Pool</p>
      "! Module pool
      module_pool        TYPE ty_program_type VALUE 'M',
      "! <p class="shorttext">Subroutine Pool</p>
      "! Subroutine pool
      subroutine_pool    TYPE ty_program_type VALUE 'S',
      "! <p class="shorttext">Include</p>
      "! Include
      include            TYPE ty_program_type VALUE 'I',
    END OF co_program_type.

  "! <p class="shorttext">Program Status</p>
  "! Program status
  "! $values {@link zif_aff_prog_v1.data:co_program_status}
  "! $default {@link zif_aff_prog_v1.data:co_program_status.unknown}
  TYPES ty_program_status TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Program Status</p>
    "! Program status
    BEGIN OF co_program_status,
      "! <p class="shorttext">SAP Production Program</p>
      "! SAP production program
      sap_production_program      TYPE ty_program_status VALUE 'P',
      "! <p class="shorttext">Customer Production Program</p>
      "! Customer production program
      customer_production_program TYPE ty_program_status VALUE 'K',
      "! <p class="shorttext">System Program</p>
      "! System program
      system_program              TYPE ty_program_status VALUE 'S',
      "! <p class="shorttext">Test Program</p>
      "! Test program
      test_program                TYPE ty_program_status VALUE 'T',
      "! <p class="shorttext">Unknown</p>
      "! Unknown
      unknown                     TYPE ty_program_status VALUE '',
    END OF co_program_status.

  TYPES:
    "! <p class="shorttext">Logical Database</p>
    "! Logical Database
    BEGIN OF ty_logical_database,
      "! <p class="shorttext">Logical Database Name</p>
      "! Name of a logical database.
      name             TYPE c LENGTH 20,
      "! <p class="shorttext">Selection Screen</p>
      "! The Dynpro selection screen.
      selection_screen TYPE c LENGTH 3,
    END OF ty_logical_database.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Program Type</p>
      "! Program type
      program_type             TYPE ty_program_type,
      "! <p class="shorttext">Program Status</p>
      "! Program status
      program_status           TYPE ty_program_status,
      "! <p class="shorttext">Fix Point Arithmetic</p>
      "! Fix point arithmetic
      fix_point_arithmetic TYPE abap_bool,
      "! <p class="shorttext">Edit Locked</p>
      "! The editor lock flag prevents other users from making changes to the program.
      "! Only the last person to change the program can remove the flag.
      edit_locked              TYPE abap_bool,
      "! <p class="shorttext">Starts Using Variant</p>
      "! A user can only start this report using a variant.
      starts_using_variant     TYPE abap_bool,
      "! <p class="shorttext">Authorization Group</p>
      "! Programs that are assigned to an authorization group are protected against
      "! display and execution. Security-related programs should, therefore, always
      "! be assigned to an authorization group.
      authorization_group      TYPE c LENGTH 8,
      "! <p class="shorttext">Application</p>
      "! Application (taplp)
      application              TYPE c LENGTH 1,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Program</p>
    "! Program
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_70_src,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Logical Database</p>
      "! Logical database
      logical_database    TYPE ty_logical_database,
    END OF ty_main.

ENDINTERFACE.
