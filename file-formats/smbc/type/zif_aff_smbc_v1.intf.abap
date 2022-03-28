INTERFACE zif_aff_smbc_v1
  PUBLIC.
  CONSTANTS:
    "! <p class="shorttext synchronized">Table Type</p>
    BEGIN OF co_table_type,
      "! <p class="shorttext synchronized">Responsive Table</p>
      responsive_table TYPE string VALUE 'ResponsiveTable',
      "! <p class="shorttext synchronized">Grid Table</p>
      grid_table       TYPE string VALUE 'GridTable',
    END OF co_table_type,
    "! <p class="shorttext synchronized">Section Layout</p>
    BEGIN OF co_section_layout,
      "! <p class="shorttext synchronized">Page</p>
      page TYPE string VALUE 'Page',
      "! <p class="shorttext synchronized">Tabs</p>
      tabs TYPE string VALUE 'Tabs',
    END OF co_section_layout,
    "! <p class="shorttext synchronized" >Table Creation Mode</p>
    BEGIN OF co_creation_mode_name,
      "! <p class="shorttext synchronized">New Page</p>
      "! Item is created in subpage
      new_page     TYPE string VALUE 'NewPage',
      "! <p class="shorttext synchronized">Inline</p>
      "! By clicking on 'Create' a new line is created but automatic navigation to subpage is not triggered.
      inline       TYPE string VALUE 'Inline',
      "! <p class="shorttext synchronized">Creation Row</p>
      "! By clicking on 'Add row' a new line is created but automatic navigation to subpage is not triggered.
      creation_row TYPE string VALUE 'CreationRow',
    END OF co_creation_mode_name,
    "! <p class="shorttext synchronized" >Initial Load</p>
    BEGIN OF co_initial_load,
      "! <p class="shorttext synchronized" >Enabled</p>
      "! Data is always loaded when opening the app
      enabled  TYPE string VALUE 'Enabled',
      "! <p class="shorttext synchronized" >Disabled</p>
      "! Data is never loaded when opening the app without an app state
      disabled TYPE string VALUE 'Disabled',
      "! <p class="shorttext synchronized" >Auto</p>
      "! Data is only loaded, if initial/preset filters are available
      auto     TYPE string VALUE 'Auto',
    END OF co_initial_load.

  TYPES:
    "! <p class="shorttext synchronized" >Personalization</p>
    BEGIN OF ty_personalization,
      "! <p class="shorttext synchronized">Hide Filter</p>
      "! If true, the user cannot filter data of the table
      hide_filter TYPE abap_bool,
      "! <p class="shorttext synchronized">Hide Sort</p>
      "! If true, the user cannot sort the table
      hide_sort   TYPE abap_bool,
      "! <p class="shorttext synchronized">Hide Column</p>
      "! If true, the user cannot add and remove columns to the table
      hide_column TYPE abap_bool,
    END OF ty_personalization,
    "! <p class="shorttext synchronized" >Table Creation Mode</p>
    BEGIN OF ty_creation_mode,
      "! <p class="shorttext synchronized">Table Creation Mode</p>
      "! $values {@link zif_aff_smbc_v1.data:co_creation_mode_name}
      name          TYPE string,
      "! <p class="shorttext synchronized">Create at End</p>
      "! If true, a new row is added to the end of the table instead of the beginning of the table
      create_at_end TYPE abap_bool,
    END OF ty_creation_mode,
    "! <p class="shorttext synchronized">Table Type</p>
    "! $values {@link zif_aff_smbc_v1.data:co_table_type}
    "! $default {@link zif_aff_smbc_v1.data:co_table_type.responsive_table}
    ty_table_type             TYPE string,
    "! <p class="shorttext synchronized">List Report Configuration</p>
    BEGIN OF ty_list_report,
      "! <p class="shorttext synchronized">Initial Load</p>
      "! Defines whether data in the List Report is automatically loaded on first app start.
      "! $values {@link zif_aff_smbc_v1.data:co_initial_load}
      "! $default {@link zif_aff_smbc_v1.data:co_initial_load.enabled}
      initial_load           TYPE string,
      table_type             TYPE ty_table_type,
      "! <p class="shorttext synchronized">Condensed Table Layout</p>
      "! If true, display rows in a condensed way. Only applicaple to Table Type 'GridTable'.
      condensed_table_layout TYPE abap_bool,
      "! <p class="shorttext synchronized">Hide Filter</p>
      "! If true, the user cannot filter data of the table
      hide_filter            TYPE ty_personalization-hide_filter,
      "! <p class="shorttext synchronized">Hide Sort</p>
      "! If true, the user cannot sort the table
      hide_sort              TYPE ty_personalization-hide_sort,
      "! <p class="shorttext synchronized">Hide Column</p>
      "! If true, the user cannot add and remove columns to the table
      hide_column            TYPE ty_personalization-hide_column,
    END OF ty_list_report,
    BEGIN OF ty_object_page_common,
      "! <p class="shorttext synchronized">Entity</p>
      "! Entity Name of the Object Page
      entity                  TYPE string,
      "! <p class="shorttext synchronized">Editable Header Content</p>
      "! If true, the header content is changeable in edit mode
      editable_header_content TYPE abap_bool,
      "! <p class="shorttext synchronized">Condensed Table Layout</p>
      "! If true, display rows in a condensed way. Only applicaple to Table Type 'GridTable'.
      condensed_table_layout  TYPE abap_bool,
      "! <p class="shorttext synchronized">Disable Paste</p>
      "! If true, disable the possibility to add several items by copying and pasting data from an excel file
      disable_paste           TYPE abap_bool,
      "! <p class="shorttext synchronized">Enable Full Screen</p>
      "! If true, a button on the table toolbar allows the user to open the table in fullscreen dialog
      enable_full_screen      TYPE abap_bool,
    END OF ty_object_page_common,
    "! <p class="shorttext synchronized">Object Page Configuration</p>
    BEGIN OF ty_object_page.
      INCLUDE TYPE ty_object_page_common.
  TYPES:
      table_type              TYPE ty_table_type,
      "! <p class="shorttext synchronized">Section Layout</p>
      "! Toggle between onepage concept and tabs.
      "! $values {@link zif_aff_smbc_v1.data:co_section_layout}
      "! $default {@link zif_aff_smbc_v1.data:co_section_layout.page}
      section_layout     TYPE string,
      "! <p class="shorttext synchronized">Table Creation Mode</p>
      "! $values {@link zif_aff_smbc_v1.data:co_creation_mode_name}
      "! $default {@link zif_aff_smbc_v1.data:co_creation_mode_name.new_page}
      creation_mode_name TYPE ty_creation_mode-name,
      "! <p class="shorttext synchronized">Create at End</p>
      "! If true, a new row is added to the end of the table instead of the beginning of the table
      create_at_end      TYPE ty_creation_mode-create_at_end,
      "! <p class="shorttext synchronized">Hide Filter</p>
      "! If true, the user cannot filter data of the table
      hide_filter        TYPE ty_personalization-hide_filter,
      "! <p class="shorttext synchronized">Hide Sort</p>
      "! If true, the user cannot sort the table
      hide_sort          TYPE ty_personalization-hide_sort,
      "! <p class="shorttext synchronized">Hide Column</p>
      "! If true, the user cannot add and remove columns to the table
      hide_column        TYPE ty_personalization-hide_column,
    END OF ty_object_page,
    "! <p class="shorttext synchronized" >Object Page Configurations</p>
    ty_object_pages TYPE SORTED TABLE OF ty_object_page WITH UNIQUE KEY entity,
    "! <p class="shorttext synchronized" >Confguration of List Report and Object Pages</p>
    "! The Object Page of the Root Entity cannot be configured.
    "! It is sufficient to maintain only those attributes that should deviate from the standard behavior.
    BEGIN OF ty_settings,
      list_report  TYPE ty_list_report,
      object_pages TYPE ty_object_pages,
    END OF ty_settings.
  TYPES:
    "! <p class="shorttext">Service Configuration</p>
    BEGIN OF ty_service_configuration,
      "! <p class="shorttext">Service Binding</p>
      "! Service Binding used for business configuration maintenance
      "! $required
      service_binding  TYPE c LENGTH 40,
      "! <p class="shorttext">Service Name</p>
      "! The name of the service to be used (as defined in the Service Binding)
      "! $required
      service_name     TYPE c LENGTH 40,
      "! <p class="shorttext">Service Version</p>
      "! The version of the service to be used (as defined in the Service Binding)
      "! $required
      service_version  TYPE n LENGTH 4,
      "! <p class="shorttext">Root Entity Set</p>
      "! The name of an entity set as exposed by the Service Definition.
      "! This entity set is used as the root node for the UI.
      "! Only for this root entity set and its associations a UI is shown.
      "! $required
      root_entity_set      TYPE c LENGTH 30,
      "! <p class="shorttext">Name</p>
      "! Name of the Business Configuration shown in the Maintain Business Configurations app.
      "! Can be translated with the Maintain Translations app
      "! $required
      name             TYPE c LENGTH 50,
      "! <p class="shorttext">Skip Root Entity List Report</p>
      "! If true, the UI automatically navigates to the Object Page of the root entity skipping the List Report.
      "! Exactly one root entity must exist
      "! $showAlways
      skip_root_entity TYPE abap_bool,
    END OF ty_service_configuration.

  TYPES:
    "! <p class="shorttext">Header for SMBC Objects</p>
    BEGIN OF ty_header,
      "! <p class="shorttext">Description</p>
      "! Description of the Business Configuration shown in the Maintain Business Configurations app.
      "! Can be translated with the Maintain Translations app
      "! $required
      description           TYPE c LENGTH 50,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the development object.
      "! Attributes Name and Description must be maintained in this language
      "! $required
      original_language     TYPE sy-langu,
      "! $values {@link zif_aff_types_v1.data:co_abap_language_version_cloud}
      "! $default {@link zif_aff_types_v1.data:co_abap_language_version_cloud.standard}
      abap_language_version TYPE zif_aff_types_v1=>ty_abap_language_version,
    END OF ty_header.

  TYPES:
    "! <p class="shorttext">Business Configuration Maintenance Object Type</p>
    BEGIN OF ty_main,
      "! $required
      format_version        TYPE zif_aff_types_v1=>ty_format_version,
      "! $required
      header                TYPE ty_header,
      "! $required
      service_configuration TYPE ty_service_configuration,
      app_configuration     TYPE ty_settings,
    END OF ty_main.

ENDINTERFACE.
