# ABAP Data Control Language Source File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
DCLS  | ABAP Data Control Language Source | Core Data Services

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.dcls.json` | 1 | [`zif_aff_dcls_v1.intf.abap`](./type/zif_aff_dcls_v1.intf.abap) | [`dcls-v1.json`](./dcls-v1.json) | [`z_aff_example_dcls.dcls.json`](./examples/z_aff_example_dcls.dcls.json)
`<name>.ddla.acds` | 1 | [CDS](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abencds.htm) | | [`z_aff_example_dcls.dcls.acds`](./examples/z_aff_example_dcls.dcls.acds)
