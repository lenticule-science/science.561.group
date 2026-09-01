"""Storage layout unit tests."""

from __future__ import annotations

from pathlib import Path

import pytest

from substrate.canonicalization import canonical, cid
from storage.aliases import AliasStore
from storage.storage_layout import StorageLayout


def test_put_and_get_record_round_trip(tmp_path: Path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    body = {"entity": "foo", "predicates": {"p": "True"}}
    rid, path = layout.put_record("cells", body)
    assert path.exists()
    assert path.name.startswith(rid)
    raw = layout.get_record_bytes("cells", rid)
    assert raw == canonical({"id": rid, **body})


def test_put_idempotent(tmp_path: Path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    body = {"entity": "foo", "predicates": {"p": "True"}}
    rid1, _ = layout.put_record("cells", body)
    rid2, _ = layout.put_record("cells", body)
    assert rid1 == rid2


def test_aliases_round_trip(tmp_path: Path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    aliases = AliasStore(tmp_path)
    aliases.set("hello", "abcd1234")
    assert aliases.get("hello") == "abcd1234"
    assert aliases.list_all() == {"hello": "abcd1234"}
    aliases.remove("hello")
    assert aliases.list_all() == {}


def test_alias_invalid_name_rejected(tmp_path: Path):
    aliases = AliasStore(tmp_path)
    from substrate.error_codes import SubstrateError
    with pytest.raises(SubstrateError):
        aliases.set("BadName", "x")


def test_config_round_trip(tmp_path: Path):
    layout = StorageLayout(tmp_path)
    config = {"node_id": "x", "boot_count": 1}
    layout.write_config(config)
    assert layout.read_config() == config
