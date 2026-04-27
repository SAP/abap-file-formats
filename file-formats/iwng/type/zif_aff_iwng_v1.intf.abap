INTERFACE /iwngw/if_aff_iwng_v1
  PUBLIC.

  "! $values { @link /iwngw/if_aff_iwng_v1.data:co_state }
  "! $default { @link /iwngw/if_aff_iwng_v1.data:co_state.off }
  TYPES ty_state TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">State</p>
    "! State
    BEGIN OF co_state,
      "! <p class="shorttext">Off</p>
      "! Off
      off TYPE ty_state VALUE ' ',
      "! <p class="shorttext">On</p>
      "! On
      on  TYPE ty_state VALUE 'X',
    END OF co_state.
  TYPES ty_provider_id    TYPE c LENGTH 32.
  TYPES ty_provider_class TYPE c LENGTH 30.
  TYPES:
    "! <p class="shorttext">Notification Provider Object</p>
    "! Create Notification provider object
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      format_version TYPE if_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE if_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Provider ID</p>
      "! Provider ID
      "! $required
      provider_id    TYPE ty_provider_id,
      "! <p class="shorttext">Provider Class Name</p>
      "! Provider Class Name
      "! $required
      provider_class TYPE ty_provider_class,
      "! <p class="shorttext">State(Client-specific)</p>
      "! State(client-dependent)
      state          TYPE ty_state,
    END OF ty_main.
ENDINTERFACE.
