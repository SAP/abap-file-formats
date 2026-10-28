#!/usr/bin/env python3
"""Check ENHO v2 examples and, once generated, the conditional JSON schema.

Run with: python3 scripts/test_enho_v2.py
Schema tests require jsonschema and file-formats/enho/enho-v2.json.
"""

import copy
import json
from pathlib import Path
import re
import unittest


ENHO = Path(__file__).resolve().parents[1] / "file-formats" / "enho"
SCHEMA = ENHO / "enho-v2.json"
EXAMPLES = ENHO / "examples"


def example(name):
    return json.loads((EXAMPLES / f"z_aff_example_enho_{name}.enho.json").read_text())


class TestExampleFiles(unittest.TestCase):
    def test_badi_has_no_abap_file(self):
        self.assertFalse((EXAMPLES / "z_aff_example_enho_v2.enho.abap").exists())

    def test_plugin_metadata_matches_abap_blocks(self):
        for name in ("plugins", "empty"):
            with self.subTest(name=name):
                metadata = example(name)
                source = (EXAMPLES / f"z_aff_example_enho_{name}.enho.abap").read_text()
                blocks = [int(number) for number in re.findall(
                    r"^ENHANCEMENT ([1-9][0-9]*)\.$", source, re.MULTILINE
                )]
                ends = re.findall(r"^ENDENHANCEMENT\.$", source, re.MULTILINE)
                plugins = metadata.get("sourceCodePlugins", [])
                numbers = [plugin["enhancementNumber"] for plugin in plugins]
                names = [plugin["fullName"] for plugin in plugins]
                self.assertEqual(blocks, numbers)
                self.assertEqual(len(ends), len(blocks))
                self.assertEqual(numbers, sorted(set(numbers)))
                self.assertEqual(len(names), len(set(names)))

    def test_empty_enhancement_omits_plugins(self):
        self.assertNotIn("sourceCodePlugins", example("empty"))
        source = (EXAMPLES / "z_aff_example_enho_empty.enho.abap").read_text()
        self.assertEqual(source.strip(), "")

    def test_badi_implementation_payload_is_preserved(self):
        previous = json.loads((EXAMPLES / "z_aff_example_enho.enho.json").read_text())
        current = example("v2")
        self.assertEqual(previous["badiImplementations"], current["badiImplementations"])
        self.assertEqual(previous["generalInformation"], current["badiInformation"])


class TestSchema(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        if not SCHEMA.exists():
            raise unittest.SkipTest("ENHO v2 schema is pending generation in UIA")
        import jsonschema
        schema = json.loads(SCHEMA.read_text())
        jsonschema.Draft202012Validator.check_schema(schema)
        cls.validator = jsonschema.Draft202012Validator(schema)

    def assertValid(self, instance):
        self.assertEqual(list(self.validator.iter_errors(instance)), [])

    def assertInvalid(self, instance):
        self.assertTrue(list(self.validator.iter_errors(instance)))

    def test_examples(self):
        for name in ("v2", "plugins", "empty"):
            with self.subTest(name=name):
                self.assertValid(example(name))

    def test_kind_is_required_and_has_no_fallback(self):
        for value in (None, "unknown", ""):
            with self.subTest(value=value):
                instance = example("empty")
                if value is None:
                    del instance["generalInformation"]["kind"]
                else:
                    instance["generalInformation"]["kind"] = value
                self.assertInvalid(instance)
        instance = example("empty")
        del instance["generalInformation"]
        self.assertInvalid(instance)

    def test_information_group_is_required_for_each_kind(self):
        for name, field in (("v2", "badiInformation"),
                            ("plugins", "sourceCodePluginInformation")):
            with self.subTest(name=name):
                instance = example(name)
                del instance[field]
                self.assertInvalid(instance)

    def test_badi_fields_are_forbidden_for_plugins(self):
        badi = example("v2")
        for field in ("badiInformation", "badiImplementations"):
            with self.subTest(field=field):
                instance = example("plugins")
                instance[field] = badi[field]
                self.assertInvalid(instance)

    def test_plugin_fields_are_forbidden_for_badis(self):
        plugins = example("plugins")
        for field in ("sourceCodePluginInformation", "sourceCodePlugins"):
            with self.subTest(field=field):
                instance = example("v2")
                instance[field] = plugins[field]
                self.assertInvalid(instance)

    def test_implementation_arrays_are_optional_or_empty(self):
        for name, field in (("v2", "badiImplementations"),
                            ("plugins", "sourceCodePlugins")):
            with self.subTest(name=name):
                instance = example(name)
                del instance[field]
                self.assertValid(instance)
                instance[field] = []
                self.assertValid(instance)

    def test_invalid_enhancement_numbers(self):
        for number in (0, -1, 1.5):
            with self.subTest(number=number):
                instance = example("plugins")
                instance["sourceCodePlugins"][0]["enhancementNumber"] = number
                self.assertInvalid(instance)

    def test_enhancement_modes(self):
        instance = example("plugins")
        instance["sourceCodePlugins"][0]["enhancementMode"] = "static"
        self.assertValid(instance)
        instance["sourceCodePlugins"][0]["enhancementMode"] = "dynamic"
        self.assertValid(instance)
        instance["sourceCodePlugins"][0]["enhancementMode"] = "section"
        self.assertInvalid(instance)

    def test_required_plugin_properties(self):
        for field in ("enhancementNumber", "fullName", "enhancementMode"):
            with self.subTest(field=field):
                instance = example("plugins")
                del instance["sourceCodePlugins"][0][field]
                self.assertInvalid(instance)

    def test_required_original_object_properties(self):
        for field in ("programId", "objectType", "objectName", "programName"):
            with self.subTest(field=field):
                instance = example("empty")
                del instance["sourceCodePluginInformation"]["originalObject"][field]
                self.assertInvalid(instance)

    def test_backend_only_fields_are_rejected(self):
        for field, value in (("extid", 1), ("source", []), ("isMethod", False)):
            with self.subTest(field=field):
                instance = copy.deepcopy(example("plugins"))
                instance["sourceCodePlugins"][0][field] = value
                self.assertInvalid(instance)

    def test_v1_layout_is_rejected(self):
        instance = example("v2")
        instance["generalInformation"]["enhancementSpot"] = "Z_AFF_EXAMPLE_ENHS"
        self.assertInvalid(instance)


if __name__ == "__main__":
    unittest.main()
