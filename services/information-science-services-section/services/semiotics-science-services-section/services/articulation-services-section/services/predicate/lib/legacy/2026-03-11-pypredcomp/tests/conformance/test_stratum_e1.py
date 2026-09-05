"""Stratum-tagging conformance — cells:[] on snapshots, witness chains.

Per ``specs/kernel/stratified-facts.md`` §2 + ``specs/filesystem/cell-record.md``
§1.5: every ``respond`` invocation must emit a ``FiberSnapshot`` whose
``cells: [...]`` array carries one ``Cell`` atom per predication, tagged
with the correct stratum:

* Phase 2 (payload composition) — ``stratum == "asserted"``, no witness fields.
* Phase 3 (closure firings)     — ``stratum == "saturated"``, ``derived_from``
  pointing to the cell ids of the firing rule's premise atoms,
  ``derived_via`` carrying the rule id.

These tests pin the contract end-to-end: build a fresh substrate, run
``respond`` invocations, assert the snapshot's cells array shape, witness
correctness, and the cross-respond witness map persisted on the fiber dict.
"""

from __future__ import annotations

import tempfile
from pathlib import Path

import pytest

from substrate.algebra import BilatticeValue
from substrate.closure_engine import RuleRecord
from substrate.error_codes import PCC_MISSING_WITNESS, SubstrateError
from substrate.respond import respond
from storage.cell import Cell
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


@pytest.fixture
def substrate(tmp_path):
    layout = StorageLayout(tmp_path / "root")
    layout.ensure_dirs()
    log = EventLog(tmp_path / "root")
    log.initialize(node_id="test-node", wall_clock_ns=0)
    return layout, log


def _add_rule(layout: StorageLayout, *, name: str, premise: dict, conclusion: dict, active: list[str]) -> str:
    rule = RuleRecord(name=name, premise=premise, conclusion=conclusion).with_id()
    rid, _ = layout.put_record("rules", rule.canonical_body())
    if rid not in active:
        active.append(rid)
    return rid


# -----------------------------------------------------------------------------
# Asserted-cell shape (Phase 2)
# -----------------------------------------------------------------------------


def test_payload_only_respond_emits_asserted_cells(substrate):
    layout, log = substrate
    result = respond(
        target="alice",
        payload={"ready/positive": "True", "heartbeat/observed": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    snapshot = result.cell
    assert len(snapshot.cells) == 2, "one asserted cell per payload predicate"
    by_pred = {c.p: c for c in snapshot.cells}

    for pred in ("ready/positive", "heartbeat/observed"):
        cell = by_pred[pred]
        assert cell.stratum == "asserted"
        assert cell.s == "alice"
        assert cell.o == "alice", "v0.1 self-application: o == s"
        assert cell.v == BilatticeValue.TRUE
        assert cell.ord == result.event_ord, "cell ord matches event ord"
        assert cell.derived_from is None, "asserted cell has no witness"
        assert cell.derived_via is None
        assert cell.sender == "tester"
        assert cell.id is not None
        assert len(cell.id) == 64  # SHA-256 hex
        assert cell.kind == "cell"


def test_system_authored_respond_omits_sender(substrate):
    layout, log = substrate
    result = respond(
        target="alice",
        payload={"observation/seen": "True"},
        # sender defaults to "system"
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    cell = result.cell.cells[0]
    assert cell.stratum == "asserted"
    assert cell.sender is None, "system-authored cells omit the sender field"


def test_asserted_cell_value_matches_post_merge_join(substrate):
    """When the prior fiber already holds True and the payload asserts False,
    the asserted cell's value is the knowledge-join (Both)."""
    layout, log = substrate
    respond(
        target="alice", payload={"flag/state": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    result = respond(
        target="alice", payload={"flag/state": "False"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    cell = result.cell.cells[0]
    assert cell.p == "flag/state"
    assert cell.v == BilatticeValue.BOTH, (
        "Phase 2 emits asserted at the post-merge value (knowledge_join), "
        "not the raw payload value, per stratified-facts §2"
    )


# -----------------------------------------------------------------------------
# Saturated-cell shape (Phase 3)
# -----------------------------------------------------------------------------


def test_rule_firing_emits_saturated_cell_with_witness(substrate):
    """A closure-rule firing emits a saturated Cell whose derived_from
    points to the asserted Cell that satisfied the rule's premise."""
    layout, log = substrate
    active: list[str] = []
    rule_id = _add_rule(
        layout,
        name="ready-implies-settled",
        premise={"ready/positive": "True"},
        conclusion={"system/settled": "True"},
        active=active,
    )
    result = respond(
        target="bob",
        payload={"ready/positive": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=active,
    )
    snapshot = result.cell
    asserted = [c for c in snapshot.cells if c.stratum == "asserted"]
    saturated = [c for c in snapshot.cells if c.stratum == "saturated"]
    assert len(asserted) == 1 and asserted[0].p == "ready/positive"
    assert len(saturated) == 1
    sat = saturated[0]
    assert sat.p == "system/settled"
    assert sat.v == BilatticeValue.TRUE
    assert sat.o == "bob"
    assert sat.ord == result.event_ord
    assert sat.derived_via == rule_id
    assert sat.derived_from == [asserted[0].id], (
        "saturated witness must point to the asserted premise's cell id"
    )


def test_multi_premise_rule_emits_witness_chain_with_all_premises(substrate):
    layout, log = substrate
    active: list[str] = []
    rule_id = _add_rule(
        layout,
        name="both-flags-warning",
        premise={"flag/positive": "True", "flag/negative": "True"},
        conclusion={"system/warning": "Both"},
        active=active,
    )
    result = respond(
        target="carol",
        payload={"flag/positive": "True", "flag/negative": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=active,
    )
    snapshot = result.cell
    asserted_by_pred = {c.p: c for c in snapshot.cells if c.stratum == "asserted"}
    saturated = [c for c in snapshot.cells if c.stratum == "saturated"]
    assert set(asserted_by_pred) == {"flag/positive", "flag/negative"}
    assert len(saturated) == 1
    sat = saturated[0]
    assert sat.p == "system/warning"
    assert sat.derived_via == rule_id
    # Witness ids are sorted by premise predicate name.
    expected = [asserted_by_pred["flag/negative"].id, asserted_by_pred["flag/positive"].id]
    assert sat.derived_from == expected


def test_cross_respond_saturated_witnesses_prior_asserted_cell(substrate):
    """A multi-premise rule that fires in respond N+1, where one premise
    was asserted in respond N and the other in respond N+1, must witness
    BOTH cell ids: the prior respond's asserted cell (recovered from the
    persisted ``cells_by_predicate`` map on the fiber dict) and the
    current respond's asserted cell."""
    layout, log = substrate
    active: list[str] = []
    rule_id = _add_rule(
        layout,
        name="both-flags-warning",
        premise={"flag/positive": "True", "flag/negative": "True"},
        conclusion={"system/warning": "Both"},
        active=active,
    )
    # Round 1 — assert flag/positive only. Rule does NOT fire (other premise missing).
    r1 = respond(
        target="dave", payload={"flag/positive": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=active,
    )
    assert all(c.stratum == "asserted" for c in r1.cell.cells)
    asserted_pos_r1 = [c for c in r1.cell.cells if c.p == "flag/positive"][0]
    # Confirm fiber dict persisted the witness map for cross-respond use.
    fiber_after_r1 = layout.get_fiber("dave")
    assert fiber_after_r1["cells_by_predicate"]["flag/positive"] == asserted_pos_r1.id

    # Round 2 — assert flag/negative. Rule fires; witness must point to
    # round-1's asserted flag/positive AND round-2's asserted flag/negative.
    r2 = respond(
        target="dave", payload={"flag/negative": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=active,
    )
    asserted_r2 = [c for c in r2.cell.cells if c.stratum == "asserted"]
    saturated_r2 = [c for c in r2.cell.cells if c.stratum == "saturated"]
    assert len(asserted_r2) == 1 and asserted_r2[0].p == "flag/negative"
    asserted_neg_r2 = asserted_r2[0]
    assert len(saturated_r2) == 1
    sat = saturated_r2[0]
    assert sat.p == "system/warning"
    assert sat.derived_via == rule_id
    # Witness ids are sorted by premise predicate name: "flag/negative" < "flag/positive".
    assert sat.derived_from == [asserted_neg_r2.id, asserted_pos_r1.id], (
        f"cross-respond witness must reference both rounds' asserted cells "
        f"(r1 flag/positive: {asserted_pos_r1.id}, r2 flag/negative: {asserted_neg_r2.id}); "
        f"got {sat.derived_from}"
    )


# -----------------------------------------------------------------------------
# Stratum-validation invariants on the Cell schema itself
# -----------------------------------------------------------------------------


def test_asserted_cell_with_witness_is_rejected():
    with pytest.raises(SubstrateError) as excinfo:
        Cell(
            s="x", p="p", o="x", v=BilatticeValue.TRUE,
            ord=1, stratum="asserted",
            derived_from=["a" * 64], derived_via="some-rule",
        )
    assert excinfo.value.code == PCC_MISSING_WITNESS


def test_saturated_cell_without_witness_is_rejected():
    with pytest.raises(SubstrateError) as excinfo:
        Cell(
            s="x", p="p", o="x", v=BilatticeValue.TRUE,
            ord=1, stratum="saturated",
        )
    assert excinfo.value.code == PCC_MISSING_WITNESS


# -----------------------------------------------------------------------------
# Snapshot canonical-bytes invariants
# -----------------------------------------------------------------------------


def test_snapshot_id_is_sensitive_to_cells_array(substrate):
    """Adding cells:[] to the snapshot changes its canonical bytes; two
    snapshots that differ only in their cells array MUST have different ids."""
    from storage.cell_record import FiberSnapshot

    a = FiberSnapshot(
        entity="x",
        predicates={"p": BilatticeValue.TRUE},
        cells=[],
    ).with_id()
    b_cell = Cell(
        s="x", p="p", o="x", v=BilatticeValue.TRUE, ord=1, stratum="asserted",
    ).with_id()
    b = FiberSnapshot(
        entity="x",
        predicates={"p": BilatticeValue.TRUE},
        cells=[b_cell],
    ).with_id()
    assert a.id != b.id, "snapshot id must change when cells:[] changes"


def test_snapshot_persisted_record_round_trips(substrate):
    """The on-disk cell record bytes round-trip through the storage layer
    with the cells:[] field intact."""
    layout, log = substrate
    result = respond(
        target="erin", payload={"ready/positive": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    raw = layout.get_record_bytes("cells", result.cell.id)
    import json
    body = json.loads(raw)
    assert "cells" in body
    assert len(body["cells"]) == 1
    atom = body["cells"][0]
    assert atom["stratum"] == "asserted"
    assert atom["s"] == "erin"
    assert atom["p"] == "ready/positive"
    assert atom["o"] == "erin"
    assert atom["v"] == "True"
    assert "derived_from" not in atom
    assert "derived_via" not in atom


# -----------------------------------------------------------------------------
# Persisted witness map shape on the fiber dict
# -----------------------------------------------------------------------------


def test_fiber_dict_persists_cells_by_predicate(substrate):
    layout, log = substrate
    result = respond(
        target="frank", payload={"ready/positive": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    fiber = layout.get_fiber("frank")
    assert "cells_by_predicate" in fiber
    asserted_cell = result.cell.cells[0]
    assert fiber["cells_by_predicate"]["ready/positive"] == asserted_cell.id


# -----------------------------------------------------------------------------
# Witness-coverage invariant: missing witness is a hard error
# -----------------------------------------------------------------------------


def test_missing_premise_witness_raises_hard_error(substrate):
    """A fiber whose persisted ``cells_by_predicate`` map omits a key
    that exists in ``predicates`` is rejected by respond's preflight
    check with ``PCC_MISSING_WITNESS``.

    This invariant ("every predicate in the fiber has an emitted
    cell-id in cells_by_predicate") is maintained by every fiber
    writer: :func:`_emit_asserted_cells` (for newly-asserted
    predicates), :func:`_write_fiber` (which persists the witness map
    alongside the predicate map), federation merge, and the boot-time
    fiber reconciliation pass. A violation indicates a corrupt fiber
    dict or a code-path bypass; surfacing it at respond entry gives a
    clearer error than letting it cascade into a downstream saturated
    emission.
    """
    layout, log = substrate
    active: list[str] = []
    _add_rule(
        layout,
        name="both-flags-warning",
        premise={"flag/positive": "True", "flag/negative": "True"},
        conclusion={"system/warning": "Both"},
        active=active,
    )
    # Forge a corrupt fiber: predicate in `predicates` map but its
    # witness entry has been stripped from `cells_by_predicate`.
    layout.put_fiber(
        "ghost",
        {
            "entity": "ghost",
            "predicates": {"flag/positive": "True"},
            "cells_by_predicate": {},  # invariant-violating: empty
            "history": [],
            "latest_cell_id": None,
        },
    )
    with pytest.raises(SubstrateError) as excinfo:
        respond(
            target="ghost", payload={"flag/negative": "True"}, sender="tester",
            layout=layout, event_log=log, node_id="test-node",
            active_rule_ids=active,
        )
    assert excinfo.value.code == PCC_MISSING_WITNESS
    assert excinfo.value.details.get("missing") == ["flag/positive"]
    assert excinfo.value.details.get("target") == "ghost"
