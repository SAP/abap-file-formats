class cl_aff_obj definition
  public
  create public .

  public section.
    interfaces if_aff_obj.

    methods:
      constructor
        importing package type devclass
                  name    type if_aff_obj=>obj_name
                  type    type trobjtype.

  private section.
    data:
      package type devclass,
      name    type if_aff_obj=>obj_name,
      type    type trobjtype.

endclass.


class cl_aff_obj implementation.

  method constructor.
    me->package = to_upper( package ).
    me->name = to_upper( name ).
    me->type = to_upper( type ).
  endmethod.

  method if_aff_obj~get_package.
    result = me->package.
  endmethod.

  method if_aff_obj~get_name.
    result = me->name.
  endmethod.

  method if_aff_obj~get_type.
    result = me->type.
  endmethod.

  method if_aff_obj~to_trkey.
    result = value #( devclass = me->package obj_name = me->name obj_type = me->type ).
  endmethod.

endclass.