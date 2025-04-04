# Entity Buffer File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
DTEB | Entity Buffer | Core Data Services

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.dteb.json` | 1 | [`zif_aff_dteb_v1.intf.abap`](./type/zif_aff_dteb_v1.intf.abap) | [`dteb-v1.json`](./dteb-v1.json) | [`z_aff_example_dteb.dteb.json`](./examples/z_aff_example_dteb.dteb.json)
`<name>.dteb.acds` | 1 | [CDS](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abencds.htm) | | [`z_aff_example_dteb.dteb.acds`](./examples/z_aff_example_dteb.dteb.acds)
