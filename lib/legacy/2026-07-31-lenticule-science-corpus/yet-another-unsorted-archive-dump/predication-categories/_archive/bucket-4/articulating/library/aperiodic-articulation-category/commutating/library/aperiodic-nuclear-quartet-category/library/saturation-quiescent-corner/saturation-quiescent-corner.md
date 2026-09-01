---
name: saturation-quiescent-corner
kind: corner-cell
description: "The σ-quiescent corner of a commutative nuclear square: Fix(σ). The sub-history-determined layer. σ has done its work; Δ may still have work. Corresponds to the potential phase of articulation."
sub-algebra: Fix(σ)
quiescence: "σ is quiescent; Δ may still act"
phase-cell: active
---

The **saturation-quiescent corner** of a [commutative nuclear square](../../../../library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/variety/library/lattice/library/closure-operator/library/nucleus/library/commutative-nuclear-square/commutative-nuclear-square.md) $(A, \sigma, \Delta)$ is the σ-fixed sub-algebra

$$
\mathrm{Fix}(\sigma) \;=\; \{a \in A : \sigma(a) = a\}.
$$

Elements here are **saturation-stable**: the past has nothing further to add. They are the largest elements of $A$ with their restriction profiles — fully determined by what they look like from every shorter history.

## Position in the quartet

| | $\Delta$-quiescent | $\Delta$-**free** |
|---|---|---|
| $\sigma$-**quiescent** | $A^*$ | **$\mathrm{Fix}(\sigma)$** |
| $\sigma$-free | $\mathrm{Fix}(\Delta)$ | $A$ |

The σ-quiescent corner is the top-right: σ has reached its fixed-point; Δ may still move elements upward.

## Sub-Heyting-algebra structure

$\mathrm{Fix}(\sigma)$ is a sub-Heyting-algebra of $A$ (closed under $\wedge$, $\vee$, $\Rightarrow$, $\bot$, $\top$). The inclusion $\iota : \mathrm{Fix}(\sigma) \hookrightarrow A$ has left adjoint $\sigma : A \to \mathrm{Fix}(\sigma)$, giving a reflective adjunction.

The transfer nucleus $\Delta$ restricts to $\mathrm{Fix}(\sigma)$: by commutativity $\sigma \circ \Delta = \Delta \circ \sigma$, so $\Delta(\mathrm{Fix}(\sigma)) \subseteq \mathrm{Fix}(\sigma)$. Within this sub-algebra, $\Delta$ continues to act non-trivially toward the joint fixed-point.

## Further reduction to the joint corner

Applying $\Delta$ to elements of $\mathrm{Fix}(\sigma)$ reduces further to the joint-quiescent corner:

$$
\mathrm{Fix}(\sigma) \xrightarrow{\Delta} A^* = \mathrm{Fix}(\sigma) \cap \mathrm{Fix}(\Delta).
$$

This is the second leg of the canonical retraction $A \to \mathrm{Fix}(\sigma) \to A^*$ (which composes to $\pi$).

## Correspondence to potential

The σ-quiescent corner corresponds to the **potential** phase-cell of articulation: token-axis articulated (σ has settled), claim-axis still free. Chu-shape pairing reads `(token, void)`. The saying has stabilized; the said is not yet committed.
