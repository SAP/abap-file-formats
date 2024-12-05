"! AFF type for the object RVBC
INTERFACE zif_aff_rvbc_v1
  PUBLIC.
  "! $values { @link zif_aff_rvbc_v1.data:co_extensibility_mode }
  "! $default { @link zif_aff_rvbc_v1.data:co_extensibility_mode.not_supported }
  TYPES ty_extensibility_mode TYPE rvb_ext_mode.
  CONSTANTS:
    BEGIN OF co_extensibility_mode,
      "! <p class="shorttext">Fully supported include custom analytical queries</p>
      "! Fully supported include custom analytical queries
      fully_supported              TYPE ty_extensibility_mode VALUE if_rvb_constants=>rvb_extensibility_mode-fully_supported,
      "! <p class="shorttext">Supported only for predefined analytical queries</p>
      "! Supported only for predefined analytical queries
      supported_predefined_queries TYPE ty_extensibility_mode
                                   VALUE if_rvb_constants=>rvb_extensibility_mode-supported_predefined_queries,
      "! <p class="shorttext">Not Supported</p>
      "! Not Supported
      not_supported                TYPE ty_extensibility_mode VALUE if_rvb_constants=>rvb_extensibility_mode-not_supported,
    END OF co_extensibility_mode.


  TYPES:
    "! <p class="shorttext">Review Booklet Definition</p>
    "! Review Booklet Definition
    BEGIN OF ty_booklet_definition,
      "! <p class="shorttext">Application ID</p>
      "! Application ID
      "! $required
      application                TYPE rvb_app_id,
      "! <p class="shorttext">Source</p>
      "! Source
      "! $required
      source                    TYPE rvb_source,
      "! <p class="shorttext">Status</p>
      "! Status
      "! $required
      status                    TYPE rvb_status,
      "! <p class="shorttext">Consistency Status</p>
      "! Consistency Status
      "! $required
      element_consistency_status TYPE rvb_constcy_status,
      "! <p class="shorttext">Extensibility Mode</p>
      "! Extensibility Mode
      "! $required
      extensibility_mode        TYPE ty_extensibility_mode,
      "! <p class="shorttext">Main Language</p>
      "! Main Language
      main_language             TYPE spras,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP Language Version
      abap_language_version     TYPE abap_language_version,

    END OF ty_booklet_definition.

  TYPES:
    "! <p class="shorttext">InA Service</p>
    "! InA Service
    BEGIN OF ty_ina1_service,
      "! <p class="shorttext">Service ID</p>
      "! Service ID
      "! $required
      ina1_service_id TYPE rvb_ina1_service_id,
      "! <p class="shorttext">Service Name</p>
      "! Service Name
      "! $required
      ina1_service    TYPE rvb_ina1_service_name,
      "! <p class="shorttext">Service Type</p>
      "! Service Type
      "! $required
      service_type    TYPE rvb_ina1_service_type,
    END OF ty_ina1_service.

  TYPES:
    "! <p class="shorttext">Object Type RVBC</p>
    "! object type RVBC
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
      "! Booklet Definition
      booklet_definition      TYPE ty_booklet_definition,
      "! <p class="shorttext">Favorites</p>
      "! Favorites
      predefined_ina1_service TYPE ty_ina1_service,
    END OF ty_main.

ENDINTERFACE.
