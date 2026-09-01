"""Snapshots — v0.2a recording + current-state verification conformance.

Pins ``specs/filesystem/snapshots.md`` §6 (the v0.2a slice). The full
spec §1-§5 spans later milestones; the gates exercised here are the
ones the v0.2a primitives in ``storage/snapshots.py`` discharge.
"""

from __future__ import annotations

import hashlib
import json
import time
from pathlib import Path

import pytest

from process.session import open_session
from process.user import create_user
from security.capabilities import SIGNAL_SNAPSHOT_RECORD
from storage.event_log import EventLog
from storage.mounts import attach_mount
from storage.snapshots import (
    SNAPSHOT_EVENT_KIND,
    compute_state_roots,
    list_snapshots,
    record_snapshot,
    verify_snapshot,
)
from storage.storage_layout import StorageLayout
from substrate.canonicalization import canonical
from substrate.error_codes import (
    PCA_SCOPE_INSUFFICIENT,
    PCM_PAYLOAD_INVALID,
    SubstrateError,
)


def _boot(tmp_path: Path, caps: list[str]):
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    event_log = EventLog(tmp_path)
    event_log.initialize(node_id="t", wall_clock_ns=time.time_ns())
    create_user(
        layout=layout, event_log=event_log, node_id="t",
        slug="user:alice", display_name="Alice",
    )
    sess = open_session(
        layout=layout, event_log=event_log, node_id="t",
        owner="user:alice", capabilities=caps,
    )
    return layout, event_log, sess


def _empty_root() -> str:
    return hashlib.sha256(canonical([])).hexdigest()


# --- compute_state_roots: determinism + shape ----------------------------


def test_compute_state_roots_returns_three_named_roots(tmp_path):
    layout, _event_log, _sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    roots = compute_state_roots(layout)
    assert set(roots.keys()) == {
        "cells_root_hash", "rules_root_hash", "fiber_root_hash",
    }
    for v in roots.values():
        assert isinstance(v, str) and len(v) == 64


def test_compute_state_roots_deterministic_for_unchanged_state(tmp_path):
    layout, _event_log, _sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    a = compute_state_roots(layout)
    b = compute_state_roots(layout)
    assert a == b


def test_compute_state_roots_post_genesis_has_user_session_state(tmp_path):
    # Bootstrap creates user + session cells/fibers; the roots are not
    # the empty-kind constant.
    layout, _event_log, _sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    roots = compute_state_roots(layout)
    # cells/ and fibers/ are populated by bootstrap; rules/ is empty
    # in this fixture.
    assert roots["cells_root_hash"] != _empty_root()
    assert roots["fiber_root_hash"] != _empty_root()
    assert roots["rules_root_hash"] == _empty_root()


# --- record_snapshot: happy path -----------------------------------------


def test_record_snapshot_emits_typed_event(tmp_path):
    layout, event_log, sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    pre_height = event_log.height()
    event = record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    assert event["kind"] == SNAPSHOT_EVENT_KIND
    assert event["ord"] == pre_height
    body = event["body"]
    assert body["at_ord"] == pre_height - 1
    assert body["sender"] == sess.owner
    assert body["session"] == sess.slug
    assert set(body.keys()) >= {
        "at_ord", "sender", "session",
        "cells_root_hash", "rules_root_hash", "fiber_root_hash",
    }


def test_recorded_snapshot_body_matches_compute_state_roots(tmp_path):
    layout, event_log, sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    expected = compute_state_roots(layout)
    event = record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    body = event["body"]
    for field, want in expected.items():
        assert body[field] == want


def test_record_snapshot_advances_event_log_by_one(tmp_path):
    layout, event_log, sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    pre = event_log.height()
    record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    assert event_log.height() == pre + 1


# --- capability gate (gate 4) --------------------------------------------


def test_record_snapshot_denied_without_capability(tmp_path):
    layout, event_log, sess = _boot(tmp_path, [])  # no caps at all
    pre_height = event_log.height()
    with pytest.raises(SubstrateError) as excinfo:
        record_snapshot(
            layout=layout, event_log=event_log, node_id="t", sess=sess,
        )
    err = excinfo.value
    assert err.code == PCA_SCOPE_INSUFFICIENT
    assert err.details.get("needed") == SIGNAL_SNAPSHOT_RECORD
    assert err.details.get("sender") == sess.slug
    assert err.details.get("owner") == sess.owner
    # gate-ordering invariant: denied call advances neither event log
    # nor any fiber.
    assert event_log.height() == pre_height


def test_record_snapshot_admitted_by_action_wildcard(tmp_path):
    layout, event_log, sess = _boot(tmp_path, ["signal:snapshot:*"])
    event = record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    assert event["kind"] == SNAPSHOT_EVENT_KIND


def test_record_snapshot_admitted_by_super_grant(tmp_path):
    layout, event_log, sess = _boot(tmp_path, ["signal:*"])
    event = record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    assert event["kind"] == SNAPSHOT_EVENT_KIND


def test_record_snapshot_denied_by_unrelated_namespace(tmp_path):
    # holding caps in another namespace must not admit snapshot recording.
    layout, event_log, sess = _boot(tmp_path, ["signal:mount:*"])
    pre_height = event_log.height()
    with pytest.raises(SubstrateError) as excinfo:
        record_snapshot(
            layout=layout, event_log=event_log, node_id="t", sess=sess,
        )
    assert excinfo.value.code == PCA_SCOPE_INSUFFICIENT
    assert event_log.height() == pre_height


# --- tamper-evidence ------------------------------------------------------


def _any_cell_file(layout: StorageLayout) -> Path:
    cells_dir = layout.root / "cells"
    for shard in sorted(cells_dir.iterdir()):
        if shard.is_dir():
            for record in sorted(shard.iterdir()):
                if record.suffix == ".json":
                    return record
    raise AssertionError("no cell records on disk to tamper with")


def _any_fiber_file(layout: StorageLayout) -> Path:
    fibers_dir = layout.root / "fibers"
    for entity_dir in sorted(fibers_dir.iterdir()):
        if entity_dir.is_dir():
            f = entity_dir / "fiber.json"
            if f.exists():
                return f
    raise AssertionError("no fiber files on disk to tamper with")


def test_cells_root_changes_when_cell_file_renamed(tmp_path):
    layout, _event_log, _sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    before = compute_state_roots(layout)
    target = _any_cell_file(layout)
    # Rename to a different stem to perturb the sorted-ID list.
    new_path = target.with_name("0" * 64 + ".json")
    target.rename(new_path)
    after = compute_state_roots(layout)
    assert after["cells_root_hash"] != before["cells_root_hash"]
    # Other roots are untouched by a cells-only change.
    assert after["rules_root_hash"] == before["rules_root_hash"]
    assert after["fiber_root_hash"] == before["fiber_root_hash"]


def test_cells_root_changes_when_cell_bytes_tampered_in_place(tmp_path):
    # Architect-flagged regression guard: hashing only the filename
    # stem would miss in-place byte tampering. The kind-root must
    # detect a rewritten cell file that keeps its name.
    layout, _event_log, _sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    before = compute_state_roots(layout)
    target = _any_cell_file(layout)
    body = json.loads(target.read_bytes())
    body["__tamper__"] = "in-place"
    target.write_bytes(canonical(body))
    after = compute_state_roots(layout)
    assert after["cells_root_hash"] != before["cells_root_hash"]
    assert after["rules_root_hash"] == before["rules_root_hash"]
    assert after["fiber_root_hash"] == before["fiber_root_hash"]


def test_rules_root_changes_when_rule_bytes_tampered_in_place(tmp_path):
    # Same in-place-tamper guard for rules/. Plant a rule file via
    # put_record so we have something to mutate.
    layout, _event_log, _sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    layout.put_record("rules", {"head": "p", "body": [], "kind": "fact"})
    before = compute_state_roots(layout)
    rules_dir = layout.root / "rules"
    target = next(
        r for shard in sorted(rules_dir.iterdir()) if shard.is_dir()
        for r in sorted(shard.iterdir()) if r.suffix == ".json"
    )
    body = json.loads(target.read_bytes())
    body["__tamper__"] = "in-place"
    target.write_bytes(canonical(body))
    after = compute_state_roots(layout)
    assert after["rules_root_hash"] != before["rules_root_hash"]
    assert after["cells_root_hash"] == before["cells_root_hash"]
    assert after["fiber_root_hash"] == before["fiber_root_hash"]


def test_fiber_root_changes_when_fiber_bytes_tampered(tmp_path):
    layout, _event_log, _sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    before = compute_state_roots(layout)
    target = _any_fiber_file(layout)
    body = json.loads(target.read_bytes())
    body["__tamper__"] = True
    target.write_bytes(canonical(body))
    after = compute_state_roots(layout)
    assert after["fiber_root_hash"] != before["fiber_root_hash"]
    # Other roots are untouched.
    assert after["cells_root_hash"] == before["cells_root_hash"]
    assert after["rules_root_hash"] == before["rules_root_hash"]


# --- verify_snapshot ------------------------------------------------------


def test_verify_snapshot_true_against_unchanged_state(tmp_path):
    layout, event_log, sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    event = record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    assert verify_snapshot(layout, event) is True


def test_verify_snapshot_false_after_state_tamper(tmp_path):
    layout, event_log, sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    event = record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    target = _any_fiber_file(layout)
    body = json.loads(target.read_bytes())
    body["__tamper__"] = True
    target.write_bytes(canonical(body))
    assert verify_snapshot(layout, event) is False


def test_verify_snapshot_false_after_state_advances(tmp_path):
    # Recording a snapshot is itself state-advancing — but only on the
    # event log, which is not part of the three roots. Mounting after
    # the snapshot writes new cells/fibers, so the snapshot's roots
    # are no longer current.
    layout, event_log, sess = _boot(
        tmp_path, [SIGNAL_SNAPSHOT_RECORD, "signal:mount:attach"],
    )
    event = record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    assert verify_snapshot(layout, event) is True
    attach_mount(
        layout=layout, event_log=event_log, node_id="t",
        session_slug=sess.slug, slug="m1",
        source_type="peer", source_ref="peer:m1.local",
        local_prefix="m1/",
    )
    assert verify_snapshot(layout, event) is False


def test_verify_snapshot_false_for_non_snapshot_event(tmp_path):
    layout, event_log, _sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    # The genesis event is not a snapshot.
    genesis = next(event_log.iter_events())
    assert genesis["kind"] != SNAPSHOT_EVENT_KIND
    assert verify_snapshot(layout, genesis) is False


# --- list_snapshots -------------------------------------------------------


def test_list_snapshots_returns_recorded_snapshots_in_order(tmp_path):
    layout, event_log, sess = _boot(tmp_path, [SIGNAL_SNAPSHOT_RECORD])
    assert list_snapshots(event_log) == []
    e1 = record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    e2 = record_snapshot(
        layout=layout, event_log=event_log, node_id="t", sess=sess,
    )
    snaps = list_snapshots(event_log)
    assert [s["id"] for s in snaps] == [e1["id"], e2["id"]]
    assert snaps[0]["ord"] < snaps[1]["ord"]


# --- empty-state determinism --------------------------------------------


def test_empty_kind_root_is_canonical_empty_list_hash(tmp_path):
    # A freshly-ensured layout (no records of any kind) hashes each
    # kind's root to the canonical-empty-list hash.
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    roots = compute_state_roots(layout)
    e = _empty_root()
    assert roots["cells_root_hash"] == e
    assert roots["rules_root_hash"] == e
    assert roots["fiber_root_hash"] == e


# --- ord-coherence + genesis precedence ---------------------------------


def test_record_snapshot_rejects_pre_genesis(tmp_path):
    # An event log that has not been initialised has no genesis event;
    # snapshot recording must refuse rather than emit a snapshot
    # whose at_ord would be negative.
    layout = StorageLayout(tmp_path)
    layout.ensure_dirs()
    event_log = EventLog(tmp_path)
    # NB: deliberately not calling event_log.initialize(...).
    from process.session import Session
    sess = Session(
        slug="session:deadbeef",
        owner="user:alice",
        capabilities=[SIGNAL_SNAPSHOT_RECORD],
        opened_at_ord=0,
        opened_at_ns=0,
        state="open",
    )
    with pytest.raises(SubstrateError) as excinfo:
        record_snapshot(
            layout=layout, event_log=event_log, node_id="t", sess=sess,
        )
    assert excinfo.value.code == PCM_PAYLOAD_INVALID
