"""Federation ⊙-merge — single-node merge of two synthesized peer fibers.

Demonstrates that the substrate's evidence-merge primitive (knowledge_join)
is commutative, associative, and idempotent — the CRDT-merge property
that lets future federation be configuration, not rewrite.
"""

from __future__ import annotations

from substrate.algebra import BilatticeValue as B, VALUES, knowledge_join


def _merge_fibers(*fibers: dict[str, B]) -> dict[str, B]:
    merged: dict[str, B] = {}
    for f in fibers:
        for k, v in f.items():
            merged[k] = knowledge_join(merged.get(k, B.NONE), v)
    return merged


def test_two_peers_disagreement_lifts_to_both():
    peer_a = {"shared/p": B.TRUE, "a-only": B.TRUE}
    peer_b = {"shared/p": B.FALSE, "b-only": B.FALSE}
    merged = _merge_fibers(peer_a, peer_b)
    assert merged["shared/p"] == B.BOTH
    assert merged["a-only"] == B.TRUE
    assert merged["b-only"] == B.FALSE


def test_merge_is_commutative():
    peer_a = {"p": B.TRUE, "q": B.FALSE}
    peer_b = {"p": B.FALSE, "r": B.BOTH}
    assert _merge_fibers(peer_a, peer_b) == _merge_fibers(peer_b, peer_a)


def test_merge_is_associative_and_idempotent():
    a = {"p": B.TRUE}
    b = {"p": B.FALSE}
    c = {"p": B.NONE}
    left = _merge_fibers(_merge_fibers(a, b), c)
    right = _merge_fibers(a, _merge_fibers(b, c))
    assert left == right
    assert _merge_fibers(a, a) == a


def test_pairwise_table():
    """Knowledge_join over every pair of single-predicate fibers ⊆ §2 table."""
    for v1 in VALUES:
        for v2 in VALUES:
            merged = _merge_fibers({"p": v1}, {"p": v2})
            assert merged["p"] == knowledge_join(v1, v2)
