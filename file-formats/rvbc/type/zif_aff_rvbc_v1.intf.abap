"! AFF type for the object RVBC ( Review Booklets )
INTERFACE zif_aff_rvbc_v1
  PUBLIC.
  "! $values { @link zif_aff_rvbc_v1.data:co_extensibility_mode }
  "! $default { @link zif_aff_rvbc_v1.data:co_extensibility_mode.not_supported }
  TYPES ty_extensibility_mode TYPE n LENGTH 2.
  TYPES ty_app_id             TYPE c LENGTH 70.
  TYPES ty_source             TYPE n LENGTH 1.
  TYPES ty_status             TYPE n LENGTH 1.
  TYPES ty_consistency_status TYPE n LENGTH 1.
  TYPES ty_ina1_service_id    TYPE c LENGTH 30.
  TYPES ty_ina1_service_name  TYPE c LENGTH 40.
  TYPES ty_ina1_service_type  TYPE n LENGTH 2.

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


  TYPES:
    "! <p class="shorttext">Review Booklet Definition</p>
    "! Review booklet definition
    BEGIN OF ty_booklet_definition,
      "! <p class="shorttext">Application ID</p>
      "! Application ID
      "! $required
      application        TYPE ty_app_id,
      "! <p class="shorttext">Source</p>
      "! Source
      "! $required
      source             TYPE ty_source,
      "! <p class="shorttext">Status</p>
      "! Status
      "! $required
      status             TYPE ty_status,
      "! <p class="shorttext">Consistency Status</p>
      "! Consistency status
      "! $required
      consistency_status TYPE ty_consistency_status,
      "! <p class="shorttext">Extensibility Mode</p>
      "! Extensibility mode
      "! $required
      extensibility_mode TYPE ty_extensibility_mode,
    END OF ty_booklet_definition.

  TYPES:
    "! <p class="shorttext">InA Service</p>
    "! InA Service
    BEGIN OF ty_ina1_service,
      "! <p class="shorttext">Service ID</p>
      "! Service ID
      "! $required
      ina1_service_id TYPE ty_ina1_service_id,
      "! <p class="shorttext">Service Name</p>
      "! Service name
      "! $required
      ina1_service    TYPE ty_ina1_service_name,
      "! <p class="shorttext">Service Type</p>
      "! Service type
      "! $required
      service_type    TYPE ty_ina1_service_type,
    END OF ty_ina1_service.

  TYPES:
    "! <p class="shorttext">Object Type RVBC</p>
    "! Object type RVBC
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version          TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                  TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Booklet Definition</p>
      "! Booklet definition
      booklet_definition      TYPE ty_booklet_definition,
      "! <p class="shorttext">Predefined InA Service</p>
      "! Predefined InA service
      predefined_ina1_service TYPE ty_ina1_service,
    END OF ty_main.

ENDINTERFACE.
