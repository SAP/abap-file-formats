import json
import jsonschema
from jsonschema import Draft7Validator
from jsonschema import exceptions
import os
import sys
from git import Repo
import pprint

# provide ABAP objects as list
# only schema for this objects are validated
object_type = ['clas', 'intf', 'func', 'reps', 'nrob', 'chko', 'fugr', 'enho', 'enhs']
nb_errors = 0


def get_all_files_from_repo():
    repo = Repo('./')
    git = repo.git
    return git.ls_tree('-r', '--name-only', 'HEAD').split('\n')


def gather_schemas( repo_objects ):
    schemas = []
    # find json schema of type <ABAB_object>.json
    for object_with_path in repo_objects:
        obj = os.path.basename(object_with_path)
        if obj.startswith(tuple(object_type)) and obj.endswith('json'):
            schemas.append(object_with_path)
    return schemas


def match_schema_instance( schemas, repo_objects ):
    # build dict with key: json schema and value: json example
    dict_json = {}
    for schema in schemas:
        filename = os.path.basename(schema)
        dict_json[schema] = list(filter(lambda el: el.endswith(filename) and os.path.basename(el) != filename, repo_objects))
    print(f"::group::Print schema/instance matches")
    pprint.pprint(dict_json)
    print(f"::endgroup::")
    return dict_json.items()

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

def validate_json( schema, instances):
    global nb_errors
    json_schema = decode_json( schema )
    for instance in instances:
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
            print(os.path.basename(instance).ljust(41) + " valid instance of schema " + os.path.basename(schema))


def validate_json_and_example( schemas, repo_objects ):
    dict_as_list = match_schema_instance( schemas, repo_objects)
    print(f"::group::Validate JSON")
    for match in dict_as_list:
        validate_json( match[0], match[1])
    print(f"::endgroup::")


repo_objects = get_all_files_from_repo()
schemas = gather_schemas( repo_objects )

validate_json_and_example( schemas, repo_objects)
if nb_errors > 0:
    sys.exit(1)
