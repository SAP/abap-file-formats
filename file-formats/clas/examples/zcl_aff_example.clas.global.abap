CLASS zcl_aff_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES example_type TYPE string.

    DATA example_attribute TYPE example_type.

    EVENTS example_event.

    METHODS example_method
      IMPORTING
        !i_param TYPE i
      RAISING
        cx_static_check.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AFF_EXAMPLE IMPLEMENTATION.


  METHOD example_method.
    example_attribute = ''(txt).
  ENDMETHOD.
ENDCLASS.
