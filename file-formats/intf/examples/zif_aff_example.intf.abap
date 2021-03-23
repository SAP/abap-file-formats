interface zif_aff_example
  public .


  types example_type type string .

  data example_attribute type example_type .

  events example_event .

  methods example_method
    importing
      i_param type i
    raising
      cx_static_check .
endinterface.