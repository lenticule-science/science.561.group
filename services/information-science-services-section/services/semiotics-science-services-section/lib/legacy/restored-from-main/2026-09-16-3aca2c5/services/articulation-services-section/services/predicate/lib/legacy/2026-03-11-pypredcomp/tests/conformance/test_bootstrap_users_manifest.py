"""Conformance — manifest-driven bootstrap-users (v0.2a freeze gate #3).

Per [`specs/init-boot/boot-sequence.md`](../../docs/dev/specs/init-boot/boot-sequence.md)
§4.1, the bootstrap routine reads a deployment manifest and emits, per
user: a kind-user cell, four canonical fiber-projection cells, a role
cell, and per-capability grant cells. The deployment manifest hash is
recorded so re-bootstrap with a different manifest is detectable.

Freeze gate: a ≥3-user manifest produces a divergence-free reconcile
(idempotent re-boot, divergence-detection on changed manifest).
"""

from __future__ import annotations

import json
import time

import pytest

from init_boot.bootstrap_users import (
    CANONICAL_FIBERS,
    BootstrapManifest,
    BootstrapUserEntry,
    default_manifest,
    ensure_default_captain,
    ensure_users_from_manifest,
    load_manifest_from_env,
    manifest_hash,
)
from init_boot.fiber_reconcile import reconcile_fibers
from process.user import authenticate, list_users
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import PCM_PAYLOAD_INVALID, SubstrateError


@pytest.fixture
def fresh_substrate(tmp_path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    log = EventLog(tmp_path)
    log.initialize(node_id="test-node", wall_clock_ns=time.time_ns())
    return layout, log


def _three_user_manifest() -> BootstrapManifest:
    return BootstrapManifest(
        users=[
            BootstrapUserEntry(
                slug="user:captain", display_name="Captain", role="admin",
            ),
            BootstrapUserEntry(
                slug="user:alice", display_name="Alice", role="member",
            ),
            BootstrapUserEntry(
                slug="user:bob", display_name="Bob", role="observer",
            ),
        ]
    )


# ---------------------------------------------------------------------------
# Manifest hash — canonical, deterministic
# ---------------------------------------------------------------------------


def test_manifest_hash_is_order_invariant():
    a = BootstrapManifest(users=[
        BootstrapUserEntry(slug="user:a", display_name="A", role="admin"),
        BootstrapUserEntry(slug="user:b", display_name="B", role="member"),
    ])
    b = BootstrapManifest(users=[
        BootstrapUserEntry(slug="user:b", display_name="B", role="member"),
        BootstrapUserEntry(slug="user:a", display_name="A", role="admin"),
    ])
    assert manifest_hash(a) == manifest_hash(b)


def test_manifest_hash_capability_order_invariant():
    a = BootstrapManifest(users=[
        BootstrapUserEntry(
            slug="user:a", display_name="A", role="admin",
            capabilities=["x", "y", "z"],
        ),
    ])
    b = BootstrapManifest(users=[
        BootstrapUserEntry(
            slug="user:a", display_name="A", role="admin",
            capabilities=["z", "y", "x"],
        ),
    ])
    assert manifest_hash(a) == manifest_hash(b)


def test_manifest_hash_changes_on_role_change():
    a = BootstrapManifest(users=[
        BootstrapUserEntry(slug="user:a", display_name="A", role="admin"),
    ])
    b = BootstrapManifest(users=[
        BootstrapUserEntry(slug="user:a", display_name="A", role="member"),
    ])
    assert manifest_hash(a) != manifest_hash(b)


# ---------------------------------------------------------------------------
# Fresh-boot provisioning — 3-user manifest, full fiber emission
# ---------------------------------------------------------------------------


def test_fresh_boot_provisions_all_users(fresh_substrate):
    layout, log = fresh_substrate
    manifest = _three_user_manifest()
    result = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node", manifest=manifest,
    )
    assert sorted(result.created_slugs) == ["user:alice", "user:bob", "user:captain"]
    assert result.prior_manifest_hash is None
    assert result.manifest_changed is False
    # All three exist on disk now.
    slugs = sorted(u.slug for u in list_users(layout))
    assert slugs == ["user:alice", "user:bob", "user:captain"]
    # Each got a plaintext token returned (delivered exactly once).
    assert set(result.tokens) == {"user:alice", "user:bob", "user:captain"}
    for tok in result.tokens.values():
        assert tok and len(tok) > 16


def test_fresh_boot_emits_full_fiber_projection_per_user(fresh_substrate):
    layout, log = fresh_substrate
    manifest = _three_user_manifest()
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node", manifest=manifest,
    )
    # For each user, the four canonical fiber projections must exist as
    # asserted cells on the user's fiber cache.
    for slug in ("boundary:captain", "boundary:alice", "boundary:bob"):
        fiber = layout.get_fiber(slug)
        assert fiber is not None, f"{slug} has no fiber cache"
        predicates = fiber.get("predicates") or {}
        for canonical in CANONICAL_FIBERS:
            key = f"projects-{canonical}-fiber"
            assert key in predicates, f"{slug} missing projection {canonical}"
            assert BilatticeValue(predicates[key]) == BilatticeValue.TRUE
        # Boundary kind cell.
        assert "kind-user" in predicates


def test_fresh_boot_emits_role_and_capability_cells(fresh_substrate):
    layout, log = fresh_substrate
    manifest = _three_user_manifest()
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node", manifest=manifest,
    )
    captain_fiber = layout.get_fiber("boundary:captain") or {}
    captain_preds = captain_fiber.get("predicates") or {}
    assert "role-admin" in captain_preds
    # Admin has runlevel:* by default.
    assert "granted:runlevel:*" in captain_preds

    observer_fiber = layout.get_fiber("boundary:bob") or {}
    observer_preds = observer_fiber.get("predicates") or {}
    assert "role-observer" in observer_preds
    # Observer does NOT have runlevel:*.
    assert "granted:runlevel:*" not in observer_preds
    assert "granted:shell:read" in observer_preds


def test_fresh_boot_records_manifest_hash_on_deployment_entity(fresh_substrate):
    layout, log = fresh_substrate
    manifest = _three_user_manifest()
    result = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node", manifest=manifest,
    )
    deploy = layout.get_fiber("deployment") or {}
    preds = deploy.get("predicates") or {}
    hash_keys = [k for k in preds if k.startswith("bootstrap-user-manifest-hash:")]
    assert len(hash_keys) == 1
    assert hash_keys[0] == f"bootstrap-user-manifest-hash:{result.manifest_hash}"


# ---------------------------------------------------------------------------
# Re-boot — idempotence
# ---------------------------------------------------------------------------


def test_reboot_with_same_manifest_is_no_op(fresh_substrate):
    layout, log = fresh_substrate
    manifest = _three_user_manifest()
    first = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node", manifest=manifest,
    )
    pre_event_count = sum(1 for _ in log.iter_events())
    pre_users = sorted(u.slug for u in list_users(layout))
    pre_tokens = first.tokens

    second = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node", manifest=manifest,
    )
    assert second.created_slugs == []
    assert second.prior_manifest_hash == first.manifest_hash
    assert second.manifest_changed is False
    assert second.tokens == {}  # no new tokens minted on re-boot
    # User set is unchanged.
    assert sorted(u.slug for u in list_users(layout)) == pre_users
    # Pre-existing tokens still authenticate (rotation NEVER happens at
    # re-boot — tokens come from create_user, which only runs once).
    for slug, tok in pre_tokens.items():
        assert authenticate(layout, tok).slug == slug
    # The deployment fiber must carry exactly ONE manifest-hash
    # predicate — the same hash recorded on first boot. A re-boot with
    # an unchanged manifest does not append a second hash record.
    deploy_fiber = layout.get_fiber("deployment") or {}
    hash_preds = [
        p for p in (deploy_fiber.get("cells_by_predicate") or {})
        if p.startswith("bootstrap-user-manifest-hash:")
    ]
    assert len(hash_preds) == 1
    assert hash_preds[0] == f"bootstrap-user-manifest-hash:{first.manifest_hash}"

    # The event log grew only by the per-user idempotent re-emissions,
    # not by any new create_user / manifest-hash records.
    post_event_count = sum(1 for _ in log.iter_events())
    # No NEW manifest-hash events.
    # Per docs/dev/questions/respond-event-payload-self-describing.md
    # (R1 ruling): respond events carry ``payload_keys`` so the event
    # log alone answers predicate-aware audit queries without joining
    # through the cell store.
    deploy_hash_events = [
        e for e in log.iter_events()
        if (e.get("body") or {}).get("target") == "deployment"
        and any(p.startswith("bootstrap-user-manifest-hash:")
                for p in ((e.get("body") or {}).get("payload_keys") or []))
    ]
    assert len(deploy_hash_events) == 1


def test_reboot_does_not_rotate_tokens(fresh_substrate):
    layout, log = fresh_substrate
    manifest = _three_user_manifest()
    first = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node", manifest=manifest,
    )
    # Re-boot — every prior token must still authenticate.
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node", manifest=manifest,
    )
    for slug, tok in first.tokens.items():
        u = authenticate(layout, tok)
        assert u.slug == slug


# ---------------------------------------------------------------------------
# Manifest change — detection
# ---------------------------------------------------------------------------


def test_changed_manifest_detected_and_recorded(fresh_substrate):
    layout, log = fresh_substrate
    first = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node",
        manifest=_three_user_manifest(),
    )
    # Captain rotates from admin → member. Same set of users; different role.
    changed_manifest = BootstrapManifest(users=[
        BootstrapUserEntry(slug="user:captain", display_name="Captain", role="member"),
        BootstrapUserEntry(slug="user:alice",   display_name="Alice",   role="member"),
        BootstrapUserEntry(slug="user:bob",     display_name="Bob",     role="observer"),
    ])
    second = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node",
        manifest=changed_manifest,
    )
    assert second.manifest_changed is True
    assert second.prior_manifest_hash == first.manifest_hash
    assert second.manifest_hash != first.manifest_hash
    # Existing users were NOT touched at the user-record level — the
    # spec says lifecycle changes go through respond, not bootstrap.
    captain_fiber = layout.get_fiber("boundary:captain") or {}
    captain_preds = captain_fiber.get("predicates") or {}
    # The original admin role is still asserted (cells are monotone;
    # the substrate doesn't retract on re-bootstrap).
    assert "role-admin" in captain_preds
    # Both manifest hashes are recorded on the deployment entity now.
    deploy = layout.get_fiber("deployment") or {}
    deploy_preds = deploy.get("predicates") or {}
    hash_keys = sorted(k for k in deploy_preds
                       if k.startswith("bootstrap-user-manifest-hash:"))
    assert len(hash_keys) == 2
    # And the change-marker cell is recorded.
    assert "bootstrap-user-manifest-changed" in deploy_preds


def test_changed_manifest_provisions_only_missing_users(fresh_substrate):
    layout, log = fresh_substrate
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node",
        manifest=_three_user_manifest(),
    )
    # New manifest adds one user (carol) and keeps the others.
    extended = BootstrapManifest(users=[
        BootstrapUserEntry(slug="user:captain", display_name="Captain", role="admin"),
        BootstrapUserEntry(slug="user:alice",   display_name="Alice",   role="member"),
        BootstrapUserEntry(slug="user:bob",     display_name="Bob",     role="observer"),
        BootstrapUserEntry(slug="user:carol",   display_name="Carol",   role="member"),
    ])
    result = ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node",
        manifest=extended,
    )
    assert result.created_slugs == ["user:carol"]
    assert "user:carol" in result.tokens
    assert set(u.slug for u in list_users(layout)) == {
        "user:captain", "user:alice", "user:bob", "user:carol",
    }


# ---------------------------------------------------------------------------
# Reconcile — divergence-free against the manifest
# ---------------------------------------------------------------------------


def test_reconcile_is_divergence_free_after_manifest_boot(fresh_substrate):
    """The freeze gate: ≥3-user manifest → reconcile reports zero divergence."""
    layout, log = fresh_substrate
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node",
        manifest=_three_user_manifest(),
    )
    summary = reconcile_fibers(layout=layout, event_log=log, strict=True)
    assert summary["divergent"] == []
    assert summary["repaired"] == []
    # Every user entity (plus deployment) showed up in the scan.
    assert summary["scanned"] >= 4


def test_reconcile_strict_raises_on_corrupted_fiber(fresh_substrate):
    """If a fiber is hand-edited to disagree with the log, strict mode raises."""
    layout, log = fresh_substrate
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node",
        manifest=_three_user_manifest(),
    )
    # Corrupt alice's fiber: drop its history.
    alice = layout.get_fiber("user:alice")
    assert alice is not None
    corrupted = dict(alice)
    corrupted["history"] = []
    layout.put_fiber("user:alice", corrupted)
    with pytest.raises(SubstrateError) as exc:
        reconcile_fibers(layout=layout, event_log=log, strict=True)
    assert exc.value.code == "PCC_PROJECTION_DIVERGED"
    assert "user:alice" in exc.value.details["divergent"]


def test_reconcile_non_strict_silently_repairs(fresh_substrate):
    """Default mode is the existing crash-recovery semantics: silent repair."""
    layout, log = fresh_substrate
    ensure_users_from_manifest(
        layout=layout, event_log=log, node_id="test-node",
        manifest=_three_user_manifest(),
    )
    alice = layout.get_fiber("user:alice")
    assert alice is not None
    layout.put_fiber("user:alice", {**alice, "history": []})
    summary = reconcile_fibers(layout=layout, event_log=log)  # strict=False
    assert "user:alice" in summary["repaired"]
    assert summary.get("divergent", []) == []


# ---------------------------------------------------------------------------
# Manifest from env — file IO + validation
# ---------------------------------------------------------------------------


def test_load_manifest_from_env_default(monkeypatch):
    monkeypatch.delenv("SUBSTRATE_BOOTSTRAP_MANIFEST", raising=False)
    m = load_manifest_from_env()
    assert len(m.users) == 1
    assert m.users[0].slug == "user:captain"


def test_load_manifest_from_env_reads_file(tmp_path, monkeypatch):
    p = tmp_path / "manifest.json"
    p.write_text(json.dumps({
        "users": [
            {"slug": "user:x", "display_name": "X", "role": "admin"},
            {"slug": "user:y", "display_name": "Y", "role": "member"},
        ]
    }))
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(p))
    m = load_manifest_from_env()
    assert sorted(u.slug for u in m.users) == ["user:x", "user:y"]


def test_load_manifest_from_env_missing_file_errors(tmp_path, monkeypatch):
    monkeypatch.setenv(
        "SUBSTRATE_BOOTSTRAP_MANIFEST", str(tmp_path / "does-not-exist.json"),
    )
    with pytest.raises(SubstrateError) as exc:
        load_manifest_from_env()
    assert exc.value.code == PCM_PAYLOAD_INVALID


def test_load_manifest_from_env_bad_schema_errors(tmp_path, monkeypatch):
    p = tmp_path / "bad.json"
    p.write_text(json.dumps({"users": [{"slug": "no-prefix", "role": "admin"}]}))
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(p))
    with pytest.raises(SubstrateError) as exc:
        load_manifest_from_env()
    assert exc.value.code == PCM_PAYLOAD_INVALID


# ---------------------------------------------------------------------------
# Backcompat — ensure_default_captain still works
# ---------------------------------------------------------------------------


def test_default_captain_backcompat(fresh_substrate):
    layout, log = fresh_substrate
    slug, created = ensure_default_captain(
        layout=layout, event_log=log, node_id="test-node",
    )
    assert slug == "user:captain"
    assert created is True
    # And the new fiber-projection cells are emitted under the back-compat path too.
    fiber = layout.get_fiber("boundary:captain") or {}
    preds = fiber.get("predicates") or {}
    for canonical in CANONICAL_FIBERS:
        assert f"projects-{canonical}-fiber" in preds
    assert "role-admin" in preds
