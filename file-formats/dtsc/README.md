# Dictionary Tuning Static Cache File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
DTSC  | Dictionary Tuning Static Cache | Core Data Services

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.dtsc.json` | 1 | [`zif_aff_dtsc_v1.intf.abap`](./type/zif_aff_dtsc_v1.intf.abap) | [`dtsc-v1.json`](./dtsc-v1.json) | [`z_aff_example_dtsc.dtsc.json`](./examples/z_aff_example_dtsc.dtsc.json)
`<name>.dtsc.acds` | 1 |  [Docu](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/ABENDDIC_STATIC_CACHES.html) | - | [`z_aff_example_dtsc.dtsc.acds`](./examples/z_aff_example_dtsc.dtsc.acds)
