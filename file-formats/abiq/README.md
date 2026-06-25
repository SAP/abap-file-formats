# Analytical Quick Action File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
ABIQ  | Analytical Quick Action | Others

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.abiq.json` | 1 | [`zif_aff_abiq_v1.intf.abap`](./type/zif_aff_abiq_v1.intf.abap) | [`abiq-v1.json`](./abiq-v1.json) | [`z_aff_example_abiq_02.abiq.json`](./examples/z_aff_example_abiq_02.abiq.json)
`<name>.abiq.content.json` | 0..1 | | | [`z_aff_example_abiq_02.abiq.content.json`](./examples/z_aff_example_abiq_02.abiq.content.json)
`<name>.abiq.prompt.txt` | 0..1 | | | [`z_aff_example_abiq_01.abiq.prompt.txt`](./examples/z_aff_example_abiq_01.abiq.prompt.txt)
