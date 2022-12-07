INTERFACE zif_aff_nrob_v1
  PUBLIC.

  TYPES:
    "! <p class="shorttext">Schema</p>
    "! Format version
    "! $required
    BEGIN OF ty_interval,
      "! <p class="shorttext">Number Length Domain</p>
      "! Name of domain, which determines the length of the number range number.
      "! Define the amount of characters available for number range intervals.
      "! It must be of type NUMC or CHAR and have a field length of at least 1 and at most 20.
      "! $required
      number_length_domain TYPE c LENGTH 30,
      "! <p class="shorttext">Percent Warning</p>
      "! Percentage of numbers remaining in a number range, upon reaching which in number assignment
      "! a warning is given. It must be between 0.1 and 99.9. Example: You have defined an interval
      "!  from 1 to 1000. If you want to issue a warning at the number 900, enter 10 (%) here.
      "! $required
      "! $minimum: 0.1
      "! $maximum: 99.9
      "! $multipleOf: 0.1
      percent_warning      TYPE p LENGTH 3 DECIMALS 1,
      "! <p class="shorttext">Sub Type</p>
      "! If you want to create subobjects for the elements of a field of the application table, specify
      "! the relevant data element for this table field. This data element must be active in the Data Dictionary
      "! and must have a check table. The domain of the data element must have a field length of between 1 and 6.
      "! $required
      sub_type             TYPE c LENGTH 30,
      "! <p class="shorttext">Until Year</p>
      "! If you want the records of the business object to be differentiated by financial year, you set this
      "! option true. This structures the intervals of a number range object.
      "! $required
      until_year           TYPE abap_bool,
      "! <p class="shorttext">Rolling</p>
      "! For each interval of a number range object, the system checks when the available characters are used up.
      "! In the true setting, once the available characters of an interval are used up, the system starts again
      "! from the beginning and the lowest number is assigned again. You can suppress this behavior by setting
      "! this option false. If you do this, no more characters from an interval are assigned once the characters
      "! of the interval are used up. You can suppress rollover for the entire number range object, that
      "! is, the setting applies to all the intervals contained in the object.
      "! $required
      rolling              TYPE abap_bool,
      "! <p class="shorttext">Prefix</p>
      "! If it is set to true determined numbers consist of the prefix (name of subobject) and the numbers.
      "! $required
      prefix               TYPE abap_bool,
    END OF ty_interval.


  "! <p class="shorttext">Buffering</p>
  "! Choose a buffer type for no buffering, for buffering via main memory or for parallel buffering.
  "! $values {@link zif_aff_nrob_v1.data:co_buffering}
  TYPES ty_buffering TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">Buffering</p>
    "! Choose a buffer type for no buffering, for buffering via main memory or for parallel buffering.
    BEGIN OF co_buffering,
      "! <p class="shorttext">Main Memory Buffering</p>
      "! Main memory buffering is the most efficient buffering solution with regards
      "! to system performance. Almost all number range objects use main memory buffering. However, it does have
      "! two restrictions: Numbers can no longer be assigned in chronological order. The numbering may contain gaps.
      main_buffer TYPE ty_buffering VALUE 'X',
      "! <p class="shorttext">Parallel Buffering</p>
      "! Parallel buffering works in the same way as main memory buffering, with the
      "! difference that the number packages are not stored in the main memory, but are written to the
      "! table NRIVSHADOW.
      parallel    TYPE ty_buffering VALUE 'S',
      "! <p class="shorttext">No Buffering</p>
      "! No buffering method is used. A number is taken from an interval stored in database NRIV. The table line is
      "! locked and this lock remains until the application that requested the number is closed, either
      "! with a COMMIT WORK or a ROLLBACK.
      none        TYPE ty_buffering VALUE ' ',
    END OF co_buffering.

  TYPES:
    "! <p class="shorttext">Configuration</p>
    "! Configuration-specific fields
    "! $required
    BEGIN OF ty_configuration,
      "! <p class="shorttext">Transaction ID</p>
      "! Transaction code for application specific transaction
      transaction_id   TYPE c LENGTH 20,
      "! <p class="shorttext">Buffering</p>
      "! Choose a buffer type for no buffering, for buffering via main memory or for parallel buffering.
      "! Default is mainBuffer.
      "! $required
      "! $default {@link zif_aff_nrob_v1.data:co_buffering.main_buffer}
      buffering        TYPE ty_buffering,
      "! <p class="shorttext">Buffered Numbers</p>
      "! This value specifies the numbers in buffer. In case of parallel and main memory buffering, add a
      "! number for 'bufferedNumbers'. It determines how many numbers are reserved in buffer for
      "!  the intervals.Default number of buffers is 10.
      "! $required
      "! $minimum 0
      "! $maximum 99999999
      "! $default '10'
      buffered_numbers TYPE i,
    END OF ty_configuration.

  TYPES:
    "! <p class="shorttext">NROB Object Type</p>
    "! Object type NROB
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_cloud,
      "! <p class="shorttext">Interval</p>
      "! Interval
      "! $required
      interval       TYPE ty_interval,
      "! <p class="shorttext">Configuration</p>
      "! Configuration-specific fields
      "! $required
      configuration  TYPE ty_configuration,
    END OF ty_main.

ENDINTERFACE.
