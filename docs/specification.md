# Technical Specification

---
**Note**: Currently, ABAP file formats are not kept stable, yet. They might still change incompatibly without creating a new file format version.

---

## Table of Contents
* [File Names](#File-Names)
* [File Extensions](#File-Extensions)
* [Formatting Conventions](#Formatting-Conventions)

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
* **`.json`** stores content of form-based editors or properties of objects, such as `originalLanguage`, `abapLanguageVersion` and others.
Details are found in [JSON Files in ABAP File Formats](./json.md)
* **`.properties`** stores translation relevant text elements as plain text


## Formatting Conventions
To enable interchangeability, the files are characterized by
* UTF-8 codepage
* No [byte order mark](https://en.wikipedia.org/wiki/Byte_order_mark)
* End-of-line (EOL) character `\n`
* Empty line at end-of-file (EOF)

The JSON files additionally follow
* 2 spaces indentation

We provide an [EditorConfig](https://editorconfig.org) based formatting configuration file [here](../.editorconfig) where the above convention is reflected.
A GitHub action run validations based of this configuration file, to ensure the repository follows the formatting convention.
Developers might choose one of the many compatible text editors for the sake of convenience.
