"""σ-pass dependent-invalidity propagation — the load-bearing capability
of the stratum tag.

Per ``specs/kernel/stratified-facts.md`` §3 + ``conformance-vectors.md``
§11.5 + ``sigma-delta-passes.md`` §6: when a payload retracts an asserted
predicate (asserts ``FALSE``) whose prior witness justified one or more
saturated derivations on the same entity, the σ-pass MUST emit a
retraction-cell at stratum ``"saturated"`` for each dependently-invalid
saturated atom, with ``derived_via = "dependent-invalid"`` and
``derived_from`` pointing at the retracting asserted cell.

This is the spec's stated load-bearing reason the stratum tag exists:
asserted and saturated cells look identical at ``(s, p, o, v)`` but
respond differently to upstream change. Without this propagation, an
OS that retracts an asserted premise leaves stale saturated derivations
on disk — the system continues to claim derived conclusions whose
support has been withdrawn.
"""

from __future__ import annotations

import pytest

from substrate.algebra import BilatticeValue
from substrate.closure_engine import RuleRecord
from substrate.respond import respond
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


@pytest.fixture
def substrate(tmp_path):
    layout = StorageLayout(tmp_path / "root")
    layout.ensure_dirs()
    log = EventLog(tmp_path / "root")
    log.initialize(node_id="test-node", wall_clock_ns=0)
    return layout, log


def _add_rule(
    layout: StorageLayout,
    *,
    name: str,
    premise: dict,
    conclusion: dict,
    active: list[str],
) -> str:
    rule = RuleRecord(name=name, premise=premise, conclusion=conclusion).with_id()
    rid, _ = layout.put_record("rules", rule.canonical_body())
    if rid not in active:
        active.append(rid)
    return rid


def test_retracting_asserted_premise_emits_saturated_retraction_cell(substrate):
    """A→B rule fires; retracting A emits a saturated retraction-cell for B.

    Round 1: assert A=True; rule ``A→B`` fires; saturated cell for B with
    ``derived_from=[asserted-A.id]`` lands.
    Round 2: assert A=False (retraction). The σ-pass MUST emit a saturated
    cell at (target, B, target, FALSE) with
    ``derived_via='dependent-invalid'`` and ``derived_from`` pointing at
    the new asserted-A cell.
    """
    layout, log = substrate
    active: list[str] = []
    _add_rule(
        layout,
        name="a-implies-b",
        premise={"flag/a": "True"},
        conclusion={"flag/b": "True"},
        active=active,
    )

    # Round 1: assert A; rule fires; saturated B exists.
    r1 = respond(
        target="alice",
        payload={"flag/a": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=active,
    )
    sat_b = [c for c in r1.cell.cells if c.stratum == "saturated" and c.p == "flag/b"]
    assert len(sat_b) == 1, "round 1 must produce the saturated B cell"
    asserted_a_round1 = next(
        c for c in r1.cell.cells if c.stratum == "asserted" and c.p == "flag/a"
    )
    assert sat_b[0].derived_from == [asserted_a_round1.id], (
        "saturated B must witness the asserted-A cell that fed the rule"
    )

    # Round 2: retract A. Dependent-invalidity MUST propagate to B.
    r2 = respond(
        target="alice",
        payload={"flag/a": "False"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=active,
    )
    asserted_a_round2 = next(
        c for c in r2.cell.cells if c.stratum == "asserted" and c.p == "flag/a"
    )

    retraction_cells = [
        c for c in r2.cell.cells
        if c.stratum == "saturated"
        and c.p == "flag/b"
        and c.derived_via == "dependent-invalid"
    ]
    assert len(retraction_cells) == 1, (
        "σ-pass MUST emit exactly one dependent-invalid saturated cell for B "
        "(stratified-facts.md §3 — the load-bearing capability)"
    )
    rc = retraction_cells[0]
    assert rc.v == BilatticeValue.FALSE, "retraction-cell carries denying value"
    assert rc.s == "alice" and rc.o == "alice", "same (s, p, o) as the invalidated atom"
    assert rc.derived_from == [asserted_a_round2.id], (
        "retraction-cell witnesses the retracting asserted cell"
    )
    assert rc.ord == r2.event_ord, "retraction-cell stamped at this respond's ord"


def test_retraction_propagates_paraconsistently_to_predicate_value(substrate):
    """After dependent-invalid retraction, B's fiber predicate is BOTH.

    Knowledge-join of prior True (from round-1 saturated derivation) with
    the round-2 saturated FALSE retraction yields BOTH — paraconsistent
    retention. The substrate does NOT claim B is simply False; it records
    that B is now contested, and the inconsistency surface picks up.
    """
    layout, log = substrate
    active: list[str] = []
    _add_rule(
        layout,
        name="a-implies-b",
        premise={"flag/a": "True"},
        conclusion={"flag/b": "True"},
        active=active,
    )

    respond(
        target="alice", payload={"flag/a": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=active,
    )
    r2 = respond(
        target="alice", payload={"flag/a": "False"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=active,
    )

    # Final fiber predicate B reflects paraconsistent retention.
    assert r2.cell.predicates["flag/b"] == BilatticeValue.BOTH, (
        "saturated retraction-cell joined with prior True must yield BOTH"
    )


def test_retraction_without_dependents_emits_no_retraction_cells(substrate):
    """Retracting a predicate with no saturated dependents is a no-op
    for the dependent-invalidity helper (no extra saturated cells)."""
    layout, log = substrate
    respond(
        target="alice", payload={"flag/a": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    r2 = respond(
        target="alice", payload={"flag/a": "False"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    dep_invalid = [
        c for c in r2.cell.cells
        if c.stratum == "saturated" and c.derived_via == "dependent-invalid"
    ]
    assert dep_invalid == [], (
        "no saturated dependents → no dependent-invalidity cells emitted"
    )


def test_retraction_propagates_through_chained_derivations(substrate):
    """A→B and B→C chain: retracting A invalidates the saturated atoms
    for both B AND C.

    Round 1: assert A; rule A→B fires (sat B witnesses A); rule B→C fires
    (sat C witnesses sat B).
    Round 2: retract A. Direct dependent-invalidity hits sat-B (its
    derived_from contains asserted-A). The σ-pass MUST also invalidate
    sat-C, whose derived_from includes the now-invalidated sat-B.
    """
    layout, log = substrate
    active: list[str] = []
    _add_rule(
        layout, name="a-implies-b", premise={"flag/a": "True"},
        conclusion={"flag/b": "True"}, active=active,
    )
    _add_rule(
        layout, name="b-implies-c", premise={"flag/b": "True"},
        conclusion={"flag/c": "True"}, active=active,
    )

    r1 = respond(
        target="alice", payload={"flag/a": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=active,
    )
    sat_b_id = next(
        c.id for c in r1.cell.cells if c.stratum == "saturated" and c.p == "flag/b"
    )
    sat_c = next(
        c for c in r1.cell.cells if c.stratum == "saturated" and c.p == "flag/c"
    )
    assert sat_b_id in (sat_c.derived_from or []), (
        "round 1 sanity: saturated C witnesses saturated B"
    )

    r2 = respond(
        target="alice", payload={"flag/a": "False"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=active,
    )
    retracted_predicates = {
        c.p for c in r2.cell.cells
        if c.stratum == "saturated" and c.derived_via == "dependent-invalid"
    }
    assert "flag/b" in retracted_predicates, (
        "direct dependent-invalidity: sat-B retracts on asserted-A retraction"
    )
    assert "flag/c" in retracted_predicates, (
        "transitive dependent-invalidity: sat-C retracts because its premise "
        "(sat-B) was just dependent-invalidated this respond — the σ↔Δ loop "
        "MUST propagate the invalidation"
    )


def test_retraction_cells_are_deterministic_across_replay(substrate, tmp_path):
    """Replay (rebuild storage from the event log + re-respond) yields
    byte-identical retraction-cells. ``derived_from`` carries the
    retracting asserted cell-id which is content-addressed, so replay is
    a determinism gate per ``presheaf-storage.md`` §5.
    """
    layout1, log1 = substrate
    active1: list[str] = []
    _add_rule(
        layout1, name="a-implies-b", premise={"flag/a": "True"},
        conclusion={"flag/b": "True"}, active=active1,
    )
    respond(
        target="alice", payload={"flag/a": "True"}, sender="tester",
        layout=layout1, event_log=log1, node_id="test-node", active_rule_ids=active1,
    )
    r2_first = respond(
        target="alice", payload={"flag/a": "False"}, sender="tester",
        layout=layout1, event_log=log1, node_id="test-node", active_rule_ids=active1,
    )

    # Fresh storage; same sequence.
    layout2 = StorageLayout(tmp_path / "root2")
    layout2.ensure_dirs()
    log2 = EventLog(tmp_path / "root2")
    log2.initialize(node_id="test-node", wall_clock_ns=0)
    active2: list[str] = []
    _add_rule(
        layout2, name="a-implies-b", premise={"flag/a": "True"},
        conclusion={"flag/b": "True"}, active=active2,
    )
    respond(
        target="alice", payload={"flag/a": "True"}, sender="tester",
        layout=layout2, event_log=log2, node_id="test-node", active_rule_ids=active2,
    )
    r2_second = respond(
        target="alice", payload={"flag/a": "False"}, sender="tester",
        layout=layout2, event_log=log2, node_id="test-node", active_rule_ids=active2,
    )

    rc_first = [
        c for c in r2_first.cell.cells
        if c.derived_via == "dependent-invalid"
    ]
    rc_second = [
        c for c in r2_second.cell.cells
        if c.derived_via == "dependent-invalid"
    ]
    assert [c.id for c in rc_first] == [c.id for c in rc_second], (
        "dependent-invalid cell-ids MUST be byte-identical across replay"
    )
