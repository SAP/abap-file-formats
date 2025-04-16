# Enhancement Implementation File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
ENHO | Enhancement Implementation | Enhancements

**Limitation**: The current version of the file format covers BAdIs only.

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.enho.json` | 1 | [`zif_aff_enho_v1.intf.abap`](./type/zif_aff_enho_v1.intf.abap) | [`enho-v1.json`](./enho-v1.json) | [`z_aff_example_enho.enho.json`](./examples/z_aff_example_enho.enho.json)
