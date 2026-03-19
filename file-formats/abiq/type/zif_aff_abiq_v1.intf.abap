"! AFF type for the object ABIQ ( ABI Quick-ACtions )
INTERFACE zif_aff_abiq_v1
  PUBLIC.

  "! $values { @link zif_aff_abiq_v1.data:co_quick_action_type }
  "! $default { @link zif_aff_abiq_v1.data:co_quick_action_type.llm }
  TYPES ty_quick_action_type TYPE n LENGTH 2.
  CONSTANTS:
    BEGIN OF co_quick_action_type,
      "! <p class="shorttext">LLM</p>
      "! LLM quick action
      llm  TYPE ty_quick_action_type VALUE 1,
      "! <p class="shorttext">JSON</p>
      "! JSON quick action
      json TYPE ty_quick_action_type VALUE 2,
      "! <p class="shorttext">PAL</p>
      "! PAL quick action
      pal  TYPE ty_quick_action_type VALUE 3,
    END OF co_quick_action_type.

  "! $values { @link zif_aff_abiq_v1.data:co_quick_action_scope }
  "! $default { @link zif_aff_abiq_v1.data:co_quick_action_scope.query }
  TYPES ty_quick_action_scope TYPE n LENGTH 2.
  CONSTANTS:
    BEGIN OF co_quick_action_scope,
      "! <p class="shorttext">Query</p>
      "! Query
      query     TYPE ty_quick_action_scope VALUE 1,
      "! <p class="shorttext">One Data Provider</p>
      "! One data provider per page
      one_data_provider TYPE ty_quick_action_scope VALUE 2,
      "! <p class="shorttext">Multiple Data Providers</p>
      "! Multiple data providers per page
      multiple_data_providers  TYPE ty_quick_action_scope VALUE 3,
    END OF co_quick_action_scope.

  "! $values { @link zif_aff_abiq_v1.data:co_output_type }
  "! $default { @link zif_aff_abiq_v1.data:co_output_type.not_set }
  TYPES ty_output_type TYPE n LENGTH 2.
  CONSTANTS:
    BEGIN OF co_output_type,
      "! <p class="shorttext">Not Set</p>
      "! Not Set
      not_set    TYPE ty_quick_action_scope VALUE 0,
      "! <p class="shorttext">HTML</p>
      "! HTML
      html       TYPE ty_quick_action_scope VALUE 1,
      "! <p class="shorttext">Card Chart</p>
      "! Card Chart
      card_chart TYPE ty_quick_action_scope VALUE 2,
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
      query_name TYPE ty_query_name,
    END OF ty_assigned_query,
    "! <p class="shorttext">Assigned Queries</p>
    "! Assigned queries
    ty_assigned_queries TYPE SORTED TABLE OF ty_assigned_query WITH UNIQUE KEY query_name.

  TYPES:
    "! <p class="shorttext">Object Type ABIQ</p>
    "! Object type ABIQ
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version          TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                  TYPE zif_aff_types_v1=>ty_header_60,
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
