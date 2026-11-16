# Enhancement Implementation File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
ENHO | Enhancement Implementation | Enhancements

**Limitation**: The current version of the file format covers BAdI implementations and source code plug-ins only.

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.enho.json` | 1 | [`zif_aff_enho_v2.intf.abap`](./type/zif_aff_enho_v2.intf.abap) | [`enho-v2.json`](./enho-v2.json) | [`z_aff_example_enho_v2.enho.json`](./examples/z_aff_example_enho_v2.enho.json) (BAdI implementation) <br/>[`z_aff_example_enho_plugins.enho.json`](./examples/z_aff_example_enho_plugins.enho.json) (source code plug-ins)
`<name>.enho.abap` | 0...1 | | - | [`z_aff_example_enho_plugins.enho.abap`](./examples/z_aff_example_enho_plugins.enho.abap)

The property `generalInformation.kind` determines which properties and files are allowed:

Property | `badiImplementation` | `sourceCodePlugin`
:--- | :--- | :---
`badiInformation` | Required | Forbidden
`badiImplementations` | Optional | Forbidden
`enhancedObject` | Forbidden | Required
`sourceCodePlugins` | Forbidden | Optional
`<name>.enho.abap` | Forbidden | Required

The file `<name>.enho.abap` contains the source code of all source code plug-ins, each enclosed in `ENHANCEMENT <number>.` and `ENDENHANCEMENT.`, ordered by number.
Each entry in `sourceCodePlugins` belongs to exactly one of these blocks via `enhancementNumber`.
The number is a file-local key and not stable across systems.

### Previous Versions

#### v1

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.enho.json` | 1 | [`zif_aff_enho_v1.intf.abap`](./type/zif_aff_enho_v1.intf.abap) | [`enho-v1.json`](./enho-v1.json) | [`z_aff_example_enho.enho.json`](./examples/z_aff_example_enho.enho.json)
