# Enhancement Implementation File Format

## Object Type Information

Object Type | Description | Group
:--- | :--- | :---
ENHO | Enhancement Implementation | Enhancements

**Limitation**: Version 2 covers BAdI implementations and source code plug-ins. Other enhancement implementation kinds are not covered.

## File Structure

File | Cardinality | Definition | Schema | Example
:--- | :---  | :--- | :--- | :---
`<name>.enho.json` | 1 | [`zif_aff_enho_v2.intf.abap`](./type/zif_aff_enho_v2.intf.abap) | Pending generation in UIA (`enho-v2.json`) | [BAdI](./examples/z_aff_example_enho_v2.enho.json), [source code plug-ins](./examples/z_aff_example_enho_plugins.enho.json)
`<name>.enho.abap` | 0...1 | E-include source, see below | - | [Source code plug-ins](./examples/z_aff_example_enho_plugins.enho.abap)

### Conditional Properties

`generalInformation.kind` selects the enhancement implementation kind:

Property | `badiImplementation` | `sourceCodePlugin`
:--- | :--- | :---
`badiInformation` | Required | Forbidden
`badiImplementations` | Optional | Forbidden
`sourceCodePluginInformation` | Forbidden | Required
`sourceCodePlugins` | Forbidden | Optional
`<name>.enho.abap` | Forbidden | Required

For BAdI implementations, the enhancement spot is specified in `badiInformation.enhancementSpot`.
For source code plug-ins, an enhancement spot can be specified per plug-in; implicit enhancement options do not require one.
Both implementation arrays may be omitted or empty. In particular, a source code enhancement implementation can have no implementation elements.

### Source Code Plug-Ins

`sourceCodePluginInformation.originalObject` identifies the enhanced repository object and its program context.
If `mainObjectType` or `mainObjectName` is omitted, the importer uses `objectType` or `objectName`, respectively, as in `CL_ENH_TOOL_HOOK_IMPL~SET_ORIGINAL_OBJECT`.
`includeBound` preserves whether the enhancement implementation is bound to an include.

Each `sourceCodePlugins` entry contains the attachment metadata of one enhancement block:

Property | Backend field | Meaning
:--- | :--- | :---
`enhancementNumber` | `ID` | Positive file-local number matching the block in the ABAP file
`fullName` | `FULL_NAME` | Backend identifier of the enhancement option
`enhancementMode` | `ENHMODE` | `static` (`S`) or `dynamic` (`D`)
`enhancementSpot` | `SPOTNAME` | Enhancement spot, if applicable
`overwrite` | `OVERWRITE` | Overwrite flag of the hook implementation
`parentFullName` | `PARENT_FULL_NAME` | Parent enhancement option, if applicable

Preserve full names, including their backend suffixes. Do not replace them with source line numbers.
The working-area handle `EXTID`, working-area flags, and generated include name are not serialized.
The backend `METHOD` flag is not represented; its meaning needs further investigation before adding it to this format.

The ABAP file represents the complete E-include (`<enho>` padded with `=` to 30 characters, followed by `E`).
It is owned by the ENHO and is not exported as a separate PROG object.
All plug-ins are stored together, with the E-include's numeric markers and without the ENHO name in the statement:

```abap
ENHANCEMENT 1.
  " Plug-in source
ENDENHANCEMENT.
```

Export blocks and metadata in ascending order of `enhancementNumber`, preserving the backend IDs.
Every metadata entry must match exactly one block, and every block must match exactly one metadata entry.
Numbers and full names must be unique within the enhancement implementation.
If `sourceCodePlugins` is omitted or empty, the ABAP file contains no enhancement blocks and may be empty.

The numbers are association keys, not cross-system identities.
An importer using `ADD_HOOK_IMPL` passes the block body and attachment metadata to the backend; `SAVE` assigns persisted IDs.
If the backend changes a number, the next export must update both the JSON entry and the ABAP marker consistently.
File presence and metadata/source correspondence require validation beyond JSON Schema.

### Schema Generation

The v2 schema is pending generation from the activated `ZIF_AFF_ENHO_V2` interface in UIA:

```abap
DATA(schema) = zcl_aff_schema_run=>generate_schema( 'ZIF_AFF_ENHO_V2' ).
```

Save the returned schema as `file-formats/enho/enho-v2.json`.
The conditional annotations use component links to `ty_general_information.kind`, as supported by the UIA generator.
Its resolver supports conditions across nested structures; no relocation of `kind` is necessary.
The local generation runner currently skips ENHO, see [issue #409](https://github.com/SAP/abap-file-formats/issues/409).

After saving the schema, run `python3 scripts/test_enho_v2.py` and `python3 json-validator.py` from the repository root.
The ENHO-specific tests cover kind-dependent requirements and prohibitions, optional or empty implementation arrays, and example file consistency.
Until the schema is available, only the example file tests run; the schema tests are skipped.

### Previous Versions

#### v1

Version 1 covers BAdIs only and stores the enhancement spot in `generalInformation.enhancementSpot`.

File | Cardinality | Definition | Schema | Example
:--- | :--- | :--- | :--- | :---
`<name>.enho.json` | 1 | [`zif_aff_enho_v1.intf.abap`](./type/zif_aff_enho_v1.intf.abap) | [`enho-v1.json`](./enho-v1.json) | [`z_aff_example_enho.enho.json`](./examples/z_aff_example_enho.enho.json)
