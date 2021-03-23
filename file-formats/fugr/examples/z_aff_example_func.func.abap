function z_aff_example_func
  importing
    i_param type i
  raising
    cx_static_check.



  types example_type type string .

  data example_attribute type example_type .

  example_attribute = 'This is an example Textelement'(001).
endfunction.