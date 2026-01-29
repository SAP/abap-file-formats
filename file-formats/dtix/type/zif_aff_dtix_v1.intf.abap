interface zif_aff_dtix_v1
  public.
  types:
      "! <p class="shorttext">Entity index</p>
      "! Entity index
      begin of ty_main,
        "! $required
        format_version type zif_aff_types_v1=>ty_format_version,
        "! <p class="shorttext">Header</p>
        "! Header
        "! $required
        header         type zif_aff_types_v1=>ty_header_60,
      end of ty_main.
    constants:
      co_st_name               type string value 'DDIC_AFF_DTIX_PROPERTIES',
      co_format_version        type zif_aff_types_v1=>ty_format_version value '1'.
endinterface.
