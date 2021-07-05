interface if_oo_aff_intf_v1 public.

  "! <p class="shorttext">Interface Category</p>
  "! Interface category
  "! $values {@link if_oo_aff_intf_v1.data:co_category}
  types ty_category type n length 2.

  constants:
    "! <p class="shorttext">Interface Category</p>
    "! Interface category
    begin of co_category,
      "! <p class="shorttext">General</p>
      "! General interface
      general                      type ty_category value '00',
      "! <p class="shorttext">Classic BAdI</p>
      "! Interface definition of a classic BAdI
      classic_badi                 type ty_category value '01',
      "! <p class="shorttext">Business (Static Components)</p>
      "! Business interface for static components
      business_static_components   type ty_category value '51',
      "! <p class="shorttext">Business (Instance-dep. components)</p>
      "! Business interface for instance-dependent components
      business_instance_components type ty_category value '52',
      "! <p class="shorttext">DB Procedure Proxy</p>
      "! Generated interface of a database procedure proxy
      db_procedure_proxy           type ty_category value '65',
      "! <p class="shorttext">Web Dynpro Runtime</p>
      "! Web Dynpro runtime interface
      web_dynpro_runtime           type ty_category value '80',
      "! <p class="shorttext">Enterprise Services</p>
      "! Generated interface of enterprise services
      enterprise_service           type ty_category value '90',
    end of co_category.

  types:
    "! <p class="shorttext">Name and Description</p>
    "! Name and description
    begin of ty_component_description,
      "! <p class="shorttext">Name</p>
      "! Name
      "! $required
      name        type if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Description</p>
      "! Description
      "! $required
      description type if_aff_types_v1=>ty_description_60,
    end of ty_component_description,

    "! <p class="shorttext">Component Descriptions</p>
    "! Interface component descriptions
    ty_component_descriptions    type sorted table of ty_component_description with unique key name.


  types:
    "! <p class="shorttext">Method Description</p>
    "! Method description
    begin of ty_method,
      "! <p class="shorttext">Method Name</p>
      "! Name of the method
      "! $required
      name        type if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Method Description</p>
      "! Description of the method
      "! $required
      description type if_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Parameter Descriptions</p>
      "! Parameter descriptions
      parameters  type ty_component_descriptions,
      "! <p class="shorttext">Exception Descriptions</p>
      "! Exception descriptions
      exceptions  type ty_component_descriptions,
    end of ty_method,
    "! <p class="shorttext">Method Descriptions</p>
    "! Method descriptions
    ty_methods type sorted table of ty_method with unique key name.

  types:
    "! <p class="shorttext">Event Description</p>
    "! Event description
    begin of ty_event,
      "! <p class="shorttext">Event Name</p>
      "! Name of the event
      "! $required
      name        type if_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Event Description</p>
      "! Description of the event
      "! $required
      description type if_aff_types_v1=>ty_description_60,
      "! <p class="shorttext">Parameter Descriptions</p>
      "! Parameter descriptions
      parameters  type ty_component_descriptions,
    end of ty_event,
    "! <p class="shorttext">Event Descriptions</p>
    "! Event descriptions
    ty_events type sorted table of ty_event with unique key name.

  types:
    "! <p class="shorttext">Interface Properties</p>
    "! Interface properties
    begin of ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema     type string,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header     type if_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">Interface Category</p>
      "! Interface category
      category   type ty_category,
      "! <p class="shorttext">Proxy Interface</p>
      "! Interface is a proxy interface
      proxy      type abap_bool,
      "! <p class="shorttext">Type Descriptions</p>
      "! Type descriptions
      types      type ty_component_descriptions,
      "! <p class="shorttext">Attribute Descriptions</p>
      "! Attribute descriptions
      attributes type ty_component_descriptions,
      "! <p class="shorttext">Event Descriptions</p>
      "! Event descriptions
      events     type ty_events,
      "! <p class="shorttext">Method Descriptions</p>
      "! Method descriptions
      methods    type ty_methods,
    end of ty_main.

endinterface.
