import json
import jsonschema
from jsonschema import Draft7Validator
from jsonschema import exceptions
import os
import glob
import sys
import re

msg_errors = list()
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
        Draft7Validator(json_schema).validate(json_instance)
    except jsonschema.exceptions.ValidationError as exVal:
        msg_errors.append(f"::error file={instance},line=1,col=1::{exVal.message} in {instance}")
    except jsonschema.exceptions.SchemaError as error_ex:
        msg_errors.print(f"::error file={instance},line=1,col=1::{error_ex.message} in {instance}")
    else:
        #print(f"::set-output name={os.path.basename(instance).ljust(31)} valid instance of schema {os.path.basename(schema)}" )
        print( "valid: " + os.path.basename(schema) + "; " + os.path.basename(instance))

def match_schema_to_data( ):
    match = {}
    for schema in schemas:
        object_type = os.path.basename(schema).split( sep='-' )[0]
        json_data = [ ex for ex in examples if object_type in os.path.basename(ex).split( sep = '.' )[-2] ]
        match[schema] = json_data
    return match

def validate_examples( matches ):
    print(f"::group::Validate JSON examples")
    for match in matches:
        if len(matches[match]) == 0:
            msg_errors.append(f"::error file={match},line=1,col=1::No JSON example found for JSON Schema {match}" )
            continue
        for example in matches[match]:
            validate_json( match, example )
    print(f"::endgroup::")


matches = match_schema_to_data( )

validate_examples( matches )

print()
if len(msg_errors) > 0:
    print(*msg_errors, sep='\n')
    sys.exit(1)
