interface zif_aff_prog_v1 public.

  "! <p class="shorttext">Program Type</p>
  "! Program type
  "! $values {@link zif_aff_prog_v1.data:co_program_type}
  "! $default {@link zif_aff_prog_v1.data:co_program_type.executable_program}
  types ty_program_type type c length 1.

  constants:
    "! <p class="shorttext">Program Type</p>
    "! Program type
    begin of co_program_type,
      "! <p class="shorttext">Executable Program</p>
      "! Executable program
      executable_program type ty_program_type value '1',
      "! <p class="shorttext">Module Pool</p>
      "! Module pool
      module_pool     type ty_program_type value 'M',
      "! <p class="shorttext">Subroutine Pool</p>
      "! Subroutine pool
      subroutine_pool type ty_program_type value 'S',
      "! <p class="shorttext">Include</p>
      "! Include
      include         type ty_program_type value 'I',
    end of co_program_type.

  "! <p class="shorttext">Program Status</p>
  "! Program status
  "! $values {@link zif_aff_prog_v1.data:co_program_status}
  "! $default {@link zif_aff_prog_v1.data:co_program_status.unknown}
  types ty_program_status type c length 1.

  constants:
    "! <p class="shorttext">Program Status</p>
    "! Program status
    begin of co_program_status,
      "! <p class="shorttext">SAP Production Program</p>
      "! SAP production program
      sap_production_program      type ty_program_status value 'P',
      "! <p class="shorttext">Customer Production Program</p>
      "! Customer production program
      customer_production_program type ty_program_status value 'K',
      "! <p class="shorttext">System Program</p>
      "! System program
      system_program              type ty_program_status value 'S',
      "! <p class="shorttext">Test Program</p>
      "! Test program
      test_program                type ty_program_status value 'T',
      "! <p class="shorttext">Unknown</p>
      "! Unknown
      unknown                     type ty_program_status value '',
    end of co_program_status.

  types:
    "! <p class="shorttext">Logical Database</p>
    "! Logical Database
    begin of ty_logical_database,
      "! <p class="shorttext">Logical Database Name</p>
      "! Name of a logical database.
      name             type c length 20,
      "! <p class="shorttext">Selection Screen</p>
      "! The Dynpro selection screen.
      selection_screen type c length 3,
    end of ty_logical_database.

  types:
    "! <p class="shorttext">General Information</p>
    "! General information
    begin of ty_general_information,
      "! <p class="shorttext">Program Type</p>
      "! Program type
      program_type             type ty_program_type,
      "! <p class="shorttext">Program Status</p>
      "! Program status
      status                   type ty_program_status,
      "! <p class="shorttext">Fix Point Arithmetic</p>
      "! Fix point arithmetic
      has_fix_point_arithmetic type abap_bool,
      "! <p class="shorttext">Edit Locked</p>
      "! The editor lock flag prevents other users from making changes to the program. Only the last person to change the program can remove the flag.
      edit_locked              type abap_bool,
      "! <p class="shorttext">Starts Using Variant</p>
      "! A user can only start this report using a variant.
      starts_using_variant     type abap_bool,
      "! <p class="shorttext">Authorization Group</p>
      "! Programs that are assigned to an authorization group are protected against display and execution. Security-related programs should, therefore, always be assigned to an authorization group.
      authorization_group      type c length 8,
      "! <p class="shorttext">Application</p>
      "! Application (taplp)
      application              type c length 1,
    end of ty_general_information.

  types:
    "! <p class="shorttext">Program</p>
    "! Program
    begin of ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      type zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              type zif_aff_types_v1=>ty_header_70_src,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information type ty_general_information,
      "! <p class="shorttext">Logical Database</p>
      "! Logical database
      logical_database    type ty_logical_database,
    end of ty_main.

endinterface.
