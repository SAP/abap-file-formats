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
* Declare field `version` as enum located on root level
1. Name `ABCD-v1.json` or `ABCD-v.1.json` for the first version of the JSON schema for ABAP object type `ABCD`
2. Store all versions in `ABCD.json` and resolve the version inside by JSON schema logic


## Decision Outcome

In the context of ABAP, `version` ambiguous as it suggests 'in-/active' versions.
Instead we agreed on `formatVersion`.
Together with the JSON schema annotation, this is considered to be precise.

We agreed on option 3 (JSON data) and option 1 (JSON schema).
The JSON version is declared as enum on root level.


### Positive Consequences <!-- optional -->

* JSON data does not invalidate with URI changes in `$schema`, provoked by any change of folders or filenames
* JSON data still decodes its version by `formatVersion`
* Ever version of a JSON schema corresponds to a single file
* Name `ABCD.json` is still possible, for example for a generated JSON schema that encodes all versions
* The type `enum` suits the purpose of validation (preferred over string)

### Negative Consequences <!-- optional -->

* Build in validation and annotation, of JSON data, in editors like eclipse or vs Code is based on `$schema` and is not accessible out-of-the box
* The logic of assigning JSON data to its JSON schema has to be provided by a third party, since it is no longer possible to resolve the URI in the JSON data


## Other Options
In the discussions we discarded the following options.

### [option 1]

Versioning by file name
— | Instance | Schema
:--- | :--- | :---
File name | xy.chko-v.1.json | chko-v.1.json

* Bad, because moving to the next version does rename the JSON data file
* Bad, as the JSON data itself should know about the version

### [option 2]

As decides, but without field `formatVersion` or `version`.

* Bad, the version information should be easily retrievable, not by decoding URIs


### [option 3]

[example | description | pointer to more information | …] <!-- optional -->

* Good, because [argument a]
* Good, because [argument b]
* Bad, because [argument c]
* … <!-- numbers of pros and cons can vary -->

## Links <!-- optional -->

* [Link type] [Link to ADR] <!-- example: Refined by [ADR-0005](0005-example.md) -->
* … <!-- numbers of links can vary -->
