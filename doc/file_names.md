# File Names

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

## Object Name
The object name corresponds to the name of the ABAP object.

## Object Type
The object type is either the R3TR object type (like DTEL, DOMA, DDLS) or the LIMU object type, if the LIMU object name can be specified uniquely in the system, without its R3TR object name.

## Sub Object Name and Sub Object Type
If the sub object can be addressed uniquely in the system, it is enough to use the combination object name and object type.
E.g., for function modules the file name would be `function_exists.func.abap`.

For sub objects which cannot be addressed uniquely in the system, the main object name and type must be part of the namespace.
E.g., the file name of a dynpro in a function group could be `seo_class_editor.fugr.0152.dynp.json`.

## Content Type
If a transport object needs multiple files which are not represented by transport objects, the content type is used to differentiate between the different file types.
```
cl_oo_clif_source.clas.global.abap
cl_oo_clif_source.clas.testclasses.abap
```

## Language
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

The `.json` file is referred to as property file and the ABAP file formats provides JSON schemata for annotation and validation.

## File Name Examples
Here are some examples of file names and its corresponding content.
| File Name | Content |
| ---  | --- |
| `cl_my_class.clas.global.abap` | Source code of global class `CL_MY_CLASS` |
| `(nmspc)cl_my_class.clas.global.abap` | Source code of global class with namespace `/NMSPC/CL_MY_CLASS` |
| `cl_my_class.clas.testclasses.abap` | Source code of local test classes in `CL_MY_CLASS` |
| `sflight.tabl.abap` | Source code of database table `SFLIGHT` |
| `s_carrid.dtel.json` | Properties of data element `S_CARRID` |
| `function_exists.func.abap` | Source code of function module `FUNCTION_EXISTS` |
| `seo_class_editor.fugr.0152.dynp.json` | Dynpro 0152 of function group `SEO_CLASS_EDITOR` |
