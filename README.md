# ABAP File Formats

[![REUSE status](https://api.reuse.software/badge/github.com/SAP/abap-file-formats)](https://api.reuse.software/info/github.com/SAP/abap-file-formats)

## Description

This project provides file format definitions of ABAP repository objects.

The project is still in an early phase. We plan to modify and extend this document as our understanding improves. Since the ABAP file formats can still change in the future, we do not recommend to use them in a productive environment, yet.

### Background and Scope

ABAP repository objects are stored on development systems and not as regular text files as many other programing languages including python, C++ and others.
The aim of the ABAP file formats is to provide a common and transparent definition of how to store ABAP repository objects in files.
The file representation of ABAP repository objects facilitates the ongoing effort of applying and adopting existing developer tools and paradigm to ABAP.

The design of the ABAP file formats covers the following principles:
* The file content is **complete** and can be used for the sharing and distribution of ABAP repository objects.
* The file content is **human-readable** and the structure is as close as possible to what users know from their IDE.
* The files don't contain metadata like dates, usernames, last editor, system specific information, plus no obsolete or redundant information.


Details on technical specification can be found [here](./doc/file_names.md).


### List of Supported ABAP Objects

| Type | Specification |
| ---  | --- |
| CHKC | [ATC Check Category](./file-formats/chkc/format.md)|
| CHKO | [ATC Check](./file-formats/chko/format.md)|
| CHKV | [ATC Check Variant](./file-formats/chkv/format.md)|
| CLAS | [Class](./file-formats/clas/format.md) |
| ENHO | [BAdI Enhancement Implementation)](./file-formats/enho/format.md) |
| ENHS | [BAdI Enhancement Spot](./file-formats/enhs/format.md) |
| FUGR | [Function Group](./file-formats/fugr/format.md) |
| INTF | [Interface](./file-formats/intf/format.md) |
| NROB | [Number Range Object](./file-formats/nrob/format.md) |

## How to Obtain Support

Feel free to raise issues to ask questions or report bugs.

## Contributing

Comments and suggestions for improvements are most welcome.

You feel responsible for an ABAP object type? We will be more than happy if you contribute your object type to this project. Just open a new pull request. 

More details are found at [Contributing](./CONTRIBUTING.md).

## Licensing

Please see our [LICENSE](LICENSE) for copyright and license information. Detailed information including third-party components and their licensing/copyright information is available via the [REUSE tool](https://api.reuse.software/info/github.com/SAP/abap-file-formats).
