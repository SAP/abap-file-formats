# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository defines file format specifications for ABAP repository objects. Each ABAP object type (e.g., CLAS, INTF, DOMA) has a corresponding folder in `file-formats/` containing:
- JSON schema definitions (e.g., `clas-v1.json`)
- ABAP interface types in `type/` subfolder (e.g., `zif_aff_clas_v1.intf.abap`)
- Example files in `examples/` subfolder

JSON schemas are **automatically generated** from ABAP interface definitions, not manually written.

## Common Commands

### Linting
```bash
npm run lint
```
Runs abaplint with auto-fix on ABAP interface files in `file-formats/`.

### JSON Schema Generation
```bash
cd generate
npm ci
npm run compile   # Transpiles ABAP to JavaScript
npm run generate  # Generates JSON schemas from ABAP types
npm test          # Runs both compile and generate
```

The generation process:
1. Downloads ABAP-to-JS transpiler tools via `oras-pull`
2. Copies ABAP interface files from `file-formats/` to `downport/`
3. Transpiles ABAP to JavaScript in `output/`
4. Runs `aff.mjs` to generate JSON schemas in `generated/`

### JSON Validation
```bash
python json-validator.py
```
Validates all JSON examples against their corresponding schemas.

### Compatibility Check
```bash
cd compatibility-check
npm ci
npm run check
```
Checks if JSON schema changes are compatible with previous versions using `json-schema-diff`.

## Architecture

### File Naming Convention

ABAP file formats follow a strict naming pattern:
```
<object_name>.<object_type>.[<sub_object_name>.<sub_object_type>.]<file_extension>
```

Example: `cl_example.clas.json` (metadata), `cl_example.clas.abap` (source code)

Namespaces convert slashes to brackets: `/NMSPC/CL_OBJECT` → `(nmspc)cl_object`

### Format Versions

JSON schemas are versioned (e.g., `intf-v1.json`, `clas-v1.json`). Each JSON file contains a mandatory `formatVersion` field.

**Compatible changes** (don't bump version):
- Adding non-mandatory fields
- Changing descriptions/titles
- Adding enum values when a default is specified

**Incompatible changes** (require new version):
- Adding mandatory fields
- Removing fields
- Renaming fields
- Changing field types
- Changing structure

### ABAP Type Interface Pattern

Every object type has an interface `zif_aff_<object_type>_v<version>` containing:
- `ty_main` structure defining the JSON schema structure
- ABAP Doc comments that become JSON schema title/description
- Special annotations like `$required`, `$default`, `$values` for enums

**Naming conventions**:
- Interfaces: `zif_aff_<type>_v<n>` (e.g., `zif_aff_intf_v1`)
- Types: `ty_*` prefix
- Constants: `co_*` prefix
- Field names in ABAP: snake_case (converted to camelCase in JSON)

Common reusable types are in `file-formats/zif_aff_types_v1.intf.abap`.

### ABAP Doc Annotations

Key annotations for JSON schema generation:
- `"! <p class="shorttext">Title</p>` - Adds title (title case)
- `"! Description text` - Adds description (sentence case)
- `"! $required` - Makes field required
- `"! $default 'value'` - Sets default value
- `"! $values {@link source.data:constant}` - Defines enum values
- `"! $pattern '<regex>'` - Adds regex pattern validation
- `"! $minLength value` / `$maxLength value` - String length constraints
- `"! $minimum value` / `$maximum value` - Number constraints
- `"! $showAlways` - Serialize even if value is initial

Use sorted tables with defined keys, not hashed tables.

### Formatting Standards

All files must follow (enforced by `.editorconfig`):
- UTF-8 encoding, no BOM
- LF line endings (`\n`)
- Empty line at EOF
- JSON: 2-space indentation
- No trailing whitespace

## Adding a New Object Type

1. Create `file-formats/<objtype>/` directory structure
2. Write ABAP interface `type/zif_aff_<objtype>_v1.intf.abap` with `ty_main` structure
3. Add ABAP Doc comments and annotations
4. Run `cd generate && npm test` to generate JSON schema
5. Copy generated schema from `generate/generated/` to `file-formats/<objtype>/<objtype>-v1.json`
6. Create example files in `examples/` subfolder
7. Run `python json-validator.py` to validate examples
8. Run `npm run lint` to check ABAP code style
9. Create README.md documenting file structure (see `file-formats/clas/README.md` as template)

## abaplint Configuration

The `abaplint.jsonc` file enforces strict ABAP coding standards including:
- Object naming patterns (INTF must match `^ZIF_AFF_[A-Z0-9]{4}_V[0-9]+$`)
- Type naming (`ty_*` prefix required)
- Constant naming (`co_*` prefix required)
- Syntax checks for v702 ABAP version
- Various code quality rules

## GitHub Workflows

CI checks run on pull requests:
- **generate.yml**: Verifies generated schemas match committed versions
- **json-compatibility.yml**: Checks schema changes are compatible
- **editorconfig.yml**: Validates file formatting
- **py-validation.yml**: Validates JSON examples
- **markdown-link-check.yml**: Checks for broken links

## Patterns from Recent PRs

Based on analysis of recent merged PRs, the AFF project follows these patterns:

### Making Incompatible Changes to v1

**When it's acceptable**: If an object type is not yet widely adopted (e.g., not used in abapGit or other major tools), incompatible changes can be made to v1 instead of creating v2. This requires:
1. Explicit confirmation from maintainers that the format is not in use
2. Justification in the PR body (e.g., PR #728: "the SRVD implementation is not used in ABAPGit yet")
3. Acceptance that compatibility checks will fail and need to be overridden

**Pattern observed in PR #726 (DOMA)**: The team discussed whether to create v2 or modify v1. After confirming no known usages, they chose to modify v1 incompatibly, ignoring the compatibility check.

### Adding Default Values to Enums

**When adding defaults** (PR #719 - DDLS):
- Add `$default` annotation to the enum field in the ABAP interface
- The default allows future enum values to be added compatibly
- Systems that don't support new enum values will fall back to the default
- Format version doesn't need to increment

**Example pattern**:
```abap
"! $values {@link zif_aff_ddls_v1.data:co_source_origin}
"! $default {@link zif_aff_ddls_v1.data:co_source_origin.abap_development_tools}
TYPES ty_source_origin TYPE c LENGTH 1.
```

### Making Fields Required

**When to make fields required** (PR #728 - SRVD):
- If the field already has a `$default` annotation, adding `$required` is a compatible change
- The field will now always be serialized (even when it has the default value)
- Update both the ABAP interface (`$required` annotation) and verify the JSON schema is regenerated correctly
- Only do this if you're certain existing usage patterns already provide these fields

### Adding Optional Fields

**Pattern for compatible extension** (PR #721 - CHKV):
- Adding new optional fields/structures doesn't increment format version
- State in PR body: "only optional fields have been added to the possible items"
- Ensure backward compatibility: old JSON files remain valid

### New Object Type Checklist

**Complete file set required** (PR #733 - BDEF, PR #720 - MSAG):
1. `file-formats/<objtype>/README.md` - Documentation with file structure table
2. `file-formats/<objtype>/<objtype>-v1.json` - Generated JSON schema
3. `file-formats/<objtype>/type/zif_aff_<objtype>_v1.intf.abap` - ABAP interface
4. `file-formats/<objtype>/type/zif_aff_<objtype>_v1.intf.json` - Metadata (format version info)
5. `file-formats/<objtype>/examples/` - At least one complete example set
6. Update `docs/specification.md` if introducing new file extensions (e.g., `.abdl` for BDEF)

**README.md format**: Use consistent structure with:
- "Object Type Information" table (Type, Description, Group)
- "File Structure" table with columns: File, Cardinality, Definition, Schema, Example
- Additional notes about special cases (e.g., extensions, variations)

### Structuring Complex Object Types

**Avoid top-level fields** (PR #726 - DOMA refactoring):
- Group related fields into sub-structures with meaningful names
- Don't place business fields directly in `ty_main` (except `format_version` and `header`)
- Use structures like `ty_general_information` to group metadata
- This makes the JSON more organized and easier to extend

**Example structure**:
```abap
BEGIN OF ty_main,
  format_version TYPE zif_aff_types_v1=>ty_format_version,
  header TYPE zif_aff_types_v1=>ty_header_60_src,
  general_information TYPE ty_general_information,  " Group fields here
  data_type TYPE ty_data_type,                      " Not at top level
END OF ty_main.
```

### File Extension Support

**When adding new file extensions** (PR #734):
- Update `.editorconfig` to include the new extension
- Add it to the list of file types in the pattern: `[*.{abap,md,properties,acds,json,mjs,gitignore,yml,abdl}]`
- Ensures proper formatting (UTF-8, LF, trailing newline) for all file types

### Enum Value Naming

**When defining enums** (PR #726 - DOMA):
- Provide comprehensive enum constants with descriptive titles
- External (JSON) names use camelCase: `dataType`, `sourceOrigin`
- Internal (ABAP) values use short codes: `'X'`, `'1'`, `'5'`
- Always include ABAP Doc with shorttext and description for each enum value
- Group related enums in well-named constant structures (e.g., `co_data_type`)

### Length Changes are Breaking

**Data type length modifications** (PR #726):
- Changing field length from 4 to 10 characters is an incompatible change
- Document the reason: "uses what is shown to the developer" vs internal representation
- If doing this on v1, requires explicit approval and rationale

## Key Repository Locations

- `file-formats/` - All ABAP type definitions and JSON schemas
- `file-formats/zif_aff_types_v1.intf.abap` - Reusable type definitions
- `generate/` - Schema generation tooling
- `compatibility-check/` - JSON schema compatibility validation
- `docs/` - Technical specifications and decision logs
- `docs/specification.md` - File naming and format conventions
- `docs/json.md` - JSON schema generation from ABAP types
