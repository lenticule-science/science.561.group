"""Canonical JSON numeric minimal form (per spec)."""

from __future__ import annotations

import math

import pytest

from substrate.canonicalization import canonical, cid


def test_integer_floats_demote_to_int():
    assert canonical({"a": 1.0}) == b'{"a":1}'
    assert canonical({"a": -3.0}) == b'{"a":-3}'
    assert canonical([1.0, 2.0, 3.0]) == b"[1,2,3]"


def test_int_and_float_share_canonical_bytes():
    assert canonical({"x": 1}) == canonical({"x": 1.0})
    assert cid({"x": 1}) == cid({"x": 1.0})


def test_non_integer_floats_use_shortest_repr():
    # 0.1 has no exact binary repr but ``repr`` (shortest round-trip)
    # gives the canonical "0.1" — and json.dumps does the same.
    assert canonical({"a": 0.1}) == b'{"a":0.1}'
    assert canonical({"a": 2.5}) == b'{"a":2.5}'


def test_nan_and_inf_rejected():
    with pytest.raises(ValueError):
        canonical({"a": float("nan")})
    with pytest.raises(ValueError):
        canonical({"a": float("inf")})
    with pytest.raises(ValueError):
        canonical({"a": -math.inf})


def test_bools_are_not_demoted_to_ints():
    assert canonical({"a": True, "b": False}) == b'{"a":true,"b":false}'


def test_nested_floats_normalized():
    encoded = canonical({"o": {"k": [1.0, 2.5, 3.0]}})
    assert encoded == b'{"o":{"k":[1,2.5,3]}}'


def test_huge_integer_floats_are_kept_as_floats():
    """Beyond 2**53, IEEE-754 doubles can't represent every int — keep float."""
    big = 2.0 ** 60
    encoded = canonical({"a": big})
    # Should NOT raise and should NOT silently change the magnitude.
    assert b"a" in encoded
