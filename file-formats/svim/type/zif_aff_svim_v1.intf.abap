INTERFACE zif_aff_svim_v1
  PUBLIC.

  "! <p class="shorttext">Screen Layout</p>
  TYPES ty_screen_layout TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Screen Layout</p>
    BEGIN OF co_screen_layout,
      "! <p class="shorttext">Overview Screen</p>
      "! One-Step Maintenance: A single overview screen is generated for entry
      overview            TYPE ty_screen_layout VALUE '1',
      "! <p class="shorttext">Overview and Detail Screen</p>
      "! Two-Step Maintenance: In addition to the overview screen, a detail screen is also generated
      overview_and_detail TYPE ty_screen_layout VALUE '2',
    END OF co_screen_layout.

  "! <p class="shorttext">Transport Recording</p>
  TYPES ty_transport_recording TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Transport Recording</p>
    "! Dependency: The recording depends upon the client setting. The following settings are possible:
    "! 1. Changes without automatic recording; Changes are not automatically recorded. It is, however,
    "!    possible to make manual recordings.
    "! 2. Automatic recoding of changes; All changes are automatically recorded.
    "! 3. No changes allowed; Changes can not be made, it is, however, possible to record table contents
    "!    manually for the transport.
    "! 4. No transport allowed; Changes can be made here, but they can be neither automatically nor
    "!    manually recorded for the transport.
    BEGIN OF co_transport_recording,
      "! <p class="shorttext">Standard Recording</p>
      "! Changes are recorded by the standard recording routine; individual maintenance events supplement it if defined.
      "! In case of a table an R3TR TABU entry is recorded and in case of a view R3TR VDAT
      standard   TYPE ty_transport_recording VALUE ' ',
      "! <p class="shorttext">No Recording</p>
      "! Changes are not recorded, and it is a current settings object
      none       TYPE ty_transport_recording VALUE 'X',
      "! <p class="shorttext">Via Events</p>
      "! Changes are recorded by individual implemented event (events 10, 11, 12)
      via_events TYPE ty_transport_recording VALUE 'U',
    END OF co_transport_recording.

  "! <p class="shorttext">Event Code</p>
  TYPES ty_event_code TYPE c LENGTH 2.

  CONSTANTS:
    "! <p class="shorttext">Event Codes</p>
    "! Predefined hook points in the generated table/view maintenance dialog (domain MAINTEVENT)
    BEGIN OF co_event_code,
      "! <p class="shorttext">Before Saving the Data in the Database</p>
      "! Event 01 - Before Saving the Data in the Database
      before_save                   TYPE ty_event_code VALUE '01',
      "! <p class="shorttext">After Saving the Data in the Database</p>
      "! Event 02 - After Saving the Data in the Database
      after_save                    TYPE ty_event_code VALUE '02',
      "! <p class="shorttext">Before Deleting the Data Displayed</p>
      "! Event 03 - Before Deleting the Data Displayed
      before_delete                 TYPE ty_event_code VALUE '03',
      "! <p class="shorttext">After Deleting the Data Displayed</p>
      "! Event 04 - After Deleting the Data Displayed
      after_delete                  TYPE ty_event_code VALUE '04',
      "! <p class="shorttext">Creating a New Entry</p>
      "! Event 05 - Creating a New Entry
      on_create                     TYPE ty_event_code VALUE '05',
      "! <p class="shorttext">After Completely Performing the Function 'Get Original'</p>
      "! Event 06 - After Completely Performing the Function 'Get Original'
      after_get_original_complete   TYPE ty_event_code VALUE '06',
      "! <p class="shorttext">Before Correcting the Contents of a Selected Field</p>
      "! Event 07 - Before Correcting the Contents of a Selected Field
      before_content_correction     TYPE ty_event_code VALUE '07',
      "! <p class="shorttext">After Correcting the Contents of a Selected Field</p>
      "! Event 08 - After Correcting the Contents of a Selected Field
      after_content_correction      TYPE ty_event_code VALUE '08',
      "! <p class="shorttext">After Getting the Original of an Entry</p>
      "! Event 09 - After Getting the Original of an Entry
      after_get_original_entry      TYPE ty_event_code VALUE '09',
      "! <p class="shorttext">After Creating the Header Entries for the Change Task (E071)</p>
      "! Event 10 - After Creating the Header Entries for the Change Task (E071)
      after_create_transport_header TYPE ty_event_code VALUE '10',
      "! <p class="shorttext">After Changing a Key Entry for the Change Task (E071K)</p>
      "! Event 11 - After Changing a Key Entry for the Change Task (E071K)
      after_change_transport_key    TYPE ty_event_code VALUE '11',
      "! <p class="shorttext">After Changing the Key Entries for the Change Task (E071K)</p>
      "! Event 12 - After Changing the Key Entries for the Change Task (E071K)
      after_change_transport_keys   TYPE ty_event_code VALUE '12',
      "! <p class="shorttext">Exit Editing (Exit Main Function Module)</p>
      "! Event 13 - Exit Editing (Exit Main Function Module)
      on_exit                       TYPE ty_event_code VALUE '13',
      "! <p class="shorttext">After Lock/Unlock in the Main Function Module</p>
      "! Event 14 - After Lock/Unlock in the Main Function Module
      after_lock_unlock             TYPE ty_event_code VALUE '14',
      "! <p class="shorttext">Before Retrieving Deleted Entries</p>
      "! Event 15 - Before Retrieving Deleted Entries
      before_restore_deleted        TYPE ty_event_code VALUE '15',
      "! <p class="shorttext">After Retrieving Deleted Entries</p>
      "! Event 16 - After Retrieving Deleted Entries
      after_restore_deleted         TYPE ty_event_code VALUE '16',
      "! <p class="shorttext">After Checking Whether the Data Has Changed</p>
      "! Event 18 - After Checking Whether the Data Has Changed
      after_change_check            TYPE ty_event_code VALUE '18',
      "! <p class="shorttext">After Initializing Global Variables, Field Symbols, Etc.</p>
      "! Event 19 - After Initializing Global Variables, Field Symbols, Etc.
      after_init_globals            TYPE ty_event_code VALUE '19',
      "! <p class="shorttext">After Input in Date Subscreen (Time-Dep. Tab./Views)</p>
      "! Event 20 - After Input in Date Subscreen (Time-Dep. Tab./Views)
      after_date_subscreen          TYPE ty_event_code VALUE '20',
      "! <p class="shorttext">Fill Hidden Fields</p>
      "! Event 21 - Fill Hidden Fields
      fill_hidden_fields            TYPE ty_event_code VALUE '21',
      "! <p class="shorttext">Go to Long Text Editor for Other Languages</p>
      "! Event 22 - Go to Long Text Editor for Other Languages
      on_open_long_text_other_lang  TYPE ty_event_code VALUE '22',
      "! <p class="shorttext">Before Calling Address Editing Screen</p>
      "! Event 23 - Before Calling Address Editing Screen
      before_address_screen         TYPE ty_event_code VALUE '23',
      "! <p class="shorttext">After Restricting an Entry (Time-Dep. Tab./Views)</p>
      "! Event 24 - After Restricting an Entry (Time-Dep. Tab./Views)
      after_restrict_entry          TYPE ty_event_code VALUE '24',
      "! <p class="shorttext">Individual Authorization Checks</p>
      "! Event 25 - Individual Authorization Checks
      authorization_check           TYPE ty_event_code VALUE '25',
      "! <p class="shorttext">Before Creating a List</p>
      "! Event 26 - Before Creating a List
      before_list                   TYPE ty_event_code VALUE '26',
      "! <p class="shorttext">After Creation or Copying a GUID (Not a Key Field)</p>
      "! Event 27 - After Creation or Copying a GUID (Not a Key Field)
      after_guid_creation           TYPE ty_event_code VALUE '27',
      "! <p class="shorttext">After Entering a Date Restriction for Time-Dep. Views</p>
      "! Event 28 - After Entering a Date Restriction for Time-Dep. Views
      after_date_input              TYPE ty_event_code VALUE '28',
      "! <p class="shorttext">Instead of the Standard Data Read Routine</p>
      "! Event AA - Instead of the Standard Data Read Routine
      replace_std_read_routine      TYPE ty_event_code VALUE 'AA',
      "! <p class="shorttext">Instead of the Standard Database Change Routine</p>
      "! Event AB - Instead of the Standard Database Change Routine
      replace_std_db_change_routine TYPE ty_event_code VALUE 'AB',
      "! <p class="shorttext">Instead of the Standard 'Get Original' Routine</p>
      "! Event AC - Instead of the Standard 'Get Original' Routine
      replace_std_get_original      TYPE ty_event_code VALUE 'AC',
      "! <p class="shorttext">Instead of the Standard RO Field Read Routine</p>
      "! Event AD - Instead of the Standard RO Field Read Routine
      replace_std_ro_field_routine  TYPE ty_event_code VALUE 'AD',
      "! <p class="shorttext">Instead of Standard Positioning Code</p>
      "! Event AE - Instead of Standard Positioning Code
      replace_std_positioning       TYPE ty_event_code VALUE 'AE',
      "! <p class="shorttext">Instead of Reading Texts in Other Languages</p>
      "! Event AF - Instead of Reading Texts in Other Languages
      replace_read_texts_other_lang TYPE ty_event_code VALUE 'AF',
      "! <p class="shorttext">Instead of 'Get Original' for Texts in Other Languages</p>
      "! Event AG - Instead of 'Get Original' for Texts in Other Languages
      replace_get_orig_texts        TYPE ty_event_code VALUE 'AG',
      "! <p class="shorttext">Instead of DB Change for Texts in Other Languages</p>
      "! Event AH - Instead of DB Change for Texts in Other Languages
      replace_db_change_texts       TYPE ty_event_code VALUE 'AH',
      "! <p class="shorttext">GUI Menu Main Program Name</p>
      "! Event ST - GUI Menu Main Program Name
      gui_menu_program              TYPE ty_event_code VALUE 'ST',
    END OF co_event_code.

  TYPES:
    "! <p class="shorttext">Attributes</p>
    "! Screen layout and configuration attributes of the generated maintenance dialog
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Function Group</p>
      "! Name of the function group that contains the generated maintenance screens (TVDIR-AREA)
      "! $required
      function_group         TYPE c LENGTH 26,
      "! <p class="shorttext">Screen Layout</p>
      "! Controls whether one combined screen or separate overview and detail screens are generated (TVDIR-TYPE)
      "! $values {@link zif_aff_svim_v1.data:co_screen_layout}
      "! $default {@link zif_aff_svim_v1.data:co_screen_layout.overview}
      "! $required
      screen_layout          TYPE ty_screen_layout,
      "! <p class="shorttext">Overview Screen Number</p>
      "! Dynpro number of the generated screen: the single maintenance screen for one-step maintenance,
      "! or the overview (list) screen for two-step maintenance (TVDIR-LISTE)
      "! $showAlways
      overview_screen_number TYPE n LENGTH 4,
      "! <p class="shorttext">Detail Screen Number</p>
      "! Dynpro number of the generated detail (single-entry) screen; relevant for two-step
      "! maintenance only (TVDIR-DETAIL)
      "! $showAlways
      detail_screen_number   TYPE n LENGTH 4,
      "! <p class="shorttext">Recording Routine</p>
      "! Controls whether the standard, via event or no recording routine is used for
      "! transport recording (TVDIR-FLAG)
      "! $values {@link zif_aff_svim_v1.data:co_transport_recording}
      "! $default {@link zif_aff_svim_v1.data:co_transport_recording.standard}
      "! $showAlways
      transport_recording    TYPE ty_transport_recording,
    END OF ty_attributes.

  TYPES:
    "! <p class="shorttext">Extended Table Maintenance Event</p>
    "! ABAP subroutine registered for a specific maintenance event (TVIMF)
    BEGIN OF ty_event,
      "! <p class="shorttext">Event Code</p>
      "! Two-character event code identifying the hook point in the maintenance dialog (TVIMF-EVENT)
      "! $values {@link zif_aff_svim_v1.data:co_event_code}
      "! $required
      event      TYPE ty_event_code,
      "! <p class="shorttext">Form Routine</p>
      "! Name of the ABAP subroutine called at this maintenance event (TVIMF-FORMNAME)
      "! $required
      subroutine TYPE c LENGTH 30,
    END OF ty_event.

  "! <p class="shorttext">Extended Table Maintenance Events</p>
  "! Extended table maintenance events registered for this table/view (table TVIMF)
  TYPES ty_events TYPE SORTED TABLE OF ty_event WITH UNIQUE KEY event.

  TYPES:
    "! <p class="shorttext">View/Table Maintenance</p>
    "! ABAP File Format representation of a View/Table Maintenance Generator object (SVIM)
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Version of the AFF format used to serialize this object
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Administrative header data: object name and description
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Attributes</p>
      "! Screen layout and configuration of the generated maintenance dialog
      "! $required
      attributes     TYPE ty_attributes,
      "! <p class="shorttext">Extended Table Maintenance Events</p>
      "! Optional extended table maintenance events called at specific points during maintenance (table TVIMF)
      events         TYPE ty_events,
    END OF ty_main.

ENDINTERFACE.
