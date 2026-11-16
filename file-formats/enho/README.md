# Enhancement Implementation File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
ENHO | Enhancement Implementation | Enhancements

**Limitation**: The current version of the file format covers BAdI implementations and source code plug-ins only.

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.enho.json` | 1 | [`zif_aff_enho_v2.intf.abap`](./type/zif_aff_enho_v2.intf.abap) | [`enho-v2.json`](./enho-v2.json) | [BAdI](./examples/z_aff_example_enho_v2.enho.json), [source code plug-ins](./examples/z_aff_example_enho_plugins.enho.json)
`<name>.enho.abap` | 0...1 | Source code of all source code plug-ins | - | [`z_aff_example_enho_plugins.enho.abap`](./examples/z_aff_example_enho_plugins.enho.abap)

`generalInformation.kind` determines which properties are allowed:

Property | `badiImplementation` | `sourceCodePlugin`
:--- | :--- | :---
`badiInformation` | Required | Forbidden
`badiImplementations` | Optional | Forbidden
`enhancedObject` | Forbidden | Required
`sourceCodePlugins` | Forbidden | Optional
`<name>.enho.abap` | Forbidden | Required

### Source Code Plug-Ins

The ABAP file contains all plug-ins of the enhancement implementation, ordered by their number:

```abap
ENHANCEMENT 1.
  " Plug-in source
ENDENHANCEMENT.
```

Each entry in `sourceCodePlugins` is associated with exactly one `ENHANCEMENT` block via `enhancementNumber`.
The number is a file-local key and not stable across systems.
`fullName` identifies the enhancement option and is stored as provided by the system.

## Previous Versions

### v1

Version 1 covers BAdI implementations only.

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.enho.json` | 1 | [`zif_aff_enho_v1.intf.abap`](./type/zif_aff_enho_v1.intf.abap) | [`enho-v1.json`](./enho-v1.json) | [`z_aff_example_enho.enho.json`](./examples/z_aff_example_enho.enho.json)
