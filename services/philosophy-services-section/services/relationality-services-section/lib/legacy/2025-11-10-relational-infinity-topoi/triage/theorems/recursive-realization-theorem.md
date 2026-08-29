---
name: recursive-realization-theorem
type: theorem
class: fixed-point
status: sketch
lean: RelationalInfinityTopoi.recursive_realization
depends-on:
  - recursive-realization
  - sd-constructible-stack
  - kz-comonad-G
  - "../../../../../relational-calculus/triage/concepts/generative-closure.md"
---

Given an [SD-constructible](../teaching/explanations/constructibility.md) skeleton $F^{(0)}$ on a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) $\mathcal{S}$ — i.e. an assignment of degree-0 data — the [recursive-realization](../teaching/explanations/recursive-realization.md) procedure converges to the unique extension $F : \mathcal{S} \to \mathcal{H}$ realizing the skeleton, and this extension is the unique fixed point of the per-stratum [KZ-comonad](../morphisms/kz-comonad-G.md) stabilization.

## Statement

Let $\mathcal{S}$ be a finite-degree SD ∞-site, $F^{(0)} : \mathcal{S}_{\leq 0} \to \mathcal{H}$ an SD-constructible degree-0 skeleton. Define $F^{(n+1)}$ by extending $F^{(n)}$ to degree $n+1$ via $F^{(n+1)}(i) := G(L_i F^{(n)} \to M_i F^{(n)})$ for every position $i$ at degree $n+1$. Then:

1. The chain $F^{(0)} \to F^{(1)} \to \cdots$ stabilizes after finitely many steps (one per degree level on a finite-degree site; transfinitely on an infinite-degree site, with convergence by the well-foundedness of the degree function).
2. The stable value $F^{(\infty)}$ is the unique [SD-constructible](../teaching/explanations/constructibility.md) extension of $F^{(0)}$ to all of $\mathcal{S}$.
3. $F^{(\infty)}$ is a $G$-coalgebra (pointwise), and so represents a point of the [field of existence](../objects/field-of-existence.md).

## Proof sketch

(1) is by induction on degree, with finite-degree termination immediate. (2) is uniqueness from constructibility: SD-constructibility forces $F(i)$ at every $i$, so any two extensions agree. (3) is the assertion that the limit is fixed by $G$, which follows from the lax-idempotence of $G$.

## Status

Sketch. The transfinite case requires an extra Scott-continuity-style argument for the limit step that the source drafts skip.

## Relationship to generative closure

This theorem is the *geometric* face of the relational-calculus pilot's [generative closure](../../../../../relational-calculus/triage/concepts/generative-closure.md) operator $G$ on the universe of acts. Both are fixed-point constructions over a well-founded structure; both terminate by the lax-idempotence of the iterating operator; both produce a uniquely-determined limit. The pilot's $A_\infty = G(A_\infty)$ at the level of acts and this theorem's $F^{(\infty)} = G(F^{(\infty)})$ at the level of diagrams are two faces of the same self-grounding pattern.
