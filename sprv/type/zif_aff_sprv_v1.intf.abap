interface zif_aff_sprv_v1
public .


  types:
    "! <p class="shorttext">Create a service provider</p>
    "! Create a service provider
    BEGIN OF ty_provdetails,
      "! <p class="shorttext">Name</p>
      "! Name of the Service Provider
      "! $required
      name TYPE c LENGTH 30,
      "! <p class="shorttext">Original Language</p>
      "! Original Language
      "! $showAlways
      org_lang TYPE c LENGTH 2,
      "! <p class="shorttext">Prefix</p>
      "! Prefix for all generated objects
      "! $showAlways
      prefix TYPE c LENGTH 10,
    END OF ty_provdetails.
  types:
    "! <p class="shorttext">SOAP Web Service Provider Model</p>
    "! SOAP Web Service Provider Model
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Service Provider</p>
      "! Service Provider
      "! $required
      provider_details TYPE ty_provdetails,
    END OF ty_main .
endinterface.
