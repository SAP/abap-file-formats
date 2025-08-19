# Service Definitions File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
SRVD  | Service Definitions | Business Services

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.srvd.json` | 1 | [`zif_aff_srvd_v1.intf.abap`](./type/zif_aff_srvd_v1.intf.abap) | [`srvd-v1.json`](./srvd-v1.json) | [`z_aff_example_srvd.srvd.json`](./examples/z_aff_example_srvd.srvd.json)
`<name>.srvd.acds` | 1 | [CDS](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abencds.htm) | | [`z_aff_example_srvd.srvd.acds`](./examples/z_aff_example_srvd.srvd.acds)
