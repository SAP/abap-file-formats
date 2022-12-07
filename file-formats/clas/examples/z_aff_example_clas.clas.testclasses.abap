CLASS ltcl_unit_test DEFINITION FOR TESTING
  DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO z_aff_example_clas.

    METHODS setup.
    METHODS assert_smth FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_unit_test IMPLEMENTATION.

  METHOD setup.
    cut = NEW z_aff_example_clas( ).
  ENDMETHOD.


  METHOD assert_smth.
    cl_abap_unit_assert=>assert_equals(
        act                  = 1
        exp                  = 1
    ).
  ENDMETHOD.

ENDCLASS.
