INTERFACE zif_aff_intf_v1 PUBLIC.

  TYPES: ty_category TYPE c LENGTH 2.

  CONSTANTS:
    "! Interface category
    BEGIN OF co_category,
      "! General interface
      general                      TYPE ty_category VALUE '00',
      "! Interface definition of a classic BAdI
      classic_badi                 TYPE ty_category VALUE '01',
      "! Business interface for static components
      business_static_components   TYPE ty_category VALUE '51',
      "! Business interface for instance-dependent components
      business_instance_components TYPE ty_category VALUE '52',
      "! Generated interface of a database procedure proxy
      db_procedure_proxy           TYPE ty_category VALUE '65',
      "! Web Dynpro runtime interface
      web_dynpro_runtime           TYPE ty_category VALUE '80',
      "! Generated interface of enterprise services
      enterprise_service           TYPE ty_category VALUE '90',
    END OF co_category.

  TYPES:
    "! Component description (e.g., for methods, attributes, types)
    BEGIN OF component_description,
      "! Name of the component
      name        TYPE zif_aff_types_v1=>object_name_30,
      "! Description of the component
      description TYPE zif_aff_types_v1=>description_60,
    END OF component_description,
    "! Interface component descriptions
    component_descriptions    TYPE SORTED TABLE OF component_description WITH UNIQUE KEY name,
    "! Sub component descriptions (e.g., for parameters or exceptions)
    subcomponent_descriptions TYPE SORTED TABLE OF component_description WITH UNIQUE KEY name.

  TYPES:
    "! Method description
    BEGIN OF method,
      name        TYPE zif_aff_types_v1=>object_name_30,
      "! Description of the component
      description TYPE zif_aff_types_v1=>description_60,
      "! Parameter descriptions
      parameters  TYPE subcomponent_descriptions,
      "! Exception descriptions
      exceptions  TYPE subcomponent_descriptions,
    END OF method,
    "! Method descriptions
    methods TYPE SORTED TABLE OF method WITH UNIQUE KEY name.

  TYPES:
    "! Event description
    BEGIN OF event,
      "! Name of the component
      name        TYPE zif_aff_types_v1=>object_name_30,
      "! Description of the component
      description TYPE zif_aff_types_v1=>description_60,
      "! Parameter descriptions
      parameters  TYPE subcomponent_descriptions,
    END OF event,
    "! Event descriptions
    events TYPE SORTED TABLE OF event WITH UNIQUE KEY name.

  TYPES:
    "! Interface properties
    BEGIN OF main,
      header     TYPE zif_aff_types_v1=>header,
      "! Interface category
      category   TYPE ty_category,
      "! Interface is a proxy interface
      proxy      TYPE abap_bool,
      "! Type descriptions
      types      TYPE component_descriptions,
      "! Attribute descriptions
      attributes TYPE component_descriptions,
      "! Event descriptions
      events     TYPE events,
      "! Method descriptions
      methods    TYPE methods,
    END OF main.

ENDINTERFACE.
