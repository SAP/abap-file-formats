# ABAP File Formats
<!-- markdown-link-check-disable-next-line -->
[![REUSE status](https://api.reuse.software/badge/github.com/SAP/abap-file-formats)](https://api.reuse.software/info/github.com/SAP/abap-file-formats)

## Description

This project provides file format definitions of [ABAP repository objects][1].

The project is still in an early phase. We plan to modify and extend this document as our understanding improves. Since the ABAP file formats can still change in the future, we do not recommend using them in a productive environment, yet.

### Background and Scope

ABAP repository objects are stored on development systems and not as regular text files like in many other programming languages including python, C++ and others.
The aim of the ABAP file formats is to provide a common and transparent definition of how to store ABAP repository objects in files.
The file representation of ABAP repository objects facilitates the ongoing effort of applying and adapting existing developer tools and paradigms to ABAP.

This endeavour is on the one hand a commitment of SAP to use these file formats in the future whenever ABAP objects need to be written to files,
e.g., in [ADT](https://tools.hana.ondemand.com/#abap) and [gCTS](https://blogs.sap.com/2019/11/14/gcts-is-here/),
and on the other hand an offer to the ABAP community to adopt them also in [abapGit](https://abapgit.org/) and other tools.

The design of the ABAP file formats covers the following principles:
* The file content is **complete** and can be used for the sharing and distribution of ABAP repository objects.
* The file content is **human-readable** and the structure is as close as possible to what users know from their IDE.
* The files don't contain metadata like dates, usernames, last editor, system specific information, plus no obsolete or redundant information as well as no autogenerated content.

Details on technical specifications can be found [here](./docs/specification.md).

### Structure of the Repository
For each supported ABAP object type, there is a corresponding folder in [`file-formats`](./file-formats). The documentation as well as the JSON schema for every type are located in the root of the folder. The file representation of the underlying interface can be found in the subfolder `type`, the file representation of an exemplary object is contained in the subfolder `examples`.


## How to Obtain Support

Feel free to raise issues and ask questions or report bugs.

## Contributing

Comments and suggestions for improvements are most welcome.

Do you feel responsible for an ABAP object type?
We will be more than happy if you contribute your object type to this project.
Just open a new pull request and create an ABAP type like it is specified [here](./docs/json.md#writing-JSON-schema-with-ABAP-types).
Feel free to hand over the type to us, so we can generate the JSON Schema for you.

More details are found in [Contributing](./CONTRIBUTING.md).

## Tooling

We provide a separate repository with an ABAP report that generates JSON Schema based on ABAP types, see https://github.com/SAP/abap-file-formats-tools.

For validation and annotation of JSON data, there is a visual studio code extension available [here](https://marketplace.visualstudio.com/items?itemName=larshp.vscode-abap-file-formats).

## Licensing

<!-- markdown-link-check-disable-next-line -->
Please see our [LICENSE](LICENSE) for copyright and license information. Detailed information including third-party components and their licensing/copyright information is available via the [REUSE tool](https://api.reuse.software/info/github.com/SAP/abap-file-formats).

[1]: ./docs/glossary.md#abap-repository-object
