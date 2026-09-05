Context Closure of Strong Normalization
=======================================

Lemma — Context closure of SN
-----------------------------

If ``\mathrm{SN}(t)`` then ``\mathrm{SN}(C[t])`` for any evaluation
context ``C`` built from application, pairing, injections, case,
projections, and ``ρ(·)``.

**Proof.** Any infinite reduction in ``C[t]`` would project to an
infinite reduction in ``t`` or yield a contradiction with finiteness
of context-driven steps; standard by structural induction on ``C``
and the fact that all redexes are within subterms except the finite
top-level eliminations. ∎

