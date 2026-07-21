INTERFACE zif_aff_devc_v1 PUBLIC.

  "! <p class="shorttext">Package Type</p>
  "! Package type
  "! $values {@link zif_aff_devc_v1.data:co_package_type}
  "! $default {@link zif_aff_devc_v1.data:co_package_type.development}
  TYPES ty_package_type TYPE c LENGTH 11.

  CONSTANTS:
    "! <p class="shorttext">Package Type</p>
    "! Package type
    BEGIN OF co_package_type,
      "! <p class="shorttext">Development</p>
      "! Development
      development TYPE ty_package_type VALUE 'development' ##NO_TEXT,
      "! <p class="shorttext">Main</p>
      "! Main packages, with the exception of your own package interfaces and subpackages, cannot contain other repository objects.
      "! Subpackages, in turn, can be other main packages and the standard development packages.
      main        TYPE ty_package_type VALUE 'main' ##NO_TEXT,
      "! <p class="shorttext">Structure</p>
      "! Structure
      structure   TYPE ty_package_type VALUE 'structure' ##NO_TEXT,
    END OF co_package_type.

  "! <p class="shorttext">Translation Relevance</p>
  "! Internal SAP classification defining the languages into which a development package is translated
  "! The translation relevance determines the languages into which the repository objects in a development package are translated.
  "! $values {@link zif_aff_devc_v1.data:co_translation_relevance}
  TYPES ty_translation_relevance TYPE c LENGTH 25.

  CONSTANTS:
    "! <p class="shorttext">Translation Relevance</p>
    "! The translation relevance determines the languages into which the repository objects in a development package are translated.
    "! You choose the translation relevance based on the target group of each development package.
    "! If you are in any doubt, contact your translation delivery manager maintained in Sirius for your program.
    BEGIN OF co_translation_relevance,
      "! <p class="shorttext">End User UI - All Languages</p>
      "! Use this classification if the objects in the package contain texts visible to business end users.
      "! Texts in objects in the package are then translated into all languages in which the product is available.
      "! For business applications, this is usually the correct classification.
      end_user_all_languages     TYPE ty_translation_relevance VALUE 'EndUserAllLanguages',
      "! <p class="shorttext">End User UI - Reduced Language Scope</p>
      "! Choose this classification if:
      "! - Either the package is aimed at business end users and contains country-specific developments, such as Payroll for France.
      "! Texts in objects in the package only require translation into the language(s) for the country/countries concerned.
      "! - Or you want to restrict translation to fewer languages than the languages in which the full product is available.
      end_user_reduced_languages TYPE ty_translation_relevance VALUE 'EndUserReducedLanguages',
      "! <p class="shorttext">Administrator UI - Admin Languages</p>
      "! Use this classification only for packages in the ABAP Platform, which are intended for system administrators.
      "! Texts in objects in the package are then translated into English, German, French, and Japanese for 7.0 - 7.30, plus
      "! into Portuguese, Russian, and Simplified Chinese for 7.31 - 7.40,
      "! plus Arabic, Danish, Dutch, Spanish, Italian, Korean, Swedish, Turkish, and Traditional Chinese as of 7.50.
      "! Do not choose this classification if the package contains objects intended for end users of business applications.
      administrator              TYPE ty_translation_relevance VALUE 'Administrator' ##NO_TEXT,
      "! <p class="shorttext">Developer UI - German/English Only</p>
      "! Use this classification only for packages in the ABAP Platform, which are intended for system developers.
      "! This type of package usually consists of ABAP Workbench applications, such as tools for development, testing, and analysis,
      "! plus other support tools and methods for modifying or enhancing code.
      "! Texts in objects in the package are then translated into German and English only.
      "! Do not choose this classification if the package contains objects intended for end users of business applications.
      developer                  TYPE ty_translation_relevance VALUE 'Developer' ##NO_TEXT,
      "! <p class="shorttext">Not Translation-Relevant</p>
      "! Choose this classification if the package is not relevant for translation, because the package is, for example, not delivered
      "! or is only used internally or by hosting partners, and not by any customer.
      no_translation             TYPE ty_translation_relevance VALUE 'NoTranslation' ##NO_TEXT,
    END OF co_translation_relevance.

  "! <p class="shorttext">Error Severity</p>
  "! Error Severity
  "! $values {@link zif_aff_devc_v1.data:co_severity}
  TYPES ty_severity TYPE c LENGTH 11.

  CONSTANTS:
    "! <p class="shorttext">Severity</p>
    "! Severity
    BEGIN OF co_severity,
      "! <p class="shorttext">Information</p>
      "! Information
      information TYPE ty_severity VALUE 'information' ##NO_TEXT,
      "! <p class="shorttext">Warning</p>
      "! Warning
      warning     TYPE ty_severity VALUE 'warning' ##NO_TEXT,
      "! <p class="shorttext">Error</p>
      "! Error
      error       TYPE ty_severity VALUE 'error' ##NO_TEXT,
      "! <p class="shorttext">None</p>
      "! None
      none        TYPE ty_severity VALUE 'none' ##NO_TEXT,
      "! <p class="shorttext">Obsolete</p>
      "! Obsolete
      obsolete    TYPE ty_severity VALUE 'obsolete' ##NO_TEXT,
    END OF co_severity.

  TYPES:
    "! <p class="shorttext">Use Access</p>
    "! Use Access
    BEGIN OF ty_use_access,
      "! <p class="shorttext">Package Interface</p>
      "! Package Interface
      package_interface TYPE c LENGTH 30,
      "! <p class="shorttext">severity</p>
      "! severity
      "! $required
      severity          TYPE ty_severity,
    END OF ty_use_access.

  TYPES:
    "! <p class="shorttext">General Information</p>
    "! General information
    BEGIN OF ty_general_information,
      "! <p class="shorttext">Package Type</p>
      "! Package type
      "! $required
      type                          TYPE ty_package_type,
      "! <p class="shorttext">Super Package</p>
      "! Super package
      super_package                 TYPE c LENGTH 30,
      "! <p class="shorttext">Switch</p>
      "! Switch
      switch                        TYPE c LENGTH 30,
      "! <p class="shorttext">Application Component</p>
      "! Name used to identify the application component
      application_component         TYPE c LENGTH 24,
      "! <p class="shorttext">Software Component</p>
      "! The software component describes a set of objects that are always delivered together.
      software_component            TYPE c LENGTH 30,
      "! <p class="shorttext">Transport Layer</p>
      "! The transport layer determines whether objects are assigned to a local or transportable change request.
      transport_layer               TYPE c LENGTH 4,
      "! <p class="shorttext">Record Object Changes in Transport Requests</p>
      "! This flag indicates whether the Transport Organizer records changes made to objects in this package.
      "! If changes are recorded, version management is also activated for the objects in this package.
      supports_record_changes       TYPE abap_bool,
      "! <p class="shorttext">Adding Further Objects not Allowed</p>
      "! If you set this flag, users cannot create new objects within the package.
      "! However, they can move existing objects to other packages.
      is_adding_objects_not_allowed TYPE abap_bool,
      "! <p class="shorttext">Encapsulated</p>
      "! When this package property is activated, the package is encapsulated. The consequence of this is that only the development
      "! elements exposed in package interfaces of the package are visible to the outside.
      "! Possible client packages need use access to those package interfaces that contain the development objects used.
      "! Otherwise, errors occur during the package check.
      is_encapsulated               TYPE abap_bool,
      "! <p class="shorttext">ABAP Language Version</p>
      "! Determines ABAP Lanaguage Version for all new objects within the package.
      abap_language_version         TYPE zif_aff_types_v1=>ty_abap_language_version,
      "! <p class="shorttext">Translation Relevance</p>
      "! Internal SAP classification defining the languages into which a development package is translated
      "! The translation relevance determines the languages into which the repository objects in a development package are translated.
      "! $required
      translation_relevance         TYPE ty_translation_relevance,
    END OF   ty_general_information.

  TYPES:
    "! <p class="shorttext">Package</p>
    "! Package
    BEGIN OF ty_main,
      "! <p class="shorttext">Format Version</p>
      "! Format version
      "! $required
      format_version      TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header              TYPE zif_aff_types_v1=>ty_header_60_no_abap_lv,
      "! <p class="shorttext">General Information</p>
      "! General information
      general_information TYPE ty_general_information,
      "! <p class="shorttext">Use Accesses</p>
      "! The use access gives a package the right to use the development elements in the package interface of another package.
      "! Note that this right is one-way only.
      use_accesses        TYPE STANDARD TABLE OF ty_use_access WITH DEFAULT KEY,
    END OF ty_main.

ENDINTERFACE.
