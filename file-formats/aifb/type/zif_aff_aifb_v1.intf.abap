INTERFACE zif_aff_aifb_v1
  PUBLIC.


  "! $values { @link zif_aff_aifb_v1.data:co_ifd_type }
  "! $default { @link zif_aff_aifb_v1.data:co_ifd_type.soap }
  TYPES ty_ifd_type       TYPE n LENGTH 3.
  "! $values { @link zif_aff_aifb_v1.data:co_field_category }
  "! $default { @link zif_aff_aifb_v1.data:co_field_category.system_fields }
  TYPES ty_field_category TYPE c LENGTH 1.
  "! $values { @link zif_aff_aifb_v1.data:co_operator }
  "! $default { @link zif_aff_aifb_v1.data:co_operator.equal }
  TYPES ty_operator       TYPE c LENGTH 2.
  TYPES:
    "! <p class="shorttext">Factor</p>
    "! Factor
    BEGIN OF ty_factor,
      "! <p class="shorttext">Number</p>
      "! Number
      "! $minimum 1
      "! $maximum 5
      number         TYPE i,
      "! <p class="shorttext">Field Category</p>
      "! Field category
      "! $required
      field_category TYPE ty_field_category,
      "! <p class="shorttext">Field Name</p>
      "! Field name
      field_name     TYPE c LENGTH 120,
    END OF ty_factor.
  "! <p class="shorttext">Factors</p>
  "! Factors
  "! $maxItems 5
  TYPES ty_factors TYPE STANDARD TABLE OF ty_factor WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">Condition</p>
    "! Condition
    BEGIN OF ty_condition,
      "! <p class="shorttext">Number</p>
      "! Number
      "! $minimum 1
      "! $maximum 5
      number   TYPE i,
      "! <p class="shorttext">Operator</p>
      "! Operator
      "! $required
      operator TYPE ty_operator,
      "! <p class="shorttext">Value</p>
      "! Value
      value    TYPE c LENGTH 45,
    END OF ty_condition.
  "! <p class="shorttext">Conditions</p>
  "! Conditions
  "! $maxItems 5
  TYPES ty_conditions TYPE STANDARD TABLE OF ty_condition WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">Custom Implementation</p>
    "! Custom implementation
    BEGIN OF ty_custom_implementation,
      "! <p class="shorttext">Function Module</p>
      "! Function module
      function_module TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_custom_implementation.
  TYPES:
    "! <p class="shorttext">Check Field Assignment</p>
    "! Check field assignment
    BEGIN OF ty_check_field_assignment,
      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      id         TYPE n LENGTH 3,
      " (type /aif/check_obj_name)
      "! <p class="shorttext">Field Name</p>
      "! Field name
      "! $required
      field_name TYPE c LENGTH 40,
    END OF ty_check_field_assignment.
  "! <p class="shorttext">Check Field Assignments</p>
  "! Check field assignments
  TYPES ty_check_field_assignments TYPE STANDARD TABLE OF ty_check_field_assignment WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">Check Assignment</p>
    "! Check assignment
    BEGIN OF ty_check_assignment,
      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      id                      TYPE n LENGTH 3,
      " (type /aif/check_obj_name)
      "! <p class="shorttext">AIF Check</p>
      "! AIF check
      "! $required
      aif_check               TYPE c LENGTH 40,
      "! <p class="shorttext">Check Field Assignments</p>
      "! Check field assignments
      "! $required
      check_field_assignments TYPE ty_check_field_assignments,
    END OF ty_check_assignment.
  "! <p class="shorttext">Check Assignments</p>
  "! Check assignments
  TYPES ty_check_assignments TYPE STANDARD TABLE OF ty_check_assignment WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">Interface Assignment</p>
    "! Interface assignment
    BEGIN OF ty_interface_assignment,
      "! <p class="shorttext">ID</p>
      "! ID
      "! $required
      id                    TYPE n LENGTH 3,
      " (type /aif/inf_obj_name)
      "! <p class="shorttext">Application Interface</p>
      "! Application interface
      "! $required
      application_interface TYPE c LENGTH 40,
      "! <p class="shorttext">Conditions</p>
      "! Conditions
      conditions            TYPE ty_conditions,
      "! <p class="shorttext">Valid From</p>
      "! Valid from
      valid_from            TYPE d,
      "! <p class="shorttext">Valid To</p>
      "! Valid to
      valid_to              TYPE d,
      "! <p class="shorttext">Check Assignments</p>
      "! Check assignments
      check_assignments     TYPE ty_check_assignments,
    END OF ty_interface_assignment.
  "! <p class="shorttext">Interface Assignments</p>
  "! Interface assignments
  TYPES ty_interface_assignments TYPE STANDARD TABLE OF ty_interface_assignment WITH DEFAULT KEY.
  TYPES:
    "! <p class="shorttext">SOAP Determination Key</p>
    "! SOAP determination key
    BEGIN OF ty_key_soap,
      "! <p class="shorttext">SOAP / Proxy Class</p>
      "! SOAP / proxy class
      soap_class  TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">SOAP / Proxy Method</p>
      "! SOAP / proxy method
      soap_method TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_key_soap.
  TYPES:
    "! <p class="shorttext">IDoc Determination Key</p>
    "! IDoc determination key
    BEGIN OF ty_key_idoc,
      "! <p class="shorttext">Basic Type</p>
      "! Basic type
      basic_type   TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Message Type</p>
      "! Message type
      message_type TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_key_idoc.
  TYPES:
    "! <p class="shorttext">Structure-based Determination Key</p>
    "! Structure-based determination key
    BEGIN OF ty_key_structure_based,
      "! <p class="shorttext">Structure</p>
      "! Structure
      structure TYPE zif_aff_types_v1=>ty_object_name_30,
    END OF ty_key_structure_based.
  TYPES:
    "! <p class="shorttext">Determination Details</p>
    "! Determination details
    BEGIN OF ty_determination_details,
      "! <p class="shorttext">Interface Assignments</p>
      "! Interface assignments
      "! $required
      interface_assignments TYPE ty_interface_assignments,
    END OF ty_determination_details.
  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Interface Determination Type</p>
      "! Interface determination type
      "! $required
      ifd_type TYPE ty_ifd_type,
    END OF ty_general_information.
  TYPES:
    "! <p class="shorttext">Interface Determination</p>
    "! Interface determination
    BEGIN OF ty_main,
      "! $required
      format_version          TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header                  TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information
      "! $required
      general_information     TYPE ty_general_information,
      "! <p class="shorttext">SOAP-specific Determination Keys</p>
      "! SOAP-specific determination keys
      soap_specific_keys      TYPE ty_key_soap,
      "! <p class="shorttext">IDoc-specific Determination Keys</p>
      "! IDoc-specific determination keys
      idoc_specific_keys      TYPE ty_key_idoc,
      "! <p class="shorttext">Structure-based-specific Determination Keys</p>
      "! Structure-based-specific determination keys
      str_based_specific_keys TYPE ty_key_structure_based,
      "! <p class="shorttext">Custom Implementation</p>
      "! Custom implementation
      custom_implementation   TYPE ty_custom_implementation,
      "! <p class="shorttext">Factors</p>
      "! Factors
      factors                 TYPE ty_factors,
      "! <p class="shorttext">Determination Details</p>
      "! Determination details
      determination_details   TYPE ty_determination_details,
    END OF ty_main.

  CONSTANTS:
    BEGIN OF co_ifd_type,
      "! <p class="shorttext">SOAP</p>
      "! SOAP
      soap            TYPE ty_ifd_type VALUE '000',
      "! <p class="shorttext">IDoc</p>
      "! IDoc
      idoc            TYPE ty_ifd_type VALUE '001',
      "! <p class="shorttext">Structure-based</p>
      "! Structure-based
      structure_based TYPE ty_ifd_type VALUE '002',
    END OF co_ifd_type.
  CONSTANTS:
    BEGIN OF co_field_category,
      "! <p class="shorttext">System Fields</p>
      "! System fields
      system_fields           TYPE ty_field_category VALUE 'S',
      "! <p class="shorttext">Field from XI Header Data</p>
      "! Field from XI header data
      xi_header_data          TYPE ty_field_category VALUE 'X',
      "! <p class="shorttext">Sender Field from Routing Data</p>
      "! Sender field from routing data
      xi_routing_data         TYPE ty_field_category VALUE 'R',
      "! <p class="shorttext">Field from Proxy-generated Structure</p>
      "! Field from proxy-generated structure
      proxy_payload_structure TYPE ty_field_category VALUE 'P',
      "! <p class="shorttext">IDoc Data Record</p>
      "! IDoc data record
      idoc_data_record        TYPE ty_field_category VALUE 'D',
      "! <p class="shorttext">IDoc Control Record</p>
      "! IDoc control record
      idoc_control_record     TYPE ty_field_category VALUE 'C',
      "! <p class="shorttext">Field from XML Structure</p>
      "! Field from XML structure
      payload_structure       TYPE ty_field_category VALUE 'A',
    END OF co_field_category.
  CONSTANTS:
    BEGIN OF co_operator,
      "! <p class="shorttext">Equal</p>
      "! Equal
      equal                      TYPE ty_operator VALUE 'EQ',
      "! <p class="shorttext">Not Equal</p>
      "! Not equal
      not_equal                  TYPE ty_operator VALUE 'NE',
      "! <p class="shorttext">Contains Pattern</p>
      "! Contains pattern
      contains_pattern           TYPE ty_operator VALUE 'CP',
      "! <p class="shorttext">No Pattern</p>
      "! No pattern
      no_pattern                 TYPE ty_operator VALUE 'NP',
      "! <p class="shorttext">Contains Any Character</p>
      "! Contains any character
      contains_any_character     TYPE ty_operator VALUE 'CA',
      "! <p class="shorttext">Not Contains Any Character</p>
      "! Not contains any character
      not_contains_any_character TYPE ty_operator VALUE 'NA',
      "! <p class="shorttext">Matches (regular expression)</p>
      "! Matches (regular expression)
      matches                    TYPE ty_operator VALUE 'MT',
    END OF co_operator.
ENDINTERFACE.
