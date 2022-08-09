## JSON Files in ABAP File Formats
JSON files are central, since every ABAP object specifies at least a JSON file.
Depending on the object, there might be additional files containing source code or other information, but there is always a JSON file with the pattern `<object_name>.<object_type>.json`, see [`File Names`](./specification.md#File-Names).
For its annotation and validation the ABAP file formats provide JSON Schemas.

## Table of Contents
* [Format Versions and Compatibility](#format-versions-and-compatibility)
* [Writing JSON Schema with ABAP Types](#writing-JSON-schema-with-ABAP-types)
* [Example](#example)
* [Reusable Fields in JSON Files](#reusable-fields-in-json-files)

## Format Versions and Compatibility

The ABAP file format of object types will evolve over time.
For this purpose the JSON Schema specifies the field `formatVersion` and the file itself, is named after the version.
For example, the JSON Schema file for INTF for the first version is named `intf-v1.json` and specifies the `formatVersion` by
```
"formatVersion": {
  "title": "ABAP File Format Version",
  "description": "The ABAP file format version for INTF.",
  "type": "string",
  "const": "1"
}
```

If a change to the format is considered incompatible, then the `formatVersion` has to be increased.

### Compatible File Format Changes

For compatible changes to the file format, the JSON Schema is just updated.
The indicator whether the format has changed is not updated.
JSON files are always validated against the latest update of the JSON Schema of the corresponding format version.

Following changes to file formats are considered as compatible:

- Values for a field (enum) are added (remark: this might lead to syntax errors in ABAP systems which don't support this value)
- Descriptions or titles are changed
- Non-mandatory fields are added




### Incompatible File Format Changes

If a file format is changed incompatibly, a new file format with a new version has to be created. The old file format is kept. It can be used for old/existing versions of files.

The following changes to file formats are considered as incompatible:

- Content type of the file is changed (e.g., from xml to json)
- Mandatory fields are added
- Content structure within the file is changed (e.g., field is moved to a sub structure)
- Mandatory fields are removed  (old implementations might rely on the field to be mandatory)
- Non-mandatory fields are removed
- Fields are renamed
- Type of a field is changed (e.g., from `string` to `number`)
- Semantic of a field is changed
- Values of a field (e.g., in enum) are removed
- Length of a field is shortened
- Length of a field is extended if some systems cannot store this information


## Writing JSON Schema with ABAP Types

Each JSON Schema provided in this repository is automatically generated. For this purpose, an interface corresponds to each object type in which the necessary components of the type are described in the type `ty_main`. The name of the interface follows the pattern `zif_aff_<object_type>_v<version_number>`. Here, `<object_type>` can be either the (R3TR) object type or the (LIMU) sub object type, since R3TR and LIMU object types share the same namespace. `<version_number>` is an increasing integer which starts with `1`.

The ABAP types are self-contained, so it is possible to work on them in any system (e.g., in an SAP BTP, ABAP environment system).

The JSON Schema is generated based on the fields and their ABAP type specification defined in `ty_main`. Each field defined in the structure is transformed to a JSON representation using a camel case notation (e.g, field `abap_language_version` is transformed to the field `abapLanguageVersion` in the JSON Schema). The ABAP type information fills the JSON Schema fields `type`, `length`, `minimum`, `maximum`.

Fields `format_version` and `header` are mandatory and translate to `formatVersion` and `header` in the JSON Schema.
The interface [`zif_aff_types_v1`](../file-formats/zif_aff_types_v1.intf.abap) offers a type for the format version and different headers for reuse, but also other often repeated types.

In order to add more information to the JSON Schema than that provided by the ABAP type, ABAP Doc can be used.
The comments are placed directly above the components of the type `ty_main`, but they are also read over several levels as, e.g., in the case of nested structures.
The different possibilities are summarized in the following.

### Type Mapping

An ABAP type is mapped to a JSON Schema `type` as follows:

ABAP Type | JSON Schema Type | JSON Schema Additions
:--- | :---  | :---
string | string |
c | string | `"maxLength": <length of character field>`
i | integer | `"minimum": -2147483648, "maximum": 2147483647`
n | string | `"maxLength": <length of character field>, "pattern": "^[0-9]+$"`
p | number | `"minimum": <minimum value>, "maximum": <maximum value>, "multipleOf": <e.g., 0.01 for 2 decimals>`
abap_bool | boolean |
sy-langu | string | `"minLength": 2, "maxLength": 2, "pattern": "^[a-z]+$"`

### Title
To provide a title, an ABAP Doc shorttext
```abap
"! <p class="shorttext">Insert Title</p>
```
is used.
Please write the title in title case. This means that all words are capitalized except for minor words. Example: "The Quick Brown Fox Jumps over the Lazy Dog".
A title must consist of a maximum of 255 characters.

### Description
An ABAP Doc comment without annotations is passed as description to the JSON Schema.
```abap
"! This is the description
```
Please write the description in sentence case. This means to write the description as if it was a normal english sentence. Example: "The quick brown fox jumps over the lazy dog"
A description must consist of a maximum of 255 characters.

### Extreme Values
For numerical types, (exclusive) minimum and (exclusive) maximum values can be specified via the annotational keywords
```abap
"! $minimum value
"! $exclusiveMinimum value
"! $maximum value
"! $exclusiveMaximum value
```
followed by a space and the desired value.

### Length Specification
Choosing an ABAP data type with length specification results in the field `maxLength` being written. In order to do this including ABAP types whose length is not already set or to specify a minimum length, the annotations
```abap
"! $maxLength value
"! $minLength value
```
followed by a space and the desired value are used.

### Multiple Of
The annotation
```abap
"! $multipleOf value
```
ensures that values of a component described by this ABAP Doc comment can only be a multiple of the provided value.

### Required Fields
If a field is to be declared as "required" in the JSON Schema, the annotation
```abap
"! $required
```
is used.

### Always Shown Fields
Normally, if an ABAP object is serialized, only the components of the corresponding type with a non-initial value are written to the JSON data file. If a component shall be shown regardless to its value, the annotation
```abap
"! $showAlways
```
is added. Note that also the `$required` annotation leads to such a behavior.

### Default Values
To set the `default` for a component of the JSON Schema, the annotation
```abap
"! $default
```
 is used, followed by the specification of the default. To provide the default, there are two different possibilities:
1. If the component has enum values, the default value is specified by a link to the corresponding component of the constant describing the enum.
```abap
"! $default {@link source_name.data:constant_name.default_component}
```
2. In all other cases, the default value is given, surrounded by single quotation marks.
```abap
"! $default 'value'
```
This also ensures that only components whose value is not equal to a specific default value are serialized to the JSON data file.
Fields, which are not specified in the JSON data file, are deserialized to their default values.
Note that if you specify a default value, initial values are written to the JSON data file, unless they are not equal to the selected default.

Since fields, which are not specified in the JSON data, might be represented by either initial values or default values, implementations of serialization and deserialization of ABAP file formats must consider fields with default values as specified here.

### Enum Values
To pass enum values to a JSON Schema, a type and a constant are necessary.
The type specifies the underlying data type and links to the constant via the following annotation:
```abap
"! $values {@link source_name.data:constant_name}
```
The names of the components of the constant are written as external (JSON) values to the JSON Schema after being transformed to camel case (e.g, component `badi_definition` is transformed to the enum value `badiDefinition` in the JSON Schema).
The corresponding values of the components represent the internal (ABAP) values.

If not the transformed name of a component shall be used, the enum value can be overwritten by adding an ABAP Doc comment with the annotational keyword
```abap
"! $enumValue 'newEnumValue'
```
to the specific component.
However, we recommend to use this feature for overwriting the enum values rarely.

Titles and descriptions of the enum values are passed to the JSON Schema in the same way as described above.
They are written in the fields `enumTitles` and `enumDescriptions`.

Remark: If an enum is used, it should be checked if one of the following points applies to your type:
1. The used constant has a component whose value is initial.
2. The field with enum values is marked as required.
3. The field with enum values has a specified default value.

It is enough and recommended to fulfill only one of these points.


The order of the comments and annotations presented here is important: First, there is the comment for the title followed by the one for the description, in case they are both provided. After these two, the remaining annotations are always located. Between them, the order is irrelevant.

### Additional Properties

Adding additional custom fields in any ABAP file formats JSON file is not allowed.

Therefore, generated JSON Schemas contain the property `"additionalProperties": false`.
This means, no additional fields can be added to the JSON files.

If new fields are added to the ABAP file format, the JSON Schema will be updated with the new field.
If fields are removed from the ABAP file format, a new JSON Schema will be defined and the `formatVersion` will be increased.

## Example
Here is the shortened type used to generate the JSON Schema for interfaces. It can be found in the interface [`zif_aff_intf_v1`](../file-formats/intf/type/zif_aff_intf_v1.intf.abap).
```abap
  TYPES:
    "! <p class="shorttext">Interface Properties</p>
    "! Interface properties
    BEGIN OF ty_main,
      "! $required
      format_version TYPE zif_aff_types_v1=>ty_format_version,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header         TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">Proxy Interface</p>
      "! Interface is a proxy interface
      proxy          TYPE abap_bool.
    END OF ty_main.
```
With the specification of the component `format_version` and `header` as well as its used types in the interface [`zif_aff_types_v1`](../file-formats/zif_aff_types_v1.intf.abap)
```abap
  "! <p class="shorttext">ABAP File Format Version</p>
  "! The ABAP file format version
  TYPES ty_format_version TYPE string.

  "! $values {@link zif_aff_types_v1.data:co_abap_language_version_src}
  "! $default {@link zif_aff_types_v1.data:co_abap_language_version_src.standard}
  TYPES ty_abap_language_version_src TYPE c LENGTH 1.

  CONSTANTS:
    "! <p class="shorttext">ABAP Language Version (Source Code Objects)</p>
    "! ABAP language version for source code objects. For non-source-code objects use
    "! {@link zif_aff_types_v1.data:ty_abap_language_version }
    BEGIN OF co_abap_language_version_src,
      "! <p class="shorttext">Standard</p>
      "! Standard
      standard          TYPE ty_abap_language_version_src VALUE 'X',
      "! <p class="shorttext">ABAP for Key Users</p>
      "! ABAP for key user extensibility
      key_user          TYPE ty_abap_language_version_src VALUE '2',
      "! <p class="shorttext">ABAP Cloud Development</p>
      "! ABAP cloud development
      cloud_development TYPE ty_abap_language_version_src VALUE '5',
    END OF co_abap_language_version_src.

  "! <p class="shorttext">Description</p>
  "! Description with 60 characters
  TYPES ty_description_60 TYPE c LENGTH 60.

  TYPES:
    "! <p class="shorttext">Header for Source Code Objects</p>
    "! The header for an ABAP main object (with source code) with a description of 60 characters
    BEGIN OF ty_header_60_src,
      "! <p class="shorttext">Description</p>
      "! Description of the ABAP object
      "! $required
      description           TYPE ty_description_60,
      "! <p class="shorttext">Original Language</p>
      "! Original language of the ABAP object
      "! $required
      original_language     TYPE sy-langu,
      "! <p class="shorttext">ABAP Language Version (source code object)</p>
      "! ABAP language version for source code objects
      abap_language_version TYPE ty_abap_language_version_src,
    END OF ty_header_60_src.
```
This leads to the following generated JSON schema:
```json
 {
  "$comment": "This file is autogenerated, do not edit manually, see https://github.com/SAP/abap-file-formats for more information.",
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://github.com/SAP/abap-file-formats/blob/main/file-formats/intf/intf.json",
  "title": "Interface Properties",
  "description": "Interface properties",
  "type": "object",
  "properties": {
    "formatVersion": {
      "title": "ABAP File Format Version",
      "description": "Format version",
      "type": "string",
      "const": "1"
    },
    "header": {
      "title": "Header",
      "description": "Header",
      "type": "object",
      "properties": {
        "description": {
          "title": "Description",
          "description": "Description of the ABAP object",
          "type": "string",
          "maxLength": 60
        },
        "originalLanguage": {
          "title": "Original Language",
          "description": "Original language of the ABAP object",
          "type": "string",
          "minLength": 2,
          "maxLength": 2,
          "pattern": "^[a-z]+$"
        },
        "abapLanguageVersion": {
          "title": "ABAP Language Version (source code object)",
          "description": "ABAP language version for source code objects",
          "type": "string",
          "enum": [
            "standard",
            "keyUser",
            "cloudDevelopment"
          ],
          "enumTitles": [
            "Standard",
            "ABAP for Key Users",
            "ABAP Cloud Development"
          ],
          "enumDescriptions": [
            "Standard",
            "ABAP for key user extensibility",
            "ABAP cloud development"
          ],
          "default": "standard"
        }
      },
      "required": [
        "description",
        "originalLanguage"
      ]
    },
    "proxy": {
      "title": "Proxy Interface",
      "description": "Interface is a proxy interface",
      "type": "boolean"
    }
  },
  "required": [
    "formatVersion",
    "header"
  ]
}
```
## Reusable Fields in JSON Files

This section describes fields that can be reused by all file formats.

The types for these reusables are defined in the interface [`ZIF_AFF_TYPES_V1`](../file-formats/zif_aff_types_v1.intf.abap).

### Format Version

The field `formatVersion` is a meta field and defines the ABAP file format version of the JSON content.
Basically, it is needed to allow the incompatible evolution of a content type.


### Description

The field `description` contains the description of the object.

### Original Language

The field `originalLanguage` stores the information about the original language of the object.

The original language is specified with [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.

All translatable texts in the object shall be maintained in their original language.
Translations of the texts shall be stored in separate files.

The original language is not specified for sub objects. Sub objects have the same original version as their main objects.

### ABAP Language Version

The field `abapLanguageVersion` specifies the ABAP language version of an object.


With the ABAP language version, it is possible to specify which ABAP language elements and which other objects you can use in your object.
It does not specify the compatibility with a specific release (like SAP_BASIS 7.55).
The ABAP language version `standard` specifies no limitation with regards to the usage of ABAP language elements or other objects.
The ABAP language versions `cloudDevelopment` and `keyUser` are a subset of the ABAP language version `standard` and you can use only a subset of ABAP language elements and released objects.
For more details, you can refer to the [ABAP keyword documentation](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm).

The field `abapLanguageVersion` is optional. Allowed values are `standard`, `cloudDevelopment` or `keyUser`. The default value is `standard`.

Implementations of ABAP file formats can decide whether they serialize the ABAP language version.

During deserialization, ABAP systems might change the ABAP language version needed in the specific context.
E.g., SAP BTP, ABAP environment systems set the ABAP language version to `cloudDevelopment`, while systems which do not support the ABAP language version might set it to `standard`.
