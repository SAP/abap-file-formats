"! This is an example interface for ABAP File Formats
interface ZIF_AFF_EXAMPLE
  public .

  "! This is an example type
  types EXAMPLE_TYPE type STRING .

  "! This is an example attribute
  data EXAMPLE_ATTRIBUTE type EXAMPLE_TYPE .

  "! This is an example event
  events EXAMPLE_EVENT .

  "! This is an example method
  "! @parameter I_PARAM |This is an example parameter
  "! @raising CX_AFF_ROOT |This is an example exception
  methods EXAMPLE_METHOD
    importing
      !I_PARAM type I
    raising
      CX_AFF_ROOT .

endinterface.