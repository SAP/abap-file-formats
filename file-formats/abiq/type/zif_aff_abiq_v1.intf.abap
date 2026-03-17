"! AFF type for the object ABIQ ( ABI Quick-ACtions )
INTERFACE zif_aff_abiq_v1
  PUBLIC.

  "! $values { @link zif_aff_abiq_v1.data:co_quick_action_type }
  "! $default { @link zif_aff_abiq_v1.data:co_quick_action_type.llm }
  types ty_quick_action_type type numc2.
  constants:
    begin of co_quick_action_type,
      "! <p class="shorttext">LLM</p>
      "! LLM Quick Action
      llm  type ty_quick_action_type value 01,
      "! <p class="shorttext">JSON</p>
      "! JSON Quick Action
      json type ty_quick_action_type value 02,
      "! <p class="shorttext">PAL</p>
      "! PAL Quick Action
      pal  type ty_quick_action_type value 03,
    end of co_quick_action_type.

  "! $values { @link zif_aff_abiq_v1.data:co_quick_action_scope }
  "! $default { @link zif_aff_abiq_v1.data:co_quick_action_scope.query }
  types ty_quick_action_scope type numc2.
  constants:
    begin of co_quick_action_scope,
      "! <p class="shorttext">Query</p>
      "! Query
      query     type ty_quick_action_scope value 01,
      "! <p class="shorttext">One Data Provider</p>
      "! One Data Provider per Page
      single_dp type ty_quick_action_scope value 02,
      "! <p class="shorttext">Two Data Providers</p>
      "! Two Data Providers per Page
      multi_dp  type ty_quick_action_scope value 03,
    end of co_quick_action_scope.

  "! $values { @link zif_aff_abiq_v1.data:co_output_type }
  "! $default { @link zif_aff_abiq_v1.data:co_output_type.not_set }
  types ty_output_type type numc2.
  constants:
    begin of co_output_type,
      "! <p class="shorttext">Not Set</p>
      "! Not Set
      not_set  type ty_quick_action_scope value 00,
      "! <p class="shorttext">HTML</p>
      "! HTML
      html       type ty_quick_action_scope value 01,
      "! <p class="shorttext">Card Chart</p>
      "! Card Chart
      card_chart type ty_quick_action_scope value 02,
    end of co_output_type.

  types:
    "! <p class="shorttext">Quick Action Definition</p>
    "! Quick Action Definition
    begin of ty_quick_action_definition,
      "! <p class="shorttext">Type</p>
      "! Type
      "! $required
      type                type ty_quick_action_type,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope               type ty_quick_action_scope,
      "! <p class="shorttext">Visible</p>
      "! Visible for Consumption
      "! $required
      consumption_visible type abap_bool,
    end of ty_quick_action_definition.

  types:
    "! <p class="shorttext">Prompt Definition</p>
    "! Prompt Definition
    begin of ty_prompt_definition,
      "! <p class="shorttext">System Prompt</p>
      "! System Prompt
      "! $required
      system_prompt       type string,
      "! <p class="shorttext">User Prompt</p>
      "! User Prompt
      "! $required
      user_prompt         type string,
      "! <p class="shorttext">Result Set Required</p>
      "! >Result Set Required
      "! $required
      result_set_required type abap_bool,
      "! <p class="shorttext">Comments Required</p>
      "! Comments Required
      "! $required
      comments_required   type abap_bool,
      "! <p class="shorttext">Output Type</p>
      "! Output Type
      "! $required
      output_type         type ty_output_type,
    end of ty_prompt_definition.

  types:
    "! <p class="shorttext">JSON Definition</p>
    "! JSON Definition
    begin of ty_json_definition,
      "! <p class="shorttext">JSON Content</p>
      "! JSON Content
      "! $required
      json_content type string,
    end of ty_json_definition.

  types:
    "! <p class="shorttext">Assigned Query</p>
    "! >Assigned Query
    begin of ty_assigned_query,
      "! <p class="shorttext">Query Name</p>
      "! Query Name
      "! $required
      query_name type char30,
    end of ty_assigned_query,
    "! <p class="shorttext">Assigned Queries</p>
    "! Assigned Queries
    ty_assigned_queries type standard table of ty_assigned_query with DEFAULT key.

  types:
    "! <p class="shorttext">Object Type ABIQ</p>
    "! Object type ABIQ
    begin of ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version          type zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                  type zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Quick Action Definition</p>
      "! Quick Action Definition
      "! $required
      quick_action_definition type ty_quick_action_definition,
      "! <p class="shorttext">Prompt Definition</p>
      "! Prompt Definition
      prompt_definition       type ty_prompt_definition,
      "! <p class="shorttext">JSON Definition</p>
      "! JSON Definition
      json_definition         type ty_json_definition,
      "! <p class="shorttext">Assigned Queries</p>
      "! Assigned Queries
      assigned_queries        type ty_assigned_queries,
    end of ty_main.

endinterface.
