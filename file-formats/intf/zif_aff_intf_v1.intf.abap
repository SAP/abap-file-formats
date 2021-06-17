INTERFACE zif_aff_intf_v1 PUBLIC.

  "! Interface category
  "!
  "! $values {@link zif_aff_intf_v1.data:co_category}
  TYPES ty_category TYPE n LENGTH 2.

  CONSTANTS:
    "! Interface category
    BEGIN OF co_category,
      "! General interface
      general                      TYPE ty_category VALUE '00',
      "! Interface definition of a classic BAdI
      classic_badi                 TYPE ty_category              VALUE '01',
      "! Business interface for static components
      business_static_components   TYPE ty_category  VALUE '51',
      "! Business interface for instance-dependent components
      business_instance_components TYPE ty_category VALUE '52',
      "! Generated interface of a database procedure proxy
      db_procedure_proxy           TYPE ty_category     VALUE '65',
      "! Web Dynpro runtime interface
      web_dynpro_runtime           TYPE ty_category      VALUE '80',
      "! Generated interface of enterprise services
      enterprise_service           TYPE ty_category     VALUE '90',
    END OF co_category.

  TYPES:
    "! Component description (e.g., for methods, attributes, types)
    BEGIN OF ty_component_description,
      "! Name of the component
      name        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! Description of the component
      description TYPE zif_aff_types_v1=>ty_description_60,
    END OF ty_component_description,
    "! Interface component descriptions
    ty_component_descriptions    TYPE SORTED TABLE OF ty_component_description WITH UNIQUE KEY name,
    "! Sub component descriptions (e.g., for parameters or exceptions)
    ty_subcomponent_descriptions TYPE SORTED TABLE OF ty_component_description WITH UNIQUE KEY name.

  TYPES:
    "! Method description
    BEGIN OF ty_method,
      name        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! Description of the component
      description TYPE zif_aff_types_v1=>ty_description_60,
      "! Parameter descriptions
      parameters  TYPE ty_subcomponent_descriptions,
      "! Exception descriptions
      exceptions  TYPE ty_subcomponent_descriptions,
    END OF ty_method,
    "! Method descriptions
    ty_methods TYPE SORTED TABLE OF ty_method WITH UNIQUE KEY name.

  TYPES:
    "! Event description
    BEGIN OF ty_event,
      "! Name of the component
      name        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! Description of the component
      description TYPE zif_aff_types_v1=>ty_description_60,
      "! Parameter descriptions
      parameters  TYPE ty_subcomponent_descriptions,
    END OF ty_event,
    "! Event descriptions
    ty_events TYPE SORTED TABLE OF ty_event WITH UNIQUE KEY name.

  TYPES:
    "! Interface properties
    BEGIN OF ty_main,
      header     TYPE zif_aff_types_v1=>ty_header,
      "! Interface category
      category   TYPE ty_category,
      "! Interface is a proxy interface
      proxy      TYPE abap_bool,
      "! Type descriptions
      types      TYPE ty_component_descriptions,
      "! Attribute descriptions
      attributes TYPE ty_component_descriptions,
      "! Event descriptions
      events     TYPE ty_events,
      "! Method descriptions
      methods    TYPE ty_methods,
    END OF ty_main.

ENDINTERFACE.
