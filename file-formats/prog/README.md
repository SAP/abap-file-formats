# Program File Format

## Object Type Information

| Object Type | Description | Group |
| :--- | :--- | :--- |
| PROG | Programs and Includes | Source Code Library |

## File Structure

| File | Cardinality | Definition | Schema | Example |
| :--- | :--- | :--- | :--- | :--- |
| `<name>.prog.json` | 1 | [`zif_aff_prog_v1.intf.abap`](./type/zif_aff_prog_v1.intf.abap) | [`prog-v1.json`](./prog-v1.json) | [`z_aff_example_prog.prog.json`](./examples/prog_p/z_aff_example_prog.prog.json), [`z_aff_example_include.prog.json`](./examples/prog_i/z_aff_example_include.prog.json) |
| `<name>.prog.abap` | 1 | [ABAP](https://help.sap.com/doc/abapdocu_cp_index_htm/CLOUD/en-US/index.htm?file=abapprogram.htm) | - | [`z_aff_example_prog.prog.abap`](./examples/prog_p/z_aff_example_prog.prog.abap), [`z_aff_example_include.prog.abap`](./examples/prog_i/z_aff_example_include.prog.abap) |
| `<name>.prog.texts.<lang>.properties` | 0...n | [Text Elements](https://help.sap.com/viewer/c238d694b825421f940829321ffa326a/7.40.19/en-US/4ec6cf916e391014adc9fffe4e204223.html) | - | [`z_aff_example_prog.prog.texts.en.properties`](./examples/prog_p/z_aff_example_prog.prog.texts.en.properties) |
| `<name>.prog.headings.<lang>.properties` | 0...n | Selection Screen Headings | - | [`z_aff_example_prog.prog.headings.en.properties`](./examples/prog_p/z_aff_example_prog.prog.headings.en.properties) |
| `<name>.prog.selections.<lang>.properties` | 0...n | Selection Screen Texts | - | [`z_aff_example_prog.prog.selections.en.properties`](./examples/prog_p/z_aff_example_prog.prog.selections.en.properties) |
