# Technical Specification

Table of  content
* [File Names](#File-Names)
* [File Extensions](#File-Extensions)
* [File Name Examples](#File-Name-Examples)
* [Formatting Conventions](#Formatting-Conventions)
* [Format Compatibility](#Format-Compatibility)

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

### Content Type
If a transport object needs multiple files which are not represented by transport objects, the content type is used to differentiate between the different file types.
```
cl_oo_clif_source.clas.global.abap
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
| `cl_my_class.clas.global.abap` | Source code of global class `CL_MY_CLASS` |
| `(nmspc)cl_my_class.clas.global.abap` | Source code of global class with namespace `/NMSPC/CL_MY_CLASS` |
| `cl_my_class.clas.testclasses.abap` | Source code of local test classes in `CL_MY_CLASS` |
| `sflight.tabl.abap` | Source code of database table `SFLIGHT` |
| `s_carrid.dtel.json` | Properties of data element `S_CARRID` |
| [`z_aff_example_fugr.fugr.z_aff_example_func.func.abap`](/file-formats/fugr/examples/z_aff_example_fugr.fugr.z_aff_example_func.func.abap) | Source code of function module `Z_AFF_EXAMPLE_FUNC` |
| `seo_class_editor.fugr.0152.dynp.json` | Dynpro 0152 of function group `SEO_CLASS_EDITOR` |

## Formatting Conventions
To enable interchangeability the files are characterized by
* UTF-8 codepage
* No [byte order mark](https://en.wikipedia.org/wiki/Byte_order_mark)
* End-of-line (EOL) character `\n`
* Empyt line at end-of-file (EOF)

The JSON files additionally follow
* 2 spaces indentation

## Format Compatibility

The format of object types will evolve over time. If a change to the format is considered incompatible, the version of the file format has to be increased.

As of today, the format version is indicated by the `$schema` attribute. This is approach is in discussion and might be changed.

### Compatible File Format Changes 

For compatible changes to the file format, the format is just updated. The indicator whether the format has to be changed should not be updated.

Following changes to file formats are considered as compatible : 

- Descriptions or titles are changed
- Values for a field (enum) are added (remark: this might lead to syntax errors in ABAP system that don't support this value)


### Incompatible File Format Changes

If a file format is changed incompatibly, a new file format with a new version has to be created. The old file format is kept. It can be used for old/exisiting versions of files.

Following changes to file formats are considered as incompatible:

- Content type of the file is changed (e.g., from xml to json)
- Content structure within the file is changed (e.g., field is moved to a sub structure)
- Mandatory fields are added
- Mandatory fields are removed  (old implementations might rely on the field to be mandatory)
- Non-mandatory fields are added 
- Non-mandatory fields iare removed 
- Fields are renamed 
- Type of a field is changed (e.g. from `string` to `number`)
- Semantic of a field is changed
- Values of a field (e.g., in enum) are removed
- Length of a field is shortened
- Length of a field is extended, if some systems cannot store this information

---
**Note**: Currently, ABAP file formats are not kept stable, yet. They might still change incompatible without creating a new file format version.

---
