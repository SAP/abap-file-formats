import json
import jsonschema
from jsonschema import Draft7Validator
from jsonschema import exceptions
import os
import glob
import sys
import re

msg_errors = list()
schemas = glob.glob('./file-formats/*/*.json')
json_in_repo = glob.glob('./file-formats/**/*.json', recursive=True)
only_instances = set(json_in_repo) - set(schemas)
instances = sorted(only_instances, key = lambda x:x[-9])
instance_without_schema = []

def match_schema_instance( ):
    matches = {}
    for instance in instances:
        # get ABAP object type
        file_name = os.path.basename(instance)
        try:
            object_type = re.search('\.(([a-z]{4})+?)\.json', file_name).group(1)
        except AttributeError:
            continue
        # access formatVersion
        json_data = decode_json( instance )
        try:
            version = json_data["formatVersion"]
        except KeyError:
            continue
        # match data with schema
        schema_name =  object_type + '-v'+ version + '.json'
        schema = [s for s in schemas if schema_name in s]
        try:
            matches[instance] = schema[0]
        except IndexError:
            matches[instance] = ""
            instance_without_schema.append(instance)
    return matches

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
        msg_errors.append(f"::error file={instance},line=1,col=1::{exVal.message}{instance}")
    except jsonschema.exceptions.SchemaError as error_ex:
        msg_errors.print(f"::error file={instance},line=1,col=1::{error_ex.message}{instance}")
    else:
        #print(f"::set-output name={os.path.basename(instance).ljust(31)} valid instance of schema {os.path.basename(schema)}" )
        print( "valid: " + os.path.basename(schema) + "; " + os.path.basename(instance))


def validate_json_and_example( matches ):
    print(f"::group::Validate JSON")
    for match in matches:
        # no schema found
        if matches[match] == "":
            continue
        validate_json( matches[match], match )
    print(f"::endgroup::")





matches = match_schema_instance( )

validate_json_and_example( matches )
if instance_without_schema:
    print("\nFiles without an associated JSON Schema in repository:")
    print(*instance_without_schema, sep='\n')

if len(msg_errors) > 0:
    print()
    print(*msg_errors, sep='\n')
    sys.exit(1)
