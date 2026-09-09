INTERFACE zif_aff_dynp_v1 PUBLIC.

************************************************************************
* Standalone replica of the ty_dynpro type from ZCL_ABAPGIT_OBJECTS_PROGRAM
************************************************************************

* ---------------------------------------------------------------------
* Header (was RPY_DYHEAD)
* ---------------------------------------------------------------------
  TYPES:
    BEGIN OF ty_dyhead,
      type            TYPE c LENGTH 1,
      nextscreen      TYPE c LENGTH 4,
      cursor_pos      TYPE c LENGTH 132,
      screen_grp      TYPE c LENGTH 4,
      lines           TYPE n LENGTH 3,
      columns         TYPE n LENGTH 3,
      hold_data       TYPE c LENGTH 1,
      fixed_font      TYPE c LENGTH 1,
      no_compr        TYPE c LENGTH 1,
      no_execute      TYPE c LENGTH 1,
      keep_scpos      TYPE c LENGTH 1,
      no_toolbar      TYPE c LENGTH 1,
      ctx_menon       TYPE c LENGTH 20,
      fiorienlargeoff TYPE c LENGTH 1,
    END OF ty_dyhead.

* ---------------------------------------------------------------------
* Containers (was DYCATT_TAB / RPY_DYCATT)
* ---------------------------------------------------------------------
  TYPES:
    BEGIN OF ty_dycatt,
      type         TYPE c LENGTH 11,
      name         TYPE c LENGTH 132,
      element_of   TYPE c LENGTH 132,
      line         TYPE n LENGTH 3,
      column       TYPE n LENGTH 3,
      length       TYPE n LENGTH 3,
      height       TYPE n LENGTH 3,
      loop_type    TYPE c LENGTH 3,
      loop_block   TYPE n LENGTH 3,
      loop_disp    TYPE n LENGTH 3,
      c_resize_v   TYPE c LENGTH 1,
      c_resize_h   TYPE c LENGTH 1,
      c_line_min   TYPE n LENGTH 3,
      c_coln_min   TYPE n LENGTH 3,
      c_scroll_v   TYPE c LENGTH 1,
      c_scroll_h   TYPE c LENGTH 1,
      tc_tabtype   TYPE c LENGTH 10,
      tc_separ_v   TYPE c LENGTH 1,
      tc_separ_h   TYPE c LENGTH 1,
      tc_title     TYPE c LENGTH 1,
      tc_header    TYPE c LENGTH 1,
      tc_config    TYPE c LENGTH 1,
      tc_sel_lns   TYPE c LENGTH 10,
      tc_sel_cls   TYPE c LENGTH 10,
      tc_lsel_cl   TYPE c LENGTH 1,
      tc_fixcol    TYPE n LENGTH 3,
      cu_cc_name   TYPE c LENGTH 40,
      sfw_switchid TYPE c LENGTH 30,
      sfw_showhide TYPE c LENGTH 1,
      tsvheight    TYPE c LENGTH 1,
      properties   TYPE string,
    END OF ty_dycatt.

  TYPES ty_dycatt_tab TYPE STANDARD TABLE OF ty_dycatt WITH DEFAULT KEY.

* ---------------------------------------------------------------------
* Fields (was DYFATC_TAB / RPY_DYFATC, which includes RPY_DYFATT)
* ---------------------------------------------------------------------
  TYPES:
    BEGIN OF ty_dyfatc,
      cont_type    TYPE c LENGTH 11,
      cont_name    TYPE c LENGTH 132,
      type         TYPE c LENGTH 11,
      name         TYPE c LENGTH 132,
      text         TYPE c LENGTH 132,
      dropdown     TYPE c LENGTH 1,
      icon_name    TYPE c LENGTH 30,
      icon_qinfo   TYPE c LENGTH 30,
      icon_qspec   TYPE c LENGTH 1,
      with_icon    TYPE c LENGTH 1,
      rolling      TYPE c LENGTH 1,
      line         TYPE n LENGTH 3,
      column       TYPE n LENGTH 3,
      length       TYPE n LENGTH 3,
      vislength    TYPE n LENGTH 3,
      height       TYPE n LENGTH 3,
      group1       TYPE c LENGTH 3,
      group2       TYPE c LENGTH 3,
      group3       TYPE c LENGTH 3,
      group4       TYPE c LENGTH 3,
      push_fcode   TYPE c LENGTH 20,
      push_ftype   TYPE c LENGTH 1,
      cxt_menon    TYPE c LENGTH 20,
      format       TYPE c LENGTH 4,
      from_dict    TYPE c LENGTH 1,
      modific      TYPE c LENGTH 1,
      conv_exit    TYPE c LENGTH 5,
      param_id     TYPE c LENGTH 20,
      set_param    TYPE c LENGTH 1,
      get_param    TYPE c LENGTH 1,
      up_lower     TYPE c LENGTH 1,
      no_templ     TYPE c LENGTH 1,
      foreignkey   TYPE c LENGTH 1,
      input_fld    TYPE c LENGTH 1,
      output_fld   TYPE c LENGTH 1,
      outputonly   TYPE c LENGTH 1,
      requ_entry   TYPE c LENGTH 1,
      poss_entry   TYPE c LENGTH 1,
      dropfrom     TYPE c LENGTH 1,
      right_just   TYPE c LENGTH 1,
      lead_zeros   TYPE c LENGTH 1,
      " DDIC name was *_ENTRY (not a valid ABAP identifier)
      star_entry   TYPE c LENGTH 1,
      no_reset     TYPE c LENGTH 1,
      fixed_font   TYPE c LENGTH 1,
      bright       TYPE c LENGTH 1,
      invisible    TYPE c LENGTH 1,
      " DDIC name was 2_DIMENS (not a valid ABAP identifier)
      two_dimens   TYPE c LENGTH 1,
      labelleft    TYPE c LENGTH 1,
      labelright   TYPE c LENGTH 1,
      ltr          TYPE c LENGTH 1,
      bidictrl     TYPE c LENGTH 1,
      dblclick     TYPE c LENGTH 1,
      matchcode    TYPE c LENGTH 132,
      ref_field    TYPE c LENGTH 132,
      tc_title     TYPE c LENGTH 1,
      tc_heading   TYPE c LENGTH 1,
      tc_selcol    TYPE c LENGTH 1,
      butt_right   TYPE c LENGTH 1,
      dict_i_fky   TYPE c LENGTH 1,
      dict_i_fkd   TYPE c LENGTH 1,
      dict_i_sgn   TYPE c LENGTH 1,
      dict_i_val   TYPE c LENGTH 1,
      sfw_switchid TYPE c LENGTH 30,
      sfw_showhide TYPE c LENGTH 1,
      properties   TYPE string,
    END OF ty_dyfatc.

  TYPES:
    ty_dyfatc_tab TYPE STANDARD TABLE OF ty_dyfatc WITH DEFAULT KEY.

* ---------------------------------------------------------------------
* Native dynpro header (was D020S)
* ---------------------------------------------------------------------
  TYPES:
    BEGIN OF ty_d020s,
      type TYPE c LENGTH 1,
      fnum TYPE c LENGTH 4,
      dgrp TYPE c LENGTH 4,
      bzmx TYPE i,
      bzbr TYPE i,
      mili TYPE i,
      mico TYPE i,
      mali TYPE i,
      maco TYPE i,
      noli TYPE i,
      noco TYPE i,
      valp TYPE i,
      cuan TYPE c LENGTH 1,
      hdat TYPE c LENGTH 1,
      spra TYPE c LENGTH 1,
      cupo TYPE c LENGTH 132,
*      dgen TYPE d,
*      tgen TYPE t,
    END OF ty_d020s.

* ---------------------------------------------------------------------
* Native dynpro field (was D021S)
* ---------------------------------------------------------------------
  TYPES:
    BEGIN OF ty_d021s,
      fnam TYPE c LENGTH 132,
      didx TYPE x LENGTH 2,
      flg1 TYPE x LENGTH 1,
      flg2 TYPE x LENGTH 1,
      flg3 TYPE x LENGTH 1,
      fill TYPE c LENGTH 1,
      fmb1 TYPE x LENGTH 1,
      fmb2 TYPE x LENGTH 1,
      colr TYPE c LENGTH 1,
      leng TYPE x LENGTH 1,
      line TYPE x LENGTH 1,
      coln TYPE x LENGTH 1,
      ltyp TYPE c LENGTH 1,
      lanf TYPE x LENGTH 1,
      lblk TYPE x LENGTH 1,
      lrep TYPE x LENGTH 1,
      fmky TYPE c LENGTH 3,
      paid TYPE c LENGTH 20,
      ucnv TYPE c LENGTH 5,
      type TYPE c LENGTH 4,
      auth TYPE c LENGTH 3,
      wnam TYPE c LENGTH 132,
      dmac TYPE c LENGTH 132,
      grp1 TYPE c LENGTH 3,
      grp2 TYPE c LENGTH 3,
      grp3 TYPE c LENGTH 3,
      grp4 TYPE c LENGTH 3,
      ityp TYPE c LENGTH 1,
      aglt TYPE x LENGTH 1,
      adez TYPE x LENGTH 1,
      stxt TYPE c LENGTH 132,
      res1 TYPE c LENGTH 255,
      res2 TYPE c LENGTH 255,
    END OF ty_d021s.

* ---------------------------------------------------------------------
* Native dynpro text (was D021T)
* ---------------------------------------------------------------------
  TYPES:
    BEGIN OF ty_d021t,
      lang TYPE c LENGTH 1,
      fldn TYPE c LENGTH 132,
      dtxt TYPE c LENGTH 132,
    END OF ty_d021t.

* ---------------------------------------------------------------------
* Main dynpro type (was ty_dynpro in ZCL_ABAPGIT_OBJECTS_PROGRAM)
* ---------------------------------------------------------------------
  TYPES:
    BEGIN OF ty_dynpro,
      header     TYPE ty_dyhead,
      containers TYPE ty_dycatt_tab,
      fields     TYPE ty_dyfatc_tab,
    END OF ty_dynpro.

  TYPES: BEGIN OF ty_dynpro_native,
      nat_header TYPE ty_d020s,
      nat_fields TYPE STANDARD TABLE OF ty_d021s WITH DEFAULT KEY,
      nat_texts  TYPE STANDARD TABLE OF ty_d021t WITH DEFAULT KEY,
    END OF ty_dynpro_native.

  TYPES:
    "! <p class="shorttext">Dynpro</p>
    "! Dynpro
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Description</p>
      "! Description
      description    TYPE string,
      "! <p class="shorttext">Dynpro</p>
      "! Dynpro
      dynpro         TYPE ty_dynpro,
      "! <p class="shorttext">Native Dynpro</p>
      "! Native dynpro (optional, only if the dynpro contains native elements)
      native_dynpro  TYPE ty_dynpro_native,
    END OF ty_main.

ENDINTERFACE.
