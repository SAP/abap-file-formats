CLASS cl_run DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    CLASS-METHODS run
      IMPORTING
        main_object_type   TYPE string
        sub_object_type   TYPE string
        format_version TYPE string
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

    schema_id = |https://github.com/SAP/abap-file-formats/blob/main/file-formats/{ to_lower( main_object_type ) }/{ to_lower( sub_object_type ) }-v{ format_version }.json|.
    type_name = to_upper( |ZIF_AFF_{ sub_object_type }_V{ format_version }=>TY_MAIN| ).

    CREATE DATA ref TYPE (type_name).

    CREATE OBJECT writer
      EXPORTING
        schema_id      = schema_id
        format_version = format_version.

    CREATE OBJECT generator
      EXPORTING
        writer = writer.

    string_tab = generator->zif_aff_generator~generate_type( ref->* ).

* workaround for transpiler/JS keywords
    LOOP AT string_tab ASSIGNING <row>.
      IF condense( <row> ) CP '"interface_"*'.
        REPLACE FIRST OCCURRENCE OF '"interface_"' IN <row> WITH '"interface"'.
      ENDIF.
    ENDLOOP.

    CONCATENATE LINES OF string_tab INTO result SEPARATED BY |\n|.
  ENDMETHOD.

ENDCLASS.
