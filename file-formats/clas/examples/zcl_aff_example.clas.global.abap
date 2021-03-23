class zcl_aff_example definition
  public
  final
  create public .

  public section.

    types example_type type string .

    data example_attribute type example_type .

    events example_event .

    methods example_method
      importing
        i_param type i
      raising
        cx_static_check .
  protected section.
  private section.
endclass.



class zcl_aff_example implementation.


  method example_method.
    example_attribute = ''(txt).
  endmethod.
endclass.