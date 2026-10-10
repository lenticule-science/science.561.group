"""LangGraph-backed closure engine — fixed-point + term conclusions."""

from __future__ import annotations

import pytest

from substrate.algebra import BilatticeValue
from substrate.closure_engine import RuleRecord, fire_rules
from substrate.error_codes import PCC_FUEL_EXHAUSTED, SubstrateError


def test_simple_premise_implies_conclusion():
    rule = RuleRecord(
        name="adopt-positive",
        premise={"ready/positive": BilatticeValue.TRUE},
        conclusion={"system/settled": BilatticeValue.TRUE},
    )
    result = fire_rules(
        initial_predicates={"ready/positive": BilatticeValue.TRUE},
        entity_slug="alpha",
        rules=[rule],
    )
    assert result.fixed_point
    assert result.final_predicates["system/settled"] is BilatticeValue.TRUE
    assert result.cycles == 1
    assert len(result.fired) == 1


def test_no_match_means_zero_cycles_and_fixed_point():
    rule = RuleRecord(
        name="adopt-positive",
        premise={"ready/positive": BilatticeValue.TRUE},
        conclusion={"system/settled": BilatticeValue.TRUE},
    )
    result = fire_rules(
        initial_predicates={"ready/negative": BilatticeValue.TRUE},
        entity_slug="alpha",
        rules=[rule],
    )
    assert result.fixed_point
    assert result.cycles == 0
    assert result.fired == []


def test_chained_rules_reach_fixed_point():
    a_to_b = RuleRecord(
        name="a-to-b",
        premise={"a/positive": BilatticeValue.TRUE},
        conclusion={"b/positive": BilatticeValue.TRUE},
    )
    b_to_c = RuleRecord(
        name="b-to-c",
        premise={"b/positive": BilatticeValue.TRUE},
        conclusion={"c/positive": BilatticeValue.TRUE},
    )
    result = fire_rules(
        initial_predicates={"a/positive": BilatticeValue.TRUE},
        entity_slug="alpha",
        rules=[a_to_b, b_to_c],
    )
    assert result.fixed_point
    assert result.final_predicates["c/positive"] is BilatticeValue.TRUE
    assert len(result.fired) == 2


def test_term_conclusion_is_reduced_via_message_language():
    rule = RuleRecord(
        name="term-conclusion",
        premise={"observation/seen": BilatticeValue.TRUE},
        conclusion={
            "observation/joined": {
                "@app": "knowledge_join",
                "args": [{"@lit": "True"}, {"@lit": "False"}],
            }
        },
    )
    result = fire_rules(
        initial_predicates={"observation/seen": BilatticeValue.TRUE},
        entity_slug="alpha",
        rules=[rule],
    )
    assert result.final_predicates["observation/joined"] is BilatticeValue.BOTH
    assert len(result.fired) == 1


def test_idempotent_rule_fires_at_most_once():
    """A rule whose conclusion is already settled doesn't refire endlessly."""
    rule = RuleRecord(
        name="idempotent",
        premise={"x": BilatticeValue.TRUE},
        conclusion={"y": BilatticeValue.TRUE},
    )
    result = fire_rules(
        initial_predicates={"x": BilatticeValue.TRUE, "y": BilatticeValue.TRUE},
        entity_slug="alpha",
        rules=[rule],
    )
    assert result.fired == []
    assert result.fixed_point


def test_entity_pattern_filters_rule():
    rule = RuleRecord(
        name="alpha-only",
        premise={"x": BilatticeValue.TRUE},
        conclusion={"y": BilatticeValue.TRUE},
        entity_pattern="alpha",
    )
    res_alpha = fire_rules(
        initial_predicates={"x": BilatticeValue.TRUE},
        entity_slug="alpha",
        rules=[rule],
    )
    res_other = fire_rules(
        initial_predicates={"x": BilatticeValue.TRUE},
        entity_slug="bravo",
        rules=[rule],
    )
    assert res_alpha.final_predicates.get("y") is BilatticeValue.TRUE
    assert "y" not in res_other.final_predicates


def test_fuel_exhaustion_raised():
    rules = [
        RuleRecord(
            name=f"rule-{i}",
            premise={f"p{i}/positive": BilatticeValue.TRUE},
            conclusion={f"p{i+1}/positive": BilatticeValue.TRUE},
        )
        for i in range(20)
    ]
    with pytest.raises(SubstrateError) as exc:
        fire_rules(
            initial_predicates={"p0/positive": BilatticeValue.TRUE},
            entity_slug="alpha",
            rules=rules,
            fuel=1,
        )
    assert exc.value.code == PCC_FUEL_EXHAUSTED


def test_lexicographic_id_ordering_is_deterministic():
    """Independent of insertion order, the rule with the smaller content-id fires first."""
    r1 = RuleRecord(
        name="rule-a",
        premise={"x": BilatticeValue.TRUE},
        conclusion={"y": BilatticeValue.TRUE},
    )
    r2 = RuleRecord(
        name="rule-b",
        premise={"x": BilatticeValue.TRUE},
        conclusion={"y": BilatticeValue.TRUE},
    )
    res_ab = fire_rules(
        initial_predicates={"x": BilatticeValue.TRUE},
        entity_slug="alpha",
        rules=[r1, r2],
    )
    res_ba = fire_rules(
        initial_predicates={"x": BilatticeValue.TRUE},
        entity_slug="alpha",
        rules=[r2, r1],
    )
    # The first-firing rule's id is identical regardless of input order.
    assert res_ab.fired[0].rule_id == res_ba.fired[0].rule_id
