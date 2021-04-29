INTERFACE zif_intf_v1 PUBLIC.

  TYPES: BEGIN OF header,
           description TYPE c LENGTH 60,
           language TYPE c LENGTH 2,
           abap_language_version TYPE string, " todo, use ENUMS?
         END OF header.

  TYPES: BEGIN OF name_description,
           name TYPE c LENGTH 30,
           description TYPE c LENGTH 60,
        END OF name_description.

  TYPES: BEGIN OF method,
           name TYPE c LENGTH 30,
           description TYPE c LENGTH 60,
           parameters TYPE STANDARD TABLE OF name_description WITH EMPTY KEY,
           exception TYPE STANDARD TABLE OF name_description WITH EMPTY KEY,
         END OF method.

  TYPES: BEGIN OF main,
           header TYPE header,
           typess TYPE STANDARD TABLE OF name_description WITH EMPTY KEY,
           attributes TYPE STANDARD TABLE OF name_description WITH EMPTY KEY,
           events TYPE STANDARD TABLE OF name_description WITH EMPTY KEY,
           events TYPE STANDARD TABLE OF method WITH EMPTY KEY,
         END OF main.

ENDINTERFACE.