# Dynpro File Format

## Object Type Information

| Object Type | Description | Group |
| :--- | :--- | :--- |
| DYNP | Dynpros | - |

## File Structure

| File | Cardinality | Definition | Schema | Example | Description | Source |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `<fugr_name>.fugr.<screen_no>.dynp.json` | 1 | [`zif_aff_dynp_v1.intf.abap`](./type/zif_aff_dynp_v1.intf.abap) | [`dynp-v1.json`](./dynp-v1.json) | [`z_aff_example_fugr.fugr.0100.dynp.json`](./examples/z_aff_example_fugr.fugr.0100.dynp.json) | draft: Header attributes, Fields, Property Bag, Containers, Texts | - |
| `<fugr_name>.fugr.<screen_no>.dynp.flow` | 1 | [DYNPRO](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abendynpro_flow_logic_glosry.htm) | - | [`z_aff_example_fugr.fugr.0100.dynp.flow`](./examples/z_aff_example_fugr.fugr.0100.dynp.flow) | Flow Logic | D022S |
| `<prog_name>.prog.<screen_no>.dynp.json` | 1 | [`zif_aff_dynp_v1.intf.abap`](./type/zif_aff_dynp_v1.intf.abap) | [`dynp-v1.json`](./dynp-v1.json) | [`z_aff_example_prog.prog.0100.dynp.json`](./examples/z_aff_example_prog.prog.0100.dynp.json) | draft: Header attributes, Fields, Property Bag, Containers, Texts | - |
| `<prog_name>.prog.<screen_no>.dynp.flow` | 1 | [DYNPRO](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abendynpro_flow_logic_glosry.htm) | - | [`z_aff_example_prog.prog.0100.dynp.flow`](./examples/z_aff_example_prog.prog.0100.dynp.flow) | Flow Logic | D022S |
