INTERFACE z_aff_example_intf PUBLIC.

  TYPES ty_example_type TYPE string.

  CONSTANTS co_example_constant TYPE ty_example_type VALUE `ABC123` ##NO_TEXT.

  EVENTS example_event.

  "! Method description, lorem ipsum
  METHODS example_method
    IMPORTING
      !i_param TYPE ty_example_type.
ENDINTERFACE.
