"""Hypothesis-driven property tests over the bilattice algebra."""

from __future__ import annotations

from hypothesis import given
from hypothesis import strategies as st

from substrate.algebra import (
    BilatticeValue,
    fuse,
    knowledge_join,
    knowledge_leq,
    knowledge_meet,
    negate,
    restrict,
    truth_leq,
)

values = st.sampled_from(list(BilatticeValue))


@given(a=values, b=values, c=values)
def test_kjoin_associative(a, b, c):
    assert knowledge_join(knowledge_join(a, b), c) == knowledge_join(a, knowledge_join(b, c))


@given(a=values, b=values)
def test_kjoin_commutative(a, b):
    assert knowledge_join(a, b) == knowledge_join(b, a)


@given(a=values)
def test_kjoin_idempotent(a):
    assert knowledge_join(a, a) == a


@given(a=values)
def test_negation_involution(a):
    assert negate(negate(a)) == a


@given(a=values, p=values, q=values)
def test_lambek_adjunction(a, p, q):
    """fuse ⊣ restrict on every triple."""
    lhs = truth_leq(fuse(a, p), q)
    rhs = truth_leq(p, restrict(a, q))
    assert lhs == rhs


@given(a=values, b=values)
def test_kmeet_below_both(a, b):
    m = knowledge_meet(a, b)
    assert knowledge_leq(m, a)
    assert knowledge_leq(m, b)
