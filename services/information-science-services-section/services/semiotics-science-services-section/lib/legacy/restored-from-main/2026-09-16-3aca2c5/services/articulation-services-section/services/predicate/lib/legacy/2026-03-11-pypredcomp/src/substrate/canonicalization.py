"""Canonical JSON encoding — the byte-identity contract.

Per ``specs/kernel/canonicalization.md``::

    - keys sorted lexicographically
    - no whitespace
    - UTF-8 encoded
    - ``None`` defaults dropped from records before serialization
    - numbers in minimal canonical form: integral-valued floats demote
      to ints (``1.0 → "1"``, ``-3.0 → "-3"``); non-integer floats use
      Python's shortest round-trip repr (``0.1 → "0.1"``); ``NaN`` and
      ``±inf`` are rejected.

The single primitive is :func:`canonical`. Content addressing uses
:func:`cid` which is ``sha256(canonical(obj))`` rendered as 64 lowercase
hex chars.
"""

from __future__ import annotations

import hashlib
import json
import math
from typing import Any

JSON = Any

# Integral floats above this magnitude are *not* demoted to int — beyond
# 2**53, IEEE-754 doubles cannot represent every integer, so the safer
# canonical form is to keep the original float tokens.
_INT_DEMOTE_LIMIT = 1 << 53


def _strip_and_normalize(obj: JSON) -> JSON:
    """Recursive normalizer.

    * Drops ``None``-valued keys from dicts (matching "null defaults must
      not be serialized").
    * Demotes integral-valued floats to ``int`` so that ``1.0`` and
      ``1`` produce identical canonical bytes.
    * Rejects non-finite floats.
    * Lists are preserved (``None`` may be a meaningful list element);
      only object/dict keys with ``None`` values are removed.
    """
    if isinstance(obj, bool):
        # Must come before the int branch — bool is a subclass of int.
        return obj
    if isinstance(obj, float):
        if not math.isfinite(obj):
            raise ValueError(f"non-finite float {obj!r} not allowed in canonical JSON")
        if obj.is_integer() and abs(obj) < _INT_DEMOTE_LIMIT:
            return int(obj)
        return obj
    if isinstance(obj, dict):
        return {k: _strip_and_normalize(v) for k, v in obj.items() if v is not None}
    if isinstance(obj, list):
        return [_strip_and_normalize(v) for v in obj]
    return obj


def canonical(obj: JSON) -> bytes:
    """Encode ``obj`` to canonical JSON bytes."""
    cleaned = _strip_and_normalize(obj)
    return json.dumps(
        cleaned,
        sort_keys=True,
        separators=(",", ":"),
        ensure_ascii=False,
        allow_nan=False,
    ).encode("utf-8")


def canonical_str(obj: JSON) -> str:
    return canonical(obj).decode("utf-8")


def cid(obj: JSON) -> str:
    """Content identifier — lowercase hex SHA-256 of canonical bytes."""
    return hashlib.sha256(canonical(obj)).hexdigest()


def cid_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def parse_canonical(data: bytes | str) -> JSON:
    """Decode a canonical JSON blob back to a Python object."""
    if isinstance(data, bytes):
        data = data.decode("utf-8")
    return json.loads(data)
