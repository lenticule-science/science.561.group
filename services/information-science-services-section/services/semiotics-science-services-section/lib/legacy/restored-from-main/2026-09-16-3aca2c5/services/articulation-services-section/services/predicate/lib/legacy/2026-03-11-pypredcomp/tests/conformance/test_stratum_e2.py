"""Conformance fixture for t02-e2 (paired t02-e2f).

Per ``docs/dev/plans/v0.2-os-class.md`` §"v0.2 / 1. Stratification" t02-e2
and ``docs/dev/specs/kernel/sigma-delta-passes.md`` §3.σ + §5 + §9:

* The σ-pass takes a separate ``sigma_fuel`` budget (default 16 layers
  per outer iteration in ``substrate.respond``); ``delta_fuel`` (4 per
  cell) and ``outer_fuel`` (8 σ↔Δ round-trips) remain independent.
* When σ-fuel is exhausted with a rule still firable, the closure
  engine surfaces ``ClosureResult.sigma_exhausted=True`` and ``respond``
  halts the outer loop with ``halted_with=PCR_SIGMA_FUEL_EXCEEDED`` and
  a ``"halt-sigma-fuel-exceeded"`` phase marker. Partial saturated
  state is preserved; the cell + event still commit.
* Each σ/Δ outer iteration emits ``"sigma-start"`` and ``"delta-start"``
  ``PCM_RESPOND_PHASE`` markers; the H¹ audit sub-phase is bracketed
  by ``"audit-start"`` / ``"audit-end"`` markers (§9.3).

These fixtures are byte-identity / structural; numerical convergence
fixtures live in ``test_sigma_delta_passes.py``.
"""

from __future__ import annotations

import pytest

from substrate.algebra import BilatticeValue
from substrate.closure_engine import RuleRecord, fire_rules
from substrate.error_codes import PCR_SIGMA_FUEL_EXCEEDED
from substrate.respond import SIGMA_DELTA_OUTER_FUEL, SIGMA_FUEL


def _chain_rules(n: int) -> list[RuleRecord]:
    """Build n closure rules forming an a0 → a1 → ... → an chain.

    Each rule's premise is ``a_i = T``; conclusion is ``a_{i+1} = T``.
    Firing the chain from ``{a0: T}`` produces ``n`` σ-firings to reach
    fixed point.
    """
    rules: list[RuleRecord] = []
    for i in range(n):
        rules.append(
            RuleRecord(
                name=f"chain-{i}",
                premise={f"a{i}": BilatticeValue.TRUE},
                conclusion={f"a{i + 1}": BilatticeValue.TRUE},
            )
        )
    return rules


# ---------------------------------------------------------------------------
# §11.2  σ-fuel separability — closure_engine direct
# ---------------------------------------------------------------------------


def test_fire_rules_default_sigma_fuel_is_uncapped() -> None:
    """Default ``sigma_fuel=None`` runs the chain to fixed point."""
    rules = _chain_rules(20)
    result = fire_rules(
        initial_predicates={"a0": BilatticeValue.TRUE},
        entity_slug="entity:demo",
        rules=rules,
    )
    assert result.fixed_point is True
    assert result.sigma_exhausted is False
    assert result.cycles == 20
    assert result.final_predicates["a20"] == BilatticeValue.TRUE


def test_fire_rules_sigma_fuel_caps_layers() -> None:
    """``sigma_fuel=4`` halts a 20-rule chain after 4 firings."""
    rules = _chain_rules(20)
    result = fire_rules(
        initial_predicates={"a0": BilatticeValue.TRUE},
        entity_slug="entity:demo",
        rules=rules,
        sigma_fuel=4,
    )
    assert result.sigma_exhausted is True
    assert result.cycles == 4
    # Partial state preserved: a0..a4 reached True, a5+ untouched.
    for i in range(5):
        assert result.final_predicates[f"a{i}"] == BilatticeValue.TRUE
    assert "a5" not in result.final_predicates or result.final_predicates["a5"] != BilatticeValue.TRUE


def test_fire_rules_sigma_fuel_not_exhausted_when_chain_terminates_first() -> None:
    """A chain shorter than ``sigma_fuel`` reaches fixed point cleanly."""
    rules = _chain_rules(3)
    result = fire_rules(
        initial_predicates={"a0": BilatticeValue.TRUE},
        entity_slug="entity:demo",
        rules=rules,
        sigma_fuel=16,
    )
    assert result.fixed_point is True
    assert result.sigma_exhausted is False
    assert result.cycles == 3


# ---------------------------------------------------------------------------
# §11.3  σ-fuel exhaustion through respond
# ---------------------------------------------------------------------------


@pytest.fixture
def fresh_substrate(tmp_path):
    """Fresh on-disk substrate rooted at ``tmp_path / "root"``."""
    from storage.event_log import EventLog
    from storage.storage_layout import StorageLayout

    layout = StorageLayout(tmp_path / "root")
    layout.ensure_dirs()
    log = EventLog(tmp_path / "root")
    log.initialize(node_id="test-node", wall_clock_ns=0)
    return layout, log


def _install_chain_rules(layout, n: int) -> list[str]:
    """Persist n chain rules; return their content-addressed ids."""
    ids: list[str] = []
    for i in range(n):
        rule = RuleRecord(
            name=f"chain-{i}",
            premise={f"a{i}": BilatticeValue.TRUE},
            conclusion={f"a{i + 1}": BilatticeValue.TRUE},
        ).with_id()
        rid, _ = layout.put_record("rules", rule.canonical_body())
        ids.append(rid)
    return ids


def test_respond_halts_on_sigma_fuel_exceeded(fresh_substrate) -> None:
    """A chain longer than ``SIGMA_FUEL`` halts with the right code +
    phase marker; partial saturated state preserved; cell still committed."""
    from substrate.respond import respond

    layout, event_log = fresh_substrate
    rule_ids = _install_chain_rules(layout, SIGMA_FUEL + 8)

    result = respond(
        target="entity:demo",
        payload={"a0": "True"},
        sender="system",
        layout=layout,
        event_log=event_log,
        node_id="test-node",
        active_rule_ids=rule_ids,
        enforce_authz=False,
    )

    assert result.halted_with == PCR_SIGMA_FUEL_EXCEEDED
    variants = [m.variant for m in result.phase_log]
    assert "halt-sigma-fuel-exceeded" in variants
    # Outer loop halted on iter 0; no Δ-pass entered.
    assert "delta-start" not in variants
    # Partial state: σ-fuel many cells produced, more remain unproduced.
    assert result.cell.predicates.get(f"a{SIGMA_FUEL}") == BilatticeValue.TRUE
    assert f"a{SIGMA_FUEL + 5}" not in result.cell.predicates
    # Cell + event still committed.
    assert result.cell_id
    assert result.event_id


# ---------------------------------------------------------------------------
# §11.4  PCM_RESPOND_PHASE marker discipline
# ---------------------------------------------------------------------------


def test_respond_emits_sigma_delta_audit_phase_markers(fresh_substrate) -> None:
    """A normal converging respond emits sigma-start, delta-start,
    audit-start, and audit-end markers in chronological order."""
    from substrate.respond import respond

    layout, event_log = fresh_substrate
    # Tiny chain — converges in one outer iteration.
    rule_ids = _install_chain_rules(layout, 3)

    result = respond(
        target="entity:demo",
        payload={"a0": "True"},
        sender="system",
        layout=layout,
        event_log=event_log,
        node_id="test-node",
        active_rule_ids=rule_ids,
        enforce_authz=False,
    )

    assert result.halted_with is None
    variants = [m.variant for m in result.phase_log]
    # Each required marker appears at least once.
    for required in ("sigma-start", "delta-start", "audit-start", "audit-end"):
        assert required in variants, f"{required!r} missing from {variants!r}"
    # audit-start strictly precedes audit-end.
    audit_start_idx = variants.index("audit-start")
    audit_end_idx = variants.index("audit-end", audit_start_idx + 1)
    assert audit_end_idx > audit_start_idx
    # All markers carry the canonical PCM_RESPOND_PHASE code.
    from substrate.error_codes import PCM_RESPOND_PHASE
    for marker in result.phase_log:
        assert marker.code == PCM_RESPOND_PHASE


def test_respond_phase_markers_paired_per_outer_iteration(fresh_substrate) -> None:
    """Each outer iteration that runs a Δ-pass produces exactly one
    sigma-start and one delta-start marker before audit-start."""
    from substrate.respond import respond

    layout, event_log = fresh_substrate
    rule_ids = _install_chain_rules(layout, 3)

    result = respond(
        target="entity:demo",
        payload={"a0": "True"},
        sender="system",
        layout=layout,
        event_log=event_log,
        node_id="test-node",
        active_rule_ids=rule_ids,
        enforce_authz=False,
    )

    sigma_starts = [m for m in result.phase_log if m.variant == "sigma-start"]
    delta_starts = [m for m in result.phase_log if m.variant == "delta-start"]
    # σ↔Δ paired per non-halting iteration.
    assert len(sigma_starts) == len(delta_starts)
    assert len(sigma_starts) == result.outer_iterations
    assert result.outer_iterations <= SIGMA_DELTA_OUTER_FUEL


# ---------------------------------------------------------------------------
# §11.5  Independence of fuel budgets
# ---------------------------------------------------------------------------


def test_outer_fuel_independent_of_sigma_fuel(fresh_substrate) -> None:
    """A chain that fits within ``SIGMA_FUEL`` per pass converges within
    ``SIGMA_DELTA_OUTER_FUEL`` outer iterations without exhausting either."""
    from substrate.respond import respond

    layout, event_log = fresh_substrate
    rule_ids = _install_chain_rules(layout, SIGMA_FUEL - 2)

    result = respond(
        target="entity:demo",
        payload={"a0": "True"},
        sender="system",
        layout=layout,
        event_log=event_log,
        node_id="test-node",
        active_rule_ids=rule_ids,
        enforce_authz=False,
    )
    assert result.halted_with is None
    assert result.outer_iterations >= 1
    assert result.outer_iterations <= SIGMA_DELTA_OUTER_FUEL
