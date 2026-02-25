INTERFACE zif_aff_enqu_v1
  PUBLIC.

  "! $values { @link zif_aff_enqu_v1.data:co_lock_modes }
  "! $default { @link zif_aff_enqu_v1.data:co_lock_modes.exclusive_lock }
  TYPES ty_lock_mode TYPE c LENGTH 1.
  CONSTANTS:
    BEGIN OF co_lock_modes,
      "! <p class="shorttext">Exclusive Lock</p>
      "! Exclusive Lock
      exclusive                 TYPE ty_lock_mode VALUE 'E',
      "! <p class="shorttext">Shared lock</p>
      "! Shared lock
      shared                    TYPE ty_lock_mode VALUE 'S',
      "! <p class="shorttext">Exclusive, not cumulative</p>
      "! Exclusive, not cumulative
      exclusive_not_cumulative  TYPE ty_lock_mode VALUE 'X',
      "! <p class="shorttext">Set optimistic lock</p>
      "! Set optimistic lock
      set_optimistic            TYPE ty_lock_mode VALUE 'O',
      "! <p class="shorttext">Promote optimistic lock; transform from '0' to 'E'</p>
      "! Promote optimistic lock; transform from '0' to 'E'
      promote_optimistic        TYPE ty_lock_mode VALUE 'R',
      "! <p class="shorttext">Only conflict check extended exclusive lock, as with 'X'</p>
      "! Only conflict check extended exclusive lock, as with 'X'
      conflict_check_extended_excl   TYPE ty_lock_mode VALUE 'U',
      "! <p class="shorttext">Only conflict check exclusive lock, as with 'E'</p>
      "! Only conflict check exclusive lock, as with 'E'
      conflict_check_exclusive  TYPE ty_lock_mode VALUE 'V',
      "! <p class="shorttext">Conflict check for shared lock only, as with 'S'</p>
      "! CaConflict check for shared lock only, as with 'S'
      conflict_check_shared    TYPE ty_lock_mode VALUE 'W',
      "! <p class="shorttext">Only promotion check optimized lock, as with 'R'</p>
      "! Only promotion check optimized lock, as with 'R'
      promotion_check_optimized TYPE ty_lock_mode VALUE 'C',
      "! <p class="shorttext">Reserved</p>
      "! Reserved
      reserved_1                     TYPE ty_lock_mode VALUE 'T',
      "! <p class="shorttext">Reserved</p>
      "! Reserved
      reserved_2                     TYPE ty_lock_mode VALUE '+',
    END OF co_lock_modes.

  TYPES:
    "! <p class="shorttext">Primary Table</p>
    "! Primary Table of the lock object
    BEGIN OF ty_lock_table,
      "! <p class="shorttext">Table Name</p>
      "! Table Name
      "! $required
      name      TYPE if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Lock Mode</p>
      "! Lock Mode
      "! $required
      lock_mode TYPE ty_lock_mode,
    END OF ty_lock_table.

  "! <p class="shorttext">Lock Tables</p>
  "! Tables and corresponding lock modes
  TYPES ty_lock_tables TYPE STANDARD TABLE OF ty_lock_table WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Lock Modules</p>
    "! Lock Modules are generated on activation
    BEGIN OF ty_lock_modules,
      "! <p class="shorttext">Allow RFC</p>
      "! Allow RFC
      allow_rfc     TYPE abap_bool,
      "! <p class="shorttext">Lock Module</p>
      "! Lock Module
      lock_module   TYPE if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Unlock Module</p>
      "! Unlock Module
      unlock_module TYPE if_aff_types_v1=>ty_object_name_30,
    END OF ty_lock_modules.

  TYPES ty_field_name TYPE c LENGTH 30.
  TYPES:
    "! <p class="shorttext">Lock Parameter</p>
    "! Lock Parameter
    BEGIN OF ty_lock_parameter,
      "! <p class="shorttext">Active</p>
      "! Parameter is part of Function Module Interface
      active TYPE abap_bool,
      "! <p class="shorttext">Parameter Name</p>
      "! Parameter_name
      name   TYPE ty_field_name,
      "! <p class="shorttext">Table</p>
      "! Table
      table  TYPE if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Field</p>
      "! Field
      field  TYPE ty_field_name,
    END OF ty_lock_parameter,

    "! <p class="shorttext">Lock Parameters</p>
    "! Lock parameter candidates are derived from the primary keys of the tables
    ty_lock_parameters TYPE STANDARD TABLE OF ty_lock_parameter WITH EMPTY KEY.

  TYPES:
    "! <p class="shorttext">Lock Object</p>
    "! Lock Object (ENQU) v1
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version   TYPE if_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header           TYPE if_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Primary Table</p>
      "! Primary Table of the lock object
      primary_table    TYPE ty_lock_table,
      "! <p class="shorttext">Lock Modules</p>
      "! The lock modules are generated on activation
      lock_modules     TYPE ty_lock_modules,
      "! <p class="shorttext">Secondary Tables</p>
      "! Secondary Tables must have a foreign key relation to the primary table
      secondary_tables TYPE ty_lock_tables,
      "! <p class="shorttext">Lock Parameters</p>
      "! Lock parameter candidates are derived from the primary keys of the tables
      lock_parameters  TYPE ty_lock_parameters,
    END OF ty_main.

ENDINTERFACE.
