"""Federation merge persists witness atoms (cells:[] + cells_by_predicate).

merge_peer_fiber receives a peer's flat predicates map and joins it
into the local fiber under ⊙. v0.1 represents this delta as one
asserted Cell atom per raised predicate (sender = peer node id),
ensuring the snapshot's cells:[] array carries witnesses for every
fiber-state delta and the fiber's cells_by_predicate stays complete —
the invariant respond.py's preflight check enforces.
"""

from __future__ import annotations

import json
from pathlib import Path

import pytest

from network.federation import merge_peer_fiber
from substrate.algebra import BilatticeValue
from substrate.closure_engine import RuleRecord
from substrate.respond import respond as do_respond
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


@pytest.fixture
def substrate(tmp_path: Path) -> tuple[StorageLayout, EventLog]:
    root = tmp_path / "root"
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id="local-node", wall_clock_ns=0)
    return layout, log


def test_federation_merge_emits_witness_cells(substrate):
    layout, log = substrate
    summary = merge_peer_fiber(
        layout=layout, event_log=log,
        peer_node_id="peer-alpha", entity="shared-entity",
        fiber_predicates={"alpha/positive": "True", "beta/positive": "True"},
        persist=True, node_id="local-node",
    )
    assert summary["persisted"] is True
    snap = layout.get_record("cells", summary["cell_id"])
    cells = snap.get("cells") or []
    by_pred = {c["p"]: c for c in cells}
    assert set(by_pred) == {"alpha/positive", "beta/positive"}
    for p, atom in by_pred.items():
        assert atom["s"] == "shared-entity"
        assert atom["o"] == "shared-entity"
        assert atom["v"] == "True"
        assert atom["stratum"] == "asserted"
        assert atom["sender"] == "peer-alpha"

    fiber = layout.get_fiber("shared-entity")
    assert set(fiber["cells_by_predicate"]) == {"alpha/positive", "beta/positive"}
    for p in ("alpha/positive", "beta/positive"):
        assert fiber["cells_by_predicate"][p] == by_pred[p]["id"]


def test_federation_merge_only_emits_cells_for_raised_predicates(substrate):
    layout, log = substrate
    merge_peer_fiber(
        layout=layout, event_log=log,
        peer_node_id="peer-alpha", entity="shared-entity",
        fiber_predicates={"p/positive": "True"},
        persist=True, node_id="local-node",
    )
    pre_fiber = layout.get_fiber("shared-entity")
    pre_witness_id = pre_fiber["cells_by_predicate"]["p/positive"]

    summary2 = merge_peer_fiber(
        layout=layout, event_log=log,
        peer_node_id="peer-beta", entity="shared-entity",
        fiber_predicates={"p/positive": "True"},
        persist=True, node_id="local-node",
    )
    snap2 = layout.get_record("cells", summary2["cell_id"])
    assert (snap2.get("cells") or []) == []

    fiber = layout.get_fiber("shared-entity")
    assert fiber["cells_by_predicate"]["p/positive"] == pre_witness_id


def test_federation_skips_brand_new_none_predicates(substrate):
    """A peer sending a brand-new key at value ``None`` must not
    materialize that key in either ``predicates`` or
    ``cells_by_predicate``.

    NONE is the bilattice bottom (no information), so writing a fresh
    NONE-valued predicate would introduce a key without a witness cell
    (the raised-only emission path skips it because joined == cur ==
    NONE). This test pins the invariant guard in merge_peer_fiber.
    """
    layout, log = substrate
    summary = merge_peer_fiber(
        layout=layout, event_log=log,
        peer_node_id="peer-x", entity="ghost-entity",
        fiber_predicates={"untouched/positive": "None"},
        persist=True, node_id="local-node",
    )
    assert summary["persisted"] is True
    snap = layout.get_record("cells", summary["cell_id"])
    assert (snap.get("cells") or []) == []
    fiber = layout.get_fiber("ghost-entity")
    assert "untouched/positive" not in fiber["predicates"]
    assert "untouched/positive" not in fiber["cells_by_predicate"]


def test_federation_replaces_witness_when_existing_key_is_raised(substrate):
    """A peer sending ``True`` for a key that locally is at ``False``
    raises the value (knowledge_join(False, True) = Both): the merge
    emits a fresh asserted cell and replaces the existing witness id in
    cells_by_predicate.

    This pins the "raise replaces witness" path of the
    only-emit-for-raised optimization (joined != cur, so the cell is
    emitted and cells_by_predicate is updated). We bootstrap with
    ``False`` rather than ``None`` because ``None`` is lifted to
    ``Both`` by the Δ-pass during respond (per
    ``specs/kernel/sigma-delta-passes.md`` §3.Δ); ``False`` is a
    bilattice fixed point and survives Δ-stabilization unchanged.
    """
    layout, log = substrate
    # Bootstrap: local fiber starts with k=False (Δ-stable settled value).
    do_respond(
        target="raise-target",
        payload={"k/positive": "False"},
        sender="local",
        layout=layout, event_log=log, node_id="local-node",
        active_rule_ids=[],
    )
    pre_fiber = layout.get_fiber("raise-target")
    assert pre_fiber["predicates"]["k/positive"] == "False"
    pre_witness_id = pre_fiber["cells_by_predicate"]["k/positive"]

    summary = merge_peer_fiber(
        layout=layout, event_log=log,
        peer_node_id="peer-y", entity="raise-target",
        fiber_predicates={"k/positive": "True"},
        persist=True, node_id="local-node",
    )
    snap = layout.get_record("cells", summary["cell_id"])
    fed_cells = snap.get("cells") or []
    assert len(fed_cells) == 1
    assert fed_cells[0]["p"] == "k/positive"
    # Federation emits the post-merge join value on the asserted cell
    # (per src/network/federation.py: ``v=merged[p]``):
    # knowledge_join(False, True) = Both.
    assert fed_cells[0]["v"] == "Both"
    assert fed_cells[0]["sender"] == "peer-y"

    fiber = layout.get_fiber("raise-target")
    # knowledge_join(False, True) = Both — the post-merge fiber value.
    assert fiber["predicates"]["k/positive"] == "Both"
    assert fiber["cells_by_predicate"]["k/positive"] == fed_cells[0]["id"]
    assert fiber["cells_by_predicate"]["k/positive"] != pre_witness_id


def test_respond_against_federated_fiber_satisfies_witness_invariant(substrate):
    layout, log = substrate
    merge_peer_fiber(
        layout=layout, event_log=log,
        peer_node_id="peer-alpha", entity="shared-entity",
        fiber_predicates={"input/positive": "True"},
        persist=True, node_id="local-node",
    )
    # Capture the federation witness id BEFORE the respond so the
    # assertion below pins exact equality (not "any value in the map").
    federated_input_id = layout.get_fiber("shared-entity")[
        "cells_by_predicate"
    ]["input/positive"]

    rule = RuleRecord(
        name="input-implies-output",
        premise={"input/positive": BilatticeValue.TRUE},
        conclusion={"output/positive": BilatticeValue.TRUE},
    )
    rule_id, _ = layout.put_record("rules", rule.canonical_body())

    result = do_respond(
        target="shared-entity",
        payload={"trigger/positive": "True"},
        sender="local",
        layout=layout, event_log=log, node_id="local-node",
        active_rule_ids=[rule_id],
    )
    saturated = [c for c in result.cell.cells if c.stratum == "saturated"]
    assert len(saturated) == 1 and saturated[0].p == "output/positive"
    assert saturated[0].derived_from == [federated_input_id], (
        f"saturated atom must witness exactly the federation cell for "
        f"input/positive (id={federated_input_id}); "
        f"got derived_from={saturated[0].derived_from}"
    )
    assert saturated[0].derived_via == rule_id
