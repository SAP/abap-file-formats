# Scalar Function Definition File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
DSFD | Scalar Function Definition | Core Data Services

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.dsfd.json` | 1 | [`zif_aff_dsfd_v1.intf.abap`](./type/zif_aff_dsfd_v1.intf.abap) | [`dsfd-v1.json`](./dsfd-v1.json) | [`zdsfd_example.dsfd.json`](./examples/zdsfd_example.dsfd.json)
`<name>.dsfd.acds` | 1 | [CDS](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abencds.htm) | | [`zdsfd_example.dsfd.acds`](./examples/zdsfd_example.dsfd.acds)
