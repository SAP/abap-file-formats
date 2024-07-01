INTERFACE zif_aff_edck_v1
  PUBLIC .
  TYPES ty_check_classification TYPE c LENGTH 1.
  TYPES ty_check_category TYPE c LENGTH 6.

  TYPES:
    BEGIN OF ty_attributes,
      "! <p class="shorttext">Check Category</p>
      "! Consistency Check Category
      "! $values {@link zif_aff_edck_v1.data:co_check_category}
      "! $default {@link if_aff_edck_v1.data:co_check_category.exist}
      "! $required
      CheckCategory             TYPE ty_check_category,
      "! <p class="shorttext">Check Classification</p>
      "! Consistency Check ID Classification
      "! $values {@link zif_aff_edck_v1.data:co_check_classification}
      "! $default {@link if_aff_edck_v1.data:co_check_classification.core}
      "! $required
      CheckIdClassification     TYPE ty_check_classification,
      "! <p class="shorttext">Additional Check Class</p>
      "! Consistency Check Class
      CheckClass                TYPE zif_aff_types_v1=>ty_object_name_30,
      "! <p class="shorttext">Result Derivation Indicator</p>
      "! Result Process Derived by BAdI
      ResultDerivationIndicator TYPE abap_bool,
    END OF ty_Attributes.

  TYPES:
    "! <p class="shorttext">Consistency Check ID</p>
    "! Check ID (EDCK) v1
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Check ID Definition</p>
      "! Attributes of a Consistency Check
      "! $required
      attributes     TYPE ty_attributes,
    END OF ty_main.

  CONSTANTS:
    "! <p class="shorttext">Check Classification</p>
    "! Check Classification
    BEGIN OF co_check_classification,
      "! <p class="shorttext">Core delivered checks</p>
      "! Core delivered checks
      core       TYPE ty_check_classification VALUE 'C',
      "! <p class="shorttext">Additionally (Extended) implemented checks</p>
      "! Additionally (Extended) implemented checks
      Additional TYPE ty_check_classification VALUE 'A',
    END OF co_check_classification.

  CONSTANTS:
    "! <p class="shorttext">Check Category</p>
    "! Check Category
    BEGIN OF co_check_category,
      "! <p class="shorttext">Existence Check</p>
      "! Existence Check
      Exist  TYPE ty_check_category VALUE 'EXIST',
      "! <p class="shorttext">Status Check</p>
      "! Status Check
      status TYPE ty_check_category VALUE 'STATUS',
      "! <p class="shorttext">Edocument Existence Check</p>
      "! Edocument Existence Check
      edochk TYPE ty_check_category VALUE 'EDOCHK',
      "! <p class="shorttext"> Content Mismatch</p>
      "!  Content Mismatch
      conmis TYPE ty_check_category VALUE 'CONMIS',
    END OF co_check_category.
ENDINTERFACE.
