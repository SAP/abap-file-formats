# SKTD File Format

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.sktd.json` | 1 | [`zif_aff_sktd_v1.intf.abap`](./type/zif_aff_sktd_v1.intf.abap) | [`sktd-v1.json`](./sktd-v1.json) | [`z_aff_example_sktd.sktd.json`](./examples/z_aff_example_sktd.sktd.en.json)


The serialization of a KTD object will be done by serialization of each documentation element, for each element the ID is followed by the markdown content.
The ID will be serialized as comment, e.g. the element ID of the headings action documentation element from the example:

```
[//]: # (id:/sap/bc/adt/bo/behaviordefinitions/z_aff_example_sktd/source/main#type=BDEF/BAC;name=z_aff_example_sktd.headings )
```

All lines of the documentation content which starts with `[//]:` will be escaped as `\[//]:`.
