# Type Pool File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
TYPE | Type Pool | Source Code Library

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.type.json` | 1 | [`zif_aff_type_v1.intf.abap`](./type/zif_aff_type_v1.intf.abap) | [`type-v1.json`](./type-v1.json) | [`zaff.type.json`](./examples/zaff.type.json)
`<name>.type.abap` | 1 | [ABAP](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/ABAPTYPE-POOL.html) | - | [`zaff.type.abap`](./examples/zaff.type.abap)
