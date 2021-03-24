class ZCL_AFF_EXAMPLE definition
  public
  final
  create public .

public section.

  types EXAMPLE_TYPE type STRING .

  data EXAMPLE_ATTRIBUTE type EXAMPLE_TYPE .

  events EXAMPLE_EVENT .

  methods EXAMPLE_METHOD
    importing
      !I_PARAM type I
    raising
      CX_STATIC_CHECK .
  protected section.
  private section.
ENDCLASS.



CLASS ZCL_AFF_EXAMPLE IMPLEMENTATION.


  method example_method.
    example_attribute = ''(txt).
  endmethod.
ENDCLASS.