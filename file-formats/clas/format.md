# File Format for Object Type CLAS

The files correspond to the tabs in ABAP in Eclipse enriched with the metadata and translation relevant texts.
Files with ending `.abap` contain plain ABAP source code.
The JSON schema for the class metadata file is provided [here](./clas.json).

Example files for a class `cl_aff_example_class` are provided in the following table.
File | Content
 --- | ---
[`cl_aff_example_class.clas.json`](./examples/cl_aff_example_class.clas.json)                                 | Metadata of the ABAP class
[`cl_aff_example_class.clas.definitions.abap`](./examples/cl_aff_example_class.clas.definitions.abap)         | Class-relevant Local Types
[`cl_aff_example_class.clas.global.abap`](./examples/cl_aff_example_class.clas.global.abap)                   | Global Class
[`cl_aff_example_class.clas.implementations.abap`](./examples/cl_aff_example_class.clas.implementations.abap) | Local Types
[`cl_aff_example_class.clas.macros.abap`](./examples/cl_aff_example_class.clas.macros.abap)                   | Macros
[`cl_aff_example_class.clas.testclasses.abap`](./examples/cl_aff_example_class.clas.testclasses.abap)         | Test Classes
[`cl_aff_example_class.clas.texts.en.properties`](./examples/cl_aff_example_class.clas.texts.en.properties)   | Translation relevant texts

Some classes store local types in only one include. These classes do not provide includes for class-relevant local types, local types, test classes an macros. In this case the local classes are stored in the file `cl_aff_example_class.clas.locals.abap`.