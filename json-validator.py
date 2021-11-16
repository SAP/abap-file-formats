import json
import jsonschema
from jsonschema import Draft7Validator
from jsonschema import exceptions
import os
import glob
import sys
import re

nb_errors = 0
schemas = glob.glob('./file-formats/*/*.json')
instances = glob.glob('./file-formats/*/examples/**.json', recursive=True)

def match_schema_instance( instances ):
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
    return matches

def decode_json( file ):
    global nb_errors
    with open(file, 'r') as json_f:
        try:
            json_instance = json.load(json_f)
        except json.JSONDecodeError as ex:
            print(f"::error file={file},line={ex.lineno},col={ex.colno}::{ex.msg}")
            nb_errors += 1
        else:
            return json_instance

def validate_json( schema, instance ):
    global nb_errors
    json_schema = decode_json( schema )
    json_instance = decode_json( instance )
    try:
        Draft7Validator(json_schema).validate(json_instance)
    except jsonschema.exceptions.ValidationError as exVal:
        nb_errors += 1
        print(f"::error file={instance},line=1,col=1::{exVal.message}")
    except jsonschema.exceptions.SchemaError as error_ex:
        nb_errors += 1
        print(f"::error file={instance},line=1,col=1::{error_ex.message}")
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





matches = match_schema_instance( instances )

validate_json_and_example( matches )
if nb_errors > 0:
    sys.exit(1)
