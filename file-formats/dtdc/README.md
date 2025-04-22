# Dynamic Cache File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
DTDC | Dynamic Cache | Dictionary

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.dtdc.json` | 1 | [`zif_aff_dtdc_v1.intf.abap`](./type/zif_aff_dtdc_v1.intf.abap) | [`dtdc-v1.json`](./dtdc-v1.json) | [`z_aff_example_dtdc.dtdc.json`](./examples/z_aff_example_dtdc.dtdc.json)
`<name>.dtdc.acds` | 1 | [CDS](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abencds.htm) | | [`z_aff_example_dtdc.dtdc.acds`](./examples/z_aff_example_dtdc.dtdc.acds)
