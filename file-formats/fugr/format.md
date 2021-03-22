# File Format for Object Type FUGR

Files with ending `.abap` contain plain ABAP source code.
A function group can contain two sub object types (reps and func) which need a metadata file themselves.
The JSON schema for the function group metadata file is provided [here](./fugr.json).
The JSON schema for the function group include (reps) metadata file is provided [here](./reps.json).
The JSON schema for the function module (func) metadata file is provided [here](./func.json).

Example files for a function group `z_aff_example_fugr` are provided in the following table.
File | Content
 --- | ---
[`z_aff_example_fugr.fugr.json`](./examples/z_aff_example_fugr.fugr.json)                 | Metadata of the FUGR
[`saplz_aff_example_fugr.reps.abap`](./examples/saplz_aff_example_fugr.reps.abap)         | Source Code of the SAPL Include
[`saplz_aff_example_fugr.reps.json`](./examples/saplz_aff_example_fugr.reps.json)         | Metadata of the SAPL Include
[`lz_aff_example_fugrtop.reps.abap`](./examples/lz_aff_example_fugrtop.reps.abap) 	  | Source Code of the TOP Include
[`lz_aff_example_fugrtop.reps.json`](./examples/lz_aff_example_fugrtop.reps.json)         | Metadata of the TOP Include
[`z_aff_example_func.func.abap`](./examples/z_aff_example_func.func.abap)                 | Source Code of the included FUNC
[`z_aff_example_func.func.json`](./examples/z_aff_example_func.func.json)                 | Metadata of the included FUNC
[`z_aff_example_fugr.fugr.texts.en.properties`](./examples/z_aff_example_fugr.fugr.texts.en.properties)   | Translation relevant texts