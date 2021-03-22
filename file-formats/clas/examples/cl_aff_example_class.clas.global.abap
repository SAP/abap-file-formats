class CL_AFF_EXAMPLE_CLASS definition
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
      CX_AFF_ROOT .
  protected section.
  private section.
ENDCLASS.



CLASS CL_AFF_EXAMPLE_CLASS IMPLEMENTATION.


  method example_method.
    example_attribute = ''(txt).
  endmethod.
ENDCLASS.