"! AFF type for the demo object WB2J
INTERFACE zif_aff_wb2j_v1
  PUBLIC.
  TYPES:
         "! $values { @link zif_aff_wb2j_v1.data:co_level }
         "! $default { @link zif_aff_wb2j_v1.data:co_level.beginner }
         ty_level TYPE i.
  CONSTANTS: BEGIN OF co_level,
               "! <p class="shorttext">Beginner</p>
               "! Beginner
               beginner TYPE ty_level VALUE 1,
               "! <p class="shorttext">Advanced</p>
               "! Advanced
               advanced TYPE ty_level VALUE 2,
               "! <p class="shorttext">Expert</p>
               "! Expert
               expert   TYPE ty_level VALUE 3,
             END OF co_level.

  TYPES:
         "! $values { @link zif_aff_wb2j_v1.data:co_canteen }
         "! $default { @link zif_aff_wb2j_v1.data:co_canteen.wdf55 }
         ty_canteen TYPE c LENGTH 5.
  CONSTANTS: BEGIN OF co_canteen,
               "! <p class="shorttext">WDF01</p>
               "! Canteen in WDF01
               wdf01 TYPE ty_canteen VALUE 'WDF01',
               "! <p class="shorttext">WDF03</p>
               "! Canteen in WDF03
               wdf03 TYPE ty_canteen VALUE 'WDF03',
               "! <p class="shorttext">WDF05</p>
               "! Canteen in WDF05
               wdf05 TYPE ty_canteen VALUE 'WDF05',
               "! <p class="shorttext">WDF08</p>
               "! Canteen in WDF08
               wdf08 TYPE ty_canteen VALUE 'WDF08',
               "! <p class="shorttext">WDF13</p>
               "! Canteen in WDF13
               wdf13 TYPE ty_canteen VALUE 'WDF13',
               "! <p class="shorttext">WDF20</p>
               "! Canteen in WDF20
               wdf20 TYPE ty_canteen VALUE 'WDF20',
               "! <p class="shorttext">WDF49</p>
               "! Canteen in WDF49
               wdf49 TYPE ty_canteen VALUE 'WDF49',
               "! <p class="shorttext">WDF53</p>
               "! Canteen in WDF53
               wdf53 TYPE ty_canteen VALUE 'WDF53',
               "! <p class="shorttext">Foodhall</p>
               "! Foodhall
               wdf55 TYPE ty_canteen VALUE 'WDF55',
             END OF co_canteen.


  TYPES:
    "! <p class="shorttext">Favorites</p>
    "! Favorites
    BEGIN OF ty_favorites,
      "! <p class="shorttext">Class</p>
      "! Favorite class
      class   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">WB2K</p>
      "! Favorite WB2K
      wb2k    TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Canteen</p>
      "! Favorite canteen
      canteen TYPE ty_canteen,
    END OF ty_favorites.

  TYPES:
    "! <p class="shorttext">Skill Details</p>
    "! Skill details
    BEGIN OF ty_skill,
      "! <p class="shorttext">Name</p>
      "! Name of skill
      name  TYPE c LENGTH 30,
      "! <p class="shorttext">Level</p>
      "! Level
      level TYPE ty_level,
    END OF ty_skill,

    ty_skills TYPE STANDARD TABLE OF ty_skill WITH DEFAULT KEY.

  TYPES:
    "! <p class="shorttext">WB2J Properties</p>
    "! WB2J properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Format version</p>
      "! Format version
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">First Name</p>
      "! First name
      "! $required
      first_name     TYPE string,
      "! <p class="shorttext">Last Name</p>
      "! Last name
      "! $required
      last_name      TYPE string,
      "! <p class="shorttext">Start At SAP</p>
      "! Year of start at SAP
      "! $minimum 1972
      start_at_sap   TYPE i,
      "! <p class="shorttext">Manager</p>
      "! The manager of this employee
      manager        TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Location</p>
      "! Location
      location       TYPE string,
      "! <p class="shorttext">Drinks Coffee</p>
      "! Flag that shows if employee drinks coffee
      drinks_coffee  TYPE abap_bool,
      "! <p class="shorttext">Favorites</p>
      "! Favorites
      favorites      TYPE ty_favorites,
      "! <p class="shorttext">Skills</p>
      "! Skills
      skills         TYPE ty_skills,
    END OF ty_main.

ENDINTERFACE.
