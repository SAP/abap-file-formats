# Dynpro File Format

## Object Type Information

| Object Type | Description | Group |
| :--- | :--- | :--- |
| DYNP | Dynpros | Source Code Library |

## File Structure

| File | Cardinality | Definition | Schema | Example | Description | Source |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `<program>.<screen>.dynp.json` | 1 | [`zif_aff_dynp_v1.intf.abap`](./type/zif_aff_dynp_v1.intf.abap) | [`dynp-v1.json`](./dynp-v1.json) | [`z_aff_example_dynpro.0100.dynp.json`](./examples/z_aff_example_dynpro.0100.dynp.json) | Header, Fields, Property Bag, Containers, Texts | - |
| `<program>.<screen>.dynp.flow` | 1 | [DYNPRO](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abendynpro_flow_logic_glosry.htm) | - | [`z_aff_example_dynpro.0100.dynp.flow`](./examples/z_aff_example_dynpro.0100.dynp.flow) | Flow Logic | D022S |
