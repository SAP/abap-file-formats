# Form File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
SFPF | Form | Form Objects

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.sfpf.json` | 1 | [`zif_aff_sfpf_v1.intf.abap`](./type/zif_aff_sfpf_v1.intf.abap) | [`sfpf-v1.json`](./sfpf-v1.json) | [`z_aff_example_sfpf.sfpf.json`](./examples/z_aff_example_sfpf.sfpf.json)
`<name>.sfpf.xdp` | 1 | [`XFA-3_3`](https://www.pdfa.org/norm-refs/XFA-3_3.pdf) | - | [`z_aff_example_sfpf.sfpf.xdp`](./examples/z_aff_example_sfpf.sfpf.xdp)
