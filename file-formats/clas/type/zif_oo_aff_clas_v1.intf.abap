INTERFACE zif_oo_aff_clas_v1 PUBLIC.

  "! <p class="shorttext">Class Category</p>
  "! Category of the class
  "! $values {@link zif_oo_aff_clas_v1.data:co_category}
  TYPES ty_category TYPE n LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Class Category</p>
    "! Category of the class
    BEGIN OF co_category,
      "! <p class="shorttext">General object type</p>
      "! General object type
      general_object_type            TYPE ty_category VALUE '00',
      "! <p class="shorttext">Exit class</p>
      "! Exit class
      exit_class                     TYPE ty_category VALUE '01',
      "! <p class="shorttext">Persistent class</p>
      "! Persistent class
      persistent_class               TYPE ty_category VALUE '10',
      "! <p class="shorttext">Factory for persistent class</p>
      "! Factory for persistent class
      factory_for_persistent_class   TYPE ty_category VALUE '11',
      "! <p class="shorttext">Status class for persistent class</p>
      "! Status class for persistent class
      status_class_for_persist_class TYPE ty_category VALUE '12',
      "! <p class="shorttext">RFC proxy class</p>
      "! RFC proxy class
      rfc_proxy_class                TYPE ty_category VALUE '35',
      "! <p class="shorttext">Exception class</p>
      "! Exception class
      exception_class                TYPE ty_category VALUE '40',
      "! <p class="shorttext">Business class</p>
      "! Business class
      business_class                 TYPE ty_category VALUE '50',
      "! <p class="shorttext">BSP application class</p>
      "! BSP application class
      bsp_application_class          TYPE ty_category VALUE '60',
      "! <p class="shorttext">Basis class for BSP element handlers</p>
      "! Basis class for BSP element handlers
      basis_class_bsp_element_hdlr   TYPE ty_category VALUE '70',
      "! <p class="shorttext">Area class (shared objects)</p>
      "! Area class (shared objects)
      area_class_shared_objects      TYPE ty_category VALUE '45',
      "! <p class="shorttext">Test class (ABAP Unit)</p>
      "! Test class (ABAP Unit)
      testclass_abap_unit            TYPE ty_category VALUE '05',
      "! <p class="shorttext">Behavior class (behavior implementations)</p>
      "! Behavior class (behavior implementations)
      behavior_class                 TYPE ty_category VALUE '06',
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
    "! Class component descriptions
    ty_component_descriptions TYPE SORTED TABLE OF ty_component_description WITH UNIQUE KEY name.


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
    "! <p class="shorttext">Class Properties</p>
    "! Class properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema               TYPE string,
      "! <p class="shorttext">Header</p>
      "! header
      "! $required
      header               TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">Class Category</p>
      "! Class category
      category             TYPE ty_category,
      "! <p class="shorttext">Fix Point Arithmetic</p>
      "! Fix point arithmetic
      fix_point_arithmetic TYPE abap_bool,
      "! <p class="shorttext">Message Class</p>
      "! The message class of the class
      message_class        TYPE c LENGTH 20,
      "! <p class="shorttext">Type Descriptions</p>
      "! Type descriptions
      types                TYPE ty_component_descriptions,
      "! <p class="shorttext">Attribute Descriptions</p>
      "! Attribute descriptions
      attributes           TYPE ty_component_descriptions,
      "! <p class="shorttext">Event Descriptions</p>
      "! Event descriptions
      events               TYPE ty_events,
      "! <p class="shorttext">Method Descriptions</p>
      "! Method descriptions
      methods              TYPE ty_methods,
    END OF ty_main.

ENDINTERFACE.
