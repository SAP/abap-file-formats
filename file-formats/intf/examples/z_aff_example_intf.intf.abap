INTERFACE z_aff_example_intf PUBLIC.

  TYPES ty_example_type TYPE string.

  DATA example_attribute TYPE ty_example_type.

  EVENTS example_event.

  "! Method description, lorem ipsum
  METHODS example_method
    IMPORTING
      !i_param TYPE ty_example_type
    RAISING
      cx_static_check.
ENDINTERFACE.
