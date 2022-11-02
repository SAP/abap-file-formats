INTERFACE zif_aff_clas_v1 PUBLIC.

  "! <p class="shorttext">Class Category</p>
  "! Category of the class
  "! $values {@link zif_aff_clas_v1.data:co_category}
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
      "! <p class="shorttext">Test class (ABAP Unit)</p>
      "! Test class (ABAP Unit)
      testclass_abap_unit            TYPE ty_category VALUE '05',
      "! <p class="shorttext">Behavior class (behavior implementations)</p>
      "! Behavior class (behavior implementations)
      behavior_class                 TYPE ty_category VALUE '06',
      "! <p class="shorttext">Entity event handler class</p>
      "! Entity event handler class
      entity_event_handler           TYPE ty_category VALUE '07',
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
      "! <p class="shorttext">Area class (shared objects)</p>
      "! Area class (shared objects)
      area_class_shared_objects      TYPE ty_category VALUE '45',
      "! <p class="shorttext">Business class</p>
      "! Business class
      business_class                 TYPE ty_category VALUE '50',
      "! <p class="shorttext">BSP application class</p>
      "! BSP application class
      bsp_application_class          TYPE ty_category VALUE '60',
      "! <p class="shorttext">Basis class for BSP element handlers</p>
      "! Basis class for BSP element handlers
      basis_class_bsp_element_hdlr   TYPE ty_category VALUE '70',
      "! <p class="shorttext">Web Dynpro runtime object</p>
      "! Web Dynpro runtime object
      web_dynpro_runtime_object      TYPE ty_category VALUE '80',
    END OF co_category.

  TYPES:
    "! <p class="shorttext">Class Properties</p>
    "! Class properties
    BEGIN OF ty_main,
      "! $required
      format_version       TYPE zif_aff_types_v1=>ty_format_version,
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
      "! <p class="shorttext">Descriptions</p>
      "! Descriptions maintained in SE80
      descriptions         TYPE zif_aff_oo_types_v1=>ty_descriptions,
    END OF ty_main.

ENDINTERFACE.
