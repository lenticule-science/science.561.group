"""Crash-recovery: post-restart fiber correctness when persistence is interrupted.

The ``respond`` primitive persists ``cell -> event -> fiber``. If a crash
lands between the event append and the fiber write, the fiber cache is
stale relative to the event log. The boot phase ``fiber_reconcile`` must
rebuild the fiber from log truth.
"""

from __future__ import annotations

import json
from pathlib import Path

import pytest

from init_boot.fiber_reconcile import reconcile_fibers
from substrate.respond import respond as do_respond
from substrate.runtime import Runtime
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


@pytest.fixture
def root(tmp_path: Path) -> Path:
    return tmp_path / "root"


def _seed(root: Path, n: int = 3) -> tuple[StorageLayout, EventLog]:
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id="crash-test", wall_clock_ns=0)
    active: list[str] = []
    for i in range(n):
        do_respond(
            target="crash-target",
            payload={f"step-{i}/positive": "True"},
            sender="crash-test",
            layout=layout,
            event_log=log,
            node_id="crash-test",
            active_rule_ids=active,
        )
    return layout, log


def test_reconcile_is_a_no_op_on_a_clean_root(root: Path):
    layout, log = _seed(root, n=2)
    summary = reconcile_fibers(layout=layout, event_log=log)
    assert summary["scanned"] == 1
    assert summary["repaired"] == []  # nothing to repair


def test_crash_after_event_append_is_recovered(root: Path):
    """Simulate: cell + event written, fiber write interrupted (file deleted).

    After reconcile, the fiber must reflect the full event-log history.
    """
    layout, log = _seed(root, n=3)
    fiber_path = layout.fiber_path("crash-target")
    assert fiber_path.exists()
    pre = json.loads(fiber_path.read_bytes().decode("utf-8"))
    assert len(pre["history"]) == 3

    # Crash window: fiber file vanishes (simulating interrupted fsync /
    # rename). Cells + events on disk are intact (they were fsync'd first).
    fiber_path.unlink()
    assert not fiber_path.exists()

    summary = reconcile_fibers(layout=layout, event_log=log)
    assert summary["scanned"] == 1
    assert summary["repaired"] == ["crash-target"]

    rebuilt = json.loads(fiber_path.read_bytes().decode("utf-8"))
    assert rebuilt["entity"] == "crash-target"
    assert len(rebuilt["history"]) == 3
    assert rebuilt["latest_cell_id"] == pre["latest_cell_id"]
    assert rebuilt["predicates"] == pre["predicates"]


def test_reconcile_preserves_cells_by_predicate_witness_map(root: Path):
    """Rebuilt fibers must carry a ``cells_by_predicate`` map covering
    every predicate, so subsequent respond invocations can witness
    saturated firings against the recovered state.

    This pins the witness-map invariant respond.py's preflight check
    enforces (every predicate in fiber.predicates has a corresponding
    cell-id in fiber.cells_by_predicate). A fiber rebuilt without it
    would cause every follow-up respond to raise PCC_MISSING_WITNESS.
    """
    layout, log = _seed(root, n=3)
    fiber_path = layout.fiber_path("crash-target")
    pre = json.loads(fiber_path.read_bytes().decode("utf-8"))
    pre_witnesses = pre.get("cells_by_predicate") or {}
    assert set(pre_witnesses) == set(pre["predicates"]), (
        f"_seed produced a fiber with incomplete witness coverage: "
        f"predicates={set(pre['predicates'])} witnesses={set(pre_witnesses)}"
    )

    fiber_path.unlink()
    reconcile_fibers(layout=layout, event_log=log)
    rebuilt = json.loads(fiber_path.read_bytes().decode("utf-8"))
    rebuilt_witnesses = rebuilt.get("cells_by_predicate") or {}
    assert set(rebuilt_witnesses) == set(rebuilt["predicates"]), (
        "rebuilt fiber missing witness ids for some predicates: "
        f"predicates={set(rebuilt['predicates'])} witnesses={set(rebuilt_witnesses)}"
    )
    # Every witness id from the original fiber must survive the rebuild
    # (the snapshots are immutable so the per-predicate latest cell-id
    # is fully determined by the snapshot history).
    assert rebuilt_witnesses == pre_witnesses

    # And the rebuilt fiber must be usable by respond — no preflight error.
    do_respond(
        target="crash-target",
        payload={"step-3/positive": "True"},
        sender="crash-test",
        layout=layout, event_log=log, node_id="crash-test",
        active_rule_ids=[],
    )


def test_partial_fiber_is_rewritten_from_log(root: Path):
    """If the fiber is one respond behind, reconcile rewrites it."""
    layout, log = _seed(root, n=3)
    fiber_path = layout.fiber_path("crash-target")
    full = json.loads(fiber_path.read_bytes().decode("utf-8"))
    # Truncate fiber history to N-1 — simulates crash between the third
    # event append and the third fiber write.
    truncated = dict(full)
    truncated["history"] = full["history"][:-1]
    truncated["latest_cell_id"] = full["history"][-2]["cell_id"]
    fiber_path.write_bytes(json.dumps(truncated).encode("utf-8"))

    summary = reconcile_fibers(layout=layout, event_log=log)
    assert "crash-target" in summary["repaired"]
    rebuilt = json.loads(fiber_path.read_bytes().decode("utf-8"))
    assert len(rebuilt["history"]) == 3
    assert rebuilt["latest_cell_id"] == full["latest_cell_id"]


def test_reconcile_handles_mixed_respond_and_federation_history(root: Path):
    """A fiber whose history mixes respond and federation_merge events
    must rebuild correctly: predicates from both event kinds, and a
    cells_by_predicate map covering everything.

    This exercises the cross-event-kind reconcile path (federation_merge
    events also carry an entity + cell_id and must contribute to the
    rebuilt history).
    """
    from network.federation import merge_peer_fiber

    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id="mixed-test", wall_clock_ns=0)

    do_respond(
        target="mixed-target",
        payload={"local/positive": "True"},
        sender="mixed-test",
        layout=layout, event_log=log, node_id="mixed-test",
        active_rule_ids=[],
    )
    merge_peer_fiber(
        layout=layout, event_log=log,
        peer_node_id="peer-x", entity="mixed-target",
        fiber_predicates={"federated/positive": "True"},
        persist=True, node_id="mixed-test",
    )
    do_respond(
        target="mixed-target",
        payload={"local2/positive": "True"},
        sender="mixed-test",
        layout=layout, event_log=log, node_id="mixed-test",
        active_rule_ids=[],
    )

    fiber_path = layout.fiber_path("mixed-target")
    pre = json.loads(fiber_path.read_bytes().decode("utf-8"))
    assert set(pre["predicates"]) == {
        "local/positive", "federated/positive", "local2/positive",
    }
    assert set(pre["cells_by_predicate"]) == set(pre["predicates"])
    assert len(pre["history"]) == 3

    fiber_path.unlink()
    summary = reconcile_fibers(layout=layout, event_log=log)
    assert "mixed-target" in summary["repaired"]
    rebuilt = json.loads(fiber_path.read_bytes().decode("utf-8"))
    assert rebuilt["predicates"] == pre["predicates"]
    assert rebuilt["cells_by_predicate"] == pre["cells_by_predicate"]
    assert len(rebuilt["history"]) == 3

    # And the rebuilt fiber accepts a follow-up respond without preflight error.
    do_respond(
        target="mixed-target",
        payload={"after/positive": "True"},
        sender="mixed-test",
        layout=layout, event_log=log, node_id="mixed-test",
        active_rule_ids=[],
    )


def test_full_runtime_boot_includes_fiber_reconcile_phase(tmp_path: Path):
    """A real Runtime boot includes the fiber_reconcile phase and recovers."""
    root = tmp_path / "root"
    rt1 = Runtime(root=root, node_id="boot-test", host="127.0.0.1", port=0)
    rt1.boot()
    do_respond(
        target="boot-target",
        payload={"a/positive": "True"},
        sender="boot-test",
        layout=rt1.boot_context.layout,
        event_log=rt1.boot_context.event_log,
        node_id="boot-test",
        active_rule_ids=rt1.active_rule_ids,
    )
    fiber_path = rt1.boot_context.layout.fiber_path("boot-target")
    assert fiber_path.exists()
    # Crash: delete the fiber.
    fiber_path.unlink()

    # Reboot — fiber_reconcile phase should rebuild it before ready.
    rt2 = Runtime(root=root, node_id="boot-test", host="127.0.0.1", port=0)
    rt2.boot()
    phase_names = [p["phase"] for p in rt2.boot_context.phase_log]
    assert "fiber_reconcile" in phase_names
    fr_phase = next(p for p in rt2.boot_context.phase_log if p["phase"] == "fiber_reconcile")
    assert fr_phase["ok"] is True
    assert fr_phase["entities_repaired"] >= 1
    assert fiber_path.exists()
    rebuilt = json.loads(fiber_path.read_bytes().decode("utf-8"))
    assert rebuilt["predicates"]["a/positive"] == "True"
