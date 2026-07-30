INTERFACE zif_aff_dynp_v1 PUBLIC.

  "! <p class="shorttext">Screen Type</p>
  "! Screen type
  "! $values {@link zif_aff_dynp_v1.data:co_screen_type}
  "! $default {@link zif_aff_dynp_v1.data:co_screen_type.main_screen_space}
  TYPES ty_screen_type TYPE c LENGTH 1.

  "! <p class="shorttext">Dictionary Modified</p>
  "! Dictionary modified
  "! $values {@link zif_aff_dynp_v1.data:co_dictionary_modified}
  "! $default {@link zif_aff_dynp_v1.data:co_dictionary_modified.original}
  TYPES ty_dictionary_modified TYPE c LENGTH 1.

 "! <p class="shorttext">Dropdown</p>
  "! Dropdown
  "! $values {@link zif_aff_dynp_v1.data:co_dropdown}
  "! $default {@link zif_aff_dynp_v1.data:co_dropdown.none}
  TYPES ty_dropdown TYPE c LENGTH 1.

  "! <p class="shorttext">Input Status</p>
  "! Input status
  "! $values {@link zif_aff_dynp_v1.data:co_input_status}
  "! $default {@link zif_aff_dynp_v1.data:co_input_status.possible}
  TYPES ty_input_status TYPE c LENGTH 1.

  "! <p class="shorttext">Output Style</p>
  "! Output style
  "! $values {@link zif_aff_dynp_v1.data:co_output_style}
  TYPES ty_output_style TYPE c LENGTH 30.

  "! <p class="shorttext">Reaction To Switch</p>
  "! Reaction to switch
  "! $values {@link zif_aff_dynp_v1.data:co_reaction_to_switch}
  "! $default {@link zif_aff_dynp_v1.data:co_reaction_to_switch.display}
  TYPES ty_reaction_to_switch TYPE c LENGTH 1.

  "! <p class="shorttext">Value List Type</p>
  "! Value list
  "! $values {@link zif_aff_dynp_v1.data:co_value_list}
  "! $default {@link zif_aff_dynp_v1.data:co_value_list.automatic}
  TYPES ty_value_list TYPE c LENGTH 1.

  "! <p class="shorttext">Input Help Key</p>
  "! Input help key
  "! $values {@link zif_aff_dynp_v1.data:co_input_help_key}
  "! $default {@link zif_aff_dynp_v1.data:co_input_help_key.temporary_if_f4_exists}
  TYPES ty_input_help_key TYPE c LENGTH 1.

  "! <p class="shorttext">Function Code Type</p>
  "! Function code type
  "! $values {@link zif_aff_dynp_v1.data:co_function_code_type}
  "! $default {@link zif_aff_dynp_v1.data:co_function_code_type.normal}
  TYPES ty_function_code_type TYPE c LENGTH 1.

  "! <p class="shorttext">Container Type</p>
  "! Container type
  "! $values {@link zif_aff_dynp_v1.data:co_container_type}
  TYPES ty_container_type TYPE c LENGTH 20.

  "! <p class="shorttext">Line Selectability</p>
  "! Determines how many table control lines can be selected simultaneously
  "! $values {@link zhm_if_aff_dynp_v1.data:co_line_selectability}
  TYPES ty_line_selectability TYPE string.

  "! <p class="shorttext">Column Selectability</p>
  "! Determines how many table control columns can be selected simultaneously
  "! $values {@link zhm_if_aff_dynp_v1.data:co_column_selectability}
  TYPES ty_column_selectability TYPE string.

  CONSTANTS:
    "! <p class="shorttext">Screen Type</p>
    "! Screen type
    BEGIN OF co_screen_type,
      "! <p class="shorttext">Normal Screen (Space Character)</p>
      "! Normal screen type (space character)
      main_screen_space TYPE ty_screen_type VALUE ' ',
      "! <p class="shorttext">Normal Screen</p>
      "! Normal screen type
      main_screen       TYPE ty_screen_type VALUE 'N',
      "! <p class="shorttext">Subscreen</p>
      "! Subscreen type
      subscreen         TYPE ty_screen_type VALUE 'I',
      "! <p class="shorttext">Modal Dialog Box</p>
      "! Modal dialog box type
      modal_dialog_box  TYPE ty_screen_type VALUE 'M',
      "! <p class="shorttext">Selection Dynpro</p>
      "! Selection dynpro type
      selection_dynpro  TYPE ty_screen_type VALUE 'S',
    END OF co_screen_type,

    "! <p class="shorttext">Dictionary Modified</p>
    "! Dictionary modified
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

    "! <p class="shorttext">Dropdown</p>
    "! Dropdown
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

    "! <p class="shorttext">Input Status</p>
    "! Input status
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

    "! <p class="shorttext">Output Style</p>
    "! Output style
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
    END OF co_output_style,

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

    "! <p class="shorttext">Value List</p>
    "! Value list
    BEGIN OF co_value_list,
      "! <p class="shorttext">Automatic Value Help</p>
      "! Automatic value help
      automatic       TYPE ty_value_list VALUE ' ',
      "! <p class="shorttext">ABAP Programmed Value List</p>
      "! ABAP-programmed value list
      abap_programmed TYPE ty_value_list VALUE 'A',
    END OF co_value_list,

    "! <p class="shorttext">Input Help Key</p>
    "! Input help key
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
    "! Function code type
    BEGIN OF co_function_code_type,
      "! <p class="shorttext">Normal Application Function</p>
      "! Normal application function
      normal              TYPE ty_function_code_type VALUE ' ',
      "! <p class="shorttext">Exit Command</p>
      "! Exit command
      exit_command        TYPE ty_function_code_type VALUE 'E',
      "! <p class="shorttext">System Function</p>
      "! System function
      system_function     TYPE ty_function_code_type VALUE 'S',
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
    "! Container type
    BEGIN OF co_container_type,
      "! <p class="shorttext">Subscreen</p>
      "! Subscreen container
      subscreen           TYPE ty_container_type VALUE 'subscreen',
      "! <p class="shorttext">Tabstrip Control</p>
      "! Tabstrip control container
      tabstrip_control    TYPE ty_container_type VALUE 'tabstripControl',
      "! <p class="shorttext">Splitter Control</p>
      "! Splitter control container
      splitter_control    TYPE ty_container_type VALUE 'splitterControl',
      "! <p class="shorttext">Custom Control</p>
      "! Custom control container
      custom_control      TYPE ty_container_type VALUE 'customControl',
      "! <p class="shorttext">Table Control</p>
      "! Table control container
      table_control       TYPE ty_container_type VALUE 'tableControl',
      "! <p class="shorttext">Step Loop</p>
      "! Step loop container
      step_loop           TYPE ty_container_type VALUE 'steploop',
      "! <p class="shorttext">Radio Button Group</p>
      "! Radio button group container
      radio_button_group  TYPE ty_container_type VALUE 'radiobuttonGroup',
    END OF co_container_type,

    "! <p class="shorttext">Line Selectability</p>
    "! Determines how many table control lines can be selected simultaneously
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
    "! Determines how many table control columns can be selected simultaneously
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
    END OF co_column_selectability.

  TYPES:
    "! <p class="shorttext">Screen Attributes</p>
    "! Screen attributes
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Screen Type</p>
      "! Screen type
      "! $required
      screen_type                    TYPE ty_screen_type,
      "! <p class="shorttext">Next Screen</p>
      "! Next screen number
      next_screen                    TYPE c LENGTH 4,
      "! <p class="shorttext">Screen Width</p>
      "! Maximum number of columns
      length                         TYPE i,
      "! <p class="shorttext">Screen Height</p>
      "! Maximum number of lines
      height                         TYPE i,
      "! <p class="shorttext">Lines Occupied</p>
      "! Number of lines occupied by screen elements
      lines_occupied                 TYPE i,
      "! <p class="shorttext">Columns Occupied</p>
      "! Number of columns occupied by screen elements
      columns_occupied               TYPE i,
      "! <p class="shorttext">Hold Data</p>
      "! Keep field contents between calls
      hold_data                      TYPE abap_bool,
      "! <p class="shorttext">Switch Off Runtime Compression</p>
      "! Runtime compression disabled
      switch_off_runtime_compression TYPE abap_bool,
      "! <p class="shorttext">Template Screen</p>
      "! Screen is a template (not executable)
      is_template                    TYPE abap_bool,
      "! <p class="shorttext">Hold Scroll Position</p>
      "! Keep scroll position between calls
      hold_scroll_position           TYPE abap_bool,
      "! <p class="shorttext">Without Application Toolbar</p>
      "! Application toolbar is hidden
      without_application_toolbar    TYPE abap_bool,
      "! <p class="shorttext">Fiori Zoom-In Disabled</p>
      "! Fiori zoom-in disabled
      fiori_zoom_disabled            TYPE abap_bool,
      "! <p class="shorttext">Initial Cursor Field</p>
      "! Initial cursor position
      initial_cursor_field           TYPE c LENGTH 132,
      "! <p class="shorttext">Screen Group</p>
      "! Logical grouping of screens
      screen_group                   TYPE c LENGTH 4,
      "! <p class="shorttext">Context Menu Form</p>
      "! Form routine for context menu handling
      context_menu_form              TYPE string,
      "! <p class="shorttext">Has Fixed Font</p>
      "! Proportional-/Fix-Font
      has_fixed_font                 TYPE abap_bool,
      "! <p class="shorttext">OK Code</p>
      "! OK code/function code triggered on screen
      "! $required
      ok_code                        TYPE c LENGTH 70,
    END OF ty_attributes.

  "! <p class="shorttext">Property Bag Attributes</p>
  "! Name, kind and value definition used by property bag attributes
  TYPES:
    BEGIN OF ty_property_bag_attributes,
      "! <p class="shorttext">Name</p>
      "! Name of the property bag attribute
      name  TYPE string,
      "! <p class="shorttext">Kind</p>
      "! Type identifier of the property bag attribute
      kind  TYPE c LENGTH 1,
      "! <p class="shorttext">Value</p>
      "! Value of the property bag attribute
      value TYPE string,
    END OF ty_property_bag_attributes.

  "! <p class="shorttext">Text Field Label</p>
  "! Single label definition for accessibility support
  TYPES:
    BEGIN OF ty_text_field_label,
      "! <p class="shorttext">Text</p>
      "! Label text
      text TYPE string,
    END OF ty_text_field_label.

  "! <p class="shorttext">Text Field Labels</p>
  "! Collection of label definitions
  TYPES ty_text_field_labels TYPE STANDARD TABLE OF ty_text_field_label WITH EMPTY KEY.

  "! <p class="shorttext">Text Field</p>
  "! Assigns a label field for accessibility support
  TYPES:
    BEGIN OF ty_text_field,
      "! <p class="shorttext">Is Set</p>
      "! Indicates whether the property is explicitly set
      is_set TYPE abap_bool,

      "! <p class="shorttext">Labels</p>
      "!  Collection of label definitions
      labels TYPE ty_text_field_labels,

    END OF ty_text_field.

  "! <p class="shorttext">Tooltip Text</p>
  "! Assigns a tooltip text to a screen field for accessibility support
  TYPES:
    BEGIN OF ty_tooltip_text,
      "! <p class="shorttext">Is Set</p>
      "! Indicates whether the property is explicitly set
      is_set TYPE abap_bool,
      "! <p class="shorttext">Kind</p>
      "! Type identifier of the tooltip value
      kind   TYPE c LENGTH 1,
      "! <p class="shorttext">Value</p>
      "! Tooltip text assigned to the screen field
      value  TYPE string,
    END OF ty_tooltip_text.

  "! <p class="shorttext">Item Count</p>
  "! Displays the number of lines in controls
  TYPES:
    BEGIN OF ty_item_count,
      "! <p class="shorttext">Is Set</p>
      "! Indicates whether the property is explicitly set
      is_set   TYPE abap_bool,
      "! <p class="shorttext">Variable</p>
      "! Variable containing the number of displayed items
      variable TYPE string,
    END OF ty_item_count.

  "! <p class="shorttext">Set Active Property</p>
  "! Generic property with explicit set and activation state
  TYPES:
    BEGIN OF ty_set_active_property,
      "! <p class="shorttext">Is Set</p>
      "! Indicates whether the property is explicitly set
      is_set    TYPE abap_bool,
      "! <p class="shorttext">Is Active</p>
      "! Indicates whether the property is active
      is_active TYPE abap_bool,
    END OF ty_set_active_property.

  "! <p class="shorttext">Knowledge Object</p>
  "! Links a dialog help button to a Knowledge Warehouse object
  TYPES:
    BEGIN OF ty_knowledge_object,
      "! <p class="shorttext">Is Set</p>
      "! Indicates whether the property is explicitly set
      is_set      TYPE abap_bool,
      "! <p class="shorttext">Description</p>
      "! Description of the linked Knowledge Warehouse object
      description TYPE string,
    END OF ty_knowledge_object.

  "! <p class="shorttext">Hyperlink</p>
  "! Supports SAP internal Drag&Relate hyperlinks
  TYPES:
    BEGIN OF ty_hyperlink,
      "! <p class="shorttext">Is Set</p>
      "! Indicates whether the property is explicitly set
      is_set TYPE abap_bool,
      "! <p class="shorttext">URL</p>
      "! URL definition for the hyperlink
      url    TYPE ty_property_bag_attributes,
      "! <p class="shorttext">Target</p>
      "! Target definition for the hyperlink
      target TYPE ty_property_bag_attributes,
      "! <p class="shorttext">Title</p>
      "! Title definition for the hyperlink
      title  TYPE ty_property_bag_attributes,
    END OF ty_hyperlink.

  "! <p class="shorttext">Attributes</p>
  "! List of speech attributes
  TYPES ty_speech_attributes TYPE STANDARD TABLE OF ty_property_bag_attributes WITH EMPTY KEY.

  "! <p class="shorttext">Speech</p>
  "! Enables speech input and output features
  TYPES:
    BEGIN OF ty_speech,
      "! <p class="shorttext">Is Set</p>
      "! Indicates whether the property is explicitly set
      is_set               TYPE abap_bool,
      "! <p class="shorttext">Attributes</p>
      "! List of speech attributes
      attributes           TYPE ty_speech_attributes,
      "! <p class="shorttext">Speech Effect Active</p>
      "! Indicates whether speech effects are active
      speech_effect_active TYPE abap_bool,
    END OF ty_speech.

  "! <p class="shorttext">RFID Attribute</p>
  "! Defines an RFID attribute with name, kind, and value
  TYPES:
    BEGIN OF ty_rfid_attribute,
      "! <p class="shorttext">Name</p>
      "! Name of the property bag attribute
      name  TYPE string,
      "! <p class="shorttext">Kind</p>
      "! Type identifier of the property bag attribute
      kind  TYPE c LENGTH 1,
      "! <p class="shorttext">Value</p>
      "! Value of the property bag attribute
      value TYPE string,
    END OF ty_rfid_attribute.

  "! <p class="shorttext">Attributes</p>
  "! List of RFID attributes
  TYPES ty_rfid_attributes TYPE STANDARD TABLE OF ty_rfid_attribute WITH EMPTY KEY.

  "! <p class="shorttext">RFID</p>
  "! Enables RFID device integration and data operations
  TYPES:
    BEGIN OF ty_rfid,
      "! <p class="shorttext">Is Set</p>
      "! Indicates whether the property is explicitly set
      is_set     TYPE abap_bool,
      "! <p class="shorttext">Attributes</p>
      "! List of RFID attributes
      attributes TYPE ty_rfid_attributes,
    END OF ty_rfid.

  "! <p class="shorttext">Custom Attribute</p>
  "! Defines a custom attribute with name, kind, and value
  TYPES:
    BEGIN OF ty_custom_attribute,
      "! <p class="shorttext">Name</p>
      "! Name of the property bag attribute
      name  TYPE string,
      "! <p class="shorttext">Kind</p>
      "! Type identifier of the property bag attribute
      kind  TYPE c LENGTH 1,
      "! <p class="shorttext">Value</p>
      "! Value of the property bag attribute
      value TYPE string,
    END OF ty_custom_attribute.

  "! <p class="shorttext">Attributes</p>
  "! List of custom attributes
  TYPES ty_custom_attributes TYPE STANDARD TABLE OF ty_custom_attribute WITH EMPTY KEY.

  "! <p class="shorttext">Custom</p>
  "! Defines custom attributes for frontend processing
  TYPES:
    BEGIN OF ty_custom_property,
      "! <p class="shorttext">Title</p>
      "! Title of the custom property
      title      TYPE string,
      "! <p class="shorttext">Type</p>
      "! Type of the custom property
      type       TYPE string,
      "! <p class="shorttext">Is Set</p>
      "! Indicates whether the property is explicitly set
      is_set     TYPE abap_bool,
      "! <p class="shorttext">Attributes</p>
      "! List of custom attributes
      attributes TYPE ty_custom_attributes,
    END OF ty_custom_property.

  "! <p class="shorttext">Property Bag</p>
  "! Property bag of the screen or an element
  TYPES:
    BEGIN OF ty_property_bag,
      "! <p class="shorttext">Text Field</p>
      "! Assigns a label field for accessibility support
      text_field                TYPE ty_text_field,
      "! <p class="shorttext">Tooltip Text</p>
      "! Assigns a tooltip text to a screen field for accessibility support
      tooltip_text              TYPE ty_tooltip_text,
      "! <p class="shorttext">Item Count</p>
      "! Displays the number of lines in controls
      item_count                TYPE ty_item_count,
      "! <p class="shorttext">Disable Implicit Labels</p>
      "! Disables automatic label assignment strategies
      disable_implicit_labels   TYPE ty_set_active_property,
      "! <p class="shorttext">Fiori Disable Auto Align</p>
      "! Prevents automatic right-justified alignment of labels in Fiori
      fiori_disable_auto_align  TYPE ty_set_active_property,
      "! <p class="shorttext">Fiori Disable Auto Expand</p>
      "! Keeps label length as defined in screen in Fiori
      fiori_disable_auto_expand TYPE ty_set_active_property,
      "! <p class="shorttext">Fiori Navigation Button</p>
      "! Marks a button as a Fiori navigation button
      fiori_navigation_button   TYPE ty_set_active_property,
      "! <p class="shorttext">Keep Tab</p>
      "! Keeps tab navigation within a subscreen area
      keep_tab                  TYPE ty_set_active_property,
      "! <p class="shorttext">Barcode Input</p>
      "! Supports scanning and processing barcode data
      barcode_input             TYPE ty_set_active_property,
      "! <p class="shorttext">Knowledge Object</p>
      "! Links a dialog help button to a Knowledge Warehouse object
      knowledge_object          TYPE ty_knowledge_object,
      "! <p class="shorttext">Hyperlink</p>
      "! Supports SAP internal Drag&Relate hyperlinks
      hyperlink                 TYPE ty_hyperlink,
      "! <p class="shorttext">Speech</p>
      "! Enables speech input and output features
      speech                    TYPE ty_speech,
      "! <p class="shorttext">RFID</p>
      "! Enables RFID device integration and data operations
      rfid                      TYPE ty_rfid,
      "! <p class="shorttext">Is RFID Data</p>
      "! Marks fields for RFID-only data entry
      is_rfid_data              TYPE ty_set_active_property,
      "! <p class="shorttext">Custom</p>
      "! Defines custom attributes for frontend processing
      custom_property           TYPE ty_custom_property,
    END OF ty_property_bag.

  "! <p class="shorttext">General</p>
  "! General field attributes
  TYPES:
    BEGIN OF ty_field_general,
      "! <p class="shorttext">Line</p>
      "! Screen line position
      "! $required
      line                TYPE i,
      "! <p class="shorttext">Column</p>
      "! Screen column position
      "! $required
      column              TYPE i,
      "! <p class="shorttext">Defined Length</p>
      "! Defined field length
      "! $required
      defined_length      TYPE i,
      "! <p class="shorttext">Visible Length</p>
      "! Visible field length
      "! $required
      visible_length      TYPE i,
      "! <p class="shorttext">Height</p>
      "! Field height
      "! $required
      height              TYPE i,
      "! <p class="shorttext">Scrollable</p>
      "! Enables scrolling within the field
      "! $required
      scrollable          TYPE abap_bool,
      "! <p class="shorttext">Format</p>
      "! ABAP Dictionary field format
      "! $required
      format              TYPE c LENGTH 4,
      "! <p class="shorttext">Input</p>
      "! User input enabled
      input               TYPE abap_bool,
      "! <p class="shorttext">Output</p>
      "! User output enabled
      output              TYPE abap_bool,
      "! <p class="shorttext">Output Only</p>
      "! Display-only field
      output_only         TYPE abap_bool,
      "! <p class="shorttext">Dictionary Field</p>
      "! Referenced ABAP Dictionary (DDIC) field
      dictionary_field    TYPE string,
      "! <p class="shorttext">Dictionary Modified</p>
      "! Indicates whether DDIC-derived attributes have been modified
      dictionary_modified TYPE ty_dictionary_modified,
    END OF ty_field_general.

  "! <p class="shorttext">Texts And Templates</p>
  "! Text and templates for screen element
  TYPES:
    BEGIN OF ty_field_texts_templates,
      "! <p class="shorttext">Text Or IO Field</p>
      "! Text or input/output Field Template
      text_or_io_field TYPE c LENGTH 132,
      "! <p class="shorttext">Dropdown</p>
      "! Dropdown
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

  "! <p class="shorttext">Special</p>
  "! Special
  TYPES:
    BEGIN OF ty_field_special,
      "! <p class="shorttext">Input Status</p>
      "! Defines whether input is allowed, optional, recommended, or required
      input_status             TYPE ty_input_status,
      "! <p class="shorttext">Star Entry As First Character</p>
      "! Allows special input processing when an entry begins with '*'
      star_entry_as_first_char TYPE abap_bool,
      "! <p class="shorttext">Input Reset Disabled</p>
      "! Prevents field input from being cleared with the reset character '!'
      input_reset_disabled     TYPE abap_bool,
      "! <p class="shorttext">Case Sensitive Entry</p>
      "! Allows input to retain lowercase and uppercase characters
      case_sensitive_entry     TYPE abap_bool,
      "! <p class="shorttext">Show Sign</p>
      "! Enables display of a plus/minus sign for numeric values
      show_sign                TYPE abap_bool,
      "! <p class="shorttext">Template Disabled</p>
      "! Allows all characters to be entered in CHAR fields, including special characters such as '!', '?' and '_'"
      template_disabled        TYPE abap_bool,
      "! <p class="shorttext">Foreign Key Check</p>
      "! Enables or disables the Dictionary foreign key check
      foreign_key_check        TYPE abap_bool,
      "! <p class="shorttext">Set Parameter</p>
      "! Stores the field value in SAP memory using the specified parameter ID
      set_parameter            TYPE abap_bool,
      "! <p class="shorttext">Get Parameter</p>
      "! Retrieves the field value from SAP memory using the specified parameter ID
      get_parameter            TYPE abap_bool,
      "! <p class="shorttext">Parameter ID</p>
      "! Identifies the SAP memory parameter used by SET/GET parameters
      parameter_id             TYPE c LENGTH 20,
      "! <p class="shorttext">Conversion Exit</p>
      "! Specifies the conversion routine used to format and interpret field values
      conversion_exit          TYPE c LENGTH 5,
    END OF ty_field_special.

  "! <p class="shorttext">Display field attributes</p>
  "! Display field attributes
  TYPES:
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
      "! Defines how decimal floating point numbers are formatted and displayed on the screen
      output_style           TYPE ty_output_style,
    END OF ty_field_display.

  "! <p class="shorttext">Modification Groups And Functions</p>
  "! Modification groups and functions
  TYPES:
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
      "! Determines whether the object is displayed or hidden when the assigned Switch Framework switch is active
      reaction_to_switch      TYPE ty_reaction_to_switch,
      "! <p class="shorttext">Entry Help</p>
      "! Indicates whether value help is available for the field
      entry_help              TYPE abap_bool,
      "! <p class="shorttext">Value List</p>
      "! Determines the source of values displayed in the dropdown list
      value_list              TYPE ty_value_list,
      "! <p class="shorttext">Input Help Key</p>
      "! Controls the availability and visibility of the input help (F4) button for the field
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

  "! <p class="shorttext">References</p>
  "! Reference assignments for the screen field
  TYPES:
    BEGIN OF ty_field_references,
      "! <p class="shorttext">Search Help</p>
      "! Specifies the search help assigned to the field, either statically or dynamically
      search_help     TYPE c LENGTH 132,
      "! <p class="shorttext">Reference Field</p>
      "! Defines a link to another screen element
      reference_field TYPE c LENGTH 132,
    END OF ty_field_references.

  "! <p class="shorttext">Screen Field</p>
  "! Screen field definition
  TYPES:
    BEGIN OF ty_field,
      "! <p class="shorttext">Field Name</p>
      "! Technical field name
      "! $required
      name                      TYPE c LENGTH 132,
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
      "! Reference assignments for the screen field
      "! $required
      references                TYPE ty_field_references,
      "! <p class="shorttext">Property Bag</p>
      "! Property bag of the screen element
      "! $required
      property_bag              TYPE ty_property_bag,
    END OF ty_field.

  "! <p class="shorttext">Target Subscreen</p>
  "! Specifies the subscreen to be displayed, identified by its program name and screen number
  TYPES:
    BEGIN OF ty_subscreen_target,
      "! <p class="shorttext">Program</p>
      "! The program containing the target subscreen
      program TYPE c LENGTH 40,
      "! <p class="shorttext">Screen</p>
      "! The screen number of the target subscreen within the specified program
      screen  TYPE c LENGTH 4,
    END OF ty_subscreen_target.

  "! <p class="shorttext">Specific Subscreen Attributes</p>
  "! Subscreen-specific attributes
  TYPES:
    BEGIN OF ty_subscreen_attributes,
      "! <p class="shorttext">Scrollable</p>
      "! Allows the field content to be scrolled when it exceeds the visible area
      scrollable         TYPE abap_bool,
      "! <p class="shorttext">SFW Switch</p>
      "! Identifier for switch in the switch framework
      switch             TYPE c LENGTH 30,
      "! <p class="shorttext">Reaction To SFW Switch</p>
      "! Determines whether the object is displayed or hidden when the assigned Switch Framework switch is active
      reaction_to_switch TYPE ty_reaction_to_switch,
      "! <p class="shorttext">Target Subscreen</p>
      "! Specifies the subscreen to be displayed, identified by its program name and screen number
      target             TYPE ty_subscreen_target,
    END OF ty_subscreen_attributes.

  "! <p class="shorttext">Specific Tabstrip Attributes</p>
  "! Tabstrip-specific attributes
  TYPES:
    BEGIN OF ty_tabstrip_attributes,
      "! <p class="shorttext">Fiori Variable Height</p>
      "! Allows the height of tabstrip pages to automatically adapt to the amount of content displayed in Fiori
      fiori_variable_height TYPE abap_bool,
    END OF ty_tabstrip_attributes.

*  "! <p class="shorttext">Specific Splitter Control Attributes</p>
*  "! Splitter control-specific attributes
*  TYPES:
*    BEGIN OF ty_splitter_attributes,
**      to be definied later
*    END OF ty_splitter_attributes.

*  "! <p class="shorttext">Specific Custom Control Attributes</p>
*  "! Custom control-specific attributes
*  TYPES:
*    BEGIN OF ty_custom_control_attributes,
**      to be definied later
*    END OF ty_custom_control_attributes.

  "! <p class="shorttext">Specific Table Control Attributes</p>
  "! Table control-specific attributes
  TYPES:
    BEGIN OF ty_table_control_attributes,
      "! <p class="shorttext">Context Menu Form</p>
      "! Form routine for context menu handling
      context_menu_form       TYPE string,
      "! <p class="shorttext">With Title</p>
      "! Determines whether the table control includes a title
      with_title              TYPE abap_bool,
      "! <p class="shorttext">Title</p>
      "! Text displayed in the title line of the table control
      title                   TYPE string,
      "! <p class="shorttext">With Column Headers</p>
      "! Determines whether the table control columns include a title line
      with_column_headers     TYPE abap_bool,
      "! <p class="shorttext">Configurability</p>
      "! Determines whether users can access the table control configuration dialog
      configurability         TYPE abap_bool,
      "! <p class="shorttext">Vertical Separators</p>
      "! Determines whether the table control displays vertical separators between columns
      vertical_separators     TYPE abap_bool,
      "! <p class="shorttext">Horizontal Separators</p>
      "! Determines whether the table control displays horizontal separators between lines
      horizontal_separators   TYPE abap_bool,
      "! <p class="shorttext">Line Selectability</p>
      "! Determines how many table control lines can be selected simultaneously
      line_selectability      TYPE ty_line_selectability,
      "! <p class="shorttext">Column Selectability</p>
      "! Determines how many table control columns can be selected simultaneously
      column_selectability    TYPE ty_column_selectability,
      "! <p class="shorttext">With Selection Column</p>
      "! Determines whether the table control displays a dedicated column for line selection
      with_selection_column   TYPE abap_bool,
      "! <p class="shorttext">Selection Column</p>
      "! Text displayed in the selection column of the table control
      selection_column        TYPE string,
      "! <p class="shorttext">Number of Fixed Columns</p>
      "! Determines the number of leading table control columns that remain fixed during horizontal scrolling and cannot be moved
      number_of_fixed_columns TYPE i,
    END OF ty_table_control_attributes.

*  "! <p class="shorttext">Specific Steploop Attributes</p>
*  "! Steploop-specific attributes
*  TYPES:
*    BEGIN OF ty_steploop_attributes,
**      to be definied later
*    END OF ty_steploop_attributes.

*  "! <p class="shorttext">Specific Radiobutton Group Attributes</p>
*  "! Radiobutton group-specific attributes
*  TYPES:
*    BEGIN OF ty_radiobutton_group_attributes,
**      to be definied later
*    END OF ty_radiobutton_group_attributes.

  "! <p class="shorttext">Specific Container Attributes</p>
  "! Container-specific attributes based on the container type
  TYPES:
    BEGIN OF ty_container_specifics,
      "! <p class="shorttext">Specific Subscreen Attributes</p>
      "! Subscreen-specific attributes
      subscreen         TYPE ty_subscreen_attributes,
      "! <p class="shorttext">Specific Tabstrip Attributes</p>
      "! Tabstrip-specific attributes
      tabstrip_control  TYPE ty_tabstrip_attributes,

*      "! <p class="shorttext">Specific Splitter Control Attributes</p>
*      "! Splitter control-specific attributes
*      splitter_control  TYPE ty_splitter_attributes,

*      "! <p class="shorttext">Specific Custom Control Attributes</p>
*      "! Custom control-specific attributes
*      custom_control    TYPE ty_custom_control_attributes,

      "! <p class="shorttext">Specific Table Control Attributes</p>
      "! Table control-specific attributes
      table_control     TYPE ty_table_control_attributes,

*      "! <p class="shorttext">Specific Steploop Attributes</p>
*      "! Steploop-specific attributes
*      steploop          TYPE ty_steploop_attributes,

*      "! <p class="shorttext">Specific Radiobutton Group Attributes</p>
*      "! Radiobutton group-specific attributes
*      radiobutton_group TYPE ty_radiobutton_group_attributes,
    END OF ty_container_specifics.

  "! <p class="shorttext">Container</p>
  "! Screen container
  TYPES:
    BEGIN OF ty_container,
      "! <p class="shorttext">Container Type</p>
      "! Type of container
      "! $required
      type                          TYPE ty_container_type,
      "! <p class="shorttext">Container Name</p>
      "! Technical container name
      "! $required
      name                          TYPE string,
      "! <p class="shorttext">Line</p>
      "! Screen line position
      "! $required
      line                          TYPE i,
      "! <p class="shorttext">Column</p>
      "! Screen column position
      "! $required
      column                        TYPE i,
      "! <p class="shorttext">Container Width</p>
      "! Maximum number of columns
      "! $required
      length                        TYPE i,
      "! <p class="shorttext">Container Height</p>
      "! Maximum number of lines
      "! $required
      height                        TYPE i,
      "! <p class="shorttext">Minimum Container Length</p>
      "! Minimum number of columns
      minimum_length                TYPE i,
      "! <p class="shorttext">Minimum Container Height</p>
      "! Minimum number of lines
      minimum_height                TYPE i,
      "! <p class="shorttext">Vertical Resizing</p>
      "! Allows the container height to adapt to vertical window resizing
      vertical_resizing             TYPE abap_bool,
      "! <p class="shorttext">Horizontal Resizing</p>
      "! Allows the container width to adapt to horizontal window resizing
      horizontal_resizing           TYPE abap_bool,
      "! <p class="shorttext">Specific Container Attributes</p>
      "! Container-specific attributes based on the container type
      specific_container_attributes TYPE ty_container_specifics,
      "! <p class="shorttext">Property Bag</p>
      "! Property bag of the container
      "! $required
      property_bag                  TYPE ty_property_bag,
      "! <p class="shorttext">Container Screen Fields</p>
      "! Array of screen fields within the container
      "! $required
      fields                        TYPE STANDARD TABLE OF ty_field WITH EMPTY KEY,
* handle recursion in the serializer !
***      "! <p class="shorttext">Containers Within The Container</p>
***      "! Array of containers within the container
***      "! $required
***      containers                    TYPE STANDARD TABLE OF ty_container WITH EMPTY KEY,    // handle recursion in the serializer !
    END OF ty_container.

  "! <p class="shorttext">Dynpro</p>
  "! Dynpro
  TYPES:
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version TYPE if_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE if_aff_types_v1=>ty_header_70_no_abap_lv,
      "! <p class="shorttext">Screen Attributes</p>
      "! Screen attributes
      "! $required
      attributes     TYPE ty_attributes,
      "! <p class="shorttext">Property Bag</p>
      "! Property bag of the screen
      "! $required
      property_bag   TYPE ty_property_bag,
      "! <p class="shorttext">Screen Fields</p>
      "! Array of screen fields
      "! $required
      fields         TYPE STANDARD TABLE OF ty_field WITH EMPTY KEY,
      "! <p class="shorttext">Containers</p>
      "! Array of containers
      "! $required
      containers     TYPE STANDARD TABLE OF ty_container WITH EMPTY KEY,
    END OF ty_main.

ENDINTERFACE.