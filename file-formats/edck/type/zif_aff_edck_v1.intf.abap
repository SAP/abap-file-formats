INTERFACE zif_aff_edck_v1
  PUBLIC.

  TYPES ty_check_classification TYPE c LENGTH 1.
  TYPES ty_check_category TYPE c LENGTH 6.

  TYPES:
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Check Category</p>
      "! Consistency check category
      "! $values {@link zif_aff_edck_v1.data:co_check_category}
      "! $default {@link if_aff_edck_v1.data:co_check_category.exist}
      check_category              TYPE ty_check_category,
      "! <p class="shorttext">Check Classification</p>
      "! Consistency check ID classification
      "! $values {@link zif_aff_edck_v1.data:co_check_classification}
      "! $default {@link if_aff_edck_v1.data:co_check_classification.core}
      check_id_classification     TYPE ty_check_classification,
      "! <p class="shorttext">Additional Check Class</p>
      "! Consistency check class
      check_class                 TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Result Derivation Indicator</p>
      "! Result process derived by BAdI
      result_derivation_indicator TYPE abap_bool,
    END OF ty_attributes.

  TYPES:
    "! <p class="shorttext">Consistency Check ID</p>
    "! Consistency check ID
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">General Information</p>
      "! General information of consistency check ID
      "! $required
      general_information TYPE ty_attributes,
    END OF ty_main.

  CONSTANTS:
    "! <p class="shorttext">Check Classification</p>
    "! Check classification
    BEGIN OF co_check_classification,
      "! <p class="shorttext">Core delivered checks</p>
      "! Core delivered checks
      core TYPE ty_check_classification VALUE 'C',
      "! <p class="shorttext">Additionally (Extended) implemented checks</p>
      "! Additionally (Extended) implemented checks
      additional TYPE ty_check_classification VALUE 'A',
    END OF co_check_classification.

  CONSTANTS:
    "! <p class="shorttext">Check Category</p>
    "! Check category
    BEGIN OF co_check_category,
      "! <p class="shorttext">Existence Check</p>
      "! Existence check
      existence_check TYPE ty_check_category VALUE 'EXIST',
      "! <p class="shorttext">Status Check</p>
      "! Status check
      status_check TYPE ty_check_category VALUE 'STATUS',
      "! <p class="shorttext">Edocument Existence Check</p>
      "! Edocument existence check
      edocument_existence_check TYPE ty_check_category VALUE 'EDOCHK',
      "! <p class="shorttext">Content Mismatch Check</p>
      "!  Content mismatch check
      content_mismatch_check TYPE ty_check_category VALUE 'CONMIS',
    END OF co_check_category.
ENDINTERFACE.
