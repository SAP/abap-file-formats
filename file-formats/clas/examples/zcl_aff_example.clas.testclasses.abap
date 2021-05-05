CLASS ltcl_unit_test DEFINITION FOR TESTING
  DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_aff_example.

    METHODS setup.
    METHODS assert_smth FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_unit_test IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_aff_example( ).
  ENDMETHOD.


  METHOD assert_smth.
    cl_abap_unit_assert=>fail( 'Implement your first test here' ).
  ENDMETHOD.

ENDCLASS.