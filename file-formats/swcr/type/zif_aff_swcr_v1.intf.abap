INTERFACE if_aff_swcr_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Header</p>
    "! Header
    BEGIN OF ty_header,
      "! $required
      original_language     TYPE if_aff_types_v1=>ty_original_language,
      abap_language_version TYPE if_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.

  TYPES:
    "! <p class="shorttext">Access Permission</p>
    "! Access Permission
    BEGIN OF ty_permission,
      "! <p class="shorttext">Software Component</p>
      "! Software Component
      "! $required
      software_component TYPE c LENGTH 30,
    END OF ty_permission.

  "! <p class="shorttext">Access Permissions</p>
  "! Access Permissions
  TYPES ty_permissions TYPE STANDARD TABLE OF ty_permission WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Dependency</p>
    "! Dependency
    BEGIN OF ty_dependency,
      "! <p class="shorttext">Software Component</p>
      "! Software Component
      "! $required
      software_component TYPE c LENGTH 30,
    END OF ty_dependency.

  "! <p class="shorttext">Dependencies</p>
  "! Dependencies
  TYPES ty_dependencies TYPE STANDARD TABLE OF ty_dependency WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">Software Component Relations</p>
    "! Software Component Relations
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format Version
      "! $required
      format_version TYPE if_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE ty_header,
      "! <p class="shorttext">Access Permissions</p>
      "! The Software Component Grants Access Permission to the Specified Software Components
      permissions    TYPE ty_permissions,
      "! <p class="shorttext">Dependencies</p>
      "! The Software Component Depends on the Specified Software Components
      dependencies   TYPE ty_dependencies,
    END OF ty_main.

ENDINTERFACE.