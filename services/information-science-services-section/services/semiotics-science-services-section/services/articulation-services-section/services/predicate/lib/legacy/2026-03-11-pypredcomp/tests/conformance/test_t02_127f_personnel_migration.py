"""Conformance — personnel-to-boundary migration (`pt-08` / `t02-127f`).

Pairs with `pt-08-personnel-to-boundary-migration` and the v0.2a milestone
slot for `t02-127`. Per the
[`identity-is-boundary-projection`](../../docs/dev/decisions/identity-is-boundary-projection.md)
decision, v0.1 substrates emitted ``personnel-record`` cells; v0.2 promotes
identity to *boundary* entities. The migration is a one-shot natural
transformation that runs as a boot phase **before** ``bootstrap_users``
(and well before ``runlevel_promote``).

Acceptance per pt-08:

* Boot phase detects legacy ``personnel-record`` cells without
  ``migrated-to-boundary-at-ord`` and emits boundary records.
* Migration audit cell is written.
* Re-running on an already-migrated store is a no-op.
* Migration pins the boundary-scheme version; a divergent recorded
  scheme on re-boot raises ``PCB_BOUNDARY_SCHEME_DIVERGED``.
* ``legacy_view`` reconstructs the v0.1 personnel-record shape from a
  migrated boundary (partial reconstruction — only carried predicates).
"""

from __future__ import annotations

import time
from pathlib import Path

import pytest

from init_boot.bootstrap_users import CANONICAL_FIBERS
from storage.event_log import EVENT_LOG_FILENAME
from init_boot.personnel_migration import (
    BOUNDARY_SCHEME_VERSION,
    MIGRATED_PREDICATE_PREFIX,
    SCHEME_PREDICATE_PREFIX,
    legacy_view,
    migrate_personnel_to_boundary,
)
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout
from substrate.algebra import BilatticeValue
from substrate.error_codes import (
    PCB_BOUNDARY_NOT_FOUND,
    PCB_BOUNDARY_SCHEME_DIVERGED,
    SubstrateError,
)
from substrate.stdlib import assert_cell


@pytest.fixture
def fresh_substrate(tmp_path):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    log = EventLog(tmp_path)
    log.initialize(node_id="n", wall_clock_ns=time.time_ns())
    return layout, log


def _seed_personnel(layout, log, slug: str, role: str | None = None) -> None:
    """Synthesize a v0.1-style personnel-record cell with optional role."""
    assert_cell(
        layout=layout, event_log=log, node_id="n",
        s=slug, p="kind-personnel-record", v=BilatticeValue.TRUE, sender="system",
    )
    if role is not None:
        assert_cell(
            layout=layout, event_log=log, node_id="n",
            s=slug, p=f"role-{role}", v=BilatticeValue.TRUE, sender="system",
        )


# ---------------------------------------------------------------------------
# Fresh substrate — no personnel records → no-op
# ---------------------------------------------------------------------------


def test_no_personnel_records_is_no_op(fresh_substrate):
    layout, log = fresh_substrate
    summary = migrate_personnel_to_boundary(
        layout=layout, event_log=log, node_id="n",
    )
    assert summary == {"scanned": 0, "migrated": [], "skipped": []}


# ---------------------------------------------------------------------------
# Migration emits boundary + four projections + audit cell
# ---------------------------------------------------------------------------


def test_migrates_personnel_to_boundary_with_full_projection(fresh_substrate):
    layout, log = fresh_substrate
    _seed_personnel(layout, log, "personnel:emsenn", role="admin")
    _seed_personnel(layout, log, "personnel:cassia-lorne", role="member")

    summary = migrate_personnel_to_boundary(
        layout=layout, event_log=log, node_id="n",
    )
    assert summary["scanned"] == 2
    assert sorted(summary["migrated"]) == [
        "personnel:cassia-lorne", "personnel:emsenn",
    ]
    assert summary["skipped"] == []

    # Boundary entities exist with kind + four canonical projections.
    for bare in ("emsenn", "cassia-lorne"):
        boundary = f"boundary:{bare}"
        b = layout.get_fiber(boundary) or {}
        preds = b.get("predicates") or {}
        assert "kind-user" in preds
        for fname in CANONICAL_FIBERS:
            assert f"projects-{fname}-fiber" in preds, (boundary, fname)

    # Carried-forward role for emsenn.
    em = layout.get_fiber("boundary:emsenn") or {}
    assert "role-admin" in (em.get("predicates") or {})

    # Audit cell on the personnel side.
    em_personnel = layout.get_fiber("personnel:emsenn") or {}
    audit_keys = [
        k for k in (em_personnel.get("predicates") or {})
        if k.startswith(MIGRATED_PREDICATE_PREFIX)
    ]
    assert len(audit_keys) == 1


# ---------------------------------------------------------------------------
# Idempotence
# ---------------------------------------------------------------------------


def test_re_migration_is_no_op(fresh_substrate):
    layout, log = fresh_substrate
    _seed_personnel(layout, log, "personnel:emsenn", role="admin")
    migrate_personnel_to_boundary(layout=layout, event_log=log, node_id="n")

    height_before = log.height()
    summary = migrate_personnel_to_boundary(
        layout=layout, event_log=log, node_id="n",
    )
    height_after = log.height()

    assert summary["scanned"] == 1
    assert summary["migrated"] == []
    assert summary["skipped"] == ["personnel:emsenn"]
    # Crucially: zero new events appended.
    assert height_after == height_before


# ---------------------------------------------------------------------------
# Personnel without kind-personnel-record → not migrated
# ---------------------------------------------------------------------------


def test_personnel_without_kind_predicate_is_skipped(fresh_substrate):
    """A personnel:* slug touched by some other respond, but with no
    kind-personnel-record predicate, is not a v0.1 personnel record and
    must not be migrated."""
    layout, log = fresh_substrate
    assert_cell(
        layout=layout, event_log=log, node_id="n",
        s="personnel:not-a-record", p="some-other-cell",
        v=BilatticeValue.TRUE, sender="system",
    )
    summary = migrate_personnel_to_boundary(
        layout=layout, event_log=log, node_id="n",
    )
    assert summary["scanned"] == 1
    assert summary["migrated"] == []
    assert summary["skipped"] == ["personnel:not-a-record"]
    # No boundary was created.
    assert layout.get_fiber("boundary:not-a-record") is None


# ---------------------------------------------------------------------------
# Boundary-scheme version is pinned on migration
# ---------------------------------------------------------------------------


def test_migration_pins_boundary_scheme_version(fresh_substrate):
    layout, log = fresh_substrate
    _seed_personnel(layout, log, "personnel:emsenn", role="admin")
    migrate_personnel_to_boundary(layout=layout, event_log=log, node_id="n")

    em_personnel = layout.get_fiber("personnel:emsenn") or {}
    scheme_keys = [
        k for k in (em_personnel.get("predicates") or {})
        if k.startswith(SCHEME_PREDICATE_PREFIX)
    ]
    assert scheme_keys == [f"{SCHEME_PREDICATE_PREFIX}{BOUNDARY_SCHEME_VERSION}"]


# ---------------------------------------------------------------------------
# Divergent recorded scheme → PCB_BOUNDARY_SCHEME_DIVERGED
# ---------------------------------------------------------------------------


def test_re_migration_with_divergent_recorded_scheme_raises(fresh_substrate):
    """A personnel migrated under a foreign scheme (e.g. a hypothetical
    v0.3 substrate writing back to a shared $ROOT, or a downgrade) must
    cause re-boot to fail loudly rather than silently re-derive."""
    layout, log = fresh_substrate
    _seed_personnel(layout, log, "personnel:emsenn", role="admin")
    # Synthesize an already-migrated personnel record carrying a foreign
    # scheme version. We forge both the audit predicate and a divergent
    # scheme cell, then re-run migration.
    assert_cell(
        layout=layout, event_log=log, node_id="n",
        s="personnel:emsenn", p=f"{MIGRATED_PREDICATE_PREFIX}1",
        v=BilatticeValue.TRUE, sender="system",
    )
    assert_cell(
        layout=layout, event_log=log, node_id="n",
        s="personnel:emsenn", p=f"{SCHEME_PREDICATE_PREFIX}v0.3-eight-fiber",
        v=BilatticeValue.TRUE, sender="system",
    )

    with pytest.raises(SubstrateError) as exc_info:
        migrate_personnel_to_boundary(layout=layout, event_log=log, node_id="n")
    assert exc_info.value.code == PCB_BOUNDARY_SCHEME_DIVERGED
    assert exc_info.value.details["personnel"] == "personnel:emsenn"
    assert "v0.3-eight-fiber" in exc_info.value.details["recorded"]
    assert exc_info.value.details["expected"] == BOUNDARY_SCHEME_VERSION


def test_re_migration_with_matching_recorded_scheme_is_no_op(fresh_substrate):
    layout, log = fresh_substrate
    _seed_personnel(layout, log, "personnel:emsenn", role="admin")
    migrate_personnel_to_boundary(layout=layout, event_log=log, node_id="n")

    height_before = log.height()
    summary = migrate_personnel_to_boundary(
        layout=layout, event_log=log, node_id="n",
    )
    assert summary["skipped"] == ["personnel:emsenn"]
    assert log.height() == height_before


# ---------------------------------------------------------------------------
# legacy_view round-trip
# ---------------------------------------------------------------------------


def test_legacy_view_reconstructs_personnel_shape(fresh_substrate):
    layout, log = fresh_substrate
    _seed_personnel(layout, log, "personnel:emsenn", role="admin")
    # Add a granted capability that should also carry through.
    assert_cell(
        layout=layout, event_log=log, node_id="n",
        s="personnel:emsenn", p="granted:read-everything",
        v=BilatticeValue.TRUE, sender="system",
    )
    migrate_personnel_to_boundary(layout=layout, event_log=log, node_id="n")

    view = legacy_view(layout=layout, boundary_slug="boundary:emsenn")
    assert view["slug"] == "personnel:emsenn"
    assert view["kind-personnel-record"] is True
    assert "role-admin" in view["predicates"]
    assert "granted:read-everything" in view["predicates"]
    # Bookkeeping predicates must NOT leak into the legacy view.
    assert all(
        not k.startswith(("kind-", "projects-", "migrated-"))
        for k in view["predicates"]
    )


def test_legacy_view_unknown_boundary_raises(fresh_substrate):
    layout, _log = fresh_substrate
    with pytest.raises(SubstrateError) as exc_info:
        legacy_view(layout=layout, boundary_slug="boundary:nobody")
    assert exc_info.value.code == PCB_BOUNDARY_NOT_FOUND


def test_legacy_view_rejects_non_boundary_slug(fresh_substrate):
    layout, _log = fresh_substrate
    with pytest.raises(SubstrateError) as exc_info:
        legacy_view(layout=layout, boundary_slug="personnel:emsenn")
    assert exc_info.value.code == PCB_BOUNDARY_NOT_FOUND


# ---------------------------------------------------------------------------
# Ordinal-replay byte-comparison (next-stretch-now §L1 procedural step 5(b))
# ---------------------------------------------------------------------------


def _build_seeded_substrate(root: Path, *, fixed_genesis_ns: int) -> tuple:
    """Spin up a substrate at ``root`` with a deterministic genesis
    timestamp and an identical seeded personnel set.

    Returns ``(layout, event_log)``. Used by the byte-comparison test
    below to exercise migration determinism — *two* substrates built
    with identical inputs must produce byte-identical event tails for
    the migration ordinals.
    """
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id="n", wall_clock_ns=fixed_genesis_ns)
    _seed_personnel(layout, log, "personnel:cassia-lorne", role="member")
    _seed_personnel(layout, log, "personnel:emsenn", role="admin")
    assert_cell(
        layout=layout, event_log=log, node_id="n",
        s="personnel:emsenn", p="granted:read-everything",
        v=BilatticeValue.TRUE, sender="system",
    )
    return layout, log


def _migration_event_tail(log: EventLog, *, after_ord: int) -> list[dict]:
    """All events with ``ord > after_ord``, returned in log order.

    The migration's contribution to the log is exactly the suffix
    appended after ``after_ord``; comparing this slice between two
    runs proves the migration is a deterministic projection.
    """
    return [ev for ev in log.iter_events() if ev["ord"] > after_ord]


def test_migration_replay_is_byte_identical(tmp_path):
    """Two fresh substrates seeded identically must produce byte-
    identical migration event tails.

    Realises the Scott-continuity-as-checkpointability discipline: the
    migration is a deterministic projection of (legacy personnel set,
    boundary scheme version), so replay across substrates with identical
    inputs yields identical event-log suffixes covering the migration
    ordinals. Without this guarantee, fixture-replay artefacts captured
    on one substrate could not be validated against another, and
    ``bootstrap-determinism`` would not hold across the migration.
    """
    fixed_ns = 1_700_000_000_000_000_000  # pinned wall-clock for both runs

    layout_a, log_a = _build_seeded_substrate(
        tmp_path / "a", fixed_genesis_ns=fixed_ns,
    )
    layout_b, log_b = _build_seeded_substrate(
        tmp_path / "b", fixed_genesis_ns=fixed_ns,
    )

    pre_height_a = log_a.height()
    pre_height_b = log_b.height()
    assert pre_height_a == pre_height_b, (
        "identical seeding must yield identical pre-migration log heights"
    )
    pre_ord = pre_height_a - 1

    summary_a = migrate_personnel_to_boundary(
        layout=layout_a, event_log=log_a, node_id="n",
    )
    summary_b = migrate_personnel_to_boundary(
        layout=layout_b, event_log=log_b, node_id="n",
    )

    assert summary_a == summary_b, (
        f"migration summaries diverged: {summary_a!r} vs {summary_b!r}"
    )

    tail_a = _migration_event_tail(log_a, after_ord=pre_ord)
    tail_b = _migration_event_tail(log_b, after_ord=pre_ord)

    assert tail_a == tail_b, (
        "migration event tails must agree as parsed dicts across fresh "
        "substrates with identical inputs (scott-continuity / "
        "bootstrap-determinism)"
    )
    # Every migrated personnel contributes 1 + len(CANONICAL_FIBERS) + 1
    # (carried role) + 2 (audit + scheme) cells, plus one extra for
    # emsenn's granted: capability — assert the suffix is non-trivial so
    # the equality above is meaningful.
    assert len(tail_a) > 0, "migration must append events for seeded personnel"

    # Byte-identical raw-JSONL comparison of the migration suffix —
    # next-stretch-now §L1 step 5(b) calls for *byte-comparison*, not
    # just parsed-event equality. Slice the on-disk events.jsonl by
    # the line index corresponding to the migration ordinal boundary
    # and assert exact byte equality.
    bytes_a = (tmp_path / "a" / EVENT_LOG_FILENAME).read_bytes()
    bytes_b = (tmp_path / "b" / EVENT_LOG_FILENAME).read_bytes()
    # Lines 0..pre_ord (inclusive) are the seeded prefix; everything
    # after is the migration suffix. JSONL is one event per line,
    # ord-aligned because both substrates were built identically.
    suffix_a = b"\n".join(bytes_a.splitlines()[pre_ord + 1:])
    suffix_b = b"\n".join(bytes_b.splitlines()[pre_ord + 1:])
    assert suffix_a == suffix_b, (
        "migration JSONL suffix must be byte-identical across fresh "
        "substrates — fixture-replay artefacts are validated against "
        "exact bytes, so any drift here silently invalidates them"
    )
    assert len(suffix_a) > 0, "byte suffix must be non-empty"
