# FUGR File Format

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.fugr.json` | 1 | [`zif_aff_fugr_v1.abap`](./type/zif_aff_fugr_v1.intf.abap) | [`fugr.json`](./fugr.json) | [`z_example.fugr.json`](./examples/z_aff_example_fugr.fugr.json)
`<name>.fugr.sapl<name>.reps.abap` | 1 | [Function-Pool](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abenfunction_pool_glosry.htm) | - | [`z_aff_example_fugr.fugr.saplz_aff_example_fugr.reps.abap`](./examples/z_aff_example_fugr.fugr.saplz_aff_example_fugr.reps.abap)
`<name>.fugr.sapl<name>.reps.json` | 1 | [`zif_aff_reps_v1.abap`](./type/zif_aff_reps_v1.intf.abap) |  [`reps.json`](./reps.json) | [`z_aff_example_fugr.fugr.saplz_aff_example_fugr.reps.json`](./examples/z_aff_example_fugr.fugr.saplz_aff_example_fugr.reps.json)
`<name>.fugr.l<name>top.reps.abap` | 1 | | - | [`z_aff_example_fugr.fugr.lz_aff_example_fugrtop.reps.abap`](./examples/z_aff_example_fugr.fugr.lz_aff_example_fugrtop.reps.abap)
`<name>.fugr.l<name>top.reps.json` | 1 | [`zif_aff_reps_v1.abap`](./type/zif_aff_reps_v1.intf.abap) | [`reps.json`](./reps.json) | [`z_aff_example_fugr.fugr.lz_aff_example_fugrtop.reps.json`](./examples/z_aff_example_fugr.fugr.lz_aff_example_fugrtop.reps.json)
`<name>.fugr.<fmname>.func.abap` | 0...n | [Function Modules](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abenabap_functions.htm) | - | [`z_aff_example_fugr.fugr.z_aff_example_func.func.abap`](./examples/z_aff_example_fugr.fugr.z_aff_example_func.func.abap)
`<name>.fugr.<fmname>.func.json` | 0...n | [`zif_aff_func_v1.abap`](./type/zif_aff_func_v1.intf.abap) | [`func.json`](./func.json) | [`z_aff_example_fugr.fugr.z_aff_example_func.func.json`](./examples/z_aff_example_fugr.fugr.z_aff_example_func.func.json)
`<name>.fugr.texts.<lang>.properties` | 0...n | [Text Elements](https://help.sap.com/viewer/c238d694b825421f940829321ffa326a/7.40.19/en-US/4ec6cf916e391014adc9fffe4e204223.html) | - | [`z_aff_example_fugr.fugr.texts.en.properties`](./examples/z_aff_example_fugr.fugr.texts.en.properties)


The following sub objects of FUGR are not yet supported:
* Dynpros
* PBO Modules
* PAI Modules
* Documentation

For FUGR-deserialization, there is no need to supply a file for the "UXX"-include.

Note that function modules are serialized with the [ABAP pseudo syntax](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abenfunction.htm):

```abap
FUNCTION z_aff_example_func
  IMPORTING
    i_param TYPE i
  RAISING
    cx_static_check.
```    
