"""Alias on-disk format pins to the filesystem spec."""

from __future__ import annotations

import json
from pathlib import Path

from substrate.canonicalization import canonical
from storage.aliases import AliasStore, validate_alias_name


def test_alias_file_body_is_target_only(tmp_path: Path):
    store = AliasStore(tmp_path)
    path = store.set("hello", "cell:abc123")
    body = json.loads(path.read_bytes().decode("utf-8"))
    assert body == {"target": "cell:abc123"}
    assert "name" not in body, "alias name lives in the filename, not the body"


def test_alias_file_bytes_are_canonical(tmp_path: Path):
    store = AliasStore(tmp_path)
    path = store.set("kebab-name", "cell:xyz")
    assert path.read_bytes() == canonical({"target": "cell:xyz"})


def test_alias_filename_is_the_name(tmp_path: Path):
    store = AliasStore(tmp_path)
    path = store.set("rsc-quiescent", "cell:0")
    assert path.name == "rsc-quiescent"
    assert path.parent == tmp_path / "aliases"


def test_alias_nested_name_round_trips(tmp_path: Path):
    """Alias names may contain ``/`` per spec §2; ``set`` writes nested
    files and ``get`` / ``list_all`` round-trip the slash-form name."""
    store = AliasStore(tmp_path)
    store.set("scope:engineering/tasks", "task:")
    store.set("scope:accounting/entries", "entry:")
    store.set("flat-alias", "cell:0")
    assert store.get("scope:engineering/tasks") == "task:"
    listed = store.list_all()
    assert listed["scope:engineering/tasks"] == "task:"
    assert listed["scope:accounting/entries"] == "entry:"
    assert listed["flat-alias"] == "cell:0"


def test_alias_kind_prefix_target_is_supported(tmp_path: Path):
    """Per spec §1, an alias target may be a kind-prefix (`<kind>:`)
    used by the path resolver to bind sub-scope → entity-kind."""
    store = AliasStore(tmp_path)
    store.set("scope:engineering/tasks", "task:")
    assert store.get("scope:engineering/tasks").endswith(":")
