function Z_AFF_EXAMPLE_FUNC
  importing
    I_PARAM type I
  raising
    CX_STATIC_CHECK.



  types EXAMPLE_TYPE type STRING .

  data EXAMPLE_ATTRIBUTE type EXAMPLE_TYPE .

  example_attribute = 'This is an example Textelement'(001).
ENDFUNCTION.