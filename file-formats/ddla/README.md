# CDS Annotation Definition File Format

## Object Type Information
Object Type | Description | Group
:--- | :--- | :---
DDLA  | Annotation Definition | Core Data Services
## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.ddla.json` | 1 | [`zif_aff_ddla_v1.intf.abap`](./type/zif_aff_ddla_v1.intf.abap) | [`ddla-v1.json`](./ddla-v1.json) | [`abapcatalog.ddla.json`](./examples/abapcatalog.ddla.json)
`<name>.ddla.acds` | 1 | [CDS](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abencds.htm) | | [`abapcatalog.ddla.acds`](./examples/abapcatalog.ddla.acds)
