---
type: concept
class: residual
depends-on: [predicatory-comparison, predication-valuation, knowledge-order, twist-product]
see-also: [evidence-residual, four-symmetric-evidence-difference, resource-deficit, predicatory-equalization]
---

# Predicatory differentiation

**Predicatory differentiation** is the comparison operation that asks what evidence separates one valuation or settling from another.

The term is intentionally restricted.
Differential categories in the sense of [@blute-cockett-seely2006] and [@blute-et-al2020] require additive symmetric monoidal structure, a coalgebra modality, and a differential combinator with coherence laws.
The [predication settling category](../objects/predication-settling-category.md) does not automatically carry that structure.

The predication-native operation is instead an **evidence residual**.
Given $v \leq_k w$, the residual $\partial_k(v,w)$ records the cellwise positive and negative evidence present in $w$ but not already present in $v$.
On a twist product $\mathbf{L}^\bowtie$, this is computed coordinatewise when the underlying lattice admits a relative complement or residuum; on $\mathbf{FOUR}$ it reduces to a finite lookup table.

When the two inputs are not comparable in $\leq_k$, the residual question is not well-typed.
On $\mathbf{FOUR}$, the [FOUR symmetric evidence difference](../morphisms/four-symmetric-evidence-difference.md) supplies the corresponding total comparison operator: it records which evidence coordinates differ without pretending that one valuation is an update of the other.

This operation supports calculator questions such as:

- What evidence did this settling step add?
- Which cells prevent $v$ from reaching $w$?
- Does a proposed update add only positive evidence, only negative evidence, or both?
- Is the difference between two frameworks a truth-side difference, a knowledge-side difference, or a contested-cell difference?

Predicatory differentiation is therefore a residual calculus before it is a differential calculus.
A later theorem may prove that a richer PredCat layer carries an actual differential-category structure, but this concept does not assume that result.
