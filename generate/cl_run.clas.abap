CLASS cl_run DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    CLASS-METHODS run
      IMPORTING
        object_type   TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS cl_run IMPLEMENTATION.

  METHOD run.
    DATA writer     TYPE REF TO zcl_aff_writer_json_schema.
    DATA generator  TYPE REF TO zcl_aff_generator.
    DATA string_tab TYPE string_table.
    DATA type_name  TYPE string.
    DATA schema_id  TYPE string.
    DATA ref        TYPE REF TO data.
    FIELD-SYMBOLS <row> LIKE LINE OF string_tab.

    schema_id = |https://github.com/SAP/abap-file-formats/blob/main/file-formats/{ to_lower( object_type ) }/{ to_lower( object_type ) }-v1.json|.
    type_name = to_upper( |ZIF_AFF_{ object_type }_V1=>TY_MAIN| ).

    CREATE DATA ref TYPE (type_name).

    CREATE OBJECT writer
      EXPORTING
        schema_id = schema_id.

    CREATE OBJECT generator
      EXPORTING
        writer = writer.

    string_tab = generator->generate_type( ref->* ).

* workaround for transpiler/JS keywords
    LOOP AT string_tab ASSIGNING <row>.
      IF condense( <row> ) CP '"interface_"*'.
        REPLACE FIRST OCCURRENCE OF '"interface_"' IN <row> WITH '"interface"'.
      ENDIF.
    ENDLOOP.

    CONCATENATE LINES OF string_tab INTO result SEPARATED BY |\n|.
  ENDMETHOD.

ENDCLASS.
