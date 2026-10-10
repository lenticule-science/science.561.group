"""Canonicalization conformance — round-trip and known-hash vectors."""

from __future__ import annotations

import json

from substrate.algebra import BilatticeValue
from substrate.canonicalization import canonical, cid, parse_canonical
from storage.cell_record import FiberSnapshot


def test_round_trip_byte_identity():
    obj = {"b": [3, 1, 2], "a": True, "c": {"z": None, "y": 42, "n": "hello"}}
    once = canonical(obj)
    twice = canonical(parse_canonical(once))
    assert once == twice


def test_none_keys_dropped():
    encoded = canonical({"a": 1, "b": None, "c": [1, 2]})
    assert b"\"b\"" not in encoded
    assert encoded == b'{"a":1,"c":[1,2]}'


def test_keys_sorted_lexicographically():
    encoded = canonical({"z": 1, "a": 2, "m": 3})
    assert encoded == b'{"a":2,"m":3,"z":1}'


def test_no_whitespace():
    encoded = canonical({"a": [1, 2, {"x": "y"}]})
    assert encoded == b'{"a":[1,2,{"x":"y"}]}'


def test_cell_record_id_is_hash_of_canonical_without_id():
    cell = FiberSnapshot(
        entity="hello-world",
        predicates={"greeting/positive": BilatticeValue.TRUE},
    ).with_id()
    # The canonical body matches the model dump with None values stripped;
    # default empty containers are kept as part of the schema.
    body_no_id = {
        "entity": "hello-world",
        "predicates": {"greeting/positive": "True"},
        "cells": [],
        "parents": [],
    }
    expected = cid(body_no_id)
    assert cell.id == expected
    assert cell.compute_id() == expected


def test_cell_canonical_full_byte_identical():
    cell = FiberSnapshot(
        entity="canon-test",
        predicates={"p": BilatticeValue.BOTH},
    ).with_id()
    raw = cell.canonical()
    decoded = parse_canonical(raw)
    re_encoded = canonical(decoded)
    assert raw == re_encoded
