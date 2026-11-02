import json
import jsonschema
import os
import glob
import sys

msg_errors = list()
msg_warning = list()
schemas = sorted( glob.glob('./file-formats/*-v*.json') + glob.glob('./file-formats/*/*-v*.json') )
examples = sorted( glob.glob('./file-formats/*/examples/*.json', recursive=True) )

meta_schema = './file-formats/meta-schema.json'
metadata_files = sorted([
    path for path in glob.glob('./file-formats/*/*.json')
    if os.path.basename(path) == f"{os.path.basename(os.path.dirname(path))}.json"
])

# Map known multi-segment example suffixes to schema object types.
TYPE_ALIASES = {
    'tabl.settings': 'tabt',
}

def decode_json( file ):
    with open(file, 'r') as json_f:
        try:
            json_instance = json.load(json_f)
        except json.JSONDecodeError as ex:
            msg_errors.append(f"::error file={file},line={ex.lineno},col={ex.colno}::{ex.msg}")
        else:
            return json_instance

def validate_json( schema, instance ):
    json_schema = decode_json( schema )
    json_instance = decode_json( instance )

    if json_schema is None or json_instance is None:
        return

    try:
        jsonschema.validate( instance=json_instance, schema=json_schema)
    except jsonschema.exceptions.ValidationError as ex_validation:
        msg_errors.append(f"::error file={instance},line=1,col=1::{ex_validation.message} in {instance}")
    except jsonschema.exceptions.SchemaError as ex_schema:
        msg_errors.append(f"::error file={instance},line=1,col=1::{ex_schema.message} in {instance}")
    else:
        #print(f"::set-output name={os.path.basename(instance).ljust(31)} valid instance of schema {os.path.basename(schema)}" )
        print( "valid: " + os.path.basename(schema) + "; " + os.path.basename(instance))

def get_example_types( example ):
    filename_parts = os.path.basename(example).split( sep='.' )

    if len(filename_parts) < 3:
        return []

    # Ignore the object name and file extension, keep semantic suffix parts.
    semantic_parts = filename_parts[1:-1]

    candidates = []

    # For files like *.tabl.settings.json, prefer known combined aliases first.
    if len(semantic_parts) >= 2:
        combined = f"{semantic_parts[0]}.{semantic_parts[-1]}"
        if combined in TYPE_ALIASES:
            candidates.append(TYPE_ALIASES[combined])

    # Prefer the most specific suffix (e.g. func, reps, settings) over object type.
    for part in reversed(semantic_parts):
        candidates.append(TYPE_ALIASES.get(part, part))

    # Keep joined prefixes as a low-priority fallback for future extensions.
    for length in range(2, len(semantic_parts) + 1):
        joined = '.'.join(semantic_parts[:length])
        candidates.append(TYPE_ALIASES.get(joined, joined))

    # Preserve order while removing duplicates.
    return list(dict.fromkeys(candidates))

def match_schema_to_data( ):
    match = {}

    for example in examples:
        example_version = decode_json( example )[ 'formatVersion' ]
        example_types = get_example_types( example )

        selected_schema = None
        for example_type in example_types:
            for schema in schemas:
                schema_name_parts = os.path.basename(schema).split( sep='-' )
                if len(schema_name_parts) < 2:
                    continue

                schema_type = schema_name_parts[0]
                schema_version = schema_name_parts[1]

                if schema_type == example_type and example_version in schema_version:
                    selected_schema = schema
                    break

            if selected_schema is not None:
                break

        try:
            match[example] = selected_schema
            if selected_schema is None:
                raise IndexError
        except IndexError:
            msg_errors.append(f"no JSON Schema found for example {os.path.basename(example)}")

    return match

def validate_examples( matches ):
    print(f"::group::Validate JSON examples")
    for example in matches:
        if len(matches[example]) == 0:
            msg_warning.append(f"::notice file={example},line=1,col=1::No JSON Schema found for JSON example {example}" )
            continue
        validate_json( matches[example], example )
    print(f"::endgroup::")

def validate_metadata_files():
    print(f"::group::Validate metadata JSON files")
    for metadata_file in metadata_files:
        validate_json( meta_schema, metadata_file )
    print(f"::endgroup::")


matches = match_schema_to_data( )

validate_examples( matches )
validate_metadata_files()

print()

if len(msg_warning) > 0:
    print(*msg_warning, sep='\n')

if len(msg_errors) > 0:
    print(*msg_errors, sep='\n')
    sys.exit(1)