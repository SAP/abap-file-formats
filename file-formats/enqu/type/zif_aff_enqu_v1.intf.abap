INTERFACE zif_aff_enqu_v1
  PUBLIC.

  "! $values { @link zif_aff_enqu_v1.data:co_lock_modes }
  "! $default { @link zif_aff_enqu_v1.data:co_lock_modes.exclusive }
  TYPES ty_lock_mode TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_lock_modes,
      "! <p class="shorttext">Exclusive Lock</p>
      "! Exclusive lock
      exclusive                    TYPE ty_lock_mode VALUE 'E',
      "! <p class="shorttext">Shared Lock</p>
      "! Shared lock
      shared                       TYPE ty_lock_mode VALUE 'S',
      "! <p class="shorttext">Exclusive, Not Cumulative</p>
      "! Exclusive, not cumulative
      exclusive_not_cumulative     TYPE ty_lock_mode VALUE 'X',
      "! <p class="shorttext">Set Optimistic Lock</p>
      "! Set optimistic lock
      set_optimistic               TYPE ty_lock_mode VALUE 'O',
      "! <p class="shorttext">Promote Optimistic Lock</p>
      "! Promote optimistic lock; transform from '0' to 'E'
      promote_optimistic           TYPE ty_lock_mode VALUE 'R',
      "! <p class="shorttext">Only Conflict Check Extended Exclusive Lock</p>
      "! Only conflict check extended exclusive lock, as with 'X'
      conflict_check_extended_excl TYPE ty_lock_mode VALUE 'U',
      "! <p class="shorttext">Only Conflict Check Exclusive Lock</p>
      "! Only conflict check exclusive lock, as with 'E'
      conflict_check_exclusive     TYPE ty_lock_mode VALUE 'V',
      "! <p class="shorttext">Conflict Check For Shared Lock Only</p>
      "! Conflict check for shared lock only, as with 'S'
      conflict_check_shared        TYPE ty_lock_mode VALUE 'W',
      "! <p class="shorttext">Only Promotion Check Optimized Lock</p>
      "! Only promotion check optimized lock, as with 'R'
      promotion_check_optimized    TYPE ty_lock_mode VALUE 'C',
      "! <p class="shorttext">Reserved</p>
      "! Reserved
      reserved_1                   TYPE ty_lock_mode VALUE 'T',
      "! <p class="shorttext">Reserved</p>
      "! Reserved
      reserved_2                   TYPE ty_lock_mode VALUE '+',
      "! <p class="shorttext">Initial</p>
      "! Initial
      initial                      TYPE ty_lock_mode VALUE '',
    END OF co_lock_modes.

  TYPES:
    "! <p class="shorttext">Primary Table</p>
    "! Primary Table of the lock object
    BEGIN OF ty_lock_table,
      "! <p class="shorttext">Table Name</p>
      "! Table name
      "! $required
      name      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Lock Mode</p>
      "! Lock mode
      "! $required
      lock_mode TYPE ty_lock_mode,
    END OF ty_lock_table.

  "! <p class="shorttext">Lock Tables</p>
  "! Tables and corresponding lock modes
  TYPES ty_lock_tables TYPE STANDARD TABLE OF ty_lock_table WITH DEFAULT KEY.

  TYPES ty_field_name  TYPE c LENGTH 30.
  TYPES:
    "! <p class="shorttext">Lock Parameter</p>
    "! Lock parameter
    BEGIN OF ty_lock_parameter,
      "! <p class="shorttext">Parameter Name</p>
      "! Parameter name
      "! $required
      name   TYPE ty_field_name,
      "! <p class="shorttext">Table</p>
      "! Table
      "! $required
      table  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Field</p>
      "! Field
      "! $required
      field  TYPE ty_field_name,
      "! <p class="shorttext">Active</p>
      "! Parameter is part of function module interface
      "! $showAlways
      active TYPE abap_bool,
    END OF ty_lock_parameter,

    "! <p class="shorttext">Lock Parameters</p>
    "! Lock parameter candidates are derived from the primary keys of the tables
    ty_lock_parameters TYPE STANDARD TABLE OF ty_lock_parameter WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Lock Modules</p>
    "! Lock modules are generated during activation
    BEGIN OF ty_lock_modules,
      "! <p class="shorttext">Allow RFC</p>
      "! Allow RFC for lock modules
      "! $showAlways
      allow_rfc TYPE abap_bool,
    END OF ty_lock_modules.

  TYPES:
    "! <p class="shorttext">Lock Object</p>
    "! Lock object (ENQU)
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version   TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header           TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Primary Table</p>
      "! Primary table of the lock object
      "! $required
      primary_table    TYPE ty_lock_table,
      "! <p class="shorttext">Secondary Tables</p>
      "! Secondary tables must have a foreign key relation to the primary table
      secondary_tables TYPE ty_lock_tables,
      "! <p class="shorttext">Lock Parameters</p>
      "! Lock parameter candidates are derived from the primary keys of the tables
      "! $required
      lock_parameters  TYPE ty_lock_parameters,
      "! <p class="shorttext">Lock Modules</p>
      "! Lock modules are generated during activation
      "! $required
      lock_modules     TYPE ty_lock_modules,
    END OF ty_main.

ENDINTERFACE.
