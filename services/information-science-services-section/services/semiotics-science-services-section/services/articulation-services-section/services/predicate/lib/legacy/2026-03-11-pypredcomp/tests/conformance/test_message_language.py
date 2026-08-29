"""Conformance tests for the message-language term calculus."""

from __future__ import annotations

import pytest

from substrate.algebra import BilatticeValue
from substrate.error_codes import (
    PCC_FUEL_EXHAUSTED,
    PCM_PAYLOAD_INVALID,
    SubstrateError,
)
from substrate.message_language import (
    Lambda,
    Reducer,
    TermEnv,
    reduce_payload,
    reduce_to_bilattice,
)


def test_literal_term_reduces_to_bilattice():
    out = reduce_to_bilattice({"@lit": "True"}, TermEnv())
    assert out is BilatticeValue.TRUE


def test_lookup_pulls_from_self():
    env = TermEnv(
        vars={"self": {"foo/positive": "True"}},
        fiber_predicates={"foo/positive": BilatticeValue.TRUE},
    )
    out = reduce_to_bilattice(
        {"@lookup": "foo/positive", "in": {"@var": "self"}}, env
    )
    assert out is BilatticeValue.TRUE


def test_path_descends_into_self():
    env = TermEnv(vars={"self": {"a": {"b": "True"}}})
    out = reduce_to_bilattice({"@path": ["a", "b"]}, env)
    assert out is BilatticeValue.TRUE


def test_app_invokes_builtin_knowledge_join():
    out = reduce_to_bilattice(
        {"@app": "knowledge_join", "args": [{"@lit": "True"}, {"@lit": "False"}]},
        TermEnv(),
    )
    assert out is BilatticeValue.BOTH


def test_sigma_folds_under_knowledge_join():
    out = reduce_to_bilattice(
        {"@sigma": [{"@lit": "True"}, {"@lit": "False"}, {"@lit": "None"}]},
        TermEnv(),
    )
    assert out is BilatticeValue.BOTH


def test_delta_folds_under_truth_join():
    out = reduce_to_bilattice(
        {"@delta": [{"@lit": "False"}, {"@lit": "None"}]},
        TermEnv(),
    )
    # truth_join(False, None) = (max(0,0), min(1,0)) = (0,0) = None
    assert out is BilatticeValue.NONE


def test_negate_swaps_witness_pair():
    out = reduce_to_bilattice({"@negate": {"@lit": "True"}}, TermEnv())
    assert out is BilatticeValue.FALSE


def test_lambda_application_substitutes_variable():
    term = {
        "@app": {
            "@lambda": ["x"],
            "body": {"@app": "knowledge_join", "args": [{"@var": "x"}, {"@lit": "False"}]},
        },
        "args": [{"@lit": "True"}],
    }
    out = reduce_to_bilattice(term, TermEnv())
    assert out is BilatticeValue.BOTH


def test_eta_reduction_collapses_trivial_lambda():
    """``λx. f(x)`` η-reduces to ``f``."""
    term = {"@lambda": ["x"], "body": {"@app": "negate", "args": [{"@var": "x"}]}}
    r = Reducer(env=TermEnv(), fuel_remaining=64)
    val = r.reduce(term)
    # After η, the value should be the bare builtin name string.
    assert val == "negate"


def test_fuel_exhaustion_raises():
    # A deeply nested sigma that needs more than 5 reduction steps.
    term = {"@sigma": [{"@lit": "True"}, {"@lit": "True"}, {"@lit": "True"}]}
    with pytest.raises(SubstrateError) as exc:
        reduce_to_bilattice(term, TermEnv(), fuel=2)
    assert exc.value.code == PCC_FUEL_EXHAUSTED


def test_unknown_tag_rejected():
    with pytest.raises(SubstrateError) as exc:
        reduce_to_bilattice({"@nope": 1}, TermEnv())
    assert exc.value.code == PCM_PAYLOAD_INVALID


def test_payload_back_compat_flat_strings():
    out, fuel_left = reduce_payload({"a/positive": "True"}, TermEnv(), fuel=10)
    assert out == {"a/positive": BilatticeValue.TRUE}
    assert fuel_left == 10


def test_payload_term_value_is_reduced():
    out, _ = reduce_payload(
        {
            "a/positive": "True",
            "b/joined": {
                "@app": "knowledge_join",
                "args": [{"@lit": "True"}, {"@lit": "False"}],
            },
        },
        TermEnv(),
        fuel=100,
    )
    assert out["a/positive"] is BilatticeValue.TRUE
    assert out["b/joined"] is BilatticeValue.BOTH


def test_if_builtin_selects_branch():
    out = reduce_to_bilattice(
        {
            "@app": "if",
            "args": [{"@lit": "True"}, {"@lit": "True"}, {"@lit": "False"}],
        },
        TermEnv(),
    )
    assert out is BilatticeValue.TRUE
