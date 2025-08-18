# Message Class object type metadata File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
MSAG  | Message Class object type metadata | Texts

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.msag.json` | 1 | [`zif_aff_msag_v1.intf.abap`](./type/zif_aff_msag_v1.intf.abap) | [`msag-v1.json`](./msag-v1.json) | [`z_aff_example_msag.msag.json`](./examples/z_aff_example_msag.msag.json)

---

**Note:**  
Long text support is not currently included in the ABAP file format. However, support for long text will be added in a future version.