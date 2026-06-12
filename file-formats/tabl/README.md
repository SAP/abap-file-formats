# Table and Structure File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
TABL  | Table and Structure | Dictionary

Table indexes are not covered.

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.tabl.json` | 1 | [`zif_aff_tabl_v1.intf.abap`](./type/zif_aff_tabl_v1.intf.abap) | [`tabl-v1.json`](./tabl-v1.json) | [`zaffexample.tabl.json`](./examples/zaffexample.tabl.json)
`<name>.tabl.ddic` | 1 | | | [`zaffexample.tabl.ddic`](./examples/zaffexample.tabl.ddic)
`<name>.tabl.settings.json` | 0..1 | [`zif_aff_tabt_v1.intf.abap`](./type/zif_aff_tabt_v1.intf.abap) | [`tabt-v1.json`](./tabt-v1.json) | [`zaffexample.tabl.settings.json`](./examples/zaffexample.tabl.settings.json)
