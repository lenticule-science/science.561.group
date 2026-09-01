"""Conformance tests for the Box_R modal-restriction authorization primitive.

Per ``library/.../predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md``
(PC #22): all six engineering surfaces of authorization are
*structurally one phenomenon* — the modal necessity operator $\\Box_R$
applied to the substrate's single accessibility relation $R$.

Structural properties of $\\Box_R$ verified here per
``modal-necessity-basic-properties``:

- truth-meet preservation: $\\Box_R(u \\wedge_t u') = \\Box_R(u) \\wedge_t \\Box_R(u')$
- constant-true preservation: $\\Box_R(\\mathbf{t})$ along an accessible
  edge equals the accessibility value
- non-amplification: $\\Box_R(u) \\leq_t u$
"""

from __future__ import annotations

from itertools import product
from pathlib import Path

import pytest

from substrate.algebra import BilatticeValue, truth_leq, truth_meet
from substrate.authorization import (
    AccessibilityCell,
    authz_check,
    box_R,
    has_accessibility_relation,
    read_accessibility,
    write_accessibility,
)
from substrate.respond import respond
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


@pytest.fixture
def layout(tmp_path: Path) -> StorageLayout:
    s = StorageLayout(tmp_path)
    s.ensure_dirs()
    return s


@pytest.fixture
def event_log(tmp_path: Path) -> EventLog:
    log = EventLog(tmp_path)
    log.initialize(node_id="test-node")
    return log


def test_no_accessibility_relation_is_default_off(
    layout: StorageLayout, event_log: EventLog,
):
    """Per the v0.2 backwards-compat convention: no accessibility cells
    on disk → authz gate is off → respond proceeds."""
    assert not has_accessibility_relation(layout)
    log = event_log
    r = respond(
        target="rsc:thing",
        payload={"raining": "True"},
        sender="rsc:peer",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    assert r.authz_decision is None
    assert r.cell_id


def test_accessibility_relation_enables_gate_grants_true(
    layout: StorageLayout, event_log: EventLog,
):
    """A single grant cell makes the (sender → target) edge accessible
    with allowed_value=TRUE; respond proceeds and authz_decision is
    populated."""
    write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from="rsc:peer",
        world_to="rsc:thing",
        allowed_value=BilatticeValue.TRUE,
    ))
    log = event_log
    r = respond(
        target="rsc:thing",
        payload={"raining": "True"},
        sender="rsc:peer",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    assert r.authz_decision is not None
    assert r.authz_decision["allowed"] is True


def test_accessibility_relation_present_but_no_grant_denies(
    layout: StorageLayout, event_log: EventLog,
):
    """The accessibility relation is installed (one grant for SOME
    edge), but the requested edge has no grant → unrelated edges
    default to NONE → Box_R returns NONE → restricted to ⊥.

    Per t02-41 and ``decisions/capability-not-acl.md``: restriction is
    algebraic, so respond returns a vacuous RespondResult (no cell, no
    event, target fiber unchanged) carrying the denied authz_decision
    on it. No exception is raised. The substrate does not produce
    PCC_AUTHZ_DENIED; that code is retained only for driver wire
    compatibility per ``substrate.error_codes``.
    """
    write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from="rsc:other",
        world_to="rsc:other",
        allowed_value=BilatticeValue.TRUE,
    ))
    log = event_log
    height_before = log.height()
    fiber_before = layout.get_fiber("rsc:thing")
    r = respond(
        target="rsc:thing",
        payload={"raining": "True"},
        sender="rsc:peer",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    assert r.authz_decision is not None
    assert r.authz_decision["allowed"] is False
    assert r.authz_decision["box_value"] == BilatticeValue.NONE.value
    assert r.cell_id is None
    assert r.cell is None
    assert r.event_id is None
    assert log.height() == height_before
    assert layout.get_fiber("rsc:thing") == fiber_before


def test_explicit_false_grant_denies(layout: StorageLayout):
    """An accessibility cell with allowed_value=FALSE explicitly denies
    the edge."""
    write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from="rsc:peer",
        world_to="rsc:thing",
        allowed_value=BilatticeValue.FALSE,
    ))
    decision = authz_check(layout=layout, sender="rsc:peer", target="rsc:thing")
    assert not decision.allowed
    assert decision.box_value == BilatticeValue.FALSE


def test_box_R_truth_meet_preservation():
    """Per modal-necessity-basic-properties:
    Box_R(u ∧t u') = Box_R(u) ∧t Box_R(u')

    We exhaustively check all (u, u', acc) triples in the 4-element
    Belnap bilattice (64 cases)."""
    cells = [
        AccessibilityCell(
            surface="authentication",
            world_from="a",
            world_to="b",
            allowed_value=acc,
        )
        for acc in BilatticeValue
    ]
    for u, u_prime in product(BilatticeValue, BilatticeValue):
        for acc in BilatticeValue:
            cell_set = [AccessibilityCell(
                surface="authentication",
                world_from="a",
                world_to="b",
                allowed_value=acc,
            )]
            lhs = box_R(
                requested_value=truth_meet(u, u_prime),
                surface="authentication",
                world_from="a",
                world_to="b",
                cells=cell_set,
            )
            rhs = truth_meet(
                box_R(requested_value=u, surface="authentication",
                      world_from="a", world_to="b", cells=cell_set),
                box_R(requested_value=u_prime, surface="authentication",
                      world_from="a", world_to="b", cells=cell_set),
            )
            assert lhs == rhs, f"truth-meet preservation failed for u={u} u'={u_prime} acc={acc}"


def test_box_R_non_amplification():
    """Per modal-necessity-basic-properties: Box_R(u) ≤_t u.
    The modal restriction can only LOWER (or preserve) the requested
    value in the truth order."""
    cells = [AccessibilityCell(
        surface="authentication",
        world_from="a",
        world_to="b",
        allowed_value=BilatticeValue.TRUE,
    )]
    for u in BilatticeValue:
        boxed = box_R(
            requested_value=u,
            surface="authentication",
            world_from="a",
            world_to="b",
            cells=cells,
        )
        assert truth_leq(boxed, u), f"non-amplification failed: u={u} → box={boxed}"


def test_box_R_constant_true_preservation():
    """Per modal-necessity-basic-properties:
    Box_R(TRUE) along a fully-granted edge = TRUE."""
    cells = [AccessibilityCell(
        surface="authentication",
        world_from="a",
        world_to="b",
        allowed_value=BilatticeValue.TRUE,
    )]
    boxed = box_R(
        requested_value=BilatticeValue.TRUE,
        surface="authentication",
        world_from="a",
        world_to="b",
        cells=cells,
    )
    assert boxed == BilatticeValue.TRUE


def test_six_surfaces_use_one_relation(layout: StorageLayout):
    """Per the theorem's "one R, six surfaces" framing: the same
    AccessibilityCell type with different `surface` tags parameterizes
    the same relation across all six engineering surfaces."""
    for surface in (
        "governance", "trust-boundary", "federation",
        "capability", "authentication", "agent-self-queueing",
    ):
        write_accessibility(layout, AccessibilityCell(
            surface=surface,
            world_from="a",
            world_to="b",
            allowed_value=BilatticeValue.TRUE,
        ))
    cells = read_accessibility(layout)
    assert len(cells) == 6
    surfaces = {c.surface for c in cells}
    assert len(surfaces) == 6


def test_authz_can_be_explicitly_disabled(
    layout: StorageLayout, event_log: EventLog,
):
    """enforce_authz=False is an explicit operator override that
    bypasses the gate even when an accessibility relation exists."""
    write_accessibility(layout, AccessibilityCell(
        surface="authentication",
        world_from="rsc:other",
        world_to="rsc:other",
        allowed_value=BilatticeValue.TRUE,
    ))
    log = event_log
    r = respond(
        target="rsc:thing",
        payload={"raining": "True"},
        sender="rsc:peer",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
        enforce_authz=False,
    )
    assert r.authz_decision is None
    assert r.cell_id
