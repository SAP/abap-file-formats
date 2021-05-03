INTERFACE zif_aff_intf_v1 PUBLIC.

  TYPES: BEGIN OF component,
           name        TYPE zif_aff_types_v1=>object_name_30,
           description TYPE zif_aff_types_v1=>description_60,
         END OF component,
         components    TYPE SORTED TABLE OF component WITH UNIQUE KEY name,
         subcomponents TYPE SORTED TABLE OF component WITH UNIQUE KEY name,

         BEGIN OF method,
           name        TYPE zif_aff_types_v1=>object_name_30,
           description TYPE zif_aff_types_v1=>description_60,
           parameters  TYPE subcomponents,
           exceptions  TYPE subcomponents,
         END OF method,
         methods TYPE SORTED TABLE OF method WITH UNIQUE KEY name,

         BEGIN OF event,
           name        TYPE zif_aff_types_v1=>object_name_30,
           description TYPE zif_aff_types_v1=>description_60,
           parameters  TYPE subcomponents,
         END OF event,
         events TYPE SORTED TABLE OF event WITH UNIQUE KEY name,

         BEGIN OF content,
           types      TYPE components,
           attributes TYPE components,
           events     TYPE events,
           methods    TYPE methods,
         END OF content.

  TYPES: BEGIN OF main.
           INCLUDE TYPE zif_aff_types_v1=>head.
           INCLUDE TYPE content.
  TYPES: END OF main.

ENDINTERFACE.