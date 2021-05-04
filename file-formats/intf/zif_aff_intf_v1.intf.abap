INTERFACE zif_aff_intf_v1 PUBLIC.

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
    subcomponent_descriptions TYPE SORTED TABLE OF component_description WITH UNIQUE KEY name,

    "! Method description
    BEGIN OF method.
      INCLUDE TYPE component_description. TYPES:
      "! Parameter descriptions
      parameters TYPE subcomponent_descriptions,
      "! Exception descriptions
      exceptions TYPE subcomponent_descriptions,
    END OF method,
    "! Method descriptions
    methods TYPE SORTED TABLE OF method WITH UNIQUE KEY name,

    "! Event description
    BEGIN OF event.
      INCLUDE TYPE component_description. TYPES:
      "! Parameter descriptions
      parameters TYPE subcomponent_descriptions,
    END OF event,
    "! Event descriptions
    events TYPE SORTED TABLE OF event WITH UNIQUE KEY name,

    "! Interface properties content
    BEGIN OF content,
      "! Type descriptions
      types      TYPE components,
      "! Attribute descriptions
      attributes TYPE components,
      "! Event descriptions
      events     TYPE events,
      "! Method descriptions
      methods    TYPE methods,
    END OF content,

    "! Interface properties
    BEGIN OF main.
      INCLUDE TYPE zif_aff_types_v1=>head.
      INCLUDE TYPE content. TYPES:
    END OF main.

ENDINTERFACE.