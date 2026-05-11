# Table and Structure File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
TABL  | Table and Structure | Dictionary

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.tabl.json` | 1 | [`zif_aff_tabl_v1.intf.abap`](./type/zif_aff_tabl_v1.intf.abap) | [`tabl-v1.json`](./tabl-v1.json) | [`zaffexample.tabl.json`](./example/zaffexample.tabl.json)
`<name>.tabl.ddic` | 1 | | | [`zaffexample.tabl.ddic`](./example/zaffexample.tabl.ddic)
`<name>.tabl.settings.json` | 0..1 | [`zif_aff_tabldtt_v1.intf.abap`](./type/zif_aff_tabldtt_v1.intf.abap) | [`tabldtt-v1.json`](./tabldtt-v1.json) | [`zaffexample.tabl.settings.json`](./example/zaffexample.tabl.settings.json)
