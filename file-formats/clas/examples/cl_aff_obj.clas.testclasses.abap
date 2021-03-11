class ltcl_unit_test definition final for testing
  duration short
  risk level harmless.

  private section.
    data:
      cut type ref to cl_aff_obj.

    methods:
      setup,
      gets_package for testing raising cx_static_check,
      gets_name for testing raising cx_static_check,
      gets_type for testing raising cx_static_check,
      to_trkey for testing raising cx_static_check.
endclass.


class ltcl_unit_test implementation.

  method setup.
    cut = new cl_aff_obj( package = 'DEVC' name = 'NAME' type = 'TYPE' ).
  endmethod.

  method gets_package.
    cl_abap_unit_assert=>assert_equals( exp = 'DEVC' act = cut->if_aff_obj~get_package( ) ).
  endmethod.

  method gets_name.
    cl_abap_unit_assert=>assert_equals( exp = 'NAME' act = cut->if_aff_obj~get_name( ) ).
  endmethod.

  method gets_type.
    cl_abap_unit_assert=>assert_equals( exp = 'TYPE' act = cut->if_aff_obj~get_type( ) ).
  endmethod.

  method to_trkey.
    cl_abap_unit_assert=>assert_equals( exp = value trkey( devclass = 'DEVC' obj_name = 'NAME' obj_type = 'TYPE' ) act = cut->if_aff_obj~to_trkey( ) ).
  endmethod.

endclass.