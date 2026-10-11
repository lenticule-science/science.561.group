"""Closure rule firing — known fixture reaches a fixed point deterministically."""

from __future__ import annotations

from substrate.algebra import BilatticeValue as B
from substrate.closure_engine import RuleRecord, fire_rules


def test_simple_chain_fires_to_fixed_point():
    rules = [
        RuleRecord(
            name="A→B",
            premise={"a": B.TRUE},
            conclusion={"b": B.TRUE},
        ),
        RuleRecord(
            name="B→C",
            premise={"b": B.TRUE},
            conclusion={"c": B.TRUE},
        ),
        RuleRecord(
            name="C→D",
            premise={"c": B.TRUE},
            conclusion={"d": B.TRUE},
        ),
    ]
    result = fire_rules(
        initial_predicates={"a": B.TRUE},
        entity_slug="test-entity",
        rules=rules,
        fuel=64,
    )
    assert result.fixed_point
    assert result.final_predicates == {"a": B.TRUE, "b": B.TRUE, "c": B.TRUE, "d": B.TRUE}
    assert len(result.fired) == 3


def test_no_fire_if_premise_unmet():
    rules = [
        RuleRecord(name="X", premise={"a": B.TRUE}, conclusion={"b": B.TRUE}),
    ]
    result = fire_rules(
        initial_predicates={"a": B.NONE},
        entity_slug="e",
        rules=rules,
        fuel=64,
    )
    assert result.fired == []
    assert result.final_predicates == {"a": B.NONE}


def test_disagreement_lifts_to_both():
    """Two rules sharing a trigger premise raise the same predicate to
    True and False respectively; knowledge_join lifts to Both."""
    rules = [
        RuleRecord(name="A_t", premise={"trigger": B.TRUE}, conclusion={"a": B.TRUE}),
        RuleRecord(name="A_f", premise={"trigger": B.TRUE}, conclusion={"a": B.FALSE}),
    ]
    result = fire_rules(
        initial_predicates={"trigger": B.TRUE},
        entity_slug="disagree",
        rules=rules,
        fuel=64,
    )
    assert result.final_predicates["a"] == B.BOTH


def test_entity_pattern_filters():
    rules = [
        RuleRecord(
            name="only-foo",
            premise={"trigger": B.TRUE},
            conclusion={"matched": B.TRUE},
            entity_pattern=r"foo:.*",
        ),
    ]
    foo_result = fire_rules(
        initial_predicates={"trigger": B.TRUE}, entity_slug="foo:bar", rules=rules, fuel=4
    )
    assert foo_result.final_predicates.get("matched") == B.TRUE
    other_result = fire_rules(
        initial_predicates={"trigger": B.TRUE}, entity_slug="baz", rules=rules, fuel=4
    )
    assert other_result.final_predicates == {"trigger": B.TRUE}


def test_idempotent_at_fixed_point():
    rules = [
        RuleRecord(name="A→B", premise={"a": B.TRUE}, conclusion={"b": B.TRUE}),
    ]
    result = fire_rules(
        initial_predicates={"a": B.TRUE, "b": B.TRUE},
        entity_slug="e",
        rules=rules,
        fuel=64,
    )
    assert result.fired == []
    assert result.final_predicates == {"a": B.TRUE, "b": B.TRUE}
