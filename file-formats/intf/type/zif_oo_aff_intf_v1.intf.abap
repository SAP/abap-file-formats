INTERFACE zif_oo_aff_intf_v1 PUBLIC.

  "! <p class="shorttext">Interface Category</p>
  "! Interface category
  "! $values {@link zif_oo_aff_intf_v1.data:co_category}
  TYPES ty_category TYPE n LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Interface Category</p>
    "! Interface category
    BEGIN OF co_category,
      "! <p class="shorttext">General</p>
      "! General interface
      general                      TYPE ty_category VALUE '00',
      "! <p class="shorttext">Classic BAdI</p>
      "! Interface definition of a classic BAdI
      classic_badi                 TYPE ty_category VALUE '01',
      "! <p class="shorttext">Business (Static Components)</p>
      "! Business interface for static components
      business_static_components   TYPE ty_category VALUE '51',
      "! <p class="shorttext">Business (Instance-dep. components)</p>
      "! Business interface for instance-dependent components
      business_instance_components TYPE ty_category VALUE '52',
      "! <p class="shorttext">DB Procedure Proxy</p>
      "! Generated interface of a database procedure proxy
      db_procedure_proxy           TYPE ty_category VALUE '65',
      "! <p class="shorttext">Web Dynpro Runtime</p>
      "! Web Dynpro runtime interface
      web_dynpro_runtime           TYPE ty_category VALUE '80',
      "! <p class="shorttext">Enterprise Services</p>
      "! Generated interface of enterprise services
      enterprise_service           TYPE ty_category VALUE '90',
    END OF co_category.

  TYPES:
    "! <p class="shorttext">Name and Description</p>
    "! Name and description
    BEGIN OF ty_component_description,
      "! <p class="shorttext">Name</p>
      "! Name
      "! $required
      name        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description TYPE zif_aff_types_v1=>ty_description_60,
    END OF ty_component_description,

    "! <p class="shorttext">Component Descriptions</p>
    "! Interface component descriptions
    ty_component_descriptions    TYPE SORTED TABLE OF ty_component_description WITH UNIQUE KEY name.


  TYPES:
    "! <p class="shorttext">Method Description</p>
    "! Method description
    BEGIN OF ty_method,
      "! <p class="shorttext">Method Name</p>
      "! Name of the method
      "! $required
      name        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Method Description</p>
      "! Description of the method
      "! $required
      description TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Parameter Descriptions</p>
      "! Parameter descriptions
      parameters  TYPE ty_component_descriptions,
      "! <p class="shorttext">Exception Descriptions</p>
      "! Exception descriptions
      exceptions  TYPE ty_component_descriptions,
    END OF ty_method,
    "! <p class="shorttext">Method Descriptions</p>
    "! Method descriptions
    ty_methods TYPE SORTED TABLE OF ty_method WITH UNIQUE KEY name.

  TYPES:
    "! <p class="shorttext">Event Description</p>
    "! Event description
    BEGIN OF ty_event,
      "! <p class="shorttext">Event Name</p>
      "! Name of the event
      "! $required
      name        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Event Description</p>
      "! Description of the event
      "! $required
      description TYPE zif_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Parameter Descriptions</p>
      "! Parameter descriptions
      parameters  TYPE ty_component_descriptions,
    END OF ty_event,
    "! <p class="shorttext">Event Descriptions</p>
    "! Event descriptions
    ty_events TYPE SORTED TABLE OF ty_event WITH UNIQUE KEY name.

  TYPES:
    "! <p class="shorttext">Interface Properties</p>
    "! Interface properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema     TYPE string,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header     TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">Interface Category</p>
      "! Interface category
      category   TYPE ty_category,
      "! <p class="shorttext">Proxy Interface</p>
      "! Interface is a proxy interface
      proxy      TYPE abap_bool,
      "! <p class="shorttext">Type Descriptions</p>
      "! Type descriptions
      types      TYPE ty_component_descriptions,
      "! <p class="shorttext">Attribute Descriptions</p>
      "! Attribute descriptions
      attributes TYPE ty_component_descriptions,
      "! <p class="shorttext">Event Descriptions</p>
      "! Event descriptions
      events     TYPE ty_events,
      "! <p class="shorttext">Method Descriptions</p>
      "! Method descriptions
      methods    TYPE ty_methods,
    END OF ty_main.

ENDINTERFACE.
