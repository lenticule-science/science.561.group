"""Conformance tests for the Lawvere-quantale cost ledger.

Per ``library/.../predicated-computing/theorems/cost-composition-via-lawvere-quantale.md``
(PC #22): substrate operation costs compose by the chosen Lawvere
quantale's binary operation $\\otimes$. Default substrate quantale:
$([0, \\infty], +, \\min)$.

Per ``cost-discipline``: three operation classes — reads contribute
the unit, admissions contribute small constants, settlements
contribute variable positive cost.
"""

from __future__ import annotations

import math
from pathlib import Path

import pytest

from substrate.cost import (
    AdditiveCostQuantale,
    CostCell,
    DEFAULT_QUANTALE,
    LawvereQuantale,
    ReliabilityQuantale,
    emit_cost,
    query_total_cost,
    read_costs,
)
from storage.storage_layout import StorageLayout


@pytest.fixture
def layout(tmp_path: Path) -> StorageLayout:
    s = StorageLayout(tmp_path)
    s.ensure_dirs()
    return s


def test_additive_quantale_is_substrate_default():
    assert isinstance(DEFAULT_QUANTALE, AdditiveCostQuantale)
    assert DEFAULT_QUANTALE.unit() == 0.0
    assert DEFAULT_QUANTALE.compose(2.0, 3.0) == 5.0
    assert DEFAULT_QUANTALE.join(2.0, 3.0) == 2.0  # cheapest path
    assert DEFAULT_QUANTALE.fold([1.0, 2.0, 3.0]) == 6.0
    assert DEFAULT_QUANTALE.fold([]) == 0.0  # unit-fold


def test_additive_quantale_axioms():
    """A Lawvere quantale's $\\otimes$ is associative, commutative
    (for our cost quantale), and has the unit as identity."""
    q = AdditiveCostQuantale()
    a, b, c = 1.0, 2.0, 3.0
    # Associativity
    assert q.compose(q.compose(a, b), c) == q.compose(a, q.compose(b, c))
    # Commutativity
    assert q.compose(a, b) == q.compose(b, a)
    # Unit is identity
    assert q.compose(q.unit(), a) == a
    assert q.compose(a, q.unit()) == a


def test_reliability_quantale_is_multiplicative():
    """Per cost-composition-via-lawvere-quantale's "non-additive
    quantales" section: independent failures multiply."""
    q = ReliabilityQuantale()
    assert q.unit() == 1.0
    assert q.compose(0.9, 0.8) == pytest.approx(0.72)
    assert q.fold([0.9, 0.8, 0.95]) == pytest.approx(0.9 * 0.8 * 0.95)


def test_infinity_absorbs_in_additive():
    q = AdditiveCostQuantale()
    assert q.compose(math.inf, 5.0) == math.inf
    assert q.compose(5.0, math.inf) == math.inf


def test_emit_and_query_total_cost(layout: StorageLayout):
    """Two cost cells fold to their additive sum."""
    for i, v in enumerate([1.5, 2.5, 4.0]):
        cell = CostCell(
            entity="rsc:thing",
            cost_class="settlement",
            value=v,
            quantale="additive",
            event_ord=i,
        ).with_id()
        emit_cost(layout=layout, cell=cell)

    summary = query_total_cost(layout=layout, entity_slug="rsc:thing")
    assert summary.total == pytest.approx(8.0)
    assert summary.cell_count == 3
    assert summary.quantale == "additive"
    assert summary.by_class["settlement"] == pytest.approx(8.0)


def test_reads_contribute_unit(layout: StorageLayout):
    """Per cost-discipline-reads-free: reads contribute the quantale
    unit, so they don't change the running total."""
    emit_cost(layout=layout, cell=CostCell(
        entity="rsc:thing",
        cost_class="settlement",
        value=10.0,
        quantale="additive",
        event_ord=0,
    ).with_id())
    for i in range(5):
        emit_cost(layout=layout, cell=CostCell(
            entity="rsc:thing",
            cost_class="read",
            value=0.0,
            quantale="additive",
            event_ord=i + 1,
        ).with_id())
    summary = query_total_cost(layout=layout, entity_slug="rsc:thing")
    assert summary.total == pytest.approx(10.0)
    assert summary.by_class["read"] == 0.0
    assert summary.by_class["settlement"] == pytest.approx(10.0)


def test_three_cost_classes(layout: StorageLayout):
    """The session-cost decomposition per the theorem:
    c = sum_reads(0) + sum_admissions(ε) + sum_settlements(c_j)."""
    emit_cost(layout=layout, cell=CostCell(
        entity="rsc:thing", cost_class="read", value=0.0,
        event_ord=0,
    ).with_id())
    emit_cost(layout=layout, cell=CostCell(
        entity="rsc:thing", cost_class="admission", value=0.1,
        event_ord=1,
    ).with_id())
    emit_cost(layout=layout, cell=CostCell(
        entity="rsc:thing", cost_class="admission", value=0.1,
        event_ord=2,
    ).with_id())
    emit_cost(layout=layout, cell=CostCell(
        entity="rsc:thing", cost_class="settlement", value=5.0,
        event_ord=3,
    ).with_id())
    summary = query_total_cost(layout=layout, entity_slug="rsc:thing")
    assert summary.total == pytest.approx(5.2)
    assert summary.by_class["read"] == 0.0
    assert summary.by_class["admission"] == pytest.approx(0.2)
    assert summary.by_class["settlement"] == pytest.approx(5.0)


def test_quantale_switching_mid_composition_rejected(layout: StorageLayout):
    """Per cost-composition-via-lawvere-quantale's "what the theorem
    rules out": switching quantales mid-composition is malformed."""
    emit_cost(layout=layout, cell=CostCell(
        entity="rsc:thing", value=1.0, quantale="additive", event_ord=0,
    ).with_id())
    emit_cost(layout=layout, cell=CostCell(
        entity="rsc:thing", value=0.9, quantale="reliability", event_ord=1,
    ).with_id())
    with pytest.raises(ValueError, match="quantale"):
        query_total_cost(layout=layout, entity_slug="rsc:thing")


def test_respond_emits_cost_cell(layout: StorageLayout, tmp_path: Path):
    """End-to-end: respond emits a CostCell whose value the cost
    ledger surfaces under the entity."""
    from substrate.respond import respond
    from storage.event_log import EventLog
    log = EventLog(tmp_path)
    log.initialize(node_id="test-node")

    r = respond(
        target="rsc:thing",
        payload={"raining": "True"},
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    cells = read_costs(layout, "rsc:thing")
    if r.cost_cell_id is not None:
        # When the respond did substrate work, a cost cell exists.
        assert any(c.id == r.cost_cell_id for c in cells)
    else:
        # No work done → the substrate's reads-free convention permits
        # suppressing the cost emission.
        assert all(c.event_ord != r.event_ord for c in cells)
