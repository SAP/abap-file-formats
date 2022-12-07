# JSON Versioning

* Status: [accepted] <!-- optional -->
* Deciders: [https://github.com/orgs/SAP/teams/abap-file-formats-team] <!-- optional -->
* Date: [2021-09] <!-- optional -->

Technical Story:
* https://github.com/SAP/abap-file-formats/issues/53
* https://github.com/SAP/abap-file-formats/issues/83

## Context and Problem Statement

File format definitions are subjected to changes.
With this decision we address the versioning of JSON schema for ABAP file formats.

It is specified how the JSON schemas indicate versions and how this is reflected in the JSON data.



## Considered Options
JSON data:
1. Indicate JSON version by `$schema`
1. Indicate JSON version by `$schema` and `version`
1. Indicate JSON version by `version`

JSON schema:
* Declare field `version` as `const` located on root level
1. Name `ABCD-v1.json` for the first version of the JSON schema for ABAP object type `ABCD`
2. Store all versions in `ABCD.json` and resolve the version inside by JSON schema logic


## Decision Outcome

In the context of ABAP, `version` is ambiguous as it suggests 'in-/active' versions.
Instead we agreed on `formatVersion`.
Together with the JSON schema annotation, this is considered to be precise.

We agreed on option 3 (JSON data) and option 1 (JSON schema).
The JSON version is declared as const on root level.


### Positive Consequences

* JSON data does not invalidate with URI changes in `$schema`, provoked by any change of folders or filenames
* JSON data still decodes its version by `formatVersion`
* Every version of a JSON schema corresponds to a single file
* Name `ABCD.json` is still possible, for example for a generated JSON schema that encodes all versions
* The type `const` suits the purpose of validation of a single value (preferred over `enum`)

### Negative Consequences

* Build-in validation and annotation of JSON data in editors like Eclipse or VS Code is based on `$schema` and is not accessible out-of-the box
* The logic of assigning JSON data to its JSON schema has to be provided by a third party, since it is no longer possible to resolve the URI in the JSON data
* Change type of `const` to number is bad, because for JSON schema the following representation of integer `1` are equivalent: `1`, `1.0`, `1.00`, ...


## Other Options
In the discussions we discarded the following options.


### [option 1]

Versioning by file name
— | Instance | Schema
:--- | :--- | :---
File name | name.ABCD-v1.json | ABCD-v1.json

* Bad, because moving to the next version does rename the JSON data file
* Bad, as the JSON data itself should know about the version

### [option 2]

As decided, but without field `formatVersion` or `version`.

* Bad, the version information should be easily retrievable, not by decoding URIs



## Links

* Discussion of whether put `$schema` into data or not https://github.com/json-schema/json-schema/issues/220
* Catalog of collection of common JSON Schema on https://www.schemastore.org/api/json/catalog.json
* Documentation of JSON editing, validation and annotation in VS Code https://code.visualstudio.com/Docs/languages/json
