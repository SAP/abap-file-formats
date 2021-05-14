INTERFACE zif_aff_example
  PUBLIC .


  TYPES example_type TYPE string .

  DATA example_attribute TYPE example_type .

  EVENTS example_event .

  METHODS example_method
    IMPORTING
      !i_param TYPE i
    RAISING
      cx_static_check .
ENDINTERFACE.
