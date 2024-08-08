INTERFACE zif_aff_sprv_v1
  PUBLIC.


  TYPES:
    "! <p class="shorttext">Service Provider</p>
    "! Service provider details
    BEGIN OF ty_servprovider,
      "! <p class="shorttext">Provider Name</p>
      "! Name of the service provider
      "! $required
      provider_name      TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Namespace</p>
      "! Namespace of the service provider
      "! $required
      namespace          TYPE c LENGTH 255,
      "! <p class="shorttext">Object Name Prefix</p>
      "! Prefix for all generated objects
      "! $showAlways
      prefix             TYPE c LENGTH 10,
      "! <p class="shorttext">Implementing Class</p>
      "! Implementing class of service provider
      "! $showAlways
      implementing_class TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_servprovider.
  TYPES:
    "! <p class="shorttext">SOAP Web Service Provider Model</p>
    "! SOAP web service provider model
    BEGIN OF ty_main,
      "! $required
      format_version   TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header data
      "! $required
      header           TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Service Provider</p>
      "! Service provider details
      "! $required
      service_provider TYPE ty_servprovider,
    END OF ty_main.
ENDINTERFACE.
