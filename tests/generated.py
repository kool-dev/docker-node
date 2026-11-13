#!/usr/bin/env python3
"""Check the simple Blade substitutions used by this repository without Docker."""
import json
import pathlib
import re

root = pathlib.Path(__file__).resolve().parents[1]
config = json.loads((root / "fwd-template.json").read_text())
for build in config["builds"]:
    expected_names = set()
    for entry in build["files"]:
        template = root / (entry["path"] + ".blade.php")
        rendered = template.read_text()
        for key, value in build["data"].items():
            rendered = rendered.replace("{{ $" + key + " }}", value)
        assert not re.search(r"{{|@(?:if|foreach|include)", rendered), template
        target = root / build["name"] / entry["name"]
        assert target.read_text() == rendered, f"Regenerate {target}"
        expected_names.add(entry["name"])
    assert {p.name for p in (root / build["name"]).iterdir()} == expected_names
print("Generated contexts match their templates")
