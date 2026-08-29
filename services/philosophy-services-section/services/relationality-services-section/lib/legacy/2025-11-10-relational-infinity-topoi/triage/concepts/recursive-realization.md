---
name: recursive-realization
type: concept
class: fixed-point-construction
symbol: "\\mathrm{RR}"
depends-on:
  - constructibility
  - kz-comonad
  - "../../../../../relational-calculus/triage/concepts/generative-closure.md"
---

**Recursive realization** is the iterative procedure that, given an [SD-constructible](constructibility.md) skeleton on a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md), produces a diagram $F$ realizing the skeleton by stabilizing each stratum in degree order.

Procedure:

1. Initialize $F^{(0)}$ as the skeleton's degree-0 input.
2. For each successor degree $n+1$, compute $F^{(n+1)}(i)$ at every degree-$(n+1)$ position $i$ as the stabilization $G\bigl(L_i F^{(n)} \to M_i F^{(n)}\bigr)$ — the [KZ comonad](kz-comonad.md) applied to the latching-to-matching span.
3. Iterate to a fixed point.

By the lax-idempotence of $G$ and the SD-constructibility of the skeleton, the procedure converges in finitely many steps on a finite-degree site and transfinitely on a site with infinite strata.

## Relationship to generative closure

This is the *geometric* face of the relational-calculus pilot's [generative closure](../../../../../relational-calculus/triage/concepts/generative-closure.md) operator $G$ — same letter, different domain. Generative closure produces the universe of *acts* by iterating constructors over a seed; recursive realization produces a *diagram* by iterating the stabilization $G$ over a skeleton. The two are linked by the [recursive-realization theorem](../theorems/recursive-realization-theorem.md), which states that the recursive realization of an SD-constructible skeleton is the unique fixed point — this is the same fixed-point pattern as generative closure's $A_\infty$.

## Comparison with predication-settling

Predication categories' [predication settling](../../../../theories/predication-categories/objects/predication-settling.md) is the 1-categorical analogue: a transfinite chain $(v_\tau)_{\tau < \lambda}$ of valuations, monotone in the [knowledge order](../../../../theories/predication-categories/concepts/knowledge-order.md), iterated to a fixed point. Recursive realization replaces the linear ordinal $\lambda$ with the partial order of strata of a stratified directed site, and replaces the per-step closure by the local KZ stabilization. The two collapse to the same construction when the SD site degenerates to a linear chain.
