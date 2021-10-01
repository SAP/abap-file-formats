INTERFACE zif_aff_srvb_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">Service Content</p>
    "! Service content
    BEGIN OF ty_service_content,
      "! <p class="shorttext">Service Major Version</p>
      "! Service Major Version
      "! $required
      service_version       TYPE c LENGTH 4,
      "! <p class="shorttext">Service Minor Version</p>
      "! Service Minor Version
      "! $required
      service_minor_version TYPE n LENGTH 10,
      "! <p class="shorttext">Service Patch Version</p>
      "! Service Patch Version
      "! $required
      service_patch_version TYPE n LENGTH 10,
      "! <p class="shorttext">Service Build Version</p>
      "! Service Build Version
      service_build_version TYPE n LENGTH 10,
      "! <p class="shorttext">API Release State</p>
      "! API Release State
      "! $required
      release_state         TYPE string,
      "! <p class="shorttext">Service Definition</p>
      "! Service Definition
      "! $required
      srvd_name             TYPE c LENGTH 30,
    END OF ty_service_content.
  TYPES: ty_service_contents TYPE TABLE OF ty_service_content WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">Service Properties</p>
    "! Service properties
    BEGIN OF ty_service,
      "! <p class="shorttext">Service Name</p>
      "! Service Name
      "! $required
      service_name    TYPE c LENGTH 40,
      "! <p class="shorttext">Service Content</p>
      "! Service Content
      "! $required
      service_content TYPE ty_service_contents,
    END OF ty_service.
  TYPES: ty_services TYPE TABLE OF  ty_service WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">Service Binding Properties</p>
    "! Service Binding properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema             TYPE string,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header             TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Bind Type Impl</p>
      "! Service Binding Implementation Name
      "! $required
      bind_type_impl     TYPE c LENGTH 40,
      "! <p class="shorttext">Bind Type</p>
      "! Service Binding Type
      "! $required
      bind_type          TYPE c LENGTH 30,
      "! <p class="shorttext">Binding Category</p>
      "! Service Binding Category
      "! $required
      bind_type_category TYPE c LENGTH 1,
      "! <p class="shorttext">Bind Type Version</p>
      "! Service Binding Version
      "! $required
      bind_type_version  TYPE c LENGTH 30,
      "! <p class="shorttext">Services</p>
      "! Services
      "! $required
      services           TYPE ty_services,
    END OF ty_main.

ENDINTERFACE.
