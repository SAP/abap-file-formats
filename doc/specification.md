# Technical Specification

---
**Note**: Currently, ABAP file formats are not kept stable, yet. They might still change incompatibly without creating a new file format version.

---

## Table of Contents
* [File Names](#File-Names)
* [File Extensions](#File-Extensions)
* [File Name Examples](#File-Name-Examples)
* [Formatting Conventions](#Formatting-Conventions)
* [Format Compatibility](#Format-Compatibility)
* [Type Specification](#Type-Specification)
* [Type Specification Example](#Type-Specification-Example)
* [Reusable Fields in JSON files](#Reusable-Fields-in-JSON-files)

## File Names

The ABAP file formats specify file content and file names for ABAP repository objects or simply ABAP objects.
The mapping of ABAP objects to file names follows the pattern
```
<object_name>.<object_type>.
  [<sub_object_name>.<sub_object_type>.]
  [<content_type>.<language>.]
<file_extension>
```
with the mandatory elements object_name, object_type and file_extension.
Namespaces are converted into brackets, for instance `/NMSPC/CL_OBJECT` becomes `(nmspc)cl_object`.

### Object Name and Type
The object name and type represent the ABAP object. Basically, the object name (R3TR) and type are stored in the ABAP object directory (aka TADIR).

### Sub Object Name and Sub Object Type

Some object types support sub objects (LIMU object types) like function modules in a function group. For sub objects, the main object name and type must be part of the file name.

E.g., for function module FUNCTION_EXISTS in function group SUNI, the file name would be `suni.fugr.function_exists.func.abap`.

### Content Type
If a transport object needs multiple files which are not represented by transport objects, the content type is used to differentiate between the different file types.
```
cl_oo_clif_source.clas.global.abap
cl_oo_clif_source.clas.testclasses.abap
```

### Language
Files with language specific content (such as translatable-texts) also have an identifier for the language in the filename to distinguish between the different translations.
```
cl_oo_clif_source.clas.texts.en.properties
cl_oo_clif_source.clas.texts.de.properties
cl_oo_clif_source.clas.texts.fr.properties
```
For property files, no language is added, even if they contain translatable texts.
These files are stored in the original language of the object and the original language is specified in the property file itself.

## File Extensions

ABAP file formats define three file types:
* **`.abap`** stores ABAP source code as plain text
* **`.json`** stores content of form-based editors or properties of ABAP objects, such as originalLanguage, abapLanguageVersion and others
* **`.properties`** stores translation relevant text elements as plain text

The `.json` file is referred to as the property file. The ABAP file formats provide JSON schemas for its annotation and validation.

## File Name Examples
Here are some examples of file names and their corresponding content:
| File Name | Content |
| ---  | --- |
| `cl_my_class.clas.global.abap` | Source code of global class `CL_MY_CLASS` |
| `(nmspc)cl_my_class.clas.global.abap` | Source code of global class with namespace `/NMSPC/CL_MY_CLASS` |
| `cl_my_class.clas.testclasses.abap` | Source code of local test classes in `CL_MY_CLASS` |
| `s_carrid.dtel.json` | Properties of data element `S_CARRID` |
| [`z_aff_example_fugr.fugr.z_aff_example_func.func.abap`](/file-formats/fugr/examples/z_aff_example_fugr.fugr.z_aff_example_func.func.abap) | Source code of function module `Z_AFF_EXAMPLE_FUNC` |
| `seo_class_editor.fugr.0152.dynp.json` | Dynpro 0152 of function group `SEO_CLASS_EDITOR` |

## Formatting Conventions
To enable interchangeability, the files are characterized by
* UTF-8 codepage
* No [byte order mark](https://en.wikipedia.org/wiki/Byte_order_mark)
* End-of-line (EOL) character `\n`
* Empty line at end-of-file (EOF)

The JSON files additionally follow
* 2 spaces indentation

## Format Compatibility

The format of object types will evolve over time. If a change to the format is considered incompatible, the version of the file format has to be increased.

As of today, the format version is indicated by the `$schema` attribute. This approach is in discussion and might be changed.

### Compatible File Format Changes

For compatible changes to the file format, the format is just updated. The indicator whether the format has to be changed should not be updated.

Following changes to file formats are considered as compatible:

- Values for a field (enum) are added (remark: this might lead to syntax errors in ABAP systems which don't support this value)
- Descriptions or titles are changed


### Incompatible File Format Changes

If a file format is changed incompatibly, a new file format with a new version has to be created. The old file format is kept. It can be used for old/existing versions of files.

The following changes to file formats are considered as incompatible:

- Content type of the file is changed (e.g., from xml to json)
- Mandatory fields are added
- Content structure within the file is changed (e.g., field is moved to a sub structure)
- Mandatory fields are removed  (old implementations might rely on the field to be mandatory)
- Non-mandatory fields are added
- Non-mandatory fields are removed
- Fields are renamed
- Type of a field is changed (e.g., from `string` to `number`)
- Semantic of a field is changed
- Values of a field (e.g., in enum) are removed
- Length of a field is shortened
- Length of a field is extended if some systems cannot store this information

## Type Specification

Each JSON schema provided in this repository is automatically generated. For this purpose, an interface corresponds to each ABAP object type in which the necessary components of the type are described in the type `ty_main`. The name of the interface follows the pattern `zif_aff_<object_type>_v<version_number>`. `<object_type>` can be either the (R3TR) object type or the (LIMU) sub object type, since R3TR and LIMU object types share the same namespace. `<version_number>` is an increasing integer which starts with `1`.

One mandatory component of the type is the field `schema` which is translated to `$schema` in the JSON schema. Its value in the `.json` files is the link given in the field `$id` of the JSON schema. Furthermore, a `header` has to be supplied. The interface [`zif_aff_types_v1`](/file-formats/typesUsedForAll/zif_aff_types_v1.intf.abap) offers different headers for reuse, but also other often repeated types.

The ABAP types are self-contained, so it is possible to work on them in any system (e.g., in an SAP BTP, ABAP environment system).

In order to add more information to the JSON schema than that provided by the ABAP type, ABAP Doc can be used. The comments are placed directly above the components of the type `ty_main`, but they are also read over several levels as, e.g., in the case of nested structures. The different possibilities are summarized in the following.

### Title
To provide a title, an ABAP Doc shorttext
```abap
"! <p class="shorttext">Insert Title</p>
```
is used. If no title is specified, the component name transformed to camel case is written.

### Description
An ABAP Doc comment without annotations is passed as description to the JSON schema.
```abap
"! This is the description
```
If no description is given, either the title, if provided, or the component name transformed to camel case is shown in the JSON schema.

### Enum Values
To pass enum values to a JSON schema, a type and a constant are specified. The names of the components of the constant are written as external (JSON) values to the JSON schema after being transformed to camel case. The corresponding values of the components represent the internal (ABAP) values. Descriptions of the enum values are passed to the schema in the same way as described above.

The type specifies the underlying data type and links to the constant via the following annotation:
```abap
"! $values {@link source_name.data:constant_name}
```
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
If a field is to be declared as "required" in the JSON schema, the annotation
```abap
"! $required
```
is used.

### Always Shown Fields
Normally, if an ABAP object is serialized, only the components of the corresponding type with a non-initial value are written to the `.json` file. If a component shall be shown regardless to its value, the annotation
```abap
"! $showAlways
```
is added. Note that also the `$required` annotation leads to such a behavior.

### Default Values
To ensure that only components whose value is not equal to a specific default value are written to the schema, the annotation
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
Note that if you specify a default value, the initial values are written to the JSON schema, unless they are not equal to the selected default.

The order of these comments is important: First, there is the comment for the title followed by the one for the description, in case they are both provided. After these two, the remaining annotations are always located. Between them, the order is irrelevant.


## Type Specification Example
Here is the shortened type used to generate the JSON schema for interfaces. It can be found in the interface [`zif_aff_intf_v1`](/file-formats/intf/type/zif_aff_intf_v1.intf.abap).
```abap
  TYPES:
    "! <p class="shorttext">Interface Properties</p>
    "! Interface properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema     TYPE string,
      "! <p class="shorttext">Header</p>
      "! Header
      "! $required
      header     TYPE zif_aff_types_v1=>ty_header_60_src,
      "! <p class="shorttext">Proxy Interface</p>
      "! Interface is a proxy interface
      proxy      TYPE abap_bool.
    END OF ty_main.
```
With the specification of the component `header` and its used types in the interface [`zif_aff_types_v1`](/file-formats/typesUsedForAll/zif_aff_types_v1.intf.abap)
```abap
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
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://github.com/SAP/abap-file-formats/blob/main/file-formats/intf/intf.json",
  "title": "Interface Properties",
  "description": "Interface properties",
  "type": "object",
  "properties": {
    "$schema": {
      "title": "Schema",
      "description": "Format version",
      "type": "string"
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
          "maxLength": 2
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
          "enumDescriptions": [
            "Standard",
            "ABAP for key user extensibility",
            "ABAP cloud development"
          ],
          "default": "standard"
        }
      },
      "additionalProperties": false,
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
  "additionalProperties": false,
  "required": [
    "$schema",
    "header"
  ]
}
```
## Reusable Fields in JSON files

In this section fields are described which can be reused by all file formats. 

The types for these reusable are defined in interface [`ZIF_AFF_TYPES_V1`](file-formats/typesUsedForAll/zif_aff_types_v1.intf.abap).

### Schema

The field `$schema` is a meta field and defines the format and the format version of the json content. 
Basically, it is  needed to allow the incompatible evolution of an content type.

`$schema` specifies the location of the json schema with an URI.
As of now, this is a link within this repository.

---
**Note**: Versioning is not finally decided. Please refer to issue [#53](https://github.com/SAP/abap-file-formats/issues/53).

---

### Description

The field `description` contains the description of the object.

### Original Language

The field `originalLanguage` stores the information about the original language of the the object. 

The original language is specified with [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language codes.

---
**Note**: It has to be decided whether the language code is specified upper case (like in ABAP) or lower case as in the ISO 639-1 specification. 
Refer to issue [#34](https://github.com/SAP/abap-file-formats/issues/53).

---

All translatable texts in the object shall be maintained in its original language.
Translations of the texts shall be stored in separate files.

The original language is not specified for sub objects. Sub objects have the same original version as their main objects.

### ABAP Language Version

The field `abapLanguageVersion` specifies the ABAP language version of an object.


With the ABAP language version, it is possible to specify which ABAP language   elements and which other objects you can use in your object.
It does not specify the compatibility with a specific release (like SAP_BASIS 7.55). 
The ABAP language version `standard` specifies no limitation with regards to the usage of ABAP language elements or other objects.
The ABAP language versions `cloudDevelopment` and `keyUser` are a subset of ABAP language version standard and you can use only a subset of ABAP language  elements and released objects.
For more details you can refer to the [ABAP keyword documentation](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm).

The field `abpaLanguageVersion` is optional. Allowed values are `standard`, `cloudDevelopment` or `keyUser`. The default value is `standard`.

Implementations of ABAP file format can decide whether they serialize the ABAP language version.

During deserialization, ABAP systems might change the ABAP language version needed in the specific context. 
E.g., SAP BTP, ABAP environment systems set the ABAP language version to `cloudDevelopment` or systems which do not support the ABAP language version might set it to `standard`.
