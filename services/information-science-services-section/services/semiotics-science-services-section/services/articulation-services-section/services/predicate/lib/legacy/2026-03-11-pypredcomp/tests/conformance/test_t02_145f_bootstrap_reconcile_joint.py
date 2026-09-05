"""Conformance — joint bootstrap-users + fiber-cache reconcile fixture (`t02-145f`).

Pairs with `task:t02-145` per the freeze-gate-3 split of v0.2a (see
[milestones/v0.2a-multi-user-single-node.md](../../docs/dev/milestones/v0.2a-multi-user-single-node.md)
§"Freeze gates" #3). Where `test_bootstrap_users_manifest.py` exercises the
provisioning routine in isolation by calling `ensure_users_from_manifest`
directly, *this* fixture drives the full :func:`init_boot.boot.boot` PHASES
sequence end-to-end on a ≥3-user manifest, then exercises the bootstrap +
reconcile interaction across reboots and crash-injection.

The freeze gate it proves:

    "bootstrap_users and fiber_reconcile boot-phase routines exist and produce
     divergence-free reconcile against a multi-user manifest of ≥3 users."

Specifically, joint behaviour the per-feature suites can't see:

* Phase wiring — the actual ``boot()`` PHASES list invokes both routines in
  the spec'd order, and a ≥3-user manifest threads through.
* Idempotent re-boot — second boot adds zero bootstrap-users events to the log
  (the ``_emit_user_cells`` skip-if-already-true short-circuit + the
  manifest-hash-not-changed short-circuit, together).
* Crash-recovery interaction — fiber deletion between boots is silently
  rebuilt by the reconcile phase, then bootstrap_users still recognises the
  user as existing (no token rotation, no re-creation).
* Strict-mode divergence — a hand-corrupted fiber history degrades the second
  boot at ``fiber_reconcile`` rather than letting bootstrap-users run on a
  divergent cache.
"""

from __future__ import annotations

import json
from pathlib import Path

import pytest

from init_boot.boot import boot
from init_boot.bootstrap_users import CANONICAL_FIBERS
from process.user import authenticate, list_users
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue


def _write_manifest(tmp_path: Path) -> Path:
    p = tmp_path / "manifest.json"
    p.write_text(json.dumps({
        "users": [
            {"slug": "user:captain", "display_name": "Captain", "role": "admin"},
            {"slug": "user:alice",   "display_name": "Alice",   "role": "member"},
            {"slug": "user:bob",     "display_name": "Bob",     "role": "observer"},
            {"slug": "user:carol",   "display_name": "Carol",   "role": "member"},
            {"slug": "user:dave",    "display_name": "Dave",    "role": "member"},
        ]
    }))
    return p


# ---------------------------------------------------------------------------
# End-to-end first-boot through PHASES sequence
# ---------------------------------------------------------------------------


def test_first_boot_provisions_full_manifest_through_phases(tmp_path, monkeypatch):
    """A ≥3-user manifest threaded through ``boot()`` provisions every user
    with full fiber emission and a divergence-free reconcile."""
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(_write_manifest(tmp_path)))

    ctx = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx.failed_phase is None, ctx.phase_log
    assert ctx.bootstrap_result is not None
    assert sorted(ctx.bootstrap_result.created_slugs) == [
        "user:alice", "user:bob", "user:captain", "user:carol", "user:dave",
    ]
    # Personnel migration ran but there are no personnel records → no-op.
    assert ctx.personnel_migration_summary == {
        "scanned": 0, "migrated": [], "skipped": [],
    }

    # All five users on disk, each with full canonical projection.
    layout = StorageLayout(tmp_path)
    user_slugs = sorted(u.slug for u in list_users(layout))
    assert user_slugs == [
        "user:alice", "user:bob", "user:captain", "user:carol", "user:dave",
    ]
    # Identity cells (kind-user / projects-*-fiber) live on the boundary
    # surface — see init_boot.bootstrap_users module docstring +
    # decisions/personnel-migration-sequenced-before-bootstrap-users.md.
    # ``user:<bare>`` carries only the auth-record + ``provisioned`` cell.
    for slug in user_slugs:
        boundary_slug = "boundary:" + slug.split(":", 1)[1]
        fiber = layout.get_fiber(boundary_slug) or {}
        preds = fiber.get("predicates") or {}
        assert "kind-user" in preds, (boundary_slug, sorted(preds))
        for fname in CANONICAL_FIBERS:
            assert f"projects-{fname}-fiber" in preds, (boundary_slug, fname)


def test_first_boot_records_manifest_hash_uniformly(tmp_path, monkeypatch):
    """Manifest hash audit cell lands on first boot and only first boot."""
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(_write_manifest(tmp_path)))
    ctx = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    layout = StorageLayout(tmp_path)
    deploy = layout.get_fiber("deployment") or {}
    hash_keys = [
        k for k in (deploy.get("predicates") or {})
        if k.startswith("bootstrap-user-manifest-hash:")
    ]
    assert len(hash_keys) == 1
    assert hash_keys[0] == f"bootstrap-user-manifest-hash:{ctx.bootstrap_result.manifest_hash}"


# ---------------------------------------------------------------------------
# Idempotent re-boot — joint bootstrap + reconcile see no work
# ---------------------------------------------------------------------------


def test_reboot_appends_zero_bootstrap_events(tmp_path, monkeypatch):
    """Idempotent re-boot adds no per-user assertion events to the log.

    Tightens the per-feature suite's assertion (``no NEW manifest-hash
    events``) into the stronger ``no NEW respond events at all from the
    bootstrap_users phase``. This is the gate-3 idempotence freeze: the
    second boot of a clean substrate is observably a no-op at the event-log
    level, not just at the substrate-state level.
    """
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(_write_manifest(tmp_path)))
    ctx1 = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx1.failed_phase is None

    # Snapshot respond-event count immediately after first boot, then re-boot
    # and verify the second boot contributed zero new respond events. This is
    # the load-bearing idempotence claim: re-boot is a no-op on the truth log,
    # not just on the materialized fibers.
    responds_after_first = _count_responds(tmp_path)
    ctx2 = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx2.failed_phase is None
    responds_after_second = _count_responds(tmp_path)

    assert responds_after_second == responds_after_first, (
        "idempotent re-boot must append zero respond events; "
        f"grew from {responds_after_first} to {responds_after_second}"
    )

    # Cross-check via the BootstrapResult shape: nothing created, manifest
    # unchanged, no tokens re-issued.
    assert ctx2.bootstrap_result is not None
    assert ctx2.bootstrap_result.created_slugs == []
    assert ctx2.bootstrap_result.manifest_changed is False
    assert ctx2.bootstrap_result.tokens == {}
    # Personnel-migration phase remained a no-op (no legacy records here).
    assert ctx2.personnel_migration_summary == {
        "scanned": 0, "migrated": [], "skipped": [],
    }

    # And a third boot is still a no-op — confirms steady-state, not a one-shot.
    ctx3 = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx3.failed_phase is None
    assert _count_responds(tmp_path) == responds_after_first


def _count_responds(root: Path) -> int:
    log = EventLog(root)
    return sum(1 for ev in log.iter_events() if ev.get("kind") == "respond")


# ---------------------------------------------------------------------------
# Crash-recovery joint behaviour
# ---------------------------------------------------------------------------


def test_reboot_after_fiber_deletion_silently_rebuilds_then_recognises_user(
    tmp_path, monkeypatch,
):
    """Sim mid-write crash: delete a fiber file. Re-boot's reconcile rebuilds
    silently; bootstrap_users then recognises the user as existing (no token
    rotation, no re-creation, no manifest-hash growth).
    """
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(_write_manifest(tmp_path)))
    ctx1 = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx1.failed_phase is None
    alice_token = ctx1.bootstrap_result.tokens["user:alice"]

    # Crash-recovery: drop alice's fiber file (the rest of the substrate is fine).
    layout = StorageLayout(tmp_path)
    fiber_path = layout.fiber_path("user:alice")
    assert fiber_path.exists()
    fiber_path.unlink()

    ctx2 = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx2.failed_phase is None
    # Reconcile silently rebuilt alice's fiber.
    rec = next(p for p in ctx2.phase_log if p["phase"] == "fiber_reconcile")
    assert rec["ok"] is True
    assert rec["entities_repaired"] >= 1
    # bootstrap_users saw alice as existing — no new tokens.
    assert ctx2.bootstrap_result is not None
    assert ctx2.bootstrap_result.created_slugs == []
    # alice's pre-crash token still authenticates.
    layout2 = StorageLayout(tmp_path)
    assert authenticate(layout2, alice_token).slug == "user:alice"


def test_reboot_after_fiber_history_corruption_degrades_at_reconcile(
    tmp_path, monkeypatch,
):
    """Hand-corrupted fiber history (history truncated to []) is divergence,
    not crash-recovery. Strict reconcile catches it; boot fails at
    ``fiber_reconcile`` BEFORE bootstrap_users runs on a divergent cache."""
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(_write_manifest(tmp_path)))
    boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)

    layout = StorageLayout(tmp_path)
    bob = layout.get_fiber("user:bob")
    assert bob is not None and bob.get("history")
    layout.put_fiber("user:bob", {**bob, "history": []})

    ctx = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx.failed_phase == "fiber_reconcile"
    rec = next(p for p in ctx.phase_log if p["phase"] == "fiber_reconcile")
    assert rec["ok"] is False
    assert "PCC_PROJECTION_DIVERGED" in rec.get("error", "")
    # bootstrap_users phase did NOT run after the failure.
    later_phases = [p["phase"] for p in ctx.phase_log if p["phase"] == "bootstrap_users"]
    assert later_phases == []


# ---------------------------------------------------------------------------
# Orphan fiber detection (strict-mode reconcile addition)
# ---------------------------------------------------------------------------


def test_reboot_after_boundary_fiber_history_corruption_degrades_at_reconcile(
    tmp_path, monkeypatch,
):
    """Companion to ``test_reboot_after_fiber_history_corruption_…`` on the
    boundary identity surface.

    Per [decisions/personnel-migration-sequenced-before-bootstrap-users.md](../../docs/dev/decisions/personnel-migration-sequenced-before-bootstrap-users.md)
    + boot-sequence.md §4.0–§4.1, identity cells (kind-user / projects-* /
    role-* / granted:*) live on ``boundary:<bare>``. The user-surface
    companion above pins divergence detection on the auth-record fiber
    (single ``provisioned`` cell); this leg pins the same contract on the
    *richer* boundary fiber (kind + 4 projections + role + multiple grants).
    Catches regressions where strict reconcile drops boundary entities from
    the scan or where the boundary projection becomes silently unrepairable.
    """
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(_write_manifest(tmp_path)))
    boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)

    layout = StorageLayout(tmp_path)
    bob_boundary = layout.get_fiber("boundary:bob")
    assert bob_boundary is not None and bob_boundary.get("history"), (
        "boundary:bob must carry a non-empty history (kind-user + 4 projections "
        "+ role-observer + per-cap grants emitted by bootstrap_users.§4.1)"
    )
    layout.put_fiber("boundary:bob", {**bob_boundary, "history": []})

    ctx = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx.failed_phase == "fiber_reconcile"
    rec = next(p for p in ctx.phase_log if p["phase"] == "fiber_reconcile")
    assert rec["ok"] is False
    assert "PCC_PROJECTION_DIVERGED" in rec.get("error", "")
    later_phases = [p["phase"] for p in ctx.phase_log if p["phase"] == "bootstrap_users"]
    assert later_phases == []


def test_reboot_with_boundary_orphan_fiber_degrades_at_reconcile(
    tmp_path, monkeypatch,
):
    """Companion to ``test_reboot_with_orphan_fiber_degrades_…`` on the
    boundary identity surface.

    A planted ``boundary:ghost`` fiber with no log truth is an orphan on
    the spec-mandated identity surface; strict reconcile must flag it as
    PCC_PROJECTION_DIVERGED just like the user-surface orphan. Catches
    regressions where reconcile only walks the user surface or skips
    boundary-only fibers.
    """
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(_write_manifest(tmp_path)))
    boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)

    layout = StorageLayout(tmp_path)
    layout.put_fiber("boundary:ghost", {
        "entity": "boundary:ghost",
        "latest_cell_id": "deadbeef",
        "predicates": {"kind-user": "true"},
        "cells_by_predicate": {"kind-user": "deadbeef"},
        "history": [{"event_id": "x", "event_ord": 999, "cell_id": "deadbeef"}],
    })

    ctx = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx.failed_phase == "fiber_reconcile"
    rec = next(p for p in ctx.phase_log if p["phase"] == "fiber_reconcile")
    assert "PCC_PROJECTION_DIVERGED" in rec.get("error", "")


def test_reboot_with_orphan_fiber_degrades_at_reconcile(tmp_path, monkeypatch):
    """A fiber present on disk but with no log truth is an orphan; strict
    reconcile flags it as PCC_PROJECTION_DIVERGED. Crash-recovery semantics
    don't apply (there's nothing in the log to rebuild from)."""
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(_write_manifest(tmp_path)))
    boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)

    # Plant a hand-written fiber with no corresponding log events.
    layout = StorageLayout(tmp_path)
    layout.put_fiber("user:ghost", {
        "entity": "user:ghost",
        "latest_cell_id": "deadbeef",
        "predicates": {"kind-user": "true"},
        "cells_by_predicate": {"kind-user": "deadbeef"},
        "history": [{"event_id": "x", "event_ord": 999, "cell_id": "deadbeef"}],
    })

    ctx = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    assert ctx.failed_phase == "fiber_reconcile"
    rec = next(p for p in ctx.phase_log if p["phase"] == "fiber_reconcile")
    assert "PCC_PROJECTION_DIVERGED" in rec.get("error", "")


# ---------------------------------------------------------------------------
# All-five-users token round-trip after divergence-free re-boot
# ---------------------------------------------------------------------------


def test_all_user_tokens_survive_clean_reboot(tmp_path, monkeypatch):
    """Every token issued at first boot still authenticates after a clean
    re-boot. The freeze-gate-3 multi-user surface is stable across boots."""
    monkeypatch.setenv("SUBSTRATE_BOOTSTRAP_MANIFEST", str(_write_manifest(tmp_path)))
    ctx1 = boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)
    tokens = dict(ctx1.bootstrap_result.tokens)
    assert set(tokens) == {
        "user:captain", "user:alice", "user:bob", "user:carol", "user:dave",
    }

    boot(root=tmp_path, node_id="n", host="0.0.0.0", port=5000)

    layout = StorageLayout(tmp_path)
    for slug, tok in tokens.items():
        assert authenticate(layout, tok).slug == slug
