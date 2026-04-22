import json
import jsonschema
from jsonschema import validate
from jsonschema import exceptions
import os
import glob
import sys
import re

msg_errors = list()
msg_warning = list()
# Only versioned JSON schema files should be treated as schemas.
# This avoids pulling in metadata files like file-formats/clas/clas.json.
schemas = sorted(
    glob.glob('./file-formats/*-v*.json') +
    glob.glob('./file-formats/*/*-v*.json')
)
examples = sorted( glob.glob('./file-formats/*/examples/*.json', recursive=True) )
meta_instances = sorted( glob.glob('./file-formats/*/*.json') )
meta_instances = [ f for f in meta_instances if not re.search(r'-v\d+\.json$', f) and not re.search(r'meta-schema\.json$', f) ]

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
        validate( instance=json_instance, schema=json_schema)
    except jsonschema.exceptions.ValidationError as ex_validation:
        msg_errors.append(f"::error file={instance},line=1,col=1::{ex_validation.message} in {instance}")
    except jsonschema.exceptions.SchemaError as ex_schema:
        msg_errors.append(f"::error file={instance},line=1,col=1::{ex_schema.message} in {instance}")
    else:
        #print(f"::set-output name={os.path.basename(instance).ljust(31)} valid instance of schema {os.path.basename(schema)}" )
        print( "valid: " + os.path.basename(schema) + "; " + os.path.basename(instance))

def match_schema_to_data( ):
    match = {}

    for example in examples:
        example_type = os.path.basename(example).split( sep = '.' )[-2]
        example_json = decode_json( example )
        if example_json is None:
            continue
        example_version = example_json.get('formatVersion')
        if example_version is None:
            msg_errors.append(f"::error file={example},line=1,col=1::Missing formatVersion in {example}")
            continue
        json_schema = [ schema for schema in schemas if example_type in os.path.basename(schema).split( sep = '-' )[0]
                                                        and example_version in os.path.basename(schema).split( sep='-')[1]]

        try:
            match[example] = json_schema.pop( 0 )
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


def validate_meta_instances( files ):
    print(f"::group::Validate meta instances")
    for file in files:
        instance = decode_json( file )
        if instance is None:
            continue
        schema_ref = instance.get('$schema')
        if schema_ref is None:
            msg_warning.append(f"::notice file={file},line=1,col=1::No $schema found in {file}")
            continue
        schema_path = os.path.normpath(os.path.join(os.path.dirname(file), schema_ref))
        validate_json( schema_path, file )
    print(f"::endgroup::")

matches = match_schema_to_data( )

validate_examples( matches )
validate_meta_instances( meta_instances )

print()

if len(msg_warning) > 0:
    print(*msg_warning, sep='\n')

if len(msg_errors) > 0:
    print(*msg_errors, sep='\n')
    sys.exit(1)
