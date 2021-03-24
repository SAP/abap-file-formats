# ABAP File Formats

This project provides file format definitions of ABAP repository objects.
We plan to modify and extend this document as our understanding improves.



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
The mapping of ABAP objects to files follows the pattern
```
<object_name>.<object_type>.
  [<sub_object_name>.<sub_object_type>.]
  [<content_type>.<language>.]
<file_extension>
```
with mandatory object_name, object_type and file_extension.

* **Object Name** corresponds to the name of the ABAP object.
* **Object Type** is either the R3TR or the LIMU object type.
* **File Extension** is either `.abap`, `.json` or `.properties`.

Details and full specification can be found [here](./doc/file_names.md).

## List of Supported ABAP Objects

| Type | Specification |
| ---  | --- |
| CLAS | [Class](./file-formats/clas/format.md) |
| INTF | [Interface](./file-formats/intf/format.md) |
| CHKO | |
| NROB | [Number Range Object](./file-formats/nrob/format.md) |



## Contributions and License

Comments and suggestions for improvements are most welcome.
More details are found at [Contributing](./CONTRIBUTING.md) and [License](./LICENSE).
