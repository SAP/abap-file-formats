# CLAS File Format

The files correspond to the tabs in ABAP Development Tools, enriched with metadata and translation relevant texts.

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.clas.json` | 1 | [`zif_aff_clas_v1.intf.abap`](./type/zif_aff_clas_v1.intf.abap) | [`clas.json`](./clas.json) | [`zcl_aff_example.clas.json`](./examples/zcl_aff_example.clas.json)
`<name>.clas.abap` | 1 | [ABAP](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abapclass.htm) | - | [`zcl_aff_example.clas.abap`](./examples/zcl_aff_example.clas.abap)
`<name>.clas.definition.abap` | 0...1 | | - | [`zcl_aff_example.clas.definitions.abap`](./examples/zcl_aff_example.clas.definitions.abap)
`<name>.clas.implementations.abap` | 0...1 | | - | [`zcl_aff_example.clas.implementations.abap`](./examples/zcl_aff_example.clas.implementations.abap)
`<name>.clas.macros.abap` | 0...1 | | - | [`zcl_aff_example.clas.macros.abap`](./examples/zcl_aff_example.clas.macros.abap)
`<name>.clas.testclasses.abap` | 0...1 | | - | [`zcl_aff_example.clas.testclasses.abap`](./examples/zcl_aff_example.clas.testclasses.abap)
`<name>.clas.texts.<lang>.properties` | 0...n | [Text Elements](https://help.sap.com/viewer/c238d694b825421f940829321ffa326a/7.40.19/en-US/4ec6cf916e391014adc9fffe4e204223.html) | - | [`zcl_aff_example.clas.testclasses.abap`](./examples/zcl_aff_example.clas.testclasses.abap)


Some classes store local types in only one include.
These classes do not provide includes for class-relevant local types, local types and macros.
In this case, local classes are stored in the file `zcl_aff_example.clas.locals.abap`.
