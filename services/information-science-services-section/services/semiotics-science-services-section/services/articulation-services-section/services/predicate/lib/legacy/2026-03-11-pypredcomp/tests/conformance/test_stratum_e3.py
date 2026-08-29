"""Per-stratum presheaf projection conformance — vector §11.7.

Per ``specs/filesystem/presheaf-storage.md`` §3 + §4.2 + §5 + §10 and
``specs/conformance-vectors.md`` §11.7.

Spec §3 distinguishes two stratum operators:

* ``project_stratum(fiber, s)`` — exact-match: cells whose ``stratum``
  field equals ``s``. Default per spec: ``"settled"``.
* ``project_stratum_at_or_below(fiber, s)`` — cumulative in the §1
  lattice ``asserted ⊑ saturated ⊑ settled``.

Spec §4.2 + §10 gate 1: every respond that touches an entity MUST
materialise three by-stratum projection files at
``$ROOT/fibers/<entity>/by-stratum/{asserted,saturated,settled}.json``.
Each file is the on-disk form of the **exact-match**
``project_stratum`` at that stratum. The files are content-addressed;
byte-identical inputs produce byte-identical bytes; discarding and
rebuilding from the event log + fiber history reproduces the same
bytes (gate 4).

These tests pin:

1. After respond, the three by-stratum files exist on disk.
2. Cell visibility per file is **exact-match**: each file holds only
   cells whose ``stratum`` equals the file name.
3. The settled projection is the read-surface default
   (``read_fiber_projection`` with no stratum argument).
4. Re-projecting the same fiber state produces byte-identical bytes.
5. Discarding the projection files and rebuilding reproduces
   byte-identical bytes (§10 gate 4).
6. Unknown stratum names raise ``PCC_PROJECTION_UNKNOWN_INDEX``.
7. ``project_stratum_at_or_below`` returns the cumulative cell set
   distinct from ``project_stratum``.
8. Missing snapshot during projection rebuild surfaces a hard error,
   not a silent omission (corruption-masking guard).
"""

from __future__ import annotations

import pytest

from substrate.algebra import BilatticeValue
from substrate.closure_engine import RuleRecord
from substrate.error_codes import (
    PCC_PROJECTION_UNKNOWN_INDEX,
    PCS_RECORD_NOT_FOUND,
    SubstrateError,
)
from substrate.projection import (
    PROJECTED_STRATA,
    materialize_by_stratum_projections,
    project_stratum,
    project_stratum_at_or_below,
    read_fiber_projection,
)
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


# -----------------------------------------------------------------------------
# Materialisation existence + on-disk shape (§10 gate 1)
# -----------------------------------------------------------------------------


def test_respond_materialises_three_by_stratum_files(substrate):
    """One respond → three projection files on disk under by-stratum/."""
    layout, log = substrate
    respond(
        target="alice",
        payload={"ready/positive": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    for stratum in PROJECTED_STRATA:
        path = layout.by_stratum_path("alice", stratum)
        assert path.exists(), f"{stratum}.json missing after respond"


def test_projection_files_have_correct_shape(substrate):
    """Each projection file is a content-addressed FiberSnapshot."""
    layout, log = substrate
    respond(
        target="alice",
        payload={"ready/positive": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    for stratum in PROJECTED_STRATA:
        body = layout.get_fiber_projection("alice", stratum)
        assert body is not None
        assert body["entity"] == "alice"
        assert "cells" in body
        assert "predicates" in body
        assert "id" in body
        assert len(body["id"]) == 64, "projection id is SHA-256 hex"


# -----------------------------------------------------------------------------
# Exact-match stratum semantics (§3 + stratified-facts.md §6)
# -----------------------------------------------------------------------------


def test_each_projection_file_holds_only_its_stratum_cells(substrate):
    """A respond with closure firings emits asserted + saturated cells.
    The exact-match by-stratum files separate them: asserted.json
    holds only stratum=='asserted' cells; saturated.json holds only
    stratum=='saturated' cells; settled.json holds only stratum==
    'settled' cells (empty in this scenario — Δ-pass is a no-op
    without bilattice movement)."""
    layout, log = substrate
    active: list[str] = []
    _add_rule(
        layout,
        name="ready-implies-finished",
        premise={"ready/positive": "True"},
        conclusion={"system/finished": "True"},
        active=active,
    )
    respond(
        target="bob",
        payload={"ready/positive": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=active,
    )
    asserted = layout.get_fiber_projection("bob", "asserted")
    saturated = layout.get_fiber_projection("bob", "saturated")
    settled = layout.get_fiber_projection("bob", "settled")

    # Exact-match: asserted.json contains cells with stratum=='asserted' only.
    assert {c["stratum"] for c in asserted["cells"]} == {"asserted"}
    assert "ready/positive" in asserted["predicates"]
    assert "system/finished" not in asserted["predicates"], (
        "saturated firing must NOT appear in the exact-match asserted projection"
    )

    # Exact-match: saturated.json contains cells with stratum=='saturated' only.
    assert {c["stratum"] for c in saturated["cells"]} == {"saturated"}
    assert "system/finished" in saturated["predicates"]
    assert "ready/positive" not in saturated["predicates"], (
        "asserted premise must NOT appear in the exact-match saturated projection"
    )

    # Exact-match: settled.json is empty here (no Δ-stabilizations occurred).
    assert settled["cells"] == []
    assert settled["predicates"] == {}


def test_settled_is_read_surface_default(substrate):
    """``read_fiber_projection`` defaults to the exact-match settled
    projection per stratified-facts.md §6."""
    layout, log = substrate
    respond(
        target="carol",
        payload={"flag/observed": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    default = read_fiber_projection(layout=layout, entity_slug="carol")
    explicit = read_fiber_projection(layout=layout, entity_slug="carol", stratum="settled")
    assert default is not None and explicit is not None
    assert default.id == explicit.id, "default projection IS the settled projection"


def test_asserted_projection_holds_payload_cells(substrate):
    """A payload-only respond produces an asserted.json with the
    payload predicate, and empty saturated/settled files."""
    layout, log = substrate
    respond(
        target="ivy",
        payload={"flag/observed": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    asserted = layout.get_fiber_projection("ivy", "asserted")
    saturated = layout.get_fiber_projection("ivy", "saturated")
    settled = layout.get_fiber_projection("ivy", "settled")
    assert asserted["predicates"] == {"flag/observed": "True"}
    assert saturated["predicates"] == {}
    assert settled["predicates"] == {}


# -----------------------------------------------------------------------------
# Byte-identity (§5, §11.7 round-trip)
# -----------------------------------------------------------------------------


def test_projection_byte_identity_on_repeated_materialisation(substrate):
    """Re-running materialize_by_stratum_projections on the same fiber
    produces byte-identical bytes (the projection function is pure)."""
    layout, log = substrate
    respond(
        target="dave",
        payload={"flag/observed": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    before = {
        s: layout.get_fiber_projection_bytes("dave", s)
        for s in PROJECTED_STRATA
    }
    fiber = layout.get_fiber("dave")
    materialize_by_stratum_projections(
        layout=layout,
        entity_slug="dave",
        fiber=fiber,
    )
    after = {
        s: layout.get_fiber_projection_bytes("dave", s)
        for s in PROJECTED_STRATA
    }
    for s in PROJECTED_STRATA:
        assert before[s] == after[s], f"{s} projection not byte-identical on re-materialise"


def test_projection_rebuild_after_discard_is_byte_identical(substrate):
    """§10 gate 4: discarding projection files and rebuilding from the
    fiber history reproduces byte-identical bytes."""
    layout, log = substrate
    active: list[str] = []
    _add_rule(
        layout,
        name="ready-implies-finished",
        premise={"ready/positive": "True"},
        conclusion={"system/finished": "True"},
        active=active,
    )
    respond(
        target="erin", payload={"ready/positive": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=active,
    )
    respond(
        target="erin", payload={"flag/observed": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=active,
    )
    before = {
        s: layout.get_fiber_projection_bytes("erin", s)
        for s in PROJECTED_STRATA
    }
    removed = layout.discard_fiber_projections("erin")
    assert removed == 3
    for s in PROJECTED_STRATA:
        assert layout.get_fiber_projection_bytes("erin", s) is None

    materialize_by_stratum_projections(
        layout=layout,
        entity_slug="erin",
        fiber=layout.get_fiber("erin"),
    )
    after = {
        s: layout.get_fiber_projection_bytes("erin", s)
        for s in PROJECTED_STRATA
    }
    for s in PROJECTED_STRATA:
        assert before[s] == after[s], (
            f"{s} projection differs after discard+rebuild "
            f"(presheaf-storage §10 gate 4 violated)"
        )


def test_projection_accumulates_across_respond_rounds(substrate):
    """A respond at round N+1 must see asserted cells from round N
    in the asserted projection (per-stratum projections accumulate
    across all respond rounds touching the entity)."""
    layout, log = substrate
    respond(
        target="frank", payload={"flag/a": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    respond(
        target="frank", payload={"flag/b": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    asserted = layout.get_fiber_projection("frank", "asserted")
    cell_predicates = {c["p"] for c in asserted["cells"]}
    assert cell_predicates == {"flag/a", "flag/b"}
    assert asserted["predicates"] == {"flag/a": "True", "flag/b": "True"}


def test_knowledge_join_in_predicates_dict(substrate):
    """When a predicate has multiple asserted cells across rounds with
    distinct values, the asserted projection's predicates dict is the
    knowledge-join (per stratified-facts §6 the read-surface predicate
    value is the join of every visible cell's value)."""
    layout, log = substrate
    respond(
        target="grace", payload={"flag/state": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    respond(
        target="grace", payload={"flag/state": "False"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    asserted = layout.get_fiber_projection("grace", "asserted")
    # Two asserted cells (one per round) for the same predicate; their
    # values are True and Both (the round-2 cell carries the post-merge
    # value Both = knowledge_join(True, False)). The projection's
    # predicates dict is the join: True ⊙ Both = Both.
    assert asserted["predicates"]["flag/state"] == "Both"


# -----------------------------------------------------------------------------
# Pure projection functions (§3 operator semantics)
# -----------------------------------------------------------------------------


def _three_stratum_cells():
    """Build one cell per stratum for operator-comparison tests."""
    return [
        Cell(s="x", p="p", o="x", v=BilatticeValue.TRUE, ord=0, stratum="asserted").with_id(),
        Cell(
            s="x", p="q", o="x", v=BilatticeValue.TRUE, ord=1, stratum="saturated",
            derived_from=["a" * 64], derived_via="rule:r1",
        ).with_id(),
        Cell(
            s="x", p="r", o="x", v=BilatticeValue.TRUE, ord=2, stratum="settled",
            derived_from=["b" * 64], derived_via="⊙-stabilize",
        ).with_id(),
    ]


def test_project_stratum_is_exact_match():
    """``project_stratum`` returns only cells whose stratum equals s."""
    cells = _three_stratum_cells()
    asserted = project_stratum(cells=cells, entity_slug="x", stratum="asserted")
    saturated = project_stratum(cells=cells, entity_slug="x", stratum="saturated")
    settled = project_stratum(cells=cells, entity_slug="x", stratum="settled")
    assert {c.p for c in asserted.cells} == {"p"}
    assert {c.p for c in saturated.cells} == {"q"}
    assert {c.p for c in settled.cells} == {"r"}


def test_project_stratum_at_or_below_is_cumulative():
    """``project_stratum_at_or_below`` returns cells whose stratum ⊑ s
    in the §1 lattice ``asserted ⊑ saturated ⊑ settled``."""
    cells = _three_stratum_cells()
    asserted = project_stratum_at_or_below(cells=cells, entity_slug="x", stratum="asserted")
    saturated = project_stratum_at_or_below(cells=cells, entity_slug="x", stratum="saturated")
    settled = project_stratum_at_or_below(cells=cells, entity_slug="x", stratum="settled")
    assert {c.p for c in asserted.cells} == {"p"}
    assert {c.p for c in saturated.cells} == {"p", "q"}
    assert {c.p for c in settled.cells} == {"p", "q", "r"}


def test_project_operators_disagree_when_strata_differ():
    """The two operators have distinct semantics; a regression that
    conflates them would silently flip behaviour. Pin the difference."""
    cells = _three_stratum_cells()
    exact = project_stratum(cells=cells, entity_slug="x", stratum="settled")
    cumul = project_stratum_at_or_below(cells=cells, entity_slug="x", stratum="settled")
    assert exact.id != cumul.id, (
        "exact-match and cumulative projections must produce distinct snapshot ids "
        "when input has cells at multiple strata"
    )


def test_unknown_stratum_raises_projection_unknown_index():
    """An unknown stratum string surfaces ``PCC_PROJECTION_UNKNOWN_INDEX``."""
    with pytest.raises(SubstrateError) as excinfo:
        project_stratum(cells=[], entity_slug="x", stratum="bogus")
    assert excinfo.value.code == PCC_PROJECTION_UNKNOWN_INDEX
    with pytest.raises(SubstrateError) as excinfo:
        project_stratum_at_or_below(cells=[], entity_slug="x", stratum="bogus")
    assert excinfo.value.code == PCC_PROJECTION_UNKNOWN_INDEX


def test_read_fiber_projection_unknown_stratum(substrate):
    layout, _ = substrate
    with pytest.raises(SubstrateError) as excinfo:
        read_fiber_projection(layout=layout, entity_slug="x", stratum="bogus")
    assert excinfo.value.code == PCC_PROJECTION_UNKNOWN_INDEX


def test_read_fiber_projection_returns_none_for_untouched_entity(substrate):
    layout, _ = substrate
    assert read_fiber_projection(layout=layout, entity_slug="never-touched") is None


# -----------------------------------------------------------------------------
# Corruption-masking guard
# -----------------------------------------------------------------------------


def test_missing_snapshot_during_rebuild_raises_hard_error(substrate):
    """If a snapshot id referenced by the entity's history is missing
    from the cells/ store, projection rebuild MUST raise — not silently
    drop the missing atoms (which would yield a projection that
    disagrees byte-wise with the canonical re-projection from the
    event log, violating presheaf-storage.md §5 byte-identity)."""
    layout, log = substrate
    respond(
        target="hank", payload={"flag/observed": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
    )
    fiber = layout.get_fiber("hank")
    # Forge a corrupt history entry with a snapshot id that doesn't exist.
    fake_id = "f" * 64
    fiber["history"].append({"cell_id": fake_id, "ord": 999})
    with pytest.raises(SubstrateError) as excinfo:
        materialize_by_stratum_projections(
            layout=layout, entity_slug="hank", fiber=fiber,
        )
    assert excinfo.value.code == PCS_RECORD_NOT_FOUND


# -----------------------------------------------------------------------------
# Projection-id stability across independent substrates
# -----------------------------------------------------------------------------


def test_two_substrates_with_same_inputs_produce_identical_projection_ids(tmp_path):
    """Byte-identity at the projection level: two independent substrates
    fed the same respond inputs produce projections with identical ids
    and identical on-disk bytes."""
    def _run(root):
        layout = StorageLayout(root)
        layout.ensure_dirs()
        log = EventLog(root)
        log.initialize(node_id="test-node", wall_clock_ns=0)
        respond(
            target="iris", payload={"ready/positive": "True"}, sender="tester",
            layout=layout, event_log=log, node_id="test-node", active_rule_ids=[],
        )
        return layout

    layout_a = _run(tmp_path / "a")
    layout_b = _run(tmp_path / "b")
    for s in PROJECTED_STRATA:
        body_a = layout_a.get_fiber_projection("iris", s)
        body_b = layout_b.get_fiber_projection("iris", s)
        assert body_a["id"] == body_b["id"], (
            f"{s} projection id differs across byte-identical inputs"
        )
        assert (
            layout_a.get_fiber_projection_bytes("iris", s)
            == layout_b.get_fiber_projection_bytes("iris", s)
        )
