FUNCTION z_aff_example_func
  IMPORTING
    i_param TYPE i
  RAISING
    cx_static_check.



  TYPES example_type TYPE string .

  DATA example_attribute TYPE example_type .

  example_attribute = 'This is an example Textelement'(001).
ENDFUNCTION.