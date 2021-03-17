# ABAP File Formats

This project provides file format definitions of ABAP development objects.



## Background and Scope

ABAP development objects are stored on development systems and not as regular text files as many other programing languages including python, C++ and others.
The aim of the ABAP File Formats is to provide a common and transparent definition of how to store ABAP development objects in files.
The file representation of ABAP development objects facilitates the ongoing effort of applying and adopting existing developer tools and paradigm to ABAP.

The design of the ABAP File Formats covers the following principles:

* The file content is **complete** and can be used for the sharing and distribution of ABAP development objects.

* The file content is **human-readable** and the structure is as close as possible to what users know from their IDE.

* The files don't contain metadata like dates, last editor, system specific information.


## Technical Specification

The ABAP File Formats specification consists of a file content and a file name.

### File Content

ABAP File Formats define three file types by the file extension `.abap`, `.json` and `.properties`.
The ABAP source code is stored as plain text files with extension `.abap`.
Content of form-based editors or ABAP repository object properties, such as masterLanguage, abapLanguageVersion and others are stored as `.json` files, also referred to as property file.
The json schema is provided by the ABAP File Formats.
Translation relevant text elements are stored as plain text in `.properties` files.

### File Names

The mapping of ABAP objects to file names follows the pattern

```
<object_name>.<object_type>.
  [<sub_object_name>.<sub_object_type>.]
  [<content_type>.<language>.]
<file_extension>
```
The object_name, object_type and file_extension are mandatory.

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

#### File Extension
The file extension specifies the general format of the file content.
| File | Format |
| ---  | --- |
| json | Metadata-based specifications of ABAP object |
| abap | Plain ABAP source code (could be also DDLS) |
| properties | Translation relevant texts |


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

| Type | Description | JSON Schema |
| ---  | --- | --- |
| CLAS | [Class](./file-formats/clas/format.md) | [Schema](./file-formats/clas/clas.json) |



## Contributions and License

Comments and suggestions for improvements are most welcome.
We plan to modify and extend this document as our understanding improves.
More details are found at [Contributing](./CONTRIBUTING.md) and [License](./LICENSE).
