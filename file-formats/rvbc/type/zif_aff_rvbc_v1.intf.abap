"! AFF type for the object RVBC ( Review Booklets )
INTERFACE zif_aff_rvbc_v1
  PUBLIC.

  TYPES ty_app_id             TYPE c LENGTH 70.
  TYPES ty_ina1_service_name  TYPE c LENGTH 40.

  "! $values { @link zif_aff_rvbc_v1.data:co_extensibility_mode }
  "! $default { @link zif_aff_rvbc_v1.data:co_extensibility_mode.not_supported }
  TYPES ty_extensibility_mode TYPE n LENGTH 2.
  CONSTANTS:
    BEGIN OF co_extensibility_mode,
      "! <p class="shorttext">Fully Supported Including Custom Analytical Queries</p>
      "! Fully supported including custom analytical queries
      fully_supported              TYPE ty_extensibility_mode VALUE 0,
      "! <p class="shorttext">Supported Only for Predefined Analytical Queries</p>
      "! Supported only for predefined analytical queries
      supported_predefined_queries TYPE ty_extensibility_mode VALUE 1,
      "! <p class="shorttext">Not Supported</p>
      "! Not supported
      not_supported                TYPE ty_extensibility_mode VALUE 2,
    END OF co_extensibility_mode.

  "! $values { @link zif_aff_rvbc_v1.data:co_source }
  "! $default { @link zif_aff_rvbc_v1.data:co_source.predefined }
  TYPES ty_source TYPE n LENGTH 1.
  CONSTANTS:
    BEGIN OF co_source,
      "! <p class="shorttext">Predefined</p>
      "! Predefined
      predefined TYPE ty_source VALUE 1,
      "! <p class="shorttext">Custom</p>
      "! Custom
      custom     TYPE ty_source VALUE 2,
    END OF co_source.

  "! $values { @link zif_aff_rvbc_v1.data:co_status }
  "! $default { @link zif_aff_rvbc_v1.data:co_status.draft }
  TYPES ty_status TYPE n LENGTH 1.
  CONSTANTS:
    BEGIN OF co_status,
      "! <p class="shorttext">Draft</p>
      "! Draft
      draft TYPE ty_status VALUE 1,
      "! <p class="shorttext">Final</p>
      "! Final
      final TYPE ty_status VALUE 2,
    END OF co_status.

  TYPES:
    "! <p class="shorttext">Review Booklet Definition</p>
    "! Review booklet definition
    BEGIN OF ty_booklet_definition,
      "! <p class="shorttext">Source</p>
      "! Source
      source             TYPE ty_source,
      "! <p class="shorttext">Status</p>
      "! Status
      status             TYPE ty_status,
      "! <p class="shorttext">Fiori Application</p>
      "! Fiori application
      application        TYPE ty_app_id,
      "! <p class="shorttext">Extensibility Mode</p>
      "! Extensibility mode
      extensibility_mode TYPE ty_extensibility_mode,
    END OF ty_booklet_definition.

  TYPES:
    "! <p class="shorttext">InA Services</p>
    "! InA Services
    BEGIN OF ty_ina1_services,
      "! <p class="shorttext">Predefined InA Service</p>
      "! Predefined InA service
      predefined TYPE ty_ina1_service_name,
      "! <p class="shorttext">Custom InA Service</p>
      "! Custom InA service
      custom     TYPE ty_ina1_service_name,
    END OF ty_ina1_services.

  TYPES:
    "! <p class="shorttext">Object Type RVBC</p>
    "! Object type RVBC
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version     TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header             TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Booklet Definition</p>
      "! Booklet definition
      "! $required
      booklet_definition TYPE ty_booklet_definition,
      "! <p class="shorttext">InA Services</p>
      "! InA services
      ina1_services      TYPE ty_ina1_services,
    END OF ty_main.

ENDINTERFACE.
