# Core Schema Notation Model File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
CSNM | Core Schema Notation Model | -

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.csnm.json` | 1 | [`zif_aff_csnm_v1.intf.abap`](./type/zif_aff_csnm_v1.intf.abap) | [`csnm-v1.json`](./csnm-v1.json) | [z_aff_example_csnm.csnm.json](./examples/z_aff_example_csnm.csnm.json)
`<name>.csnm.<csnfilename>.csn` | 0...n | - | - | [z_aff_example_csnm.csnm.model_inferred.csn](./examples/z_aff_example_csnm.csnm.model_inferred.csn)
