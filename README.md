# ABAP File Formats

This project provides file format definitions of ABAP repository objects. 

The project is still in an early phase. We plan to modify and extend this document as our understanding improves. Therefore, the ABAP file formats can still change in the future.

## Background and Scope

ABAP repository objects are stored on development systems and not as regular text files as many other programing languages including python, C++ and others.
The aim of the ABAP file formats is to provide a common and transparent definition of how to store ABAP repository objects in files.
The file representation of ABAP repository objects facilitates the ongoing effort of applying and adopting existing developer tools and paradigm to ABAP.

The design of the ABAP file formats covers the following principles:
* The file content is **complete** and can be used for the sharing and distribution of ABAP repository objects.
* The file content is **human-readable** and the structure is as close as possible to what users know from their IDE.
* The files don't contain metadata like dates, usernames, last editor, system specific information, plus no obsolete or redundant information.


## Technical Specification

The ABAP file formats specifies file content and file names for ABAP repository objects or simply ABAP objects.

### File Content

For each object type, a list of possible files and their file content is described in the object-specific file `format.md` in the folder [`file-formats`](./file-formats). For example, the file [`file-formats/clas/format.md`](./file-formats/clas/format.md) describes the format of ABAP classes).

For other object types refer to the [list of supported object types](#List-of-Supported-ABAP-Objects).

### File Names
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
| CHKO | [ATC Check](./file-formats/chko/format.md)|
| CLAS | [Class](./file-formats/clas/format.md) |
| FUGR | [Function Group](./file-formats/fugr/format.md) |
| INTF | [Interface](./file-formats/intf/format.md) |
| NROB | [Number Range Object](./file-formats/nrob/format.md) |



## Contributions and License

Comments and suggestions for improvements are most welcome.
More details are found at [Contributing](./CONTRIBUTING.md) and [License](./LICENSE).
