# Dictionary Data Elements File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
DTEL  | Dictionary Data Elements | Dictionary

## File Structure

File | Cardinality | Definition | Schema | Examples
:--- | :--- | :--- | :--- | :---
`<name>.dtel.json` | 1 | [`zif_aff_dtel_v1.intf.abap`](./type/zif_aff_dtel_v1.intf.abap) | [`dtel-v1.json`](./dtel-v1.json) | [`z_aff_example_domain.dtel.json`](./examples/z_aff_example_domain.dtel.json) [`z_aff_example_predefined_type.dtel.json`](./examples/z_aff_example_predefined_type.dtel.json)
`<name>.dtel.docu.json` | 0...1 | [`zif_aff_docu_v1.intf.abap`](../zif_aff_docu_v1.intf.abap) | [`docu-v1.json`](../docu-v1.json) | [`z_aff_example_domain.dtel.docu.json`](./examples/z_aff_example_domain.dtel.docu.json)
