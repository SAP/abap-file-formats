# Behavior Definition File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
BDEF | Behavior Definition | Core Data Services

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.bdef.json` | 1 | [`zif_aff_bdef_v1.intf.abap`](./type/zif_aff_bdef_v1.intf.abap) | [`bdef-v1.json`](./bdef-v1.json) | [`z_aff_example_bdef.bdef.json`](./examples/z_aff_example_bdef.bdef.json)
`<name>.bdef.abdl` | 1 | [BDEF](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/abencds_bdef.html) | | [`z_aff_example_bdef.bdef.abdl`](./examples/z_aff_example_bdef.bdef.abdl)
`<name>.bdef.json` | [0..1] | [`zif_aff_bdef_v1.intf.abap` (Extension BDEF)](./type/zif_aff_bdef_v1.intf.abap) | [`bdef-v1.json`](./bdef-v1.json) | [`z_aff_example_bdef_extension.bdef.json`](./examples/z_aff_example_bdef_extension.bdef.json)
`<name>.bdef.abdl` | [0..1] | [Extension BDEF](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/ABENBDL_EXTENSION.html) | | [`z_aff_example_bdef_extension.bdef.abdl`](./examples/z_aff_example_bdef_extension.bdef.abdl)

A behavior definition can have multiple extensions. An extension behavior definition must have the behavior definition name in the metadata which it extends.
