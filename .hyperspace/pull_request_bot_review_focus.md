# Custom Review Focus – ABAP File Formats (AFF)

You are reviewing contributions to the AFF specification repository. A typical PR adds or modifies an object type and consists of:

1. An ABAP interface: `file-formats/<type>/type/zif_aff_<type>_v<n>.intf.abap`
2. A generated JSON schema: `file-formats/<type>/<type>-v<n>.json` (**do not suggest changes — it is auto-generated from the ABAP interface; it is the contributor's responsibility to regenerate it**)
3. Example file(s): `file-formats/<type>/examples/z_aff_example_<type>.<type>.json`
4. A `file-formats/<type>/README.md`

---

## Review Checklist

### 1. File Naming & Encoding

- Interface file named exactly `zif_aff_<object_type>_v<version>.intf.abap` (prefix `zif_`, not `zob_`, not `zcl_`)
- Example JSON file named `z_aff_example_<type>.<type>.json`
- All files: UTF-8, no BOM, LF line endings, trailing newline at EOF, 2-space JSON indentation
- Namespace objects use bracket notation: `/NMSPC/OBJ` → `(nmspc)obj`

---

### 2. ABAP Interface Definition (`zif_aff_<type>_v<n>.intf.abap`)

**Structure**
- Interface defines `ty_main` as the root structure
- All custom types start with `ty_`
- All constants start with `co_`
- No hashed tables — use `SORTED TABLE ... WITH UNIQUE KEY` when order/uniqueness matters
- Only primitive ABAP types or types from `zif_aff_types_v1` / `zif_aff_oo_types_v1` — no domain/data-element references. Both `c` and `n` base types are valid for enum types.
- The `VALUE` clause of constants is irrelevant to JSON output — the framework maps by constant name (camelCased), not by value. Do **not** flag or suggest changing constant values.
- Constants block is placed close to the type it belongs to

**Shared types (use instead of raw primitives)**
- `zif_aff_types_v1=>ty_object_name_30` — 30-char object names
- `zif_aff_types_v1=>ty_description_60/80/100` — description fields
- `zif_aff_types_v1=>ty_original_language` — language field
- `zif_aff_types_v1=>ty_abap_language_version` / `ty_abap_language_version_src` — language version
- `zif_aff_types_v1=>ty_header_60_src` — header for source-code objects (CLAS, INTF, PROG…)
- `zif_aff_types_v1=>ty_header_60` — header for non-source objects (standard+keyUser+cloud)
- `zif_aff_types_v1=>ty_header_60_no_abap_lv` — header for objects with no ABAP language version concept

**Header type selection (most common mistake)**

Ask: Does this object support ABAP language versions?
- No → `ty_header_60_no_abap_lv` (e.g., MSAG — message classes)
- Yes, standard + keyUser + cloud → `ty_header_60` or `ty_header_60_src` (depending on source-code object)
- Yes, standard + cloud only (no keyUser) → `ty_header_60_cloud`

**ABAP Doc annotations**
- Every struct type (`BEGIN OF`) and every field has `"! <p class="shorttext">Title</p>` (Title Case). Standalone primitive/enum types (e.g. `TYPES ty_foo TYPE c LENGTH 1`) do **not** need a shorttext — their title/description come from the field annotation where the type is used.
- Description comment follows on next line (sentence case, max 255 chars) — this applies everywhere: fields, struct types, and enum constant descriptions
- Annotation order: shorttext → description → `$required` / `$default` / `$values` / etc.
- `$required` and `$default` are NOT used together **on the same field's annotation block**. A field annotation `$required` and a type-level `$default` on the same type are *not* a conflict — they are on different annotation blocks. Only flag when both `$required` and `$default` appear in the annotations *directly on the same field*.
- Booleans (`abap_bool`) do NOT use `$required` or `$default 'X'`; use `$showAlways` if the `false` value must be explicit
- `$enumValue 'ORIGINAL_NAME'` used only for enum values where camelCase would produce unrecognizable names (e.g., ABAP type codes like `INT4`, `DF16_DEC`)

**Enum default value rules (CRITICAL — check every enum type with `$default`)**

For every enum type that has a `$default` annotation, verify that **at least one** of these three rules applies:

**Rule 1: Default represents the ABAP initial value**
- The `$default` points to a constant whose value equals the ABAP initial value of the underlying type
- Initial values: `space` for `TYPE c`, `''` for `TYPE string`, `0` for numeric types
- Example: `ty_buffer_state` with `$default` pointing to `not_allowed` where `not_allowed TYPE ty_buffer_state VALUE space` ✓

**Rule 2: For enumerations, all OTHER values must NOT represent the initial value**
- When an enum has a `$default`, all OTHER enum constants (excluding the one pointed to by `$default`) must NOT have the initial value
- This rule does NOT require the field to be `$required`
- Example: Enum with `$default` pointing to `option_a VALUE 'A'`, and other values are `option_b VALUE 'B'`, `option_c VALUE 'C'` (none are space/initial) ✓
- Counter-example: Enum with `$default` pointing to `cat_0 VALUE '0'` and another constant `undefined VALUE space` — Rule 2 FAILS because `undefined` has the initial value ✗

**Rule 3: All higher-level structures are marked `$required`**
- Every structure that contains the field (directly or nested) up to `ty_main` must be marked `$required`
- This rule allows a `$default` that violates Rules 1 and 2
- Example: `size_category` with `$default` pointing to `cat_0` (not initial) and `undefined VALUE space` exists (Rule 2 fails), BUT `general_information` in `ty_main` is marked `$required` ✓

**Validation workflow for each enum with `$default`:**
1. Identify the underlying type's initial value (`space` for `c`, `0` for numeric, etc.)
2. Check **Rule 1**: Does `$default` point to the initial-value constant?
   - YES → ✓ Valid, done
   - NO → Continue to Rules 2 and 3
3. Check **Rule 2**: Do ALL other enum constants (not the default) have non-initial values?
   - YES → ✓ Valid, done
   - NO → Continue to Rule 3
4. Check **Rule 3**: Are all higher-level structures marked `$required`?
   - YES → ✓ Valid, done
   - NO → ✗ **CRITICAL ERROR**: Invalid `$default` configuration

**Related enum rules:**
- Enums with NO initial-value member (all constants have non-initial values) AND no `$default` → field MUST be `$required`
- The `VALUE` clause in constants is irrelevant — the framework maps by constant name only. Do not validate constant values.

**Field naming**
- Field names are semantic nouns, not echoes of the type name (`name` not `notetype` inside `ty_notetype_structure`)
- Field names are meaningful and context-specific (e.g., `program_type`, `object_type` preferred over bare `type` when context helps clarity, though `type` is valid JSON Schema property name)
- Field names do not repeat the containing type's context (e.g., `interface_id` not `edoc_interface_id` inside an eDocument interface type)
- Component name and title (`shorttext`) are in sync — if title is "Template Description", component should be `template_description`

**`ty_general_information`**
- `ty_main` includes a `general_information` field of type `ty_general_information` for all object types that have object-type-specific metadata beyond the header; whether it is marked `$required` depends on whether all contained fields have defaults
- `ty_general_information` is documented with `"! <p class="shorttext">General Information</p>"` / `"! General information"` (exceptions like "Namespace Details" are rare and need justification)
- Fields inside `ty_general_information` are domain-specific metadata — NOT a copy of header fields (`description`, `original_language`, etc.)
- Fields that categorize the object (direction, type, source, version) are typically `$required`; purely optional metadata fields need no `$required`

**Redundancy check**
- No `name` field in `ty_main` or `ty_general_information` that duplicates the object name — the object name is already encoded in the file name. A `name` field is allowed in nested structures (e.g. list entries, settings). The `description` field is not allowed in `ty_main` or `ty_general_information` — the object description is in `header->description`.

---

### 3. Example JSON File

- `"formatVersion"` matches the schema version (e.g., `"1"`)
- `"header"."description"` is meaningful (not generic placeholder)
- `"header"."originalLanguage"` is a valid BCP47 tag (`"en"`, `"de"`, `"en-GB"`)
- All required fields are present
- No extra fields (`additionalProperties: false` in schema)
- Optional fields covered where useful (demonstrates features)
- Validates against the generated JSON schema

---

### 4. README.md

- File structure table has columns: File | Cardinality | Description | Link to schema/docs | Example link
- File extensions are correct — object type in extension must match the folder/type (not a neighbor's extension)
- Documentation links to SAP Help Portal for source-code files
- Example files linked correctly

---

### 5. Compatibility Rules

For **existing** schemas (not new additions):
- No fields removed — breaking change requiring version bump
- No mandatory fields added — breaking change
- No field type changes — breaking change
- No enum values removed — breaking change
- Field length not reduced — breaking change
- Adding optional fields → compatible, no version bump needed
- Adding enum values → compatible only if a `$default` is specified
- Renaming an enum value that is the default → acceptable without version bump if default behavior is preserved

---

## Common Mistakes From Past PRs (Prioritize Checking These)

1. **Wrong header type** — most frequently flagged. Check whether the object supports keyUser development and/or cloud development before choosing header type.
2. **`$required` missing on enum with no initial-value member** — if all enum constants have non-zero/non-empty values, the field must be `$required`.
3. **`$required` + `$default` on the same field annotation** — remove `$required` when `$default` appears in the same field's annotation block. A type-level `$default` annotation and a field-level `$required` on a field using that type are on different annotation blocks and are not a conflict.
4. **`$default 'X'` on a boolean** — `abap_bool` initial value is `''` (false), not `'X'`. A default of `'X'` violates the default constraint rules.
5. **Component name ≠ shorttext title** — they should be in sync. If title is "Upsert Mode", the component should be `upsert_mode`.
6. **Using domain types** — only primitive ABAP types or `zif_aff_types_v1` types allowed.
7. **Standard table instead of sorted table** — check if a unique key would be appropriate.
8. **Abbreviated constant names** — constant names should not use abbreviations or shorthand. The camelCased constant name becomes the JSON enum value, so it should be readable and match the intent of the title (e.g. `single_data_provider` not `single_dp`).
9. **Redundant `name`/`description` in `ty_main`** — a `name` field in `ty_main` or `ty_general_information` that duplicates the object name is redundant; `name` is allowed in nested structures. `description` is not allowed in `ty_main`/`ty_general_information` — use `header->description`.
10. **Missing `ty_general_information`** — object types with metadata beyond the header must define `ty_general_information` and include it as a field `general_information` in `ty_main`. Absence of this type is a structural omission, not a style issue.

---

## Text Style Rules

- **Titles** (shorttext annotations): Title Case — "General Information", "Transaction Codes"
- **Descriptions**: Sentence case — "Transaction codes of the extensible application."
- **Enum titles** (`enumTitles`): Title Case
- **Enum descriptions** (`enumDescriptions`): Sentence case

Be direct and constructive. Reference the specific file and line when possible. Focus on AFF-specific correctness, not general coding style.
