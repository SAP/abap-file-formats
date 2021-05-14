# File Format for Object Type FUGR

Files with ending `.abap` contain plain ABAP source code.
A function group can contain two sub object types (reps and func) which need a properties file themselves.
The JSON schema for the function group property file is provided [here](./fugr.json).
The JSON schema for the function group include (reps) property file is provided [here](./reps.json).
The JSON schema for the function module (func) property file is provided [here](./func.json).

Example files for a function group `z_aff_example_fugr` are provided in the following table.
File | Content
 --- | ---
[`z_aff_example_fugr.fugr.json`](./examples/z_aff_example_fugr.fugr.json)                 | Properties and descriptions of the FUGR
[`z_aff_example_fugr.fugr.saplz_aff_example_fugr.reps.abap`](./examples/z_aff_example_fugr.fugr.saplz_aff_example_fugr.reps.abap)         | Source Code of the SAPL Include
[`z_aff_example_fugr.fugr.saplz_aff_example_fugr.reps.json`](./examples/z_aff_example_fugr.fugr.saplz_aff_example_fugr.reps.json)         | Properties and descriptions of the SAPL Include
[`z_aff_example_fugr.fugr.lz_aff_example_fugrtop.reps.abap`](./examples/z_aff_example_fugr.fugr.lz_aff_example_fugrtop.reps.abap) 	  | Source Code of the TOP Include
[`z_aff_example_fugr.fugr.lz_aff_example_fugrtop.reps.json`](./examples/z_aff_example_fugr.fugr.lz_aff_example_fugrtop.reps.json)         | Properties and descriptions of the TOP Include
[`z_aff_example_fugr.fugr.z_aff_example_func.func.abap`](./examples/z_aff_example_fugr.fugr.z_aff_example_func.func.abap)                 | Source Code of the included FUNC
[`z_aff_example_fugr.fugr.z_aff_example_func.func.json`](./examples/z_aff_example_fugr.fugr.z_aff_example_func.func.json)                 | Properties and descriptionss of the included FUNC
[`z_aff_example_fugr.fugr.texts.en.properties`](./examples/z_aff_example_fugr.fugr.texts.en.properties)   | Translation relevant texts

The following sub objects of FUGR are not yet supported:
* Dynpros
* PBO Modules
* PAI Modules

For FUGR-deserialization there is no need to supply a file for the "UXX"-include.
