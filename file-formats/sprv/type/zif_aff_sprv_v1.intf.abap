INTERFACE zif_aff_sprv_v1
  PUBLIC.


  TYPES:
    "! <p class="shorttext">Service Provider</p>
    "! Service provider details
    BEGIN OF ty_servprovider,
      "! <p class="shorttext">Name</p>
      "! Name of the service provider
      "! $required
      name   TYPE c LENGTH 30,
      "! <p class="shorttext">Prefix</p>
      "! Prefix for all generated objects
      "! $showAlways
      prefix TYPE c LENGTH 10,
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
