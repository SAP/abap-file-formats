interface zif_aff_ddlx_v1
  public.

  types:
    "! <p class="shorttext">Object Type DDLX</p>
    "! DDLX object type
    begin of ty_main,
      "! $required
      format_version type zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         type zif_aff_types_v1=>ty_header_60,
    end of ty_main.

endinterface.
