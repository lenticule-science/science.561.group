---
type: concept
class: operation
symbol: "\\sim"
depends-on: [evidence]
see-also: [truth, knowledge, conflation, internal-z2-gauge]
---

# Negation

The role of an involution that *swaps the two sides of [evidence](evidence.md)*: positive evidence for an assertion becomes evidence against, and vice versa, with the assertion's *informational content* — how much is known about it — left unchanged.

A framework realizes negation when it gives an operation $\sim$ on its value space whose effect on a value can be described entirely as "interchange the for-roles and the against-roles." Three structural pressures distinguish negation from related operations:

- **Truth-reversal.** A value that is well-supported as true must become well-supported as false, and vice versa. Concretely, $\sim$ is *antitone in the [truth order](truth-order.md)* $\leq_t$.
- **Knowledge-preservation.** A value carrying a lot of information must, after negation, still carry a lot of information — and a value carrying little, still little. Negation moves *across* the truth axis but *along* the knowledge axis. Concretely, $\sim$ is *monotone in the [knowledge order](knowledge-order.md)* $\leq_k$.
- **Self-inverse.** Negating twice restores the original. Concretely, $\sim \sim a = a$.

These three pressures interact: knowledge-monotonicity together with the involution forces $\sim$ to be a $\leq_k$-automorphism, so it must permute each $\leq_k$-rank to itself — in particular, fix any value that is uniquely determined by its $\leq_k$-rank. On [$\mathbf{FOUR}$](../objects/four-bilattice.md) this forces $\sim$ to fix $\bot$ and $\top$ (the unique $\leq_k$-bottom and $\leq_k$-top) and exchange $\mathbf{t}$ and $\mathbf{f}$ (the unique pair at the middle $\leq_k$-rank); on richer bilattices the role still preserves $\leq_k$-rank but may permute non-trivially within each rank, with truth-antitonicity constraining how. A framework that handles all three pressures realizes negation in the sense used here; one that handles only the first (a classical "not") collapses unknownness into denial and trivializes contradiction, recovering the foils discussed in [classical, three-valued, and paraconsistent foils for adjudication](prose/teaching/explanations/classical-three-valued-paraconsistent-foils.md).

## Distinguished from conflation

A second involution can be present alongside negation: the [conflation](../morphisms/conflation.md) $-$, which is *antitone in the knowledge order and monotone in the truth order* — the role-dual of negation, swapping informational extremes while preserving truth-extremes. The two involutions are independent: a framework can carry negation without conflation, and the [Klein-four symmetry](klein-four-symmetry.md) records the structure when both are present and commute.

## The bilattice realization

On a [pre-bilattice](../objects/pre-bilattice.md), negation is realized as a unary operation $\sim$ satisfying the three pressures verbatim; the resulting structure is a [bilattice](../objects/bilattice.md). The minimal non-trivial example, [$\mathbf{FOUR}$](../objects/four-bilattice.md), exhibits negation as the swap of $\mathbf{t}$ and $\mathbf{f}$ with $\bot$ and $\top$ fixed.

## The twist-product realization

When the bilattice is presented as a [twist product](../objects/twist-product.md) $\mathbf{L}^\bowtie$, with values $\langle a_+, a_- \rangle$ tracking positive and negative [evidence](evidence.md) separately, negation is *literally* the coordinate swap

$$\sim \langle a_+, a_- \rangle \;=\; \langle a_-, a_+ \rangle.$$

The role's content — interchange the two sides of evidence — becomes a one-line algebraic operation. By [Avron representation](../theorems/avron-representation.md), every interlaced bilattice is a twist product, so this presentation captures all the cases the program uses.

## Under dualization

Negation lifts to the full [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) by acting cellwise on each [predication fiber algebra](../objects/predication-fiber-algebra.md), and to its [Priestley dual](../objects/dual-predication-hyperdoctrine.md) by the dualized cellwise swap. As an action on the bilattice it generates the [internal $\mathbb{Z}/2$-gauge](internal-z2-gauge.md), which propagates through the cohomology layer as the gauge group of [equivariant settling cohomology](../theorems/equivariant-settling-cohomology.md). The role of negation is therefore not only a connective on values but a *symmetry of the entire structure* — visible at every layer at which evidence is recorded.
