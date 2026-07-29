INTERFACE zif_aff_dynp_v1 PUBLIC.

  "! <p class="shorttext">Screen Type</p>
  "! Screen type enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_screen_type}
  "! $default {@link zif_aff_dynp_v1.data:co_screen_type.normal}
  TYPES ty_screen_type TYPE c LENGTH 1.

  "! <p class="shorttext">Dropdown Type</p>
  "! Dropdown enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_dropdown}
  "! $default {@link zif_aff_dynp_v1.data:co_dropdown.none}
  TYPES ty_dropdown TYPE c LENGTH 1.

  "! <p class="shorttext">Dictionary Modified</p>
  "! Dictionary modified enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_dictionary_modified}
  "! $default {@link zif_aff_dynp_v1.data:co_dictionary_modified.original}
  TYPES ty_dictionary_modified TYPE c LENGTH 1.

  "! <p class="shorttext">Input Status</p>
  "! Input status enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_input_status}
  "! $default {@link zif_aff_dynp_v1.data:co_input_status.possible}
  TYPES ty_input_status TYPE c LENGTH 1.

  "! <p class="shorttext">Value List Type</p>
  "! Value list enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_value_list}
  "! $default {@link zif_aff_dynp_v1.data:co_value_list.automatic}
  TYPES ty_value_list TYPE c LENGTH 1.

  "! <p class="shorttext">Input Help Key</p>
  "! Input help key enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_input_help_key}
  "! $default {@link zif_aff_dynp_v1.data:co_input_help_key.temporary_if_f4_exists}
  TYPES ty_input_help_key TYPE c LENGTH 1.

  "! <p class="shorttext">Function Code Type</p>
  "! Function code type enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_function_code_type}
  "! $default {@link zif_aff_dynp_v1.data:co_function_code_type.normal}
  TYPES ty_function_code_type TYPE c LENGTH 1.

  "! <p class="shorttext">Container Type</p>
  "! Container type enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_container_type}
  TYPES ty_container_type TYPE c LENGTH 20.

  "! <p class="shorttext">Reaction To Switch</p>
  "! Reaction to switch enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_reaction_to_switch}
  "! $default {@link zif_aff_dynp_v1.data:co_reaction_to_switch.display}
  TYPES ty_reaction_to_switch TYPE c LENGTH 1.

  "! <p class="shorttext">Line Selectability</p>
  "! Line selectability enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_line_selectability}
  TYPES ty_line_selectability TYPE c LENGTH 10.

  "! <p class="shorttext">Column Selectability</p>
  "! Column selectability enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_column_selectability}
  TYPES ty_column_selectability TYPE c LENGTH 10.

  "! <p class="shorttext">Output Style</p>
  "! Output style enumeration
  "! $values {@link zif_aff_dynp_v1.data:co_output_style}
  TYPES ty_output_style TYPE c LENGTH 30.

  CONSTANTS:
    "! <p class="shorttext">Screen Type</p>
    "! Screen type values
    BEGIN OF co_screen_type,
      "! <p class="shorttext">Normal (space character)</p>
      "! Normal screen type with space character
      normal_space TYPE ty_screen_type VALUE ' ',
      "! <p class="shorttext">Normal</p>
      "! Normal screen type
      normal       TYPE ty_screen_type VALUE 'N',
      "! <p class="shorttext">Subscreen</p>
      "! Subscreen type
      subscreen    TYPE ty_screen_type VALUE 'I',
      "! <p class="shorttext">Modal Dialog Box</p>
      "! Modal dialog box type
      modal_dialog TYPE ty_screen_type VALUE 'M',
      "! <p class="shorttext">Selection Dynpro</p>
      "! Selection dynpro type
      selection    TYPE ty_screen_type VALUE 'S',
    END OF co_screen_type,

    "! <p class="shorttext">Dropdown</p>
    "! Dropdown values
    BEGIN OF co_dropdown,
      "! <p class="shorttext">None</p>
      "! No dropdown
      none              TYPE ty_dropdown VALUE ' ',
      "! <p class="shorttext">List Box</p>
      "! List box dropdown
      list_box          TYPE ty_dropdown VALUE 'L',
      "! <p class="shorttext">List Box With Key Values</p>
      "! List box with key values dropdown
      list_box_key      TYPE ty_dropdown VALUE 'K',
    END OF co_dropdown,

    "! <p class="shorttext">Dictionary Modified</p>
    "! Dictionary modified values
    BEGIN OF co_dictionary_modified,
      "! <p class="shorttext">Original</p>
      "! Original DDIC field
      original        TYPE ty_dictionary_modified VALUE ' ',
      "! <p class="shorttext">Modified</p>
      "! Modified DDIC field
      modified        TYPE ty_dictionary_modified VALUE 'X',
      "! <p class="shorttext">Fixed</p>
      "! Fixed DDIC field
      fixed           TYPE ty_dictionary_modified VALUE 'F',
      "! <p class="shorttext">Variable Label</p>
      "! Variable label from field
      variable_label  TYPE ty_dictionary_modified VALUE 'V',
      "! <p class="shorttext">Fixed Label 1</p>
      "! Fixed label variant 1
      fixed_label_1   TYPE ty_dictionary_modified VALUE '1',
      "! <p class="shorttext">Fixed Label 2</p>
      "! Fixed label variant 2
      fixed_label_2   TYPE ty_dictionary_modified VALUE '2',
      "! <p class="shorttext">Fixed Label 3</p>
      "! Fixed label variant 3
      fixed_label_3   TYPE ty_dictionary_modified VALUE '3',
      "! <p class="shorttext">Fixed Header</p>
      "! Fixed header labels
      fixed_header    TYPE ty_dictionary_modified VALUE '4',
    END OF co_dictionary_modified,

    "! <p class="shorttext">Input Status</p>
    "! Input status values
    BEGIN OF co_input_status,
      "! <p class="shorttext">Not Possible</p>
      "! Input not possible
      not_possible TYPE ty_input_status VALUE 'N',
      "! <p class="shorttext">Possible</p>
      "! Input possible
      possible     TYPE ty_input_status VALUE ' ',
      "! <p class="shorttext">Recommended</p>
      "! Input recommended
      recommended  TYPE ty_input_status VALUE 'R',
      "! <p class="shorttext">Required</p>
      "! Input required
      required     TYPE ty_input_status VALUE 'O',
    END OF co_input_status,

    "! <p class="shorttext">Value List</p>
    "! Value list values
    BEGIN OF co_value_list,
      "! <p class="shorttext">Automatic Value Help</p>
      "! Automatic value help
      automatic TYPE ty_value_list VALUE ' ',
      "! <p class="shorttext">ABAP Programmed Value List</p>
      "! ABAP-programmed value list
      abap_programmed TYPE ty_value_list VALUE 'A',
    END OF co_value_list,

    "! <p class="shorttext">Input Help Key</p>
    "! Input help key values
    BEGIN OF co_input_help_key,
      "! <p class="shorttext">Temporary If F4 Exists</p>
      "! Temporary F4 help if field help exists
      temporary_if_f4_exists TYPE ty_input_help_key VALUE ' ',
      "! <p class="shorttext">Disabled</p>
      "! F4 help disabled
      disabled               TYPE ty_input_help_key VALUE '0',
      "! <p class="shorttext">Temporary</p>
      "! Temporary F4 help
      temporary              TYPE ty_input_help_key VALUE '1',
      "! <p class="shorttext">Permanent</p>
      "! Permanent F4 help
      permanent              TYPE ty_input_help_key VALUE '2',
    END OF co_input_help_key,

    "! <p class="shorttext">Function Code Type</p>
    "! Function code type values
    BEGIN OF co_function_code_type,
      "! <p class="shorttext">Normal Application Function</p>
      "! Normal application function
      normal              TYPE ty_function_code_type VALUE ' ',
      "! <p class="shorttext">Exit Command</p>
      "! Exit command
      exit_command        TYPE ty_function_code_type VALUE 'E',
      "! <p class="shorttext">System Function</p>
      "! System function
      system_function    TYPE ty_function_code_type VALUE 'S',
      "! <p class="shorttext">Transaction Call</p>
      "! Transaction call
      transaction_call    TYPE ty_function_code_type VALUE 'T',
      "! <p class="shorttext">Local GUI Function</p>
      "! Local GUI function
      local_gui_function  TYPE ty_function_code_type VALUE 'P',
      "! <p class="shorttext">Internal Use</p>
      "! Internal use
      internal_use        TYPE ty_function_code_type VALUE 'H',
    END OF co_function_code_type,

    "! <p class="shorttext">Container Type</p>
    "! Container type values
    BEGIN OF co_container_type,
      "! <p class="shorttext">Subscreen</p>
      "! Subscreen container
      subscreen        TYPE ty_container_type VALUE 'subscreen',
      "! <p class="shorttext">Tabstrip Control</p>
      "! Tabstrip control container
      tabstrip_control TYPE ty_container_type VALUE 'tabstripControl',
      "! <p class="shorttext">Splitter Control</p>
      "! Splitter control container
      splitter_control TYPE ty_container_type VALUE 'splitterControl',
      "! <p class="shorttext">Custom Control</p>
      "! Custom control container
      custom_control   TYPE ty_container_type VALUE 'customControl',
      "! <p class="shorttext">Table Control</p>
      "! Table control container
      table_control    TYPE ty_container_type VALUE 'tableControl',
      "! <p class="shorttext">Step Loop</p>
      "! Step loop container
      step_loop        TYPE ty_container_type VALUE 'steploop',
      "! <p class="shorttext">Radio Button Group</p>
      "! Radio button group container
      radio_button_group TYPE ty_container_type VALUE 'radiobuttonGroup',
    END OF co_container_type,

    "! <p class="shorttext">Reaction To Switch</p>
    "! Reaction to switch values
    BEGIN OF co_reaction_to_switch,
      "! <p class="shorttext">Display</p>
      "! Display when switch framework switch is active
      display TYPE ty_reaction_to_switch VALUE 'D',
      "! <p class="shorttext">Hide</p>
      "! Hide when switch framework switch is active
      hide    TYPE ty_reaction_to_switch VALUE 'H',
    END OF co_reaction_to_switch,

    "! <p class="shorttext">Line Selectability</p>
    "! Line selectability values
    BEGIN OF co_line_selectability,
      "! <p class="shorttext">None</p>
      "! No line selection
      none     TYPE ty_line_selectability VALUE 'None',
      "! <p class="shorttext">Single</p>
      "! Single line selection
      single   TYPE ty_line_selectability VALUE 'Single',
      "! <p class="shorttext">Multiple</p>
      "! Multiple line selection
      multiple TYPE ty_line_selectability VALUE 'Multiple',
    END OF co_line_selectability,

    "! <p class="shorttext">Column Selectability</p>
    "! Column selectability values
    BEGIN OF co_column_selectability,
      "! <p class="shorttext">None</p>
      "! No column selection
      none     TYPE ty_column_selectability VALUE 'None',
      "! <p class="shorttext">Single</p>
      "! Single column selection
      single   TYPE ty_column_selectability VALUE 'Single',
      "! <p class="shorttext">Multiple</p>
      "! Multiple column selection
      multiple TYPE ty_column_selectability VALUE 'Multiple',
    END OF co_column_selectability,

    "! <p class="shorttext">Output Style</p>
    "! Output style values
    BEGIN OF co_output_style,
      "! <p class="shorttext">Simple</p>
      simple                    TYPE ty_output_style VALUE 'Simple',
      "! <p class="shorttext">Sign as postfix</p>
      sign_as_postfix           TYPE ty_output_style VALUE 'Sign as postfix',
      "! <p class="shorttext">Scale-preserving</p>
      scale_preserving          TYPE ty_output_style VALUE 'Scale-preserving',
      "! <p class="shorttext">Scientific</p>
      scientific                TYPE ty_output_style VALUE 'Scientific',
      "! <p class="shorttext">Scientific with leading zeros</p>
      scientific_leading_zeros  TYPE ty_output_style VALUE 'Scientific with leading zeros',
      "! <p class="shorttext">Scale-preserving scientific</p>
      scale_preserving_sci      TYPE ty_output_style VALUE 'Scale-preserving scientific',
      "! <p class="shorttext">Engineering</p>
      engineering               TYPE ty_output_style VALUE 'Engineering',
      "! <p class="shorttext">Extended monetary</p>
      extended_monetary         TYPE ty_output_style VALUE 'Extended monetary',
      "! <p class="shorttext">Monetary</p>
      monetary                  TYPE ty_output_style VALUE 'Monetary',
    END OF co_output_style.

  TYPES:
    "! <p class="shorttext">Header</p>
    "! Header information for Dynpro
    BEGIN OF ty_header,
      "! <p class="shorttext">Description</p>
      "! Screen description
      "! $required
      description       TYPE c LENGTH 60,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the screen
      "! $required
      original_language TYPE c LENGTH 2,
    END OF ty_header.

  TYPES:
    "! <p class="shorttext">General Field Attributes</p>
    "! General field attributes
    BEGIN OF ty_field_general,
      "! <p class="shorttext">Line</p>
      "! Screen line position
      "! $required
      line              TYPE i,
      "! <p class="shorttext">Column</p>
      "! Screen column position
      "! $required
      column            TYPE i,
      "! <p class="shorttext">Defined Length</p>
      "! Defined field length
      "! $required
      defined_length    TYPE i,
      "! <p class="shorttext">Visible Length</p>
      "! Visible field length
      "! $required
      visible_length    TYPE i,
      "! <p class="shorttext">Height</p>
      "! Field height
      "! $required
      height            TYPE i,
      "! <p class="shorttext">Scrollable</p>
      "! Enables scrolling within the field
      "! $required
      scrollable        TYPE abap_bool,
      "! <p class="shorttext">Format</p>
      "! ABAP Dictionary field format
      "! $required
      format            TYPE c LENGTH 4,
      "! <p class="shorttext">Input</p>
      "! User input enabled
      input             TYPE abap_bool,
      "! <p class="shorttext">Output</p>
      "! User output enabled
      output            TYPE abap_bool,
      "! <p class="shorttext">Output Only</p>
      "! Display-only field
      output_only       TYPE abap_bool,
      "! <p class="shorttext">Dictionary Field</p>
      "! Referenced ABAP Dictionary (DDIC) field
      dictionary_field  TYPE string,
      "! <p class="shorttext">Dictionary Modified</p>
      "! Indicates whether DDIC-derived attributes have been modified
      dictionary_modified TYPE ty_dictionary_modified,
    END OF ty_field_general.

  TYPES:
    "! <p class="shorttext">Field Texts And Templates</p>
    "! Text and templates for screen field
    BEGIN OF ty_field_texts_templates,
      "! <p class="shorttext">Text Or IO Field</p>
      "! Text or input/output Field Template
      text_or_io_field TYPE string,
      "! <p class="shorttext">Dropdown</p>
      "! Dropdown type enumeration
      dropdown         TYPE ty_dropdown,
      "! <p class="shorttext">With Icon</p>
      "! Allows the output field to display an icon and optional text
      with_icon        TYPE abap_bool,
      "! <p class="shorttext">Icon</p>
      "! Identifies the icon ID
      icon             TYPE c LENGTH 4,
      "! <p class="shorttext">Icon Name</p>
      "! Specifies the name of the icon assigned to the screen element
      icon_name        TYPE c LENGTH 30,
      "! <p class="shorttext">Icon Tooltip</p>
      "! Specifies the tooltip text displayed when hovering over the element
      icon_tooltip     TYPE c LENGTH 30,
    END OF ty_field_texts_templates.

  TYPES:
    "! <p class="shorttext">Field Special Attributes</p>
    "! Special field attributes
    BEGIN OF ty_field_special,
      "! <p class="shorttext">Input Status</p>
      "! Defines whether input is allowed, optional, recommended, or required
      input_status                     TYPE ty_input_status,
      "! <p class="shorttext">Star Entry As First Character Allowed</p>
      "! Allows special input processing when an entry begins with '*'
      star_entry_as_first_char_allowed TYPE abap_bool,
      "! <p class="shorttext">Input Reset Disabled</p>
      "! Prevents field input from being cleared with the reset character '!'
      input_reset_disabled             TYPE abap_bool,
      "! <p class="shorttext">Case Sensitive Entry</p>
      "! Allows input to retain lowercase and uppercase characters
      case_sensitive_entry             TYPE abap_bool,
      "! <p class="shorttext">Show Sign</p>
      "! Enables display of a plus/minus sign for numeric values
      show_sign                        TYPE abap_bool,
      "! <p class="shorttext">Template Disabled</p>
      "! Allows all characters to be entered in CHAR fields
      template_disabled                TYPE abap_bool,
      "! <p class="shorttext">Foreign Key Check</p>
      "! Enables or disables the Dictionary foreign key check
      foreign_key_check                TYPE abap_bool,
      "! <p class="shorttext">Set Parameter</p>
      "! Stores the field value in SAP memory using the specified parameter ID
      set_parameter                    TYPE abap_bool,
      "! <p class="shorttext">Get Parameter</p>
      "! Retrieves the field value from SAP memory using the specified parameter ID
      get_parameter                    TYPE abap_bool,
      "! <p class="shorttext">Parameter ID</p>
      "! Identifies the SAP memory parameter used by SET/GET parameters
      parameter_id                     TYPE c LENGTH 20,
      "! <p class="shorttext">Conversion Exit</p>
      "! Specifies the conversion routine used to format and interpret field values
      conversion_exit                  TYPE c LENGTH 5,
    END OF ty_field_special.

  TYPES:
    "! <p class="shorttext">Field Display Attributes</p>
    "! Display field attributes
    BEGIN OF ty_field_display,
      "! <p class="shorttext">Bright</p>
      "! Highlights the field to make it stand out on the screen
      bright                 TYPE abap_bool,
      "! <p class="shorttext">Invisible</p>
      "! Hides the field and its contents at runtime
      invisible              TYPE abap_bool,
      "! <p class="shorttext">Right Justified</p>
      "! Aligns field content to the right
      right_justified        TYPE abap_bool,
      "! <p class="shorttext">Display Leading Zeros</p>
      "! Displays numeric values with leading zeros
      leading_zeros          TYPE abap_bool,
      "! <p class="shorttext">Two-Dimensional Display</p>
      "! Displays input/output fields in a flat two-dimensional style
      two_dimensional        TYPE abap_bool,
      "! <p class="shorttext">Fixed Font</p>
      "! Displays field content using a fixed-width font
      fixed_font             TYPE abap_bool,
      "! <p class="shorttext">As Label On Left</p>
      "! Uses the field as the label for the element on its right
      label_left             TYPE abap_bool,
      "! <p class="shorttext">As Label On Right</p>
      "! Uses the field as the label for the element on its left
      label_right            TYPE abap_bool,
      "! <p class="shorttext">Double Click</p>
      "! Triggers an action when the field is double-clicked
      double_click           TYPE abap_bool,
      "! <p class="shorttext">Left-To-Right Direction</p>
      "! Defines left-to-right text display and input
      ltr_direction          TYPE abap_bool,
      "! <p class="shorttext">No BIDI Character Filtering</p>
      "! Preserves bidirectional text formatting characters
      disable_bidi_filtering TYPE abap_bool,
      "! <p class="shorttext">No GUI Input History</p>
      "! Prevents SAP GUI from storing field input history
      no_input_history       TYPE abap_bool,
      "! <p class="shorttext">AM/PM-Enabled Time Format</p>
      "! Allows time values to use the 12-hour AM/PM format
      am_pm_time_format      TYPE abap_bool,
      "! <p class="shorttext">Output Style</p>
      "! Defines how decimal floating point numbers are formatted
      output_style           TYPE ty_output_style,
    END OF ty_field_display.

  TYPES:
    "! <p class="shorttext">Field Modification Groups And Functions</p>
    "! Modification groups and functions
    BEGIN OF ty_field_mod_groups_funcs,
      "! <p class="shorttext">Group 1</p>
      "! Identifier for SCREEN-GROUP1 used for dynamic field modifications
      group1                  TYPE c LENGTH 3,
      "! <p class="shorttext">Group 2</p>
      "! Identifier for SCREEN-GROUP2 used for dynamic field modifications
      group2                  TYPE c LENGTH 3,
      "! <p class="shorttext">Group 3</p>
      "! Identifier for SCREEN-GROUP3 used for dynamic field modifications
      group3                  TYPE c LENGTH 3,
      "! <p class="shorttext">Group 4</p>
      "! Identifier for SCREEN-GROUP4 used for dynamic field modifications
      group4                  TYPE c LENGTH 3,
      "! <p class="shorttext">SFW Switch</p>
      "! Identifier for switch in the switch framework
      switch                  TYPE c LENGTH 30,
      "! <p class="shorttext">Reaction To SFW Switch</p>
      "! Determines whether the object is displayed or hidden
      reaction_to_switch      TYPE ty_reaction_to_switch,
      "! <p class="shorttext">Entry Help</p>
      "! Indicates whether value help is available for the field
      entry_help              TYPE abap_bool,
      "! <p class="shorttext">Value List</p>
      "! Determines the source of values displayed in the dropdown list
      value_list              TYPE ty_value_list,
      "! <p class="shorttext">Input Help Key</p>
      "! Controls the availability and visibility of the input help (F4) button
      input_help_key          TYPE ty_input_help_key,
      "! <p class="shorttext">Function Code</p>
      "! Defines the function code triggered by a user interaction
      function_code           TYPE c LENGTH 20,
      "! <p class="shorttext">Function Code Type</p>
      "! Determines how the associated function code is handled at runtime
      function_code_type      TYPE ty_function_code_type,
      "! <p class="shorttext">Dynamic Context Menu</p>
      "! Dynamic callback ON_CTMENU
      dynamic_context_menu    TYPE c LENGTH 20,
    END OF ty_field_mod_groups_funcs.

  TYPES:
    "! <p class="shorttext">Field References</p>
    "! Field references
    BEGIN OF ty_field_references,
      "! <p class="shorttext">Search Help</p>
      "! Specifies the search help assigned to the field
      search_help    TYPE string,
      "! <p class="shorttext">Reference Field</p>
      "! Defines a link to another screen element
      reference_field TYPE string,
    END OF ty_field_references.

  TYPES:
    "! <p class="shorttext">Screen Field</p>
    "! Screen field definition
    BEGIN OF ty_field,
      "! <p class="shorttext">Field Name</p>
      "! Technical field name
      "! $required
      name                      TYPE string,
      "! <p class="shorttext">Field Type</p>
      "! Screen element type
      "! $required
      type                      TYPE c LENGTH 45,
      "! <p class="shorttext">General</p>
      "! General field attributes
      "! $required
      general                   TYPE ty_field_general,
      "! <p class="shorttext">Texts And Templates</p>
      "! Text and Templates for screen element
      "! $required
      texts_and_templates       TYPE ty_field_texts_templates,
      "! <p class="shorttext">Special</p>
      "! Special field attributes
      "! $required
      special                   TYPE ty_field_special,
      "! <p class="shorttext">Display</p>
      "! Display field attributes
      "! $required
      display                   TYPE ty_field_display,
      "! <p class="shorttext">Modification Groups And Functions</p>
      "! Modification groups and functions
      "! $required
      mod_groups_and_funcs      TYPE ty_field_mod_groups_funcs,
      "! <p class="shorttext">References</p>
      "! References
      "! $required
      references                TYPE ty_field_references,
    END OF ty_field.

  TYPES:
    "! <p class="shorttext">Screen Attributes</p>
    "! Screen attributes
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Screen Type</p>
      "! Screen type enumeration
      "! $required
      screen_type                        TYPE ty_screen_type,
      "! <p class="shorttext">Next Screen</p>
      "! Next screen number
      next_screen                        TYPE c LENGTH 4,
      "! <p class="shorttext">Screen Width</p>
      "! Maximum number of columns
      length                             TYPE i,
      "! <p class="shorttext">Screen Height</p>
      "! Maximum number of lines
      height                             TYPE i,
      "! <p class="shorttext">Lines Occupied</p>
      "! Number of lines occupied by screen elements
      lines_occupied                     TYPE i,
      "! <p class="shorttext">Columns Occupied</p>
      "! Number of columns occupied by screen elements
      columns_occupied                   TYPE i,
      "! <p class="shorttext">Hold Data</p>
      "! Keep field contents between calls
      hold_data                          TYPE abap_bool,
      "! <p class="shorttext">Switch Off Runtime Compression</p>
      "! Runtime compression disabled
      switch_off_runtime_compression     TYPE abap_bool,
      "! <p class="shorttext">Template Screen</p>
      "! Screen is a template (not executable)
      is_template                        TYPE abap_bool,
      "! <p class="shorttext">Hold Scroll Position</p>
      "! Keep scroll position between calls
      hold_scroll_position               TYPE abap_bool,
      "! <p class="shorttext">Without Application Toolbar</p>
      "! Application toolbar is hidden
      without_application_toolbar        TYPE abap_bool,
      "! <p class="shorttext">Fiori Zoom-In Disabled</p>
      "! Fiori zoom-in disabled
      fiori_zoom_disabled                TYPE abap_bool,
      "! <p class="shorttext">Initial Cursor Field</p>
      "! Initial cursor position
      initial_cursor_field               TYPE string,
      "! <p class="shorttext">Screen Group</p>
      "! Logical grouping of screens
      screen_group                       TYPE c LENGTH 4,
      "! <p class="shorttext">Context Menu Form</p>
      "! Form routine for context menu handling
      context_menu_form                  TYPE string,
      "! <p class="shorttext">Has Fixed Font</p>
      "! Proportional-/Fix-Font
      has_fixed_font                     TYPE abap_bool,
      "! <p class="shorttext">OK Code</p>
      "! OK code/function code triggered on screen
      "! $required
      ok_code                            TYPE c LENGTH 70,
    END OF ty_attributes.

  TYPES:
    "! <p class="shorttext">Subscreen Target</p>
    "! Target subscreen reference
    BEGIN OF ty_subscreen_target,
      "! <p class="shorttext">Program</p>
      "! The program containing the target subscreen
      program TYPE c LENGTH 40,
      "! <p class="shorttext">Screen</p>
      "! The screen number of the target subscreen
      screen  TYPE c LENGTH 4,
    END OF ty_subscreen_target.

  TYPES:
    "! <p class="shorttext">Table Control Attributes</p>
    "! Table control-specific attributes
    BEGIN OF ty_table_control_attrs,
      "! <p class="shorttext">Context Menu Form</p>
      "! Form routine for context menu handling
      context_menu_form         TYPE string,
      "! <p class="shorttext">With Title</p>
      "! Determines whether the table control includes a title
      with_title                TYPE abap_bool,
      "! <p class="shorttext">Title</p>
      "! Text displayed in the title line of the table control
      title                     TYPE string,
      "! <p class="shorttext">With Column Headers</p>
      "! Determines whether the table control columns include a title line
      with_column_headers       TYPE abap_bool,
      "! <p class="shorttext">Configurability</p>
      "! Determines whether users can access the table control configuration
      configurability           TYPE abap_bool,
      "! <p class="shorttext">Vertical Separators</p>
      "! Determines whether the table control displays vertical separators
      vertical_separators       TYPE abap_bool,
      "! <p class="shorttext">Horizontal Separators</p>
      "! Determines whether the table control displays horizontal separators
      horizontal_separators     TYPE abap_bool,
      "! <p class="shorttext">Line Selectability</p>
      "! Determines how many table control lines can be selected simultaneously
      line_selectability        TYPE ty_line_selectability,
      "! <p class="shorttext">Column Selectability</p>
      "! Determines how many table control columns can be selected simultaneously
      column_selectability      TYPE ty_column_selectability,
      "! <p class="shorttext">With Selection Column</p>
      "! Determines whether the table control displays a dedicated selection column
      with_selection_column     TYPE abap_bool,
      "! <p class="shorttext">Selection Column</p>
      "! Text displayed in the selection column of the table control
      selection_column          TYPE string,
      "! <p class="shorttext">Number of Fixed Columns</p>
      "! Determines the number of leading table control columns that remain fixed
      number_of_fixed_columns   TYPE i,
    END OF ty_table_control_attrs.

  TYPES:
    "! <p class="shorttext">Screen Container</p>
    "! Screen container
    BEGIN OF ty_container,
      "! <p class="shorttext">Container Type</p>
      "! Type of container
      "! $required
      type                    TYPE ty_container_type,
      "! <p class="shorttext">Container Name</p>
      "! Technical container name
      "! $required
      name                    TYPE string,
      "! <p class="shorttext">Line</p>
      "! Screen line position
      "! $required
      line                    TYPE i,
      "! <p class="shorttext">Column</p>
      "! Screen column position
      "! $required
      column                  TYPE i,
      "! <p class="shorttext">Container Width</p>
      "! Maximum number of columns
      "! $required
      length                  TYPE i,
      "! <p class="shorttext">Container Height</p>
      "! Maximum number of lines
      "! $required
      height                  TYPE i,
      "! <p class="shorttext">Minimum Container Length</p>
      "! Minimum number of columns
      minimum_length          TYPE i,
      "! <p class="shorttext">Minimum Container Height</p>
      "! Minimum number of lines
      minimum_height          TYPE i,
      "! <p class="shorttext">Vertical Resizing</p>
      "! Allows the container height to adapt to vertical window resizing
      vertical_resizing       TYPE abap_bool,
      "! <p class="shorttext">Horizontal Resizing</p>
      "! Allows the container width to adapt to horizontal window resizing
      horizontal_resizing     TYPE abap_bool,
      "! <p class="shorttext">Subscreen Specific - Scrollable</p>
      "! Allows the field content to be scrolled when it exceeds the visible area
      scrollable              TYPE abap_bool,
      "! <p class="shorttext">Subscreen Specific - Switch</p>
      "! Identifier for switch in the switch framework
      switch                  TYPE c LENGTH 30,
      "! <p class="shorttext">Subscreen Specific - Reaction To Switch</p>
      "! Determines whether the object is displayed or hidden
      reaction_to_switch      TYPE ty_reaction_to_switch,
      "! <p class="shorttext">Subscreen Target</p>
      "! Specifies the subscreen to be displayed
      subscreen_target        TYPE ty_subscreen_target,
      "! <p class="shorttext">Tabstrip Fiori Variable Height</p>
      "! Allows the height of tabstrip pages to automatically adapt
      fiori_variable_height   TYPE abap_bool,
      "! <p class="shorttext">Table Control Attributes</p>
      "! Table control-specific attributes
      table_control_attrs     TYPE ty_table_control_attrs,
    END OF ty_container.

  TYPES:
    "! <p class="shorttext">Dynpro - Version 1</p>
    "! Dynpro version 1 structure
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE ty_header,
      "! <p class="shorttext">Screen Attributes</p>
      "! Screen attributes
      "! $required
      attributes     TYPE ty_attributes,
      "! <p class="shorttext">Fields</p>
      "! Array of screen fields
      "! $required
      fields         TYPE STANDARD TABLE OF ty_field,
      "! <p class="shorttext">Containers</p>
      "! Array of screen containers
      "! $required
      containers     TYPE STANDARD TABLE OF ty_container,
    END OF ty_main.

ENDINTERFACE.
