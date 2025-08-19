# Enhancement Spot File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
ENHS | Enhancement Spot | Enhancements

**Limitation**: The current version of the file format covers BAdIs only.

## File Structure

Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.enhs.json` | 1 | [`zif_aff_enhs_v1.intf.abap`](./type/zif_aff_enhs_v1.intf.abap) | [`enhs-v1.json`](./enhs-v1.json) | [`z_aff_example_enhs.enhs.json`](./examples/z_aff_example_enhs.enhs.json)
