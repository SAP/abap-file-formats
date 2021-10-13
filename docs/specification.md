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

## File Names

The ABAP file formats specify file content and unique file names for ABAP repository objects or simply objects.
The mapping of objects to file names follows the pattern
```
<object_name>.<object_type>.
  [<sub_object_name>.<sub_object_type>.]
  [<content_type>.][<language>.]
<file_extension>
```
with the mandatory elements object_name, object_type and file_extension.
Namespaces are converted into brackets, for instance `/NMSPC/CL_OBJECT` becomes `(nmspc)cl_object`.

### Object Name and Type
The object name (R3TR) and object type are derived from the object itself, as stored in the ABAP object directory (aka TADIR).

### Sub Object Name and Sub Object Type

Some object types support sub objects (LIMU object types) like function modules in a function group. For sub objects, the main object name and type must be part of the file name.

E.g., for function module FUNCTION_EXISTS in function group SUNI, the file name would be `suni.fugr.function_exists.func.abap`.

### Content Type
If an object needs multiple files which are not represented by transport objects, the content type is used to differentiate between the different file types.
```
cl_oo_clif_source.clas.abap
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
* **`.json`** stores content of form-based editors or properties of objects, such as `originalLanguage`, `abapLanguageVersion` and others
* **`.properties`** stores translation relevant text elements as plain text

The `.json` file is referred to as the property file. The ABAP file formats provide JSON schemas for its annotation and validation, see [JSON Type Specification](./json.md) for additional details.

## File Name Examples
Here are some examples of file names and their corresponding content:
| File Name | Content |
| ---  | --- |
| `cl_my_class.clas.abap` | Source code of class `CL_MY_CLASS` |
| `(nmspc)cl_my_class.clas.abap` | Source code of class with namespace `/NMSPC/CL_MY_CLASS` |
| `cl_my_class.clas.testclasses.abap` | Source code of local test classes in `CL_MY_CLASS` |
| `s_carrid.dtel.json` | Properties of data element `S_CARRID` |
| [`z_aff_example_fugr.fugr.z_aff_example_func.func.abap`](../file-formats/fugr/examples/z_aff_example_fugr.fugr.z_aff_example_func.func.abap) | Source code of function module `Z_AFF_EXAMPLE_FUNC` |
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
