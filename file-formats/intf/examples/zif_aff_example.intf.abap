interface ZIF_AFF_EXAMPLE
  public .


  types EXAMPLE_TYPE type STRING .

  data EXAMPLE_ATTRIBUTE type EXAMPLE_TYPE .

  events EXAMPLE_EVENT .

  methods EXAMPLE_METHOD
    importing
      !I_PARAM type I
    raising
      CX_STATIC_CHECK .
endinterface.