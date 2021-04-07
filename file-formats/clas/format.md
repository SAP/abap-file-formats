# File Format for Object Type CLAS

The files correspond to the tabs in ABAP in Eclipse enriched with the metadata and translation relevant texts.
Files with ending `.abap` contain plain ABAP source code.
The JSON schema for the class metadata file is provided [here](./clas.json).

Example files for a class `zcl_aff_example` are provided in the following table.
File | Content
 --- | ---
[`zcl_aff_example.clas.json`](./examples/zcl_aff_example.clas.json)                                 | Properties and descriptions of the ABAP class
[`zcl_aff_example.clas.definitions.abap`](./examples/zcl_aff_example.clas.definitions.abap)         | Class-relevant Local Types
[`zcl_aff_example.clas.global.abap`](./examples/zcl_aff_example.clas.global.abap)                   | Global Class
[`zcl_aff_example.clas.implementations.abap`](./examples/zcl_aff_example.clas.implementations.abap) | Local Types
[`zcl_aff_example.clas.macros.abap`](./examples/zcl_aff_example.clas.macros.abap)                   | Macros
[`zcl_aff_example.clas.testclasses.abap`](./examples/zcl_aff_example.clas.testclasses.abap)         | Test Classes
[`zcl_aff_example.clas.texts.en.properties`](./examples/zcl_aff_example.clas.texts.en.properties)   | Translation relevant texts

Some classes store local types in only one include.
These classes do not provide includes for class-relevant local types, local types and macros.
In this case, local classes are stored in the file `zcl_aff_example.clas.locals.abap`.