# Technical Specification

Table of  content
* [File Names](#File-Names)
* [File Extensions](#File-Extensions)
* [File Name Examples](#File-Name-Examples)
* [Formatting Conventions](#Formatting-Conventions)
* [Format Compatibility](#Format-Compatibility)
* [Type Specification](#Type-Specification)
* [Type Specification Example](#Type-Specification-Example)

## File Names

The ABAP file formats specifies file content and file names for ABAP repository objects or simply ABAP objects.
The mapping of ABAP objects to file names follows the pattern
```
<object_name>.<object_type>.
  [<sub_object_name>.<sub_object_type>.]
  [<content_type>.<language>.]
<file_extension>
```
with mandatory object_name, object_type and file_extension.
Namespaces are converted into brackets, for instance `/NMSPC/CL_OBJECT` becomes `(nmspc)cl_object`.

### Object Name and Type
The object name and type represents the ABAP object. It is basically the (R3TR) object name and type stored in the ABAP object directory (aka TADIR).

### Sub Object Name and Sub Object Type

Some object types support sub objects (like function modules in a function group). For sub objects, the main object name and type must be part of the file name.

E.g., for function module FUNCTION_EXISTS in function group SUNI, the file name would be `suni.fugr.function_exists.func.abap`.

Only one JSON file is created for each object, eg. for reports it will contain Dynpro + CUA + texts + metadata.

### Content Type
If a transport object needs multiple files which are not represented by transport objects, the content type is used to differentiate between the different file types.
```
cl_oo_clif_source.clas.abap
cl_oo_clif_source.clas.testclasses.abap
```

### Language
Files with language specific content (such as translatable-texts) have also an identifier for the language in the filename to distinguish between the different translations.
```
cl_oo_clif_source.clas.texts.en.properties
cl_oo_clif_source.clas.texts.de.properties
cl_oo_clif_source.clas.texts.fr.properties
```
For property files no language is added, even if they contain translatable texts.
These files are stored in the master language of the object and the master language is specified in the property file itself.

## File Extensions

ABAP file formats define three file types:
* **`.abap`** stores ABAP source code as plain text
* **`.json`** stores content of form-based editors or properties of ABAP object, such as masterLanguage, abapLanguageVersion and others
* **`.properties`** stores translation relevant text elements as plain text

The `.json` file is referred to as property file and the ABAP file formats provide JSON schemas for its annotation and validation.

## File Name Examples
Here are some examples of file names and its corresponding content.
| File Name | Content |
| ---  | --- |
| `cl_my_class.clas.abap` | Source code of global class `CL_MY_CLASS` |
| `cl_my_class.clas.json` | Metadata for global class `CL_MY_CLASS` |
| `(nmspc)cl_my_class.clas.abap` | Source code of global class with namespace `/NMSPC/CL_MY_CLASS` |
| `cl_my_class.clas.testclasses.abap` | Source code of local test classes in `CL_MY_CLASS` |
| `foo.prog.abap` | Source code of global report `FOO` |
| `foo.prog.json` | Metadata global report `FOO` |
| `if_bar.intf.abap` | Source code of global interface `IF_BAR` |
| `if_bar.intf.json` | Metadata for global interface `IF_BAR` |
| `s_carrid.dtel.json` | Properties of data element `S_CARRID` |
| [`z_aff_example_fugr.fugr.z_aff_example_func.func.abap`](/file-formats/fugr/examples/z_aff_example_fugr.fugr.z_aff_example_func.func.abap) | Source code of function module `Z_AFF_EXAMPLE_FUNC` |
| `seo_class_editor.fugr.json` | Metadata for function group `SEO_CLASS_EDITOR`, containing DynPros + CUA + titles + parameters + more |

## Formatting Conventions
To enable interchangeability the files are characterized by
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

Following changes to file formats are considered as compatible :

- Values for a field (enum) are added (remark: this might lead to syntax errors in ABAP systems which don't support this value)
- Descriptions or titles are changed


### Incompatible File Format Changes

If a file format is changed incompatibly, a new file format with a new version has to be created. The old file format is kept. It can be used for old/existing versions of files.

Following changes to file formats are considered as incompatible:

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

Each JSON schema provided in this repository is automatically generated. For this purpose, an interface corresponds
to each ABAP object type in which the necessary components of the type are described in the type `ty_main`.
One component of the type is the field `schema` which is translated to `$schema` in the JSON schema. Its value in the `.json` files is the link given in the field `$id` of the JSON schema.

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
If no description is given, either the title if it is provided or the component name transformed to camel case is shown in the JSON schema.

### Enum Values
To pass enum values to a JSON schema, a type and a constant are specified. The names of the components of the constant are written as external (JSON) values to the JSON schema after being transformed to camel case. The corresponding values of the components represent the internal (ABAP) values. Descriptions of the enum values are passed to the schema in the same way as above.

The type specifies the underlying data type and links to the constant via the following annotation.
```abap
"! $values {@link source_name.data:category_name}
```

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
is added. Remark that also the `$required` annotation leads to such a behavior.

The order of these comments is important: First, there is the comment for the title followed by that for the description, in case they are both provided. After the two, the remaining annotations are always located. Between them, the order is irrelevant.

## Type Specification Example
Here is the shortened type used to generate the JSON schema for interfaces. It can be found in the interface [`zif_oo_aff_intf_v1`](/file-formats/intf/type/zif_oo_aff_intf_v1.intf.abap).
```abap
  TYPES:
    "! <p class="shorttext">Interface Properties</p>
    "! Interface properties
    BEGIN OF ty_main,
      "! <p class="shorttext">Schema</p>
      "! Format version
      "! $required
      schema     TYPE string,
      "! <p class="shorttext">Interface Category</p>
      "! Interface category
      category   TYPE ty_category,
      "! <p class="shorttext">Proxy Interface</p>
      "! Interface is a proxy interface
      proxy      TYPE abap_bool.
    END OF ty_main.
```
With the also shortened specification of the enum values for the component `category`
```abap
  "! $values {@link zif_oo_aff_intf_v1.data:co_category}
  TYPES ty_category TYPE n LENGTH 2.

  CONSTANTS:
    BEGIN OF co_category,
      "! <p class="shorttext">General</p>
      "! General interface
      general                      TYPE ty_category VALUE '00',
      "! <p class="shorttext">Classic BAdI</p>
      "! Interface definition of a classic BAdI
      classic_badi                 TYPE ty_category VALUE '01',
    END OF co_category.
```
this leads to the following generated JSON schema.
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
    "category": {
      "title": "Interface Category",
      "description": "Interface category",
      "type": "string",
      "enum": [
        "general",
        "classicBadi"
      ],
      "enumDescriptions": [
        "General interface",
        "Interface definition of a classic BAdI"
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
    "$schema"
  ]
}
```
---
**Note**: Currently, ABAP file formats are not kept stable, yet. They might still change incompatible without creating a new file format version.

---
