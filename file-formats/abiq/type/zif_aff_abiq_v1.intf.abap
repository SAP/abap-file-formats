"! AFF type for the object ABIQ ( ABI Quick-ACtions )
INTERFACE if_aff_abiq_v1
  PUBLIC.

  "! $values { @link if_aff_abiq_v1.data:co_quick_action_type }
  "! $default { @link if_aff_abiq_v1.data:co_quick_action_type.llm }
  TYPES ty_quick_action_type TYPE numc2.
  CONSTANTS:
    BEGIN OF co_quick_action_type,
      "! <p class="shorttext">LLM</p>
      "! LLM Quick Action
      llm  TYPE ty_quick_action_type VALUE 01,
      "! <p class="shorttext">JSON</p>
      "! JSON Quick Action
      json TYPE ty_quick_action_type VALUE 02,
      "! <p class="shorttext">PAL</p>
      "! PAL Quick Action
      pal  TYPE ty_quick_action_type VALUE 03,
    END OF co_quick_action_type.

  "! $values { @link if_aff_abiq_v1.data:co_quick_action_scope }
  "! $default { @link if_aff_abiq_v1.data:co_quick_action_scope.query }
  TYPES ty_quick_action_scope TYPE numc2.
  CONSTANTS:
    BEGIN OF co_quick_action_scope,
      "! <p class="shorttext">Query</p>
      "! Query
      query     TYPE ty_quick_action_scope VALUE 01,
      "! <p class="shorttext">One Data Provider</p>
      "! One Data Provider per Page
      single_dp TYPE ty_quick_action_scope VALUE 02,
      "! <p class="shorttext">Two Data Providers</p>
      "! Two Data Providers per Page
      multi_dp  TYPE ty_quick_action_scope VALUE 03,
    END OF co_quick_action_scope.

  "! $values { @link if_aff_abiq_v1.data:co_output_type }
  "! $default { @link if_aff_abiq_v1.data:co_output_type.not_set }
  TYPES ty_output_type TYPE numc2.
  CONSTANTS:
    BEGIN OF co_output_type,
      "! <p class="shorttext">Not Set</p>
      "! Not Set
      not_set    TYPE ty_quick_action_scope VALUE 00,
      "! <p class="shorttext">HTML</p>
      "! HTML
      html       TYPE ty_quick_action_scope VALUE 01,
      "! <p class="shorttext">Card Chart</p>
      "! Card Chart
      card_chart TYPE ty_quick_action_scope VALUE 02,
    END OF co_output_type.

  TYPES:
    "! <p class="shorttext">Quick Action Definition</p>
    "! Quick Action Definition
    BEGIN OF ty_quick_action_definition,
      "! <p class="shorttext">Type</p>
      "! Type
      "! $required
      type                TYPE ty_quick_action_type,
      "! <p class="shorttext">Scope</p>
      "! Scope
      "! $required
      scope               TYPE ty_quick_action_scope,
      "! <p class="shorttext">Visible</p>
      "! Visible for Consumption
      "! $required
      consumption_visible TYPE abap_bool,
    END OF ty_quick_action_definition.

  TYPES:
    "! <p class="shorttext">Prompt Definition</p>
    "! Prompt Definition
    BEGIN OF ty_prompt_definition,
      "! <p class="shorttext">System Prompt</p>
      "! System Prompt
      "! $required
      system_prompt       TYPE string,
      "! <p class="shorttext">User Prompt</p>
      "! User Prompt
      "! $required
      user_prompt         TYPE string,
      "! <p class="shorttext">Result Set Required</p>
      "! >Result Set Required
      "! $required
      result_set_required TYPE abap_bool,
      "! <p class="shorttext">Comments Required</p>
      "! Comments Required
      "! $required
      comments_required   TYPE abap_bool,
      "! <p class="shorttext">Output Type</p>
      "! Output Type
      "! $required
      output_type         TYPE ty_output_type,
    END OF ty_prompt_definition.

  TYPES:
    "! <p class="shorttext">JSON Definition</p>
    "! JSON Definition
    BEGIN OF ty_json_definition,
      "! <p class="shorttext">JSON Content</p>
      "! JSON Content
      "! $required
      json_content TYPE string,
    END OF ty_json_definition.

  TYPES:
    "! <p class="shorttext">Assigned Query</p>
    "! >Assigned Query
    BEGIN OF ty_assigned_query,
      "! <p class="shorttext">Query Name</p>
      "! Query Name
      "! $required
      query_name TYPE char30,
    END OF ty_assigned_query,
    "! <p class="shorttext">Assigned Queries</p>
    "! Assigned Queries
    ty_assigned_queries TYPE STANDARD TABLE OF ty_assigned_query WITH EMPTY KEY.

  TYPES:
    "! <p class="shorttext">Object Type ABIQ</p>
    "! Object type ABIQ
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version          TYPE if_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                  TYPE if_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">Quick Action Definition</p>
      "! Quick Action Definition
      "! $required
      quick_action_definition TYPE ty_quick_action_definition,
      "! <p class="shorttext">Prompt Definition</p>
      "! Prompt Definition
      prompt_definition       TYPE ty_prompt_definition,
      "! <p class="shorttext">JSON Definition</p>
      "! JSON Definition
      json_definition         TYPE ty_json_definition,
      "! <p class="shorttext">Assigned Queries</p>
      "! Assigned Queries
      assigned_queries        TYPE ty_assigned_queries,
    END OF ty_main.

ENDINTERFACE.
