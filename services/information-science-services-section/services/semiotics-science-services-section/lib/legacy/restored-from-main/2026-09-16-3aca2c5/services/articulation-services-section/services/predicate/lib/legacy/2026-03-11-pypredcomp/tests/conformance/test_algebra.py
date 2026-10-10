"""Conformance vectors §1 (adjunction) and §2 (truth tables)."""

from __future__ import annotations

import pytest

from substrate.algebra import (
    BilatticeValue as B,
    VALUES,
    fuse,
    knowledge_join,
    knowledge_leq,
    knowledge_meet,
    negate,
    nelson_fuse,
    nelson_imply,
    post_close,
    restrict,
    truth_join,
    truth_leq,
    truth_meet,
    verify_adjunction,
)


def test_adjunction_zero_violations():
    """fuse(a,p) ≤_t q  ⇔  p ≤_t restrict(a,q) on every triple in 4³."""
    report = verify_adjunction()
    assert report.checked == 64
    assert report.ok, f"violations: {report.violations}"


def test_knowledge_join_truth_table():
    """Conformance §2 ⊙ table."""
    expected = {
        (B.NONE, B.NONE): B.NONE,
        (B.NONE, B.TRUE): B.TRUE,
        (B.NONE, B.FALSE): B.FALSE,
        (B.NONE, B.BOTH): B.BOTH,
        (B.TRUE, B.NONE): B.TRUE,
        (B.TRUE, B.TRUE): B.TRUE,
        (B.TRUE, B.FALSE): B.BOTH,
        (B.TRUE, B.BOTH): B.BOTH,
        (B.FALSE, B.NONE): B.FALSE,
        (B.FALSE, B.TRUE): B.BOTH,
        (B.FALSE, B.FALSE): B.FALSE,
        (B.FALSE, B.BOTH): B.BOTH,
        (B.BOTH, B.NONE): B.BOTH,
        (B.BOTH, B.TRUE): B.BOTH,
        (B.BOTH, B.FALSE): B.BOTH,
        (B.BOTH, B.BOTH): B.BOTH,
    }
    for (a, b), want in expected.items():
        assert knowledge_join(a, b) == want, f"⊙({a},{b}) = {knowledge_join(a, b)}, want {want}"


def test_knowledge_join_is_crdt():
    for a in VALUES:
        assert knowledge_join(a, a) == a, "idempotent"
        for b in VALUES:
            assert knowledge_join(a, b) == knowledge_join(b, a), "commutative"
            for c in VALUES:
                left = knowledge_join(knowledge_join(a, b), c)
                right = knowledge_join(a, knowledge_join(b, c))
                assert left == right, "associative"


def test_negation_involution():
    for v in VALUES:
        assert negate(negate(v)) == v
    assert negate(B.TRUE) == B.FALSE
    assert negate(B.FALSE) == B.TRUE
    assert negate(B.NONE) == B.NONE
    assert negate(B.BOTH) == B.BOTH


def test_post_close_lifts_none():
    assert post_close(B.NONE) == B.BOTH
    for v in (B.TRUE, B.FALSE, B.BOTH):
        assert post_close(v) == v


def test_truth_diamond():
    assert truth_leq(B.FALSE, B.NONE)
    assert truth_leq(B.FALSE, B.BOTH)
    assert truth_leq(B.NONE, B.TRUE)
    assert truth_leq(B.BOTH, B.TRUE)
    assert not truth_leq(B.NONE, B.BOTH)
    assert not truth_leq(B.BOTH, B.NONE)


def test_knowledge_diamond():
    assert knowledge_leq(B.NONE, B.TRUE)
    assert knowledge_leq(B.NONE, B.FALSE)
    assert knowledge_leq(B.TRUE, B.BOTH)
    assert knowledge_leq(B.FALSE, B.BOTH)
    assert not knowledge_leq(B.TRUE, B.FALSE)
    assert not knowledge_leq(B.FALSE, B.TRUE)


def test_nelson_coincides_on_2x2():
    for a in VALUES:
        for b in VALUES:
            assert nelson_imply(a, b) == restrict(a, b)
            assert nelson_fuse(a, b) == fuse(a, b)


def test_meets_and_joins_consistent_with_orderings():
    for a in VALUES:
        for b in VALUES:
            tj = truth_join(a, b)
            tm = truth_meet(a, b)
            assert truth_leq(a, tj) and truth_leq(b, tj)
            assert truth_leq(tm, a) and truth_leq(tm, b)
            kj = knowledge_join(a, b)
            km = knowledge_meet(a, b)
            assert knowledge_leq(a, kj) and knowledge_leq(b, kj)
            assert knowledge_leq(km, a) and knowledge_leq(km, b)
