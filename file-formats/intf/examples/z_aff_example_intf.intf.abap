interface z_aff_example_intf public .

  types ty_example_type type string .

  data example_attribute type ty_example_type .

  events example_event .

  "! Method description, lorem ipsum
  methods example_method
    importing
      !i_param type ty_example_type
    raising
      cx_static_check .
endinterface.
