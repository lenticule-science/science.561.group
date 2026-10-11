"""Conformance — bootstrap-user manifest canonicalization (`t02-142f`).

Pairs with [`task:t02-142`](../../docs/dev/tasks/engineering/t02-142-v0.2a-multi-user-authoring.md)
per [`decisions/fixture-authoring-paired-task.md`](../../docs/dev/decisions/fixture-authoring-paired-task.md).
This is the **byte-identity contract** for the bootstrap-user manifest defined
by [`specs/init-boot/bootstrap-manifest.md`](../../docs/dev/specs/init-boot/bootstrap-manifest.md).

The manifest hash is what gates idempotence (`t02-141`) and what cross-
implementation Rust ↔ Python diversity replays through. If two conforming
implementations disagree on the canonical bytes for the same manifest, every
downstream byte-identity claim collapses. This fixture pins the canonical
bytes and the SHA-256 hash for a reference 4-user manifest containing both
ASCII-only display names and a non-ASCII display name (``Dóra Östberg``) —
the latter would diverge under ``ensure_ascii=True``, surfacing the most
common cross-language canonicalization bug.

The five legs:

* ``test_canonical_bytes_match_pinned_fixture`` — the canonical bytes
  produced by :func:`canonical_manifest_bytes` are byte-identical with
  the on-disk ``manifest-3-users.canonical`` ground truth.
* ``test_manifest_hash_matches_pinned_fixture`` — the SHA-256 hash
  matches the on-disk ``manifest-3-users.sha256`` ground truth.
* ``test_canonical_bytes_round_trip`` — re-loading the canonical bytes
  as JSON and re-canonicalizing produces the same bytes.
* ``test_canonical_form_uses_utf8_not_ascii_escapes`` — the canonical
  bytes contain the literal UTF-8 encoding of ``Dóra``, NOT the
  ``\\u00f3`` escape that Python's default ``json.dumps`` emits. This
  is the spec §3.2 ``ensure_ascii=False`` rule structurally checked.
* ``test_canonical_form_invariant_under_input_reordering`` — shuffling
  the users array and the capabilities arrays in the source manifest
  produces the same canonical bytes (sort discipline per spec §3.1).
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

import pytest

from init_boot.bootstrap_users import (
    BootstrapManifest,
    BootstrapUserEntry,
    canonical_manifest_bytes,
    canonical_manifest_payload,
    manifest_hash,
)
from substrate.canonicalization import canonical


_FIXTURE_DIR = Path(__file__).parent.parent / "fixtures" / "bootstrap"
_MANIFEST_PATH = _FIXTURE_DIR / "manifest-3-users.json"
_CANONICAL_PATH = _FIXTURE_DIR / "manifest-3-users.canonical"
_SHA256_PATH = _FIXTURE_DIR / "manifest-3-users.sha256"


def _load_fixture_manifest() -> BootstrapManifest:
    raw = json.loads(_MANIFEST_PATH.read_text(encoding="utf-8"))
    return BootstrapManifest.model_validate(raw)


def _expected_canonical_bytes() -> bytes:
    return _CANONICAL_PATH.read_bytes().rstrip(b"\n")


def _expected_sha256() -> str:
    return _SHA256_PATH.read_text(encoding="utf-8").strip()


# ---------------------------------------------------------------------------
# Pinned ground-truth witnesses
# ---------------------------------------------------------------------------


def test_canonical_bytes_match_pinned_fixture():
    """Pin the canonical bytes against `manifest-3-users.canonical`."""
    manifest = _load_fixture_manifest()
    produced = canonical_manifest_bytes(manifest)
    expected = _expected_canonical_bytes()
    assert produced == expected, (
        f"canonical-bytes drift: produced sha256="
        f"{hashlib.sha256(produced).hexdigest()}, expected sha256="
        f"{hashlib.sha256(expected).hexdigest()}"
    )


def test_manifest_hash_matches_pinned_fixture():
    """Pin SHA-256 against `manifest-3-users.sha256`."""
    manifest = _load_fixture_manifest()
    assert manifest_hash(manifest) == _expected_sha256()


# ---------------------------------------------------------------------------
# Structural rules (spec §3)
# ---------------------------------------------------------------------------


def test_canonical_bytes_round_trip():
    """`canonical(json.loads(canonical(x))) == canonical(x)`.

    Required by [`canonicalization.md`](../../docs/dev/specs/kernel/canonicalization.md)
    §5 — any replay must re-canonicalize and produce identical bytes.
    """
    manifest = _load_fixture_manifest()
    once = canonical_manifest_bytes(manifest)
    decoded = json.loads(once.decode("utf-8"))
    twice = canonical(decoded)
    assert once == twice


def test_canonical_form_uses_utf8_not_ascii_escapes():
    """Spec §3.2 — non-ASCII characters appear verbatim, NOT as `\\uXXXX`.

    The reference manifest contains ``Dóra Östberg``; the canonical bytes
    must contain the UTF-8 encoding of ``ó`` (``0xc3 0xb3``), not the
    ASCII escape ``\\u00f3``. This is the cross-implementation byte-identity
    bug that ``ensure_ascii=True`` introduces silently.
    """
    manifest = _load_fixture_manifest()
    raw = canonical_manifest_bytes(manifest)
    assert "Dóra".encode("utf-8") in raw
    assert b"\\u00f3" not in raw  # ASCII-escape form must NOT appear


def test_canonical_form_invariant_under_input_reordering():
    """Spec §3.1 — users sorted by slug; capabilities sorted in-entry.

    Permuting the source-side ordering must not change the canonical
    bytes; that's the hash-stability gate the idempotence path depends on.
    """
    manifest = _load_fixture_manifest()
    canonical_a = canonical_manifest_bytes(manifest)

    shuffled = BootstrapManifest(
        users=list(reversed([
            BootstrapUserEntry(
                slug=u.slug,
                display_name=u.display_name,
                role=u.role,
                capabilities=list(reversed(u.capabilities)),
            )
            for u in manifest.users
        ]))
    )
    canonical_b = canonical_manifest_bytes(shuffled)
    assert canonical_a == canonical_b
    assert manifest_hash(manifest) == manifest_hash(shuffled)


# ---------------------------------------------------------------------------
# Schema closure (spec §2.2)
# ---------------------------------------------------------------------------


def test_unknown_top_level_key_rejected():
    """Spec §2.2 — closed schema."""
    bad = {"users": [], "extra": "nope"}
    from pydantic import ValidationError
    with pytest.raises(ValidationError):
        BootstrapManifest.model_validate(bad)


def test_unknown_user_entry_key_rejected():
    bad = {"users": [{
        "slug": "user:x", "display_name": "X", "role": "admin",
        "capabilities": [], "extra": "nope",
    }]}
    from pydantic import ValidationError
    with pytest.raises(ValidationError):
        BootstrapManifest.model_validate(bad)


def test_unknown_role_rejected():
    bad = {"users": [{
        "slug": "user:x", "display_name": "X", "role": "wizard",
        "capabilities": [],
    }]}
    from pydantic import ValidationError
    with pytest.raises(ValidationError):
        BootstrapManifest.model_validate(bad)


def test_slug_without_user_prefix_rejected():
    """Spec §2.1 — `slug` MUST start with `user:`."""
    from pydantic import ValidationError
    bad = {"users": [{
        "slug": "captain", "display_name": "X", "role": "admin",
    }]}
    with pytest.raises(ValidationError):
        BootstrapManifest.model_validate(bad)


def test_empty_user_local_part_rejected():
    from pydantic import ValidationError
    bad = {"users": [{
        "slug": "user:", "display_name": "X", "role": "admin",
    }]}
    with pytest.raises(ValidationError):
        BootstrapManifest.model_validate(bad)


def test_duplicate_slug_rejected():
    """Spec §2.2 — slugs MUST be unique within one manifest."""
    from pydantic import ValidationError
    bad = {"users": [
        {"slug": "user:a", "display_name": "A", "role": "admin"},
        {"slug": "user:a", "display_name": "A2", "role": "member"},
    ]}
    with pytest.raises(ValidationError):
        BootstrapManifest.model_validate(bad)


def test_missing_required_entry_field_rejected():
    """Spec §2.2 — required fields per §2.1 cannot be omitted."""
    from pydantic import ValidationError
    for field in ("slug", "display_name", "role"):
        entry = {"slug": "user:x", "display_name": "X", "role": "admin"}
        entry.pop(field)
        with pytest.raises(ValidationError):
            BootstrapManifest.model_validate({"users": [entry]})


def test_missing_users_key_rejected():
    """Spec §2.2 — `users` is required."""
    from pydantic import ValidationError
    with pytest.raises(ValidationError):
        BootstrapManifest.model_validate({})


def test_non_array_users_rejected():
    """Spec §2.2 — `users` must be an array."""
    from pydantic import ValidationError
    with pytest.raises(ValidationError):
        BootstrapManifest.model_validate({"users": "user:captain"})
    with pytest.raises(ValidationError):
        BootstrapManifest.model_validate({"users": {"slug": "user:x"}})


# ---------------------------------------------------------------------------
# Public-path error mapping (spec §1, §2.2): malformed manifests surface as
# `PCM_PAYLOAD_INVALID` through `load_manifest_from_env`, not raw Pydantic.
# ---------------------------------------------------------------------------


def test_load_manifest_from_env_maps_invalid_to_substrate_error(tmp_path, monkeypatch):
    """A malformed file at `$SUBSTRATE_BOOTSTRAP_MANIFEST` surfaces as
    `PCM_PAYLOAD_INVALID`, not a raw `pydantic.ValidationError`. This is
    the spec §1 + §2.2 contract through the public boot-harness path.
    """
    from init_boot.bootstrap_users import load_manifest_from_env
    from substrate.error_codes import PCM_PAYLOAD_INVALID, SubstrateError

    bad_path = tmp_path / "bad.json"
    bad_path.write_text(
        json.dumps({"users": [{"slug": "captain", "display_name": "X", "role": "admin"}]}),
        encoding="utf-8",
    )
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(bad_path))
    with pytest.raises(SubstrateError) as exc:
        load_manifest_from_env()
    assert exc.value.code == PCM_PAYLOAD_INVALID


# ---------------------------------------------------------------------------
# Canonical-form payload structure (spec §3.1)
# ---------------------------------------------------------------------------


def test_canonical_payload_has_exactly_four_fields_per_user():
    manifest = _load_fixture_manifest()
    payload = canonical_manifest_payload(manifest)
    assert set(payload.keys()) == {"users"}
    expected_keys = {"slug", "display_name", "role", "capabilities"}
    for entry in payload["users"]:
        assert set(entry.keys()) == expected_keys


def test_canonical_payload_users_sorted_by_slug():
    manifest = _load_fixture_manifest()
    payload = canonical_manifest_payload(manifest)
    slugs = [u["slug"] for u in payload["users"]]
    assert slugs == sorted(slugs)


def test_canonical_payload_capabilities_sorted():
    manifest = BootstrapManifest(users=[
        BootstrapUserEntry(
            slug="user:x", display_name="X", role="admin",
            capabilities=["zeta", "alpha", "mu"],
        ),
    ])
    payload = canonical_manifest_payload(manifest)
    assert payload["users"][0]["capabilities"] == ["alpha", "mu", "zeta"]
