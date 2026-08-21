"! AFF type for object AUTH
INTERFACE zif_aff_auth_v1
  PUBLIC.
  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    "! $required
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Data Element</p>
      "! Name of the data element
      "! $required
      data_element   TYPE c LENGTH 30,
      "! <p class="shorttext">Organizational Level</p>
      "! Describes whether the authorization field is currently defined as an organizational level or cannot be defined
      "! as one.
      org_level_info TYPE c LENGTH 120,
    END OF ty_general_information.

  "! $values {@link zif_aff_auth_v1.data:co_type_of_maintenance_dialog}
  "! $default {@link zif_aff_auth_v1.data:co_type_of_maintenance_dialog.standard}
  TYPES ty_type_of_maintenance_dialog TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Type of Maintenance Dialog</p>
    BEGIN OF co_type_of_maintenance_dialog,
      "! <p class="shorttext">Standard</p>
      "! Standard maintenance dialog
      standard   TYPE ty_type_of_maintenance_dialog VALUE '1',
      "! <p class="shorttext">Individual (using Exit Function Module)</p>
      "! Individual maintenance dialog using an exit function module as an alternative to the standard maintenance
      "! dialog in order to take account of specific attributes of the field.
      individual TYPE ty_type_of_maintenance_dialog VALUE '2',
    END OF co_type_of_maintenance_dialog.

  TYPES:
    "! <p class="shorttext">Maintenance Dialog</p>
    "! Maintenance dialog
    BEGIN OF ty_maintenance_dialog,
      "! <p class="shorttext">Type of Maintenance Dialog</p>
      "! Type of maintenance dialog
      "! $required
      type_of_maintenance_dialog TYPE ty_type_of_maintenance_dialog,
      "! <p class="shorttext">Exit Function Module</p>
      "! The authorization field uses an individual maintenance dialog that is implemented in the named function module
      "! and overrides the standard maintenance dialog.
      exit_function_module       TYPE c LENGTH 30,
      "! <p class="shorttext">Some Authorization Objects use an own Maintenance Dialog</p>
      "! An object-specific maintenance dialog is required if the authorization values of different fields are dependent
      "! on one another. It always overrides the maintenance dialogs (default or custom) of all fields contained in the
      "! authorization object.
      object_own_maint_dialog    TYPE abap_bool,
    END OF ty_maintenance_dialog.

  "! $values {@link zif_aff_auth_v1.data:co_type_of_search_help}
  "! $default {@link zif_aff_auth_v1.data:co_type_of_search_help.search_help_of_data_element}
  TYPES ty_type_of_search_help TYPE c LENGTH 1.
  CONSTANTS:
    "! <p class="shorttext">Type of Search Help</p>
    BEGIN OF co_type_of_search_help,
      "! <p class="shorttext">Using Search Help of Data Element</p>
      "! Search help of data element is used in standard maintenance dialog.
      search_help_of_data_element TYPE ty_type_of_search_help VALUE '1',
      "! <p class="shorttext">Using Check Table (Authorization Field)</p>
      "! Check table is used as search help in standard maintenance dialog.
      "! A check table is only suitable if the first column with a data element identical to the authorization field is
      "! suitable for value selection. If no matching data element exists, the first column with a matching domain is
      "! used for value selection.
      check_table                 TYPE ty_type_of_search_help VALUE '2',
    END OF co_type_of_search_help.

  TYPES:
    "! <p class="shorttext">Search Help</p>
    "! Search help
    "! $required
    BEGIN OF ty_search_help,
      "! <p class="shorttext">Check Table</p>
      "! Check table
      check_table              TYPE c LENGTH 30,
      "! <p class="shorttext">Type of Search Help</p>
      "! Type of search help
      "! $required
      type_of_search_help      TYPE ty_type_of_search_help,
      "! <p class="shorttext">Some Authorization Objects use an Object Field Search Help</p>
      "! If the search help for an authorization field returns unsuitable selection results in a particular
      "! authorization object, an alternative search help can be maintained in the object definition for this field,
      "! in order to select suitable values for the object/field combination. This object/field
      "! search help always has priority over the search help for the field.
      object_field_search_help TYPE abap_bool,
    END OF ty_search_help.

  TYPES:
    "! <p class="shorttext">Authorization Field</p>
    "! Authorization Field
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Maintenance Dialog</p>
      "! Maintenance dialog
      "! $required
      maintenance_dialog  TYPE ty_maintenance_dialog,
      "! <p class="shorttext">Search Help in Standard Maintenance Dialog</p>
      "! Search help in standard maintenance dialog
      "! $required
      search_help         TYPE ty_search_help,
    END OF ty_main.
ENDINTERFACE.
