INTERFACE zif_aff_srvb_v1
  PUBLIC.
  "! <p class="shorttext">Binding Category</p>
  "! Service Binding category
  "! $values {@link zif_aff_srvb_v1.data:co_bind_type_category}
  TYPES ty_bind_type_category TYPE c LENGTH 1.

  CONSTANTS:
    BEGIN OF co_bind_type_category,
      "! <p class="shorttext">UI</p>
      "! UI
      ui      TYPE ty_bind_type_category VALUE 0,
      "! <p class="shorttext">Web API</p>
      "! Web API
      web_api TYPE ty_bind_type_category VALUE 1,
    END OF co_bind_type_category.
  TYPES:
    "! <p class="shorttext">Service Version</p>
    "! Service version
    BEGIN OF ty_service_content,
      "! <p class="shorttext">Service Version</p>
      "! Service version
      "! $required
      service_version         TYPE c LENGTH 24,
      "! <p class="shorttext">Service Build Version</p>
      "! Service build version
      service_build_version   TYPE n LENGTH 10,
      "! <p class="shorttext">Service Definition</p>
      "! Service definition
      "! $required
      service_definition TYPE c LENGTH 30,
    END OF ty_service_content.
  TYPES: ty_service_contents TYPE TABLE OF ty_service_content WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">Service Properties</p>
    "! Service properties
    BEGIN OF ty_service,
      "! <p class="shorttext">Service Name</p>
      "! Service name
      "! $required
      name    TYPE c LENGTH 40,
      "! <p class="shorttext">Service Versions</p>
      "! Service versions
      "! $required
     versions TYPE ty_service_contents,
    END OF ty_service.
  TYPES: ty_services TYPE TABLE OF  ty_service WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">Service Binding Properties</p>
    "! Service Binding properties
    BEGIN OF ty_main,
      "! $required
      format_version     TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header             TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Binding Type</p>
      "! Service Binding type
      "! $required
      binding_type          TYPE c LENGTH 30,
      "! <p class="shorttext">Binding Category</p>
      "! Service Binding category
      "! $required
      binding_type_category TYPE ty_bind_type_category,
      "! <p class="shorttext">Services</p>
      "! Services
      "! $required
      services           TYPE ty_services,
    END OF ty_main.

ENDINTERFACE.
