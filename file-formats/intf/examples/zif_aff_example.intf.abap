INTERFACE zif_aff_example PUBLIC.

  TYPES ty_example_type TYPE string.

  EVENTS example_event.

  "! Method description, lorem ipsum
  METHODS example_method
    IMPORTING
      !i_param TYPE ty_example_type
    RAISING
      cx_static_check.
ENDINTERFACE.
