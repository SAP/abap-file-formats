class ltcl_unit_test definition for testing
  duration short risk level harmless.

  private section.
    data cut type ref to zcl_aff_example.

    methods setup.
    methods assert_smth for testing raising cx_static_check.

endclass.


class ltcl_unit_test implementation.

  method setup.
    cut = new zcl_aff_example( ).
  endmethod.


  method assert_smth.
    cl_abap_unit_assert=>fail( 'Implement your first test here' ).
  endmethod.

endclass.