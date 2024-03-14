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
schemas = sorted( glob.glob('./file-formats/*/*.json') )
examples = sorted( glob.glob('./file-formats/*/examples/*.json', recursive=True) )

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
    try:
        validate( instance=json_instance, schema=json_schema)
    except jsonschema.exceptions.ValidationError as ex_validation:
        msg_errors.append(f"::error file={instance},line=1,col=1::{ex_validation.message} in {instance}")
    except jsonschema.exceptions.SchemaError as ex_schema:
        msg_errors.print(f"::error file={instance},line=1,col=1::{ex_schema.message} in {instance}")
    else:
        #print(f"::set-output name={os.path.basename(instance).ljust(31)} valid instance of schema {os.path.basename(schema)}" )
        print( "valid: " + os.path.basename(schema) + "; " + os.path.basename(instance))

def match_schema_to_data( ):
    match = {}

    for example in examples:
        example_type = os.path.basename(example).split( sep = '.' )[-2]
        example_version = decode_json( example )[ 'formatVersion' ]
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


matches = match_schema_to_data( )

validate_examples( matches )

print()

if len(msg_warning) > 0:
    print(*msg_warning, sep='\n')

if len(msg_errors) > 0:
    print(*msg_errors, sep='\n')
    sys.exit(1)
