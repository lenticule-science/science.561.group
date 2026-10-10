"""Conformance — fuel-composition byte-identical replay (`t02-44f`).

Pairs with `task:t02-44` ("Fuel-composition gate: explicit `F = top-level
ceiling` produces byte-identical replay") per
[milestones/v0.2a-multi-user-single-node.md](../../docs/dev/milestones/v0.2a-multi-user-single-node.md)
§"Freeze gates" #6 and
[decisions/fixture-authoring-paired-task.md](../../docs/dev/decisions/fixture-authoring-paired-task.md).

The freeze gate this fixture proves is the milestone's gate item 6:

    "The fuel-composition gate: a ``respond`` invocation with explicit
     ``F = top-level ceiling`` produces byte-identical replay across
     two fresh boot cycles."

Authority for the implementation surface:
[specs/kernel/fuel-composition.md](../../docs/dev/specs/kernel/fuel-composition.md)
§5 "Conformance gates":

    1. Honours the §1 composition law — total cost = quantale-⊗ of the
       five fuel-surface contributions.
    2. Honours the §3 cost-class assignments — reads emit at unit;
       admissions at the small constant; settlements at the consumed
       total.
    3. (Implied by the milestone's gate #6) Replays byte-identically
       under explicit ``F``.

The scenario itself is a two-respond sequence: the first asserts
``(task:fuel-demo, status-open) = TRUE``; the second contradicts it
with ``False``, raising a paraconsistent contradiction so
``EmitCostCellPhase`` emits a settlement cost cell (per its
short-circuit: emission is skipped *only* when ``cost_value <= 0`` AND
``not pending_inconsistencies``). A pure no-op respond would
legitimately omit the settlement cell — under the additive quantale's
unit ``0`` the quantale-fold is preserved either way — but exercising
gate #6 against a scenario with a real cost-cell emission is the
load-bearing replay surface.

The fixture has three legs:

* **Replay leg** (``test_respond_with_explicit_fuel_replays_byte_identical``)
  — runs the two-respond scenario against two fresh substrates with an
  explicit top-level fuel ceiling ``F = _F_CEILING`` and asserts:

    - The full ``events.jsonl`` byte stream is identical across runs
      (the milestone's literal gate-#6 assertion).
    - Every cost-cell file under ``$ROOT/cost/`` is byte-identical
      across runs (the cost ledger is part of the replay surface per
      §3, even though it lives outside the event log).
    - The returned ``RespondResult.cell_id``, ``cost_cell_id``, and
      ``outer_iterations`` agree across runs (cross-checks the bytes).

* **Cost-class leg** (``test_settlement_emission_is_per_respond_under_quantale``)
  — anchors §3 + §4.2 commitment #2 ("per-pass per-iteration cost
  cells are NOT separately emitted") by asserting per-invocation
  semantics: the first (no-op) respond emits no settlement cell (the
  ``EmitCostCellPhase`` short-circuit when ``cost_value <= 0`` AND
  ``not pending_inconsistencies`` is consistent with the additive
  quantale's unit ``0`` — omission preserves the §1 fold), and the
  second (contradicting) respond emits exactly one settlement cell
  tagged with the additive quantale, with a finite ``>= 0`` value.
  Asserting the two invocations separately stops the test from
  ratifying any specific aggregate count.

* **Reads-are-free leg** (``test_query_total_cost_preserves_quantale_fold``)
  — anchors §3 + the ``cost-discipline-reads-free`` theorem at the
  spec's actual level: a read-only ``query_total_cost`` over the
  responded entity does not change the cost-ledger's quantale-fold
  (the spec permits read-class cells, but they MUST contribute the
  additive quantale unit ``0`` per §3, so the fold is invariant
  regardless of whether they are materialised). Catches the
  regression mode where a future read path starts billing reads at
  positive cost.

The replay leg pins the same non-determinism sources as
``test_t02_34f_multi_user_authoring.py`` (no ``wall_clock_ns`` on
``EventLog.initialize``); ``respond`` itself does not pass
``wall_clock_ns`` to the event log (verified by inspection of
``PersistPhase.run``) and cost cells are content-addressed via
``cid(canonical_body)`` per ``cost.py``.
"""

from __future__ import annotations

import math
from pathlib import Path

import pytest

from storage.event_log import EVENT_LOG_FILENAME, EventLog
from storage.storage_layout import StorageLayout
from substrate.cost import (
    DEFAULT_QUANTALE,
    AdditiveCostQuantale,
    query_total_cost,
    read_costs,
)
from substrate.respond import respond


_NODE_ID = "test-node"
_TARGET = "task:fuel-demo"
_F_CEILING = 256  # explicit top-level fuel ceiling F per fuel-composition.md §1

# Two-respond scenario: the first respond asserts ``p = True``; the
# second respond asserts the same predicate as ``False`` and so raises
# a paraconsistent contradiction (the post-fiber predicate value rises
# to ``Both``). The second respond has ``pending_inconsistencies`` set,
# which is the documented condition under which ``EmitCostCellPhase``
# emits a settlement cost cell even when the σ-closure cycle count is
# zero (per ``respond.py::EmitCostCellPhase.run``: emission is skipped
# only when ``cost_value <= 0`` AND ``not pending_inconsistencies``).
# This means the scenario as a whole produces (a) two event-log
# appends, (b) at least one settlement cost cell, and (c) one
# inconsistency-witness cell — a richer replay surface than a single
# no-op respond and the smallest scenario that exercises all three
# fuel-composition conformance legs together.
_PAYLOAD_FIRST = {"status-open": "True"}
_PAYLOAD_SECOND = {"status-open": "False"}


# ---------------------------------------------------------------------------
# Fixture builders
# ---------------------------------------------------------------------------


def _provision(root: Path) -> tuple[StorageLayout, EventLog]:
    """Stand up a fresh substrate with a wall-clock-free event log."""
    layout = StorageLayout(root)
    layout.ensure_dirs()
    log = EventLog(root)
    log.initialize(node_id=_NODE_ID)  # no wall_clock_ns -> deterministic
    return layout, log


def _run_scenario_with_explicit_F(
    layout: StorageLayout, log: EventLog, *, fuel: int
) -> tuple[object, object]:
    """Two respond invocations under an explicit top-level ``F``.

    Returns the two ``RespondResult``s in invocation order. The second
    creates a paraconsistent contradiction so ``EmitCostCellPhase``
    emits a settlement cost cell.
    """
    first = respond(
        target=_TARGET,
        payload=_PAYLOAD_FIRST,
        sender="user:captain",
        layout=layout,
        event_log=log,
        node_id=_NODE_ID,
        active_rule_ids=[],
        fuel=fuel,
    )
    second = respond(
        target=_TARGET,
        payload=_PAYLOAD_SECOND,
        sender="user:captain",
        layout=layout,
        event_log=log,
        node_id=_NODE_ID,
        active_rule_ids=[],
        fuel=fuel,
    )
    return first, second


def _events_bytes(root: Path) -> bytes:
    """Raw bytes of the substrate's event log."""
    return (root / EVENT_LOG_FILENAME).read_bytes()


def _cost_dir_bytes(root: Path) -> dict[str, bytes]:
    """Per-file bytes of every cost cell on disk, keyed by relative path.

    Returned as a dict so a difference between runs surfaces *which*
    cost-cell file diverged, not just that some file did.
    """
    cost_root = root / "cost"
    out: dict[str, bytes] = {}
    if not cost_root.exists():
        return out
    for f in sorted(cost_root.rglob("*.json")):
        out[str(f.relative_to(root))] = f.read_bytes()
    return out


# ---------------------------------------------------------------------------
# Test 1: gate-#6 — byte-identical replay under explicit F
# ---------------------------------------------------------------------------


def test_respond_with_explicit_fuel_replays_byte_identical(tmp_path: Path):
    """Milestone freeze-gate #6: a ``respond`` invocation with explicit
    ``F = top-level ceiling`` produces byte-identical replay across two
    fresh boot cycles.

    The literal gate is the ``events.jsonl`` byte equality. The cost
    ledger and the returned ``RespondResult`` ids are checked alongside
    so a regression in cost-cell determinism (e.g., adding
    ``wall_clock_ns`` to a cost cell's body) cannot ratify under a pure
    event-log compare.
    """
    root_a = tmp_path / "boot_a"
    root_b = tmp_path / "boot_b"
    root_a.mkdir()
    root_b.mkdir()

    layout_a, log_a = _provision(root_a)
    first_a, result_a = _run_scenario_with_explicit_F(
        layout_a, log_a, fuel=_F_CEILING
    )

    layout_b, log_b = _provision(root_b)
    first_b, result_b = _run_scenario_with_explicit_F(
        layout_b, log_b, fuel=_F_CEILING
    )

    # Literal gate-#6 assertion.
    assert _events_bytes(root_a) == _events_bytes(root_b), (
        "events.jsonl diverged across two fresh boot cycles under "
        f"explicit fuel F = {_F_CEILING}"
    )

    # Cost ledger participates in the replay surface — §3 cost cells are
    # written under $ROOT/cost/<entity>/<id>.json with content-addressed
    # ids; their bytes must match across runs too.
    assert _cost_dir_bytes(root_a) == _cost_dir_bytes(root_b), (
        "cost ledger diverged across two fresh boot cycles under "
        f"explicit fuel F = {_F_CEILING}"
    )

    # Returned RespondResult cross-check: the public surface that
    # downstream (federation, dashboards) consumes must agree on both
    # invocations of the scenario.
    assert first_a.cell_id == first_b.cell_id
    assert first_a.cost_cell_id == first_b.cost_cell_id
    assert first_a.outer_iterations == first_b.outer_iterations
    assert result_a.cell_id == result_b.cell_id
    assert result_a.cost_cell_id == result_b.cost_cell_id
    assert result_a.outer_iterations == result_b.outer_iterations

    # The contradicting second respond must have triggered settlement
    # cost-cell emission (per ``EmitCostCellPhase.run``: emission runs
    # when ``pending_inconsistencies`` is set even if cost_value == 0).
    assert result_a.cost_cell_id is not None, (
        "second respond raised a contradiction but emitted no settlement "
        "cost cell — fuel-composition.md §3 + EmitCostCellPhase invariant "
        "violated"
    )


# ---------------------------------------------------------------------------
# Test 2: §3 cost-class assignments + §4.2 single-cell-per-respond
# ---------------------------------------------------------------------------


def test_settlement_emission_is_per_respond_under_quantale(tmp_path: Path):
    """Per fuel-composition.md §3 + §4.2 commitment #2: cost-cell
    emission is *per respond invocation*, not per σ↔Δ pass.

    Asserted per-invocation rather than per-aggregate so the test
    states what each respond produces:

    * The first (no-op) respond emits **no** settlement cell. Under
      the additive quantale's unit ``0``, omitting a 0-value cell
      preserves the §1 quantale-fold, so the ``EmitCostCellPhase``
      short-circuit (``cost_value <= 0 AND not pending_inconsistencies``)
      is fold-invariant.
    * The second (contradicting) respond emits **exactly one**
      settlement cell — §4.2 commitment #2's "one settlement cell per
      respond, not one per pass" applied to a respond that DOES emit.
      The cell is tagged with the additive quantale and has a finite
      non-negative value.
    """
    root = tmp_path / "boot"
    root.mkdir()
    layout, log = _provision(root)

    first, second = _run_scenario_with_explicit_F(
        layout, log, fuel=_F_CEILING
    )

    # First respond — no-op; the implementation's omission is
    # fold-invariant under the additive quantale.
    assert first.cost_cell_id is None, (
        "first (no-op) respond emitted a settlement cost cell despite "
        "cost_value == 0 and no pending inconsistencies; "
        "EmitCostCellPhase short-circuit not honoured"
    )

    # Second respond — contradicting; MUST emit exactly one settlement
    # cell per §4.2 commitment #2.
    assert second.cost_cell_id is not None, (
        "second (contradicting) respond emitted no settlement cost "
        "cell; fuel-composition.md §4.2 commitment #2 violated"
    )

    settlements_for_second = [
        c for c in read_costs(layout, _TARGET)
        if c.cost_class == "settlement" and c.id == second.cost_cell_id
    ]
    assert len(settlements_for_second) == 1, (
        "second respond's settlement cell is not exactly one on disk; "
        "regression in §4.2 commitment #2 ('one settlement cell per "
        f"respond, not one per pass'). Found: {settlements_for_second!r}"
    )

    s = settlements_for_second[0]
    assert s.entity == _TARGET
    assert s.source_op == "respond"
    # §1 composition law lives over the additive quantale by default.
    assert s.quantale == DEFAULT_QUANTALE.name == "additive"
    # The consumed total in V = ([0, ∞], +, min): finite and >= unit.
    assert math.isfinite(s.value), "settlement value must be finite"
    assert s.value >= DEFAULT_QUANTALE.unit(), (
        f"settlement value {s.value} below additive quantale unit "
        f"{DEFAULT_QUANTALE.unit()}; violates fuel-composition §1"
    )


# ---------------------------------------------------------------------------
# Test 3: reads-are-free — §3 cost-class + cost-discipline-reads-free
# ---------------------------------------------------------------------------


def test_query_total_cost_preserves_quantale_fold(tmp_path: Path):
    """Per fuel-composition.md §3 + the ``cost-discipline-reads-free``
    theorem: read-only inspection of the cost ledger does not change
    the entity's quantale-fold.

    The spec permits read-class cells to be emitted (cost-class
    ``read``), but they MUST contribute the additive quantale's unit
    ``0`` per §3, so the total fold is invariant whether or not they
    are materialised. This is the spec-level invariant; the fixture
    therefore asserts the FOLD is unchanged across a read, rather than
    overbinding to "no new cells materialised". A regression where a
    read path bills at positive cost would surface as a non-zero
    delta in the fold and lose the audit-scaling guarantee per
    ``decisions/cost-is-lawvere-quantale``.
    """
    root = tmp_path / "boot"
    root.mkdir()
    layout, log = _provision(root)

    _run_scenario_with_explicit_F(layout, log, fuel=_F_CEILING)

    q = AdditiveCostQuantale()
    fold_before = query_total_cost(
        layout=layout, entity_slug=_TARGET, quantale=q,
    ).total
    summary = query_total_cost(
        layout=layout, entity_slug=_TARGET, quantale=q,
    )
    fold_after = query_total_cost(
        layout=layout, entity_slug=_TARGET, quantale=q,
    ).total

    # The §3 invariant: a read leaves the quantale-fold unchanged.
    assert fold_after == fold_before, (
        f"query_total_cost shifted the additive-quantale fold from "
        f"{fold_before} to {fold_after} — reads MUST contribute the "
        "additive quantale unit (0) per fuel-composition.md §3"
    )
    assert summary.total == fold_before, (
        "query_total_cost returned a fold inconsistent with itself "
        "across back-to-back invocations"
    )

    # §1 sanity: tag and non-negativity. Cell-count is intentionally
    # NOT asserted — the spec permits read-class unit cells to be
    # materialised, so cell counts are an implementation choice while
    # the fold is the spec-level invariant.
    assert summary.quantale == "additive"
    assert math.isfinite(summary.total)
    assert summary.total >= q.unit()
