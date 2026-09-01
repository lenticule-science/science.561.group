"""Closure rule engine — fires rules to a fixed point under fuel.

Per ``specs/kernel/closure-engine-internals.md``,
``specs/kernel/closure-rule-record.md``, and
``specs/kernel/sigma-delta-passes.md`` §3.σ (this module is the σ-pass
half of the σ↔Δ outer-fuel alternation specified there). Implemented as a LangGraph
``StateGraph`` with three nodes:

* ``match`` — scan rules in lexicographic ``id`` order, find the first
  rule that fires (premise satisfied AND conclusion would raise at least
  one predicate value under ``knowledge_join``).
* ``apply`` — apply the matched rule's conclusion (which may itself be a
  message-language term, β/η reduced under fuel), append a
  :class:`RepairEntry` to the repair log, decrement fuel.
* ``check_fixpoint`` — if no rule matched in the last pass, the closure
  has reached a fixed point and we exit.

Conditional edges:
* ``match  → apply``        when a firing rule was found
* ``match  → check_fixpoint`` when no rule fired this pass (terminate)
* ``apply  → match``        keep iterating until fixed point

The plain in-process ``fire_rules`` helper remains as a thin wrapper that
invokes the StateGraph and unpacks the final state. Determinism: rules
are ``with_id``-canonicalized then sorted by id; per-cycle iteration is
left-to-right; ties are broken by id.
"""

from __future__ import annotations

import re
from typing import Any, TypedDict

from pydantic import BaseModel, ConfigDict, Field, model_validator

from substrate.algebra import BilatticeValue, knowledge_join, knowledge_leq
from substrate.canonicalization import cid
from substrate.error_codes import (
    PCC_FUEL_EXHAUSTED,
    PCR_PREMISE_INVALID,
    PCR_SIGMA_FUEL_EXCEEDED,
    SubstrateError,
)
from substrate.message_language import TermEnv, reduce_payload


# ---------------------------------------------------------------------------
# Records
# ---------------------------------------------------------------------------


class RuleRecord(BaseModel):
    """Closure-rule record. ``id`` is the SHA-256 of canonical-without-id.

    A rule's ``premise`` MUST be a non-empty map of
    ``{predicate: BilatticeValue}``: every saturated firing has a
    derivation chain rooted in asserted premises (per
    ``specs/kernel/stratified-facts.md`` §2 and ``specs/filesystem/cell-record.md``
    §1.5's witness requirement). Premise-less "axioms" are expressed as
    payload-asserted cells, not as rules.

    The ``conclusion`` map's values may be either bilattice values
    directly or message-language terms. Terms are reduced against the
    current fiber predicates at firing time (the variable ``self`` is
    bound to the current fiber).
    """

    model_config = ConfigDict(extra="forbid")

    id: str | None = None
    name: str
    premise: dict[str, BilatticeValue] = Field(default_factory=dict)
    conclusion: dict[str, Any] = Field(default_factory=dict)
    entity_pattern: str | None = None
    retired: bool = False
    # Per ``library/.../predicated-computing/theorems/rule-language-realizability-determines-regime.md``:
    # the rule's syntactic language fragment, together with the substrate's
    # base finiteness, determines the substrate's regime. v0.2 ships
    # only ``"quantifier-free"`` rules (the strict-regime fragment); a
    # rule declaring ``"with-forall-blocks"`` would force the substrate
    # into ``transfinite-bounded`` or ``aperiodic`` and is rejected at
    # RegimeRecord validation if the active regime is strict.
    rule_language_fragment: str = "quantifier-free"
    metadata: dict[str, Any] | None = None

    @model_validator(mode="after")
    def _check_premise_nonempty(self) -> "RuleRecord":
        if not self.premise:
            raise SubstrateError(
                PCR_PREMISE_INVALID,
                f"rule {self.name!r} has empty premise; "
                "every saturated firing requires an asserted derivation chain "
                "(express axioms as payload assertions instead)",
                rule_name=self.name,
            )
        return self

    def canonical_body(self) -> dict[str, Any]:
        body = self.model_dump(mode="json", exclude={"id"})
        return {k: v for k, v in body.items() if v is not None and v != {} and v != []}

    def compute_id(self) -> str:
        return cid(self.canonical_body())

    def with_id(self) -> "RuleRecord":
        body = self.canonical_body()
        return RuleRecord(id=cid(body), **body)

    def matches_entity(self, entity_slug: str) -> bool:
        if not self.entity_pattern:
            return True
        try:
            return bool(re.fullmatch(self.entity_pattern, entity_slug))
        except re.error as e:
            raise SubstrateError(PCR_PREMISE_INVALID, f"bad entity_pattern regex: {e}")

    def matches_predicates(self, current: dict[str, BilatticeValue]) -> bool:
        for pred, required in self.premise.items():
            cur = current.get(pred, BilatticeValue.NONE)
            if not knowledge_leq(required, cur):
                return False
        return True


class RepairEntry(BaseModel):
    rule_id: str
    rule_name: str
    cycle: int
    raised: dict[str, str]


class ClosureResult(BaseModel):
    fired: list[RepairEntry]
    cycles: int
    fuel_remaining: int
    final_predicates: dict[str, BilatticeValue]
    fixed_point: bool
    # σ-pass layer-budget exhaustion (per t02-e2 / specs/kernel/sigma-delta-passes.md §3.σ.4):
    # ``True`` when ``cycles`` reached the caller's ``sigma_fuel`` cap with
    # at least one rule still firable. Partial state is preserved; ``respond``
    # surfaces ``PCR_SIGMA_FUEL_EXCEEDED`` and halts the σ↔Δ outer loop.
    sigma_exhausted: bool = False


# ---------------------------------------------------------------------------
# LangGraph state
# ---------------------------------------------------------------------------


class _ClosureState(TypedDict, total=False):
    predicates: dict[str, BilatticeValue]
    rules: list[RuleRecord]
    fired: list[RepairEntry]
    cycles: int
    fuel_remaining: int
    fixed_point: bool
    entity: str
    last_match_index: int  # index of the rule that fired in the last pass
    progressed_this_cycle: bool
    sigma_fuel: int | None  # max σ-layer firings; None = uncapped
    sigma_exhausted: bool   # True when sigma_fuel cap was hit with a firable rule


def _conclude_for(rule: RuleRecord, predicates: dict[str, BilatticeValue], fuel: int) -> tuple[dict[str, BilatticeValue], int]:
    """Reduce a rule's conclusion to ``{pred: BilatticeValue}`` under fuel."""
    env = TermEnv(
        vars={"self": dict(predicates)},
        fiber_predicates=predicates,
    )
    return reduce_payload(rule.conclusion, env, fuel=fuel)


# ---------------------------------------------------------------------------
# StateGraph nodes
# ---------------------------------------------------------------------------


def _node_match(state: _ClosureState) -> _ClosureState:
    """Find the next rule that would fire; record its index in state.

    Iterates rules in deterministic (id-sorted) order. Skips rules whose
    premise doesn't match. The first rule whose conclusion would raise
    at least one predicate under knowledge_join is selected. If none
    match, ``last_match_index`` is set to ``-1`` and ``progressed_this_cycle``
    is set to ``False``.
    """
    current = state["predicates"]
    rules = state["rules"]
    fuel = state["fuel_remaining"]
    if fuel <= 0:
        raise SubstrateError(
            PCC_FUEL_EXHAUSTED,
            f"closure exhausted fuel after {state['cycles']} cycles",
            cycles=state["cycles"],
        )
    # σ-layer cap (per t02-e2 / specs/kernel/sigma-delta-passes.md §3.σ.4).
    # When the caller passes a ``sigma_fuel`` budget and we have already
    # consumed it, scan once for any firable rule; if found, flag
    # ``sigma_exhausted`` and force finalize so partial state survives.
    sigma_cap = state.get("sigma_fuel")
    if sigma_cap is not None and state["cycles"] >= sigma_cap:
        for rule in rules:
            if not rule.matches_predicates(current):
                continue
            try:
                concluded, _ = _conclude_for(rule, current, fuel=fuel)
            except SubstrateError:
                continue
            for pred, asserted in concluded.items():
                cur = current.get(pred, BilatticeValue.NONE)
                if knowledge_join(cur, asserted) != cur:
                    return {**state, "last_match_index": -1, "sigma_exhausted": True}
        return {**state, "last_match_index": -1}
    for idx, rule in enumerate(rules):
        if not rule.matches_predicates(current):
            continue
        # Reduce conclusion using a probe of fuel; this is a free preview
        # (the reducer fuel is part of the engine's overall fuel budget,
        # so we account for it on apply, not here).
        try:
            concluded, _ = _conclude_for(rule, current, fuel=fuel)
        except SubstrateError:
            # Reducer error means the rule cannot fire; treat as no-match.
            continue
        raises_anything = False
        for pred, asserted in concluded.items():
            cur = current.get(pred, BilatticeValue.NONE)
            joined = knowledge_join(cur, asserted)
            if joined != cur:
                raises_anything = True
                break
        if raises_anything:
            return {**state, "last_match_index": idx}
    return {**state, "last_match_index": -1}


def _node_apply(state: _ClosureState) -> _ClosureState:
    """Apply the matched rule; update predicates + repair log + fuel."""
    idx = state["last_match_index"]
    rule = state["rules"][idx]
    current = dict(state["predicates"])
    fuel = state["fuel_remaining"]
    concluded, fuel_after_reduce = _conclude_for(rule, current, fuel=fuel)
    raised: dict[str, str] = {}
    for pred, asserted in concluded.items():
        cur = current.get(pred, BilatticeValue.NONE)
        joined = knowledge_join(cur, asserted)
        if joined != cur:
            current[pred] = joined
            raised[pred] = joined.value
    fired = list(state.get("fired", []))
    fired.append(
        RepairEntry(
            rule_id=rule.id or "",
            rule_name=rule.name,
            cycle=state["cycles"] + 1,
            raised=raised,
        )
    )
    return {
        **state,
        "predicates": current,
        "fired": fired,
        "fuel_remaining": fuel_after_reduce - 1,
        "cycles": state["cycles"] + 1,
        "progressed_this_cycle": True,
    }


def _node_finalize(state: _ClosureState) -> _ClosureState:
    return {**state, "fixed_point": True}


def _branch_after_match(state: _ClosureState) -> str:
    return "apply" if state.get("last_match_index", -1) >= 0 else "finalize"


def _build_graph():
    """Construct the StateGraph (cheap; built per ``fire_rules`` call to
    keep the engine free of mutable module-global state)."""
    from langgraph.graph import StateGraph, END

    g: StateGraph = StateGraph(_ClosureState)
    g.add_node("match", _node_match)
    g.add_node("apply", _node_apply)
    g.add_node("finalize", _node_finalize)
    g.set_entry_point("match")
    g.add_conditional_edges(
        "match",
        _branch_after_match,
        {"apply": "apply", "finalize": "finalize"},
    )
    g.add_edge("apply", "match")
    g.add_edge("finalize", END)
    return g.compile()


# ---------------------------------------------------------------------------
# Public entry point
# ---------------------------------------------------------------------------


def fire_rules(
    *,
    initial_predicates: dict[str, BilatticeValue],
    entity_slug: str,
    rules: list[RuleRecord],
    fuel: int = 1024,
    sigma_fuel: int | None = None,
) -> ClosureResult:
    """Run ``rules`` against ``initial_predicates`` to a fixed point.

    Iterates the LangGraph closure StateGraph until ``finalize`` is hit.

    ``fuel`` is the message-language reducer budget (per-firing conclusion
    reduction). ``sigma_fuel`` is the σ-pass layer cap (max firings before
    surfacing ``sigma_exhausted=True`` per t02-e2). When ``sigma_fuel`` is
    ``None`` the σ-pass runs uncapped (legacy behaviour).
    """
    active_rules = sorted(
        [r.with_id() for r in rules if not r.retired and r.matches_entity(entity_slug)],
        key=lambda r: r.id or "",
    )

    initial: _ClosureState = {
        "predicates": dict(initial_predicates),
        "rules": active_rules,
        "fired": [],
        "cycles": 0,
        "fuel_remaining": fuel,
        "fixed_point": False,
        "entity": entity_slug,
        "last_match_index": -1,
        "progressed_this_cycle": False,
        "sigma_fuel": sigma_fuel,
        "sigma_exhausted": False,
    }
    # ``recursion_limit`` bounds the StateGraph supersteps. Two supersteps
    # per firing (match → apply); add a safety multiplier of 4.
    cfg = {"recursion_limit": max(64, fuel * 4 + 8)}
    final_state = _build_graph().invoke(initial, config=cfg)

    return ClosureResult(
        fired=final_state.get("fired", []),
        cycles=final_state.get("cycles", 0),
        fuel_remaining=final_state.get("fuel_remaining", fuel),
        final_predicates=final_state.get("predicates", initial_predicates),
        fixed_point=bool(final_state.get("fixed_point", False)),
        sigma_exhausted=bool(final_state.get("sigma_exhausted", False)),
    )
