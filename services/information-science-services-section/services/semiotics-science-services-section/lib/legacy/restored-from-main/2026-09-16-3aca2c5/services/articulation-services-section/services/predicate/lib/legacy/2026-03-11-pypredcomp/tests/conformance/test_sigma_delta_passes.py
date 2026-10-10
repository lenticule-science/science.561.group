"""σ↔Δ passes conformance — predicated-computing kernel Phase 3.

Per ``specs/kernel/sigma-delta-passes.md`` §3 + ``conformance-vectors.md``
§11.1, §11.3, §11.4, §11.6 + gate 9 (Δ-pass permutation invariance):

* §11.1 stratum extension — every emitted cell carries a ``stratum`` tag
  in {``"asserted"``, ``"saturated"``, ``"settled"``}, and ``"settled"``
  cells carry the correct witness chain.
* §11.3 Δ-only fixture — payload with ``None``-valued predicates fires
  the Δ-pass without any σ-firings; post-Δ predicate values lift via
  the four-valued bilattice's closure operator (``None → Both``).
* §11.4 σ↔Δ alternation — a Δ-stabilization that raises a value to
  ``Both`` matches a previously-unmatched closure-rule premise; the
  outer loop re-runs σ to consume the new firing.
* §11.6 settled-stratum cells — a ``"settled"`` cell's ``derived_from``
  references the asserted/saturated cell that fed the stabilization;
  ``derived_via`` carries the bilattice-operator tag.
* gate 9 — Δ-pass is order-invariant: two responds whose payloads differ
  only in key-iteration order produce byte-identical fibers.
"""

from __future__ import annotations

import json

import pytest

from substrate.algebra import BilatticeValue
from substrate.canonicalization import canonical
from substrate.closure_engine import RuleRecord
from substrate.delta_pass import (
    DELTA_FUEL,
    compute_wavefront_ordinals,
    run_delta_pass,
    stabilize_value,
)
from substrate.closure_engine import RepairEntry
from substrate.error_codes import (
    PCM_RESPOND_PHASE,
    PCR_BILATTICE_DIVERGED,
    PCR_DELTA_NO_MOVEMENT,
    PCR_DELTA_STABILIZED,
    PCR_SIGMA_DELTA_DIVERGED,
    SubstrateError,
)
from substrate import respond as respond_module
from substrate.respond import (
    DeltaLogEntry,
    PhaseMarker,
    respond,
)
from storage.event_log import EventLog
from storage.storage_layout import StorageLayout


# -----------------------------------------------------------------------------
# Fixtures
# -----------------------------------------------------------------------------


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
# Δ-pass per-cell stabilization (unit-of-the-mechanism)
# -----------------------------------------------------------------------------


class TestStabilizeValue:
    """Per-cell ``stabilize_value`` is the four-valued bilattice's closure
    operator: ``None → Both``, identity on settled values."""

    def test_none_lifts_to_both(self):
        v, substeps, via = stabilize_value(BilatticeValue.NONE)
        assert v == BilatticeValue.BOTH
        # post_close on NONE: 1 substep moves NONE→BOTH; 2nd substep
        # confirms the fixed point. Either is acceptable; the spec
        # requires ≤ delta_fuel.
        assert 1 <= substeps <= DELTA_FUEL
        assert via == "⊙-stabilize"

    @pytest.mark.parametrize(
        "value", [BilatticeValue.TRUE, BilatticeValue.FALSE, BilatticeValue.BOTH]
    )
    def test_settled_values_are_fixed_points(self, value):
        v, substeps, via = stabilize_value(value)
        assert v == value, f"{value} should be a Δ-stabilization fixed point"
        assert substeps == 1, "settled values converge in a single substep"

    def test_zero_fuel_is_rejected(self):
        with pytest.raises(SubstrateError) as excinfo:
            stabilize_value(BilatticeValue.NONE, delta_fuel=0)
        assert excinfo.value.code == PCR_BILATTICE_DIVERGED


# -----------------------------------------------------------------------------
# Wavefront ordinal — BFS through closure-rule premise → conclusion graph
# -----------------------------------------------------------------------------


class TestWavefrontOrdinals:
    """Per ``library/.../wavefront.md``: the wavefront ordinal is the
    structural transitive-closure distance from the seed predicates."""

    def test_seeds_have_ordinal_zero(self):
        ord_ = compute_wavefront_ordinals(rules=[], seed_predicates={"a", "b"})
        assert ord_ == {"a": 0, "b": 0}

    def test_one_hop_conclusion(self):
        rule = RuleRecord(
            name="a-implies-b", premise={"a": "True"}, conclusion={"b": "True"}
        )
        ord_ = compute_wavefront_ordinals(rules=[rule], seed_predicates={"a"})
        assert ord_ == {"a": 0, "b": 1}

    def test_two_hop_chain(self):
        r1 = RuleRecord(name="ab", premise={"a": "True"}, conclusion={"b": "True"})
        r2 = RuleRecord(name="bc", premise={"b": "True"}, conclusion={"c": "True"})
        ord_ = compute_wavefront_ordinals(rules=[r1, r2], seed_predicates={"a"})
        assert ord_["a"] == 0
        assert ord_["b"] == 1
        assert ord_["c"] == 2

    def test_unreachable_predicates_omitted(self):
        rule = RuleRecord(name="ab", premise={"a": "True"}, conclusion={"b": "True"})
        ord_ = compute_wavefront_ordinals(rules=[rule], seed_predicates={"x"})
        assert "b" not in ord_
        assert ord_ == {"x": 0}


# -----------------------------------------------------------------------------
# §11.3 — Δ-only fixture (no σ-firings; pure bilattice stabilization)
# -----------------------------------------------------------------------------


def test_delta_only_payload_lifts_none_to_both(substrate):
    """A payload that asserts a predicate at value ``None`` (no info)
    triggers the Δ-pass to lift it to ``Both`` via the bilattice closure
    operator. No closure rules fire."""
    layout, log = substrate
    result = respond(
        target="alice",
        payload={"observation/missing": "None"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    snapshot = result.cell

    # No σ-firings — repair_log is empty.
    assert result.repair_log == [], "Δ-only fixture has zero σ-firings"

    # Cells: one asserted (NONE), one settled (BOTH after Δ-stabilization).
    asserted = [c for c in snapshot.cells if c.stratum == "asserted"]
    settled = [c for c in snapshot.cells if c.stratum == "settled"]
    assert len(asserted) == 1 and asserted[0].v == BilatticeValue.NONE
    assert len(settled) == 1
    s = settled[0]
    assert s.p == "observation/missing"
    assert s.v == BilatticeValue.BOTH
    assert s.derived_via == "⊙-stabilize"
    assert s.derived_from == [asserted[0].id], (
        "settled witness must point to the asserted cell that fed Δ-stabilization"
    )

    # Δ-log records the stabilization with the right code.
    stabilizations = [
        e for e in result.delta_log if e.code == PCR_DELTA_STABILIZED
    ]
    assert len(stabilizations) == 1
    e = stabilizations[0]
    assert e.predicate == "observation/missing"
    assert e.pre_value == "None"
    assert e.post_value == "Both"
    assert e.via == "⊙-stabilize"
    assert e.iteration == 0
    assert 1 <= e.substeps <= DELTA_FUEL


def test_delta_only_settled_cells_within_delta_fuel(substrate):
    """Per §11.3 + §3.Δ: every cell stabilizes within ``delta_fuel = 4``
    substeps. The four-valued bilattice's bounded-settlement property."""
    layout, log = substrate
    result = respond(
        target="bob",
        payload={
            "p1/none": "None",
            "p2/none": "None",
            "p3/none": "None",
        },
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    stabilizations = [
        e for e in result.delta_log if e.code == PCR_DELTA_STABILIZED
    ]
    assert len(stabilizations) == 3
    for e in stabilizations:
        assert e.substeps <= DELTA_FUEL, (
            f"Δ-stabilization of {e.predicate} took {e.substeps} substeps; "
            f"delta_fuel = {DELTA_FUEL}"
        )


def test_settled_value_already_at_fixed_point_no_movement(substrate):
    """A payload that asserts an already-settled value (e.g. True) hits
    the Δ-pass at a fixed point — no settled cell is emitted; the Δ-log
    records ``PCR_DELTA_NO_MOVEMENT``."""
    layout, log = substrate
    result = respond(
        target="carol",
        payload={"flag/positive": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    settled = [c for c in result.cell.cells if c.stratum == "settled"]
    assert settled == [], "no settled cells when asserted value is already fixed"

    nm = [e for e in result.delta_log if e.code == PCR_DELTA_NO_MOVEMENT]
    assert len(nm) == 1
    assert nm[0].predicate == "flag/positive"
    assert nm[0].pre_value == nm[0].post_value == "True"


# -----------------------------------------------------------------------------
# §11.4 — σ↔Δ alternation
# -----------------------------------------------------------------------------


def test_delta_movement_triggers_fresh_sigma_iteration(substrate):
    """A Δ-stabilization that raises ``None → Both`` matches a
    closure-rule premise that requires ``Both``; the outer loop runs a
    second σ-pass to consume the new firing.

    Setup: rule premise ``{p: Both}`` (matches values ≥k Both, i.e. only
    Both itself), conclusion ``{q: True}``. Payload asserts ``p: None``.

    Iteration 0: σ-pass fires nothing (None ≱k Both). Δ-pass lifts p to
    Both. Iteration 1: σ-pass fires the rule (Both ≥k Both); Δ-pass
    finds no movement. Iteration 2: outer fixed point, exit.
    """
    layout, log = substrate
    active: list[str] = []
    rule_id = _add_rule(
        layout,
        name="both-implies-q",
        premise={"p/maybe": "Both"},
        conclusion={"q/derived": "True"},
        active=active,
    )
    result = respond(
        target="dave",
        payload={"p/maybe": "None"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=active,
    )

    # Outer loop ran ≥ 2 iterations (σ→Δ→σ→Δ→fixed-point).
    assert result.outer_iterations >= 2, (
        f"Δ-then-σ alternation must run ≥ 2 outer iterations; "
        f"got {result.outer_iterations}"
    )
    # Exactly one σ-firing: the rule fires in iteration 1 after Δ raised p.
    assert len(result.repair_log) == 1
    assert result.repair_log[0].rule_id == rule_id

    asserted_p = [
        c for c in result.cell.cells
        if c.p == "p/maybe" and c.stratum == "asserted"
    ]
    assert len(asserted_p) == 1 and asserted_p[0].v == BilatticeValue.NONE
    settled_p = [
        c for c in result.cell.cells
        if c.p == "p/maybe" and c.stratum == "settled"
    ]
    assert len(settled_p) == 1 and settled_p[0].v == BilatticeValue.BOTH

    saturated = [c for c in result.cell.cells if c.stratum == "saturated"]
    assert len(saturated) == 1
    sat = saturated[0]
    assert sat.p == "q/derived"
    # Witness chain: saturated cell points to the SETTLED cell (the cell
    # whose Δ-elevated value satisfied the rule's premise), not the
    # original asserted cell. cells_by_predicate was updated to the
    # settled atom after Δ-emission.
    assert sat.derived_from == [settled_p[0].id], (
        "σ-firing in iteration 1 must witness the Δ-emitted settled cell, "
        "not the original asserted cell, because cells_by_predicate is "
        "updated when Δ emits a settled atom"
    )

    # Final fiber predicates reflect post-Δ state.
    assert result.cell.predicates["p/maybe"] == BilatticeValue.BOTH
    assert result.cell.predicates["q/derived"] == BilatticeValue.TRUE


def test_phase_log_records_outer_loop_phase_markers(substrate):
    """Phase markers segment the repair log into σ/Δ sub-passes per
    ``sigma-delta-passes.md`` §5."""
    layout, log = substrate
    result = respond(
        target="erin",
        payload={"flag/positive": "True"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    # Even a no-σ no-Δ-movement respond emits the iteration-0 phase
    # markers (sigma-start, delta-start) so log readers can locate the
    # sub-pass boundaries.
    assert all(m.code == PCM_RESPOND_PHASE for m in result.phase_log)
    variants = [m.variant for m in result.phase_log]
    assert variants[:2] == ["sigma-start", "delta-start"]
    assert all(m.iteration == 0 for m in result.phase_log[:2])


# -----------------------------------------------------------------------------
# §11.6 — settled-stratum cells (witness chain shape + via-tag)
# -----------------------------------------------------------------------------


def test_settled_cell_persisted_record_round_trips(substrate):
    """The on-disk snapshot record must include the settled cell with
    its full ``stratum``, ``derived_from``, and ``derived_via`` fields."""
    layout, log = substrate
    result = respond(
        target="frank",
        payload={"sensor/idle": "None"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    raw = layout.get_record_bytes("cells", result.cell.id)
    body = json.loads(raw)
    settled = [a for a in body["cells"] if a.get("stratum") == "settled"]
    assert len(settled) == 1
    s = settled[0]
    assert s["p"] == "sensor/idle"
    assert s["v"] == "Both"
    assert s["derived_via"] == "⊙-stabilize"
    assert isinstance(s["derived_from"], list) and len(s["derived_from"]) == 1
    # The witness id refers to the asserted cell in the same snapshot.
    asserted_ids = {a["id"] for a in body["cells"] if a.get("stratum") == "asserted"}
    assert set(s["derived_from"]) <= asserted_ids


def test_fiber_cells_by_predicate_maps_to_settled_after_delta(substrate):
    """When Δ emits a settled cell, the fiber's ``cells_by_predicate``
    map must point to the settled cell (highest-stratum atom wins)."""
    layout, log = substrate
    result = respond(
        target="grace",
        payload={"observation/missing": "None"},
        sender="tester",
        layout=layout,
        event_log=log,
        node_id="test-node",
        active_rule_ids=[],
    )
    fiber = layout.get_fiber("grace")
    settled = [
        c for c in result.cell.cells
        if c.p == "observation/missing" and c.stratum == "settled"
    ][0]
    assert fiber["cells_by_predicate"]["observation/missing"] == settled.id, (
        "post-Δ witness map must point to the settled cell so subsequent "
        "responds chain against it"
    )


# -----------------------------------------------------------------------------
# Gate 9 — Δ-pass permutation invariance
# -----------------------------------------------------------------------------


def test_delta_pass_permutation_invariance_on_payload_key_order(substrate, tmp_path):
    """Per gate 9 + §3.Δ ordering: Δ-pass orders its worklist by
    (wavefront ordinal, predicate), producing identical fibers regardless
    of payload key insertion order. ALL N! permutations of the asserted
    intake must yield byte-identical snapshots and fibers — exhaustive
    coverage of the Scott-continuity property."""
    import itertools

    keys = ["p1/none", "p2/none", "p3/none"]
    # Mix bilattice values so the Δ-pass actually does work and the
    # permutation invariance applies to a non-trivial fixture: two
    # NONE-asserted cells (require Δ stabilization) plus one TRUE
    # (already at fixed point — exercises the "no-movement" path).
    base_payload = {
        "p1/none": "None",
        "p2/none": "None",
        "p3/none": "True",
    }
    canonical_id: str | None = None
    canonical_fiber_bytes: bytes | None = None

    for i, perm in enumerate(itertools.permutations(keys)):
        payload = {k: base_payload[k] for k in perm}
        layout = StorageLayout(tmp_path / f"perm-{i}")
        layout.ensure_dirs()
        log = EventLog(tmp_path / f"perm-{i}")
        log.initialize(node_id="test-node", wall_clock_ns=0)
        result = respond(
            target="harry", payload=payload, sender="tester",
            layout=layout, event_log=log,
            node_id="test-node", active_rule_ids=[],
        )
        if canonical_id is None:
            canonical_id = result.cell.id
            canonical_fiber_bytes = canonical(layout.get_fiber("harry"))
        else:
            assert result.cell.id == canonical_id, (
                f"gate 9: permutation {perm} produced cell id "
                f"{result.cell.id} != canonical {canonical_id}"
            )
            assert canonical(layout.get_fiber("harry")) == canonical_fiber_bytes, (
                f"gate 9: permutation {perm} produced different fiber bytes"
            )

    # Sanity: we covered all 6 permutations.
    assert i == 5, f"expected 6 permutations (3!), iterated {i + 1}"


# -----------------------------------------------------------------------------
# Wavefront expansion — Δ-pass processes structural successors, not just seeds
# -----------------------------------------------------------------------------


def test_wavefront_expansion_processes_downstream_cells_via_prev_fiber(
    substrate,
):
    """Per ``sigma-delta-passes.md`` §3.Δ + ``library/.../wavefront.md``:
    when a Δ-stabilization could affect downstream cells, the worklist
    expands to include those cells in true wavefront order — not just
    the σ-moved seeds.

    Fixture:
    - Round 1: respond asserts ``b/maybe: None``, no rules. Δ stabilizes
      b → BOTH (b is a seed, ordinal 0).
    - Round 2: add rule ``a → b`` THEN respond asserts ``a/seed: None``.
      Seeds for the round = {a/seed} (payload). The Δ-pass now sees
      that b/maybe is *reachable* from a/seed via the rule graph
      (ordinal 1), and even though b is already at BOTH (a fixed point),
      the worklist expansion records a ``PCR_DELTA_NO_MOVEMENT`` entry
      for b/maybe at ``wavefront_ordinal=1`` — exercising the
      structural-successor expansion. Without expansion, b/maybe would
      not appear in the round-2 delta_log at all.
    """
    layout, log = substrate
    # Round 1: bootstrap b/maybe at None (Δ lifts to BOTH).
    respond(
        target="ivy", payload={"b/maybe": "None"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=[],
    )

    # Round 2: add rule a→b, respond with a/seed: None.
    active: list[str] = []
    _add_rule(
        layout,
        name="a-to-b",
        premise={"a/seed": "True"},
        conclusion={"b/maybe": "True"},
        active=active,
    )
    result = respond(
        target="ivy", payload={"a/seed": "None"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=active,
    )

    # The Δ-pass worklist must include BOTH a/seed (ordinal 0, seed) and
    # b/maybe (ordinal 1, structural successor) — gathered in wavefront
    # order. Without the expansion, only a/seed would be processed.
    delta_predicates = sorted(
        (e.predicate, e.wavefront_ordinal)
        for e in result.delta_log
        if e.iteration == 0
    )
    assert ("a/seed", 0) in delta_predicates, (
        "seed predicate a/seed must appear in Δ-pass worklist at ordinal 0"
    )
    assert ("b/maybe", 1) in delta_predicates, (
        "structural successor b/maybe (reachable via a→b rule) must "
        "appear in Δ-pass worklist at wavefront ordinal 1"
    )


# -----------------------------------------------------------------------------
# Unified audit log — single chronological repair stream per spec §5
# -----------------------------------------------------------------------------


def test_audit_log_unifies_chronological_repair_stream(substrate):
    """Per ``sigma-delta-passes.md`` §5: ``audit_log`` interleaves phase
    markers, σ-firings, and Δ-stabilizations in true emission order.
    The typed projections (``repair_log``, ``delta_log``, ``phase_log``)
    are stratum-specific filters of this single stream."""
    layout, log = substrate
    active: list[str] = []
    _add_rule(
        layout,
        name="both-implies-q",
        premise={"p/maybe": "Both"},
        conclusion={"q/derived": "True"},
        active=active,
    )
    result = respond(
        target="jane", payload={"p/maybe": "None"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=active,
    )

    # audit_log non-empty and contains entries from all three strata.
    kinds = [type(e).__name__ for e in result.audit_log]
    assert "PhaseMarker" in kinds
    assert "RepairEntry" in kinds, "σ-firings must appear in audit_log"
    assert "DeltaLogEntry" in kinds, "Δ-stabilizations must appear in audit_log"

    # Chronological invariant: first entry is sigma-start at iteration 0.
    first = result.audit_log[0]
    assert isinstance(first, PhaseMarker)
    assert first.variant == "sigma-start" and first.iteration == 0

    # Projection equivalence: filtering audit_log yields the typed fields.
    audit_phase = [e for e in result.audit_log if isinstance(e, PhaseMarker)]
    audit_sigma = [e for e in result.audit_log if isinstance(e, RepairEntry)]
    audit_delta = [e for e in result.audit_log if isinstance(e, DeltaLogEntry)]
    assert audit_phase == result.phase_log
    assert audit_sigma == result.repair_log
    assert audit_delta == result.delta_log

    # Within each iteration: sigma-start strictly precedes the σ-firing
    # which strictly precedes delta-start which strictly precedes the
    # Δ-entry. Verify via index ordering.
    sigma_start_0 = next(
        i for i, e in enumerate(result.audit_log)
        if isinstance(e, PhaseMarker)
        and e.variant == "sigma-start" and e.iteration == 1
    )
    delta_start_0 = next(
        i for i, e in enumerate(result.audit_log)
        if isinstance(e, PhaseMarker)
        and e.variant == "delta-start" and e.iteration == 1
    )
    sigma_fired_0 = next(
        i for i, e in enumerate(result.audit_log)
        if isinstance(e, RepairEntry)
    )
    assert sigma_start_0 < sigma_fired_0 < delta_start_0, (
        "Within iteration 1: sigma-start < σ-firing < delta-start"
    )


# -----------------------------------------------------------------------------
# §3.outer — termination depends on Δ-movement, not σ-firing
# -----------------------------------------------------------------------------


def test_sigma_fires_but_delta_stable_terminates_in_one_iteration(
    substrate, monkeypatch
):
    """Per ``sigma-delta-passes.md`` §3.outer: the σ-pass always reaches
    a closure-rule fixed point internally (``fire_rules`` saturates), so
    the σ↔Δ outer loop should re-enter σ ONLY when Δ-stabilization moved
    a value that could unlock a previously-unmatched premise. If σ
    fires in iteration 0 but Δ produces no emissions, the loop must
    terminate at ``outer_iterations=1`` — NOT force a spurious second
    iteration that could exhaust outer fuel and emit a false
    ``PCR_SIGMA_DELTA_DIVERGED`` halt.

    Fixture: a closure rule whose premise is asserted directly in the
    payload at TRUE — σ fires in iteration 0, but neither the asserted
    nor the derived predicate has any NONE → BOTH movement, so Δ emits
    nothing.

    Stress test: monkeypatch SIGMA_DELTA_OUTER_FUEL=1. Under the old
    (buggy) termination criterion this would trigger a false divergence
    halt; under the corrected criterion the loop converges cleanly.
    """
    monkeypatch.setattr(respond_module, "SIGMA_DELTA_OUTER_FUEL", 1)

    layout, log = substrate
    active: list[str] = []
    _add_rule(
        layout,
        name="p-true-implies-q-true",
        premise={"p/asserted": "True"},
        conclusion={"q/derived": "True"},
        active=active,
    )
    result = respond(
        target="mona", payload={"p/asserted": "True"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=active,
    )

    assert result.halted_with is None, (
        "σ-fired-but-Δ-stable must converge cleanly even at "
        "SIGMA_DELTA_OUTER_FUEL=1; got "
        f"halted_with={result.halted_with!r}"
    )
    assert result.outer_iterations == 1, (
        "σ-fired-but-Δ-stable must terminate at outer_iterations=1 "
        "(re-entering σ is justified only by Δ-movement, not by σ "
        f"firings in the just-completed σ fixed-point); got "
        f"outer_iterations={result.outer_iterations}"
    )
    # σ fired (q/derived was concluded from p/asserted).
    assert any(
        "q/derived" in r.raised for r in result.repair_log
    ), "expected the closure rule to fire (q/derived in repair_log.raised)"
    # Δ produced no emissions in this iteration.
    iter0_emissions = [
        e for e in result.delta_log
        if e.iteration == 0 and e.code == PCR_DELTA_STABILIZED
    ]
    assert iter0_emissions == [], (
        "Δ must have no STABILIZED emissions when all values are at "
        "bilattice fixed point"
    )
    # Phase log shows exactly one σ↔Δ round-trip and no halt marker.
    halt_markers = [
        m for m in result.phase_log if m.variant.startswith("halt-")
    ]
    assert halt_markers == [], (
        f"no halt markers expected on convergence; got {halt_markers}"
    )
    sigma_starts = [m for m in result.phase_log if m.variant == "sigma-start"]
    delta_starts = [m for m in result.phase_log if m.variant == "delta-start"]
    assert len(sigma_starts) == 1 and len(delta_starts) == 1, (
        "exactly one σ-start and one δ-start when terminating in iter 0"
    )


# -----------------------------------------------------------------------------
# §11.6 — pathological outer-fuel exhaustion: partial state preserved
# -----------------------------------------------------------------------------


def test_outer_fuel_exhaustion_preserves_partial_state(substrate, monkeypatch):
    """Per ``sigma-delta-passes.md`` §6 (3.outer row): when the σ↔Δ
    alternation does not converge within ``SIGMA_DELTA_OUTER_FUEL``
    round-trips, the cell + event still commit, ``halted_with`` carries
    ``PCR_SIGMA_DELTA_DIVERGED``, and a ``halt-outer-fuel`` phase marker
    is appended. The substrate does NOT raise — partial state is
    preserved per §6."""
    # Force outer fuel to 1 so a Δ-then-σ alternation cannot converge.
    monkeypatch.setattr(respond_module, "SIGMA_DELTA_OUTER_FUEL", 1)

    layout, log = substrate
    active: list[str] = []
    _add_rule(
        layout,
        name="both-implies-q",
        premise={"p/maybe": "Both"},
        conclusion={"q/derived": "True"},
        active=active,
    )
    # Payload asserts p/maybe at None — Δ lifts to Both, which would
    # enable the rule, but with outer_fuel=1 the second σ-pass never
    # runs. The respond must still return a valid result with
    # halted_with set.
    result = respond(
        target="kate", payload={"p/maybe": "None"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=active,
    )

    assert result.halted_with == PCR_SIGMA_DELTA_DIVERGED, (
        f"outer-fuel exhaustion must set halted_with; got {result.halted_with!r}"
    )
    halt_markers = [
        m for m in result.phase_log if m.variant == "halt-outer-fuel"
    ]
    assert len(halt_markers) == 1, (
        "exactly one halt-outer-fuel phase marker on outer-fuel exhaustion"
    )
    assert halt_markers[0].code == PCM_RESPOND_PHASE

    # Partial state preserved: the cell + fiber + event were persisted
    # despite divergence. p/maybe is at Both (Δ-stabilized) even though
    # the second σ-pass never ran.
    assert result.cell.predicates["p/maybe"] == BilatticeValue.BOTH
    fiber = layout.get_fiber("kate")
    assert fiber is not None
    assert fiber["latest_cell_id"] == result.cell.id
    assert fiber["predicates"]["p/maybe"] == "Both"


def test_bilattice_divergence_preserves_partial_state(substrate, monkeypatch):
    """Per ``sigma-delta-passes.md`` §6 (3.Δ row): when a per-cell
    Δ-pass exceeds ``delta_fuel``, ``PCR_BILATTICE_DIVERGED`` is the
    halt cause; the cell + event still commit and a
    ``halt-bilattice-diverged`` phase marker is appended."""
    # Force per-cell delta_fuel to 0 so any Δ-stabilization that would
    # do real work (NONE → BOTH) raises PCR_BILATTICE_DIVERGED.
    # ``respond`` binds DELTA_FUEL at import time, so monkeypatch the
    # module-level symbol on ``substrate.respond`` directly.
    monkeypatch.setattr(respond_module, "DELTA_FUEL", 0)

    layout, log = substrate
    result = respond(
        target="liam", payload={"p/none": "None"}, sender="tester",
        layout=layout, event_log=log, node_id="test-node",
        active_rule_ids=[],
    )

    assert result.halted_with == PCR_BILATTICE_DIVERGED, (
        f"per-cell Δ-fuel exhaustion must set halted_with; "
        f"got {result.halted_with!r}"
    )
    halt_markers = [
        m for m in result.phase_log if m.variant == "halt-bilattice-diverged"
    ]
    assert len(halt_markers) == 1
    assert halt_markers[0].code == PCM_RESPOND_PHASE

    # Partial state preserved: the asserted cell was emitted (pre-Δ),
    # the fiber + event committed. The settled cell was NOT emitted
    # because Δ aborted before stabilization.
    asserted = [c for c in result.cell.cells if c.stratum == "asserted"]
    settled = [c for c in result.cell.cells if c.stratum == "settled"]
    assert len(asserted) == 1 and asserted[0].p == "p/none"
    assert settled == [], "no settled cells when Δ-pass aborts mid-worklist"
    fiber = layout.get_fiber("liam")
    assert fiber is not None
    assert fiber["latest_cell_id"] == result.cell.id


# -----------------------------------------------------------------------------
# Δ-pass module API — direct invocation (no respond wrapper)
# -----------------------------------------------------------------------------


def test_run_delta_pass_returns_no_movement_on_settled_only_seed():
    """Calling ``run_delta_pass`` with predicates already at fixed point
    yields zero emissions and one no-movement entry per seed."""
    result = run_delta_pass(
        predicates={
            "a": BilatticeValue.TRUE,
            "b": BilatticeValue.BOTH,
        },
        moved_predicates={"a", "b"},
        rules=[],
    )
    assert result.emissions == []
    nm_predicates = sorted(nm.predicate for nm in result.no_movement)
    assert nm_predicates == ["a", "b"]
    assert result.final_predicates == {
        "a": BilatticeValue.TRUE,
        "b": BilatticeValue.BOTH,
    }


def test_run_delta_pass_emits_for_none_seed():
    """Calling ``run_delta_pass`` with a NONE-valued seed yields one
    emission per stabilizable cell."""
    result = run_delta_pass(
        predicates={"a": BilatticeValue.NONE, "b": BilatticeValue.TRUE},
        moved_predicates={"a", "b"},
        rules=[],
    )
    assert len(result.emissions) == 1
    e = result.emissions[0]
    assert e.predicate == "a"
    assert e.pre_value == "None"
    assert e.post_value == "Both"
    assert e.via == "⊙-stabilize"
    assert result.final_predicates["a"] == BilatticeValue.BOTH
    assert result.final_predicates["b"] == BilatticeValue.TRUE
