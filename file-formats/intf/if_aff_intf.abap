interface IF_OO_AFF_TYPES public.

  types:
    begin of ty_aff_header,
      "! The header for an ABAP main object
      begin of header,
        "! Location of the corresponding JSON schema
        schema             type string,
        "! Description of the ABAP main object
        description        type string,
        "! Master language of the ABAP main object
        master_language    type syst_langu,
        "! ABAP language version (standard, keyUser or cloudDevelopment)
        abap_langu_version type abap_language_version,
      end of header,
    end of ty_aff_header,

    begin of TY_COMPONENT,
      NAME        type SEOCMPNAME,
      DESCRIPTION type SEODESCR,
    end of TY_COMPONENT,

    TY_COMPONENTS type sorted table of TY_COMPONENT with unique key NAME,
    TY_SUBCOMPONENTS type sorted table of TY_COMPONENT with unique key NAME,

    begin of TY_METHOD,
      NAME        type SEOCMPNAME,
      DESCRIPTION type SEODESCR,
      PARAMETERS  type TY_SUBCOMPONENTS,
      EXCEPTIONS  type TY_SUBCOMPONENTS,
    end of TY_METHOD,
    TY_METHODS type sorted table of TY_METHOD with unique key NAME,

    begin of TY_EVENT,
      NAME        type SEOCMPNAME,
      DESCRIPTION type SEODESCR,
      PARAMETERS  type TY_SUBCOMPONENTS,
    end of TY_EVENT,
    TY_EVENTS type sorted table of TY_EVENT with unique key NAME,

    begin of ty_clif_properties,
        attributes type ty_components,
        methods type ty_methods,
        events type ty_events,
        types type ty_components,
    end of ty_clif_properties.

endinterface.