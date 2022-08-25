"! AFF type for the demo object WB2J
interface zif_aff_wb2j_v1
  public .
  types:
         "! $values { @link zif_aff_wb2j_v1.data:co_level }
         "! $default { @link zif_aff_wb2j_v1.data:co_level.beginner }
         ty_level type i.
    constants: begin of co_level,
            "! <p class="shorttext">Beginner</p>
            "! Beginner
            beginner type ty_level value 1,
            "! <p class="shorttext">Advanced</p>
            "! Advanced
            advanced type ty_level value 2,
            "! <p class="shorttext">Expert</p>
            "! Expert
            expert type ty_level value 3,
            end of co_level.

  types:
         "! $values { @link zif_aff_wb2j_v1.data:co_canteen }
         "! $default { @link zif_aff_wb2j_v1.data:co_canteen.wdf55 }
         ty_canteen type c length 5.
    constants: begin of co_canteen,
            "! <p class="shorttext">WDF01</p>
            "! Canteen in WDF01
            wdf01 type ty_canteen value 'WDF01',
            "! <p class="shorttext">WDF03</p>
            "! Canteen in WDF03
            wdf03 type ty_canteen value 'WDF03',
            "! <p class="shorttext">WDF05</p>
            "! Canteen in WDF05
            wdf05 type ty_canteen value 'WDF05',
            "! <p class="shorttext">WDF08</p>
            "! Canteen in WDF08
            wdf08 type ty_canteen value 'WDF08',
            "! <p class="shorttext">WDF13</p>
            "! Canteen in WDF13
            wdf13 type ty_canteen value 'WDF13',
            "! <p class="shorttext">WDF20</p>
            "! Canteen in WDF20
            wdf20 type ty_canteen value 'WDF20',
            "! <p class="shorttext">WDF49</p>
            "! Canteen in WDF49
            wdf49 type ty_canteen value 'WDF49',
            "! <p class="shorttext">WDF53</p>
            "! Canteen in WDF53
            wdf53 type ty_canteen value 'WDF53',
            "! <p class="shorttext">Foodhall</p>
            "! Foodhall
            wdf55 type ty_canteen value 'WDF55',
            end of co_canteen.


  types:
    "! <p class="shorttext">Favorites</p>
    "! Favorites
    begin of ty_favorites,
      "! <p class="shorttext">Class</p>
      "! Favorite class
      class   type zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">WB2K</p>
      "! Favorite WB2K
      wb2k   type zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Canteen</p>
      "! Favorite canteen
      canteen   type ty_canteen,
    end of ty_favorites.

  types:
    "! <p class="shorttext">Skill Details</p>
    "! Skill details
    begin of ty_skill,
      "! <p class="shorttext">Name</p>
      "! Name of skill
      name  type c length 30,
      "! <p class="shorttext">Level</p>
      "! Level
      level type ty_level,
    end of ty_skill,

    ty_skills type standard table of ty_skill with default key.

  types:
    "! <p class="shorttext">WB2J Properties</p>
    "! WB2J properties
    begin of ty_main,
      "! <p class="shorttext">Format version</p>
      "! Format version
      "! $required
      format_version    type zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header            type zif_aff_types_v1=>ty_header_60,
      "! <p class="shorttext">First Name</p>
      "! First name
      "! $required
      first_name   type string,
      "! <p class="shorttext">Last Name</p>
      "! Last name
      "! $required
      last_name  type string,
      "! <p class="shorttext">Start At SAP</p>
      "! Year of start at SAP
      "! $minimum 1972
      start_at_sap   type i,
      "! <p class="shorttext">Manager</p>
      "! The manager of this employee
      manager  type zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Location</p>
      "! Location
      location   type string,
      "! <p class="shorttext">Drinks Coffee</p>
      "! Flag that shows if employee drinks coffee
      drinks_coffee type xsdboolean,
      "! <p class="shorttext">Favorites</p>
      "! Favorites
      favorites type ty_favorites,
      "! <p class="shorttext">Skills</p>
      "! Skills
      skills           type ty_skills,
    end of ty_main.

endinterface.
