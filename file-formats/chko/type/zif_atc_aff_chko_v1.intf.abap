INTERFACE zif_atc_aff_chko_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Parameter</p>
    "! A parameter of an ATC Check Object
    BEGIN OF ty_parameter,
      "! <p class="shorttext">Technical ID</p>
      "! The technical Id of a parameter
      technical_id TYPE c LENGTH 4,
      "! <p class="shorttext">Parameter Name</p>
      "! Name of a parameter
      name         TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Parameter Description</p>
      "! Description of a parameter
      description  TYPE c LENGTH 255,
      "! <p class="shorttext">Modifiable Flag</p>
      "! The parameter is modifiable
      modifiable   TYPE abap_bool,
    END OF ty_parameter.

  TYPES:
    "! <p class="shorttext">Parameters</p>
    "! List of parameters
    ty_parameters TYPE HASHED TABLE OF ty_parameter WITH UNIQUE KEY technical_id
      WITH UNIQUE HASHED KEY xml_name COMPONENTS name.

  TYPES:
    "! <p class="shorttext">ATC Check</p>
    "! ATC check object properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema             TYPE string,
      "! <p class="shorttext">Header</p>
      "! header
      "! $required
      header             TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Category</p>
      "! The parent category of an ATC Check Object
      category           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Implementing Class</p>
      "! The implementing class of the ATC Check Object
      "! $required
      implementing_class TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Remote-enabled flag</p>
      "! The ATC Check Object is remote-enabled
      remote_enabled     TYPE abap_bool,
      "! <p class="shorttext">Parameters</p>
      "! Parameters of the ATC Check Object
      parameters         TYPE ty_parameters,
    END OF ty_main.
ENDINTERFACE.
