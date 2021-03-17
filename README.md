# ABAP File Formats

This project provides file format definitions of ABAP repository objects.



## Background and Scope

ABAP repository objects are stored on development systems and not as regular text files as many other programing languages including python, C++ and others.
The aim of the ABAP File Formats is to provide a common and transparent definition of how to store ABAP repository objects in files.
The file representation of ABAP repository objects facilitates the ongoing effort of applying and adopting existing developer tools and paradigm to ABAP.

The design of the ABAP File Formats covers the following principles:
* The file content is **complete** and can be used for the sharing and distribution of ABAP repository objects.
* The file content is **human-readable** and the structure is as close as possible to what users know from their IDE.
* The files don't contain metadata like dates, last editor, system specific information.


## Technical Specification

The ABAP File Formats specifies file content and file names for ABAP repository objects or simply ABAP objects.
Let's consider for example an ABAP interface, for which there are two files specified.
One file contains the meta data (master_lang, abap_language_version, ...) and an other file stores the plain source code.

### File Content

ABAP File Formats define three file types:
* **`.abap`** stores ABAP source code as plain text
* **`.json`** stores content of form-based editors or properties of ABAP object, such as masterLanguage, abapLanguageVersion and others
* **`.properties`** stores translation relevant text elements as plain text

The `.json` file is referred to as property file and the ABAP File Formats provides json schemata for annotation and validation.

### File Names

The mapping of ABAP objects to file names follows the pattern

```
<object_name>.<object_type>.
  [<sub_object_name>.<sub_object_type>.]
  [<content_type>.<language>.]
<file_extension>
```
with mandatory object_name, object_type and file_extension.

#### Object Name
The object name corresponds to the name of the ABAP object.

#### Object Type
The object type is either the R3TR object type (like DTEL, DOMA, DDLS) or the LIMU object type, if the LIMU object name can be specified uniquely in the system, without its R3TR object name.

#### Sub Object Name and Sub Object Type
If the sub object can be addressed uniquely in the system, it is enough to use the combination object name and object type.
E.g., for function modules the file name would be `function_exists.func.abap`.

For sub objects which cannot be addressed uniquely in the system, the main object name and type must be part of the namespace.
E.g., the file name of a dynpro in a function group could be `seo_class_editor.fugr.0152.dynp.json`.

#### Content Type
If a transport object needs multiple files which are not represented by transport objects, the content type is used to differentiate between the different file types.
```
cl_oo_clif_source.clas.global.abap
cl_oo_clif_source.clas.testclasses.abap
```

#### Language
Files with language specific content (such as translatable-texts) have also an identifier for the language in the filename to distinguish between the different translations.
```
cl_oo_clif_source.clas.texts.en.properties
cl_oo_clif_source.clas.texts.de.properties
cl_oo_clif_source.clas.texts.fr.properties
```
For property files no language is added, even if they contain translatable texts.
These files are stored in the master language of the object and the master language is specified in the property file itself.

#### File Name Examples
Here are some examples of file names and its corresponding content.
| File Name | Content |
| ---  | --- |
| `cl_my_class.clas.global.abap` | Source code of global class `CL_MY_CLASS` |
| `cl_my_class.clas.testclasses.abap` | Source code of local test classes in `CL_MY_CLASS` |
| `sflight.tabl.abap` | Source code of database table `SFLIGHT` |
| `s_carrid.dtel.json` | Properties of data element `S_CARRID` |
| `function_exists.func.abap` | Source code of function module `FUNCTION_EXISTS` |
| `seo_class_editor.fugr.0152.dynp.json` | Dynpro 0152 of function group `SEO_CLASS_EDITOR` |


## List of Supported ABAP Objects

| Type | Description |
| ---  | --- |
| CLAS | [Class](./file-formats/clas/format.md) |
| INTF | |
| CHKO | |



## Contributions and License

Comments and suggestions for improvements are most welcome.
We plan to modify and extend this document as our understanding improves.
More details are found at [Contributing](./CONTRIBUTING.md) and [License](./LICENSE).
