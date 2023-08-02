INTERFACE zif_aff_swcr_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Header</p>
    "! Header
    BEGIN OF ty_header,
      "! $required
      original_language     TYPE zif_aff_types_v1=>ty_original_language,
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.

  TYPES:
    "! <p class="shorttext">Access Permission</p>
    "! Access permission
    BEGIN OF ty_permission,
      "! <p class="shorttext">Software Component</p>
      "! Software component
      "! $required
      software_component TYPE c LENGTH 30,
    END OF ty_permission.

  "! <p class="shorttext">Access Permissions</p>
  "! Access permissions
  TYPES ty_permissions TYPE STANDARD TABLE OF ty_permission WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Dependency</p>
    "! Dependency
    BEGIN OF ty_dependency,
      "! <p class="shorttext">Software Component</p>
      "! Software component
      "! $required
      software_component TYPE c LENGTH 30,
    END OF ty_dependency.

  "! <p class="shorttext">Dependencies</p>
  "! Dependencies
  TYPES ty_dependencies TYPE STANDARD TABLE OF ty_dependency WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Software Component Relations</p>
    "! Software component relations
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE ty_header,
      "! <p class="shorttext">Access Permissions</p>
      "! The software component grants access permission to the specified software components
      permissions    TYPE ty_permissions,
      "! <p class="shorttext">Dependencies</p>
      "! The software component depends on the specified software components
      dependencies   TYPE ty_dependencies,
    END OF ty_main.

ENDINTERFACE.
