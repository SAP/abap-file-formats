INTERFACE zif_aff_sajc_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Header for SAJC Object</p>
    "! The header for an application job catalog entry
    BEGIN OF ty_header,
      "! <p class="shorttext">Description</p>
      "! Description of the application job catalog entry
      "! $required
      description           TYPE c LENGTH 120,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the application job catalog entry
      "! $required
      original_language     TYPE sy-langu,
      "! <p class="shorttext">ABAP Language Version</p>
      "! ABAP language version
      "! $values {@link zif_aff_types_v1.data:co_abap_language_version_cloud}
      "! $default {@link zif_aff_types_v1.data:co_abap_language_version_cloud.standard}
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version_cloud,
    END OF ty_header.

  "! <p class="shorttext">Program Name</p>
  "! Name of the program
  TYPES ty_program_name TYPE c LENGTH 40.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Class with Execute Method</p>
      "! Name of the class which contains the execute-method to run within the job
      "! $required
      class_name   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Executed Program</p>
      "! Name of the program which is executed within the job
      program_name TYPE ty_program_name,
    END OF ty_general_information.

  TYPES:
    "! <p class="shorttext">Exit Classes</p>
    "! Classes which contain the exits of the job scheduling and processing
    BEGIN OF ty_exit_classes,
      "! <p class="shorttext">Check</p>
      "! Name of the class which contains the check exit
      check        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Value Help</p>
      "! Name of the class which contains the value help exit
      value_help   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Notification</p>
      "! Name of the class which contains the notification exit
      notification TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_exit_classes.

  "! <p class="shorttext">Parameter Name</p>
  "! Name of the parameter
  TYPES ty_parameter_name TYPE c LENGTH 38.
  "! <p class="shorttext">Group Name</p>
  "! Name of the group
  TYPES ty_group_name TYPE c LENGTH 10.
  "! <p class="shorttext">Section Name</p>
  "! Name of the section
  TYPES ty_section_name TYPE c LENGTH 10.
  "! <p class="shorttext">Parameter Title Text</p>
  "! Text of the parameter title
  TYPES ty_parameter_title_text TYPE c LENGTH 255.
  "! <p class="shorttext">Title Text</p>
  "! Text of the title
  TYPES ty_title_text TYPE c LENGTH 120.
  "! <p class="shorttext">Radio Button Group</p>
  "! Name of the radio button group
  TYPES ty_radio_button_group TYPE c LENGTH 4.
  "! <p class="shorttext">Screen Element</p>
  "! Type of the screen element
  "! $values {@link zif_aff_sajc_v1.data:co_screen_element}
  "! $default {@link zif_aff_sajc_v1.data:co_screen_element.none}
  TYPES ty_screen_element TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Screen Element</p>
    "! Type of the screen element
    BEGIN OF co_screen_element,
      "! <p class="shorttext">None</p>
      "! None
      none         TYPE ty_screen_element VALUE ' ',
      "! <p class="shorttext">Checkbox</p>
      "! Checkbox
      checkbox     TYPE ty_screen_element VALUE 'C',
      "! <p class="shorttext">Radio Button</p>
      "! Radio button
      radio_button TYPE ty_screen_element VALUE 'R',
      "! <p class="shorttext">List Box</p>
      "! List box
      list_box     TYPE ty_screen_element VALUE 'L',
    END OF co_screen_element.

  "! <p class="shorttext">Value Help Type</p>
  "! Type of the value help
  "! $values {@link zif_aff_sajc_v1.data:co_value_help_type}
  "! $default {@link zif_aff_sajc_v1.data:co_value_help_type.none}
  TYPES ty_value_help_type TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Value Help Type</p>
    "! Type of the value help
    BEGIN OF co_value_help_type,
      "! <p class="shorttext">None</p>
      "! No or unsupported value help type
      none     TYPE ty_value_help_type VALUE ' ',
      "! <p class="shorttext">CDS view</p>
      "! Value help based on a CDS view
      cds_view TYPE ty_value_help_type VALUE 'V',
      "! <p class="shorttext">Domain</p>
      "! Value help based on the 'Fixed values' list of a dictionary domain
      domain   TYPE ty_value_help_type VALUE 'O',
    END OF co_value_help_type.

  TYPES:
    "! <p class="shorttext">Parameter</p>
    "! Parameter of the class which is executed within the job
    BEGIN OF ty_parameter,
      "! <p class="shorttext">Name</p>
      "! Name of the parameter
      "! $required
      name                 TYPE ty_parameter_name,
      "! <p class="shorttext">Title</p>
      "! Title of the parameter on the selection screen
      title                TYPE ty_parameter_title_text,
      "! <p class="shorttext">Group</p>
      "! Name of the parameter group
      group                TYPE ty_group_name,
      "! <p class="shorttext">Indented</p>
      "! Flag indicating whether the parameter is indented on the selection screen
      indented             TYPE abap_bool,
      "! <p class="shorttext">Mandatory</p>
      "! Flag indicating whether the parameter is mandatory
      mandatory            TYPE abap_bool,
      "! <p class="shorttext">Hidden</p>
      "! Flag indicating whether the parameter is hidden
      hidden               TYPE abap_bool,
      "! <p class="shorttext">Read Only</p>
      "! Flag indicating whether the parameter is read only
      read_only            TYPE abap_bool,
      "! <p class="shorttext">Enabled By Parameter</p>
      "! Name of the boolean parameter which enables / disables the current parameter
      enabled_by_parameter TYPE ty_parameter_name,
      "! <p class="shorttext">Screen Element</p>
      "! Display of the parameter as screen element (radio button, checkbox, list box)
      screen_element       TYPE ty_screen_element,
      "! <p class="shorttext">Radio Button Group</p>
      "! Name of the radio button group if the parameter is a radio button
      radio_button_group   TYPE ty_radio_button_group,
      "! <p class="shorttext">Value Help</p>
      "! Name of the object on which the value help is based:
      "! for value helps based on a CDS view: name of the data definition;
      "! for value helps based on a domain: name of the domain
      value_help           TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Value Help Type</p>
      "! Type of the value help (based on a CDS view, or based on the 'Fixed values' list of a dictionary domain)
      value_help_type      TYPE ty_value_help_type,
      "! <p class="shorttext">Backend Call</p>
      "! Flag indicating whether a call of the backend system is triggered after a parameter value change to check it
      backend_call         TYPE abap_bool,
      "! <p class="shorttext">Only Single Values</p>
      "! Flag indicating whether only single values are allowed (no conditions like 'not equal' or 'between')
      single_values        TYPE abap_bool,
      "! <p class="shorttext">Text Lines in Editor</p>
      "! Number of lines of the text editor (0 means no multiline editor)
      "! $minimum 0
      "! $maximum 20
      text_editor_lines    TYPE i,
    END OF ty_parameter.
  TYPES:
    "! <p class="shorttext">Parameters</p>
    "! List of parameters
    ty_parameter_table TYPE STANDARD TABLE OF ty_parameter WITH KEY name.

  TYPES:
    "! <p class="shorttext">Group</p>
    "! Group of parameters on the selection screen
    BEGIN OF ty_group,
      "! <p class="shorttext">Name</p>
      "! Name of the group
      "! $required
      name    TYPE ty_group_name,
      "! <p class="shorttext">Title</p>
      "! Title of the group on the selection screen
      "! $required
      title   TYPE ty_title_text,
      "! <p class="shorttext">Section</p>
      "! Name of the group section
      section TYPE ty_section_name,
    END OF ty_group.
  TYPES:
    "! <p class="shorttext">Groups</p>
    "! List of groups
    ty_group_table TYPE STANDARD TABLE OF ty_group WITH KEY name.

  TYPES:
    "! <p class="shorttext">Section</p>
    "! Section of parameter groups on the selection screen
    BEGIN OF ty_section,
      "! <p class="shorttext">Name</p>
      "! Name of the section
      "! $required
      name  TYPE ty_section_name,
      "! <p class="shorttext">Title</p>
      "! Title of the section on the selection screen
      "! $required
      title TYPE ty_title_text,
    END OF ty_section.
  TYPES:
    "! <p class="shorttext">Sections</p>
    "! List of sections
    ty_section_table TYPE STANDARD TABLE OF ty_section WITH KEY name.

  TYPES:
    "! <p class="shorttext">Application Job Catalog Entry</p>
    "! Attributes of the application job catalog entry
    BEGIN OF ty_main,
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE ty_header,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Exit Classes</p>
      "! Classes which contain the exits of the job scheduling and processing
      exit_classes        TYPE ty_exit_classes,
      "! <p class="shorttext">Sections</p>
      "! List of sections
      sections            TYPE ty_section_table,
      "! <p class="shorttext">Groups</p>
      "! List of groups
      groups              TYPE ty_group_table,
      "! <p class="shorttext">Parameters</p>
      "! List of parameters
      parameters          TYPE ty_parameter_table,
    END OF ty_main.
ENDINTERFACE.
