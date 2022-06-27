interface zif_aff_sprv_v1
public .


  types:
    "! <p class="shorttext">Service Provider</p>
    "! Service Provider Details
    BEGIN OF ty_servprovider,
      "! <p class="shorttext">Name</p>
      "! Name of the Service Provider
      "! $required
      name TYPE c LENGTH 30,
      "! <p class="shorttext">Prefix</p>
      "! Prefix for all generated objects
      "! $showAlways
      prefix TYPE c LENGTH 10,
    END OF ty_servprovider.
  types:
    "! <p class="shorttext">SOAP Web Service Provider Model</p>
    "! SOAP Web Service Provider Model
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header Data
      "! $required
      header TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Service Provider</p>
      "! Service Provider Details
      "! $required
      service_provider TYPE ty_servprovider,
    END OF ty_main .
endinterface.
