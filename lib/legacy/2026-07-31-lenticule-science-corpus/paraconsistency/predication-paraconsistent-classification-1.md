---
kind: theorem
status: proved
closes: paraconsistent-settling-associated-sheaf
depends-on: [aperiodic-regime-classification, aperiodic-classifying-invariant, inconsistency-sheaf, mutually-locally-derivable, settling-morphism, bigraded-settling-cohomology]
---

# Paraconsistent aperiodic-regime classification

For [aperiodic-regime](four-regime-dichotomy.md) [knowledge presheaves](../objects/spatiotemporal-knowledge-presheaf.md) $v, v'$ over a common base whose settlings may generate $\top$-valued cells, define the **bigraded classifying invariant**

$$\mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}(v) \;:=\; \bigl([\mathrm{cl}\text{-}\mathrm{inv}^{(t)}(v)],\; [\mathrm{cl}\text{-}\mathrm{inv}^{(\top)}(v)]\bigr) \;\in\; H^1_t(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{(t)}) \,\oplus\, H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{(\top)}),$$

with $\mathrm{cl}\text{-}\mathrm{inv}^{(t)}$ the truth-order [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) and $\mathrm{cl}\text{-}\mathrm{inv}^{(\top)}$ the analogous class in the [inconsistency sheaf](../objects/inconsistency-sheaf.md)'s cohomology.

Then

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}(v) = \mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}(v').$$

## Proof

The [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence is defined via [settling-morphisms](../morphisms/settling-morphism.md), which are bilattice homomorphisms — hence preserve the designation decomposition $\{\mathbf{t}, \top\}$ separately. The [aperiodic-regime classification](aperiodic-regime-classification.md) proof applied to the $\mathbf{t}$-only part gives the first component; the same proof applied to the $\top$-only part (using the [inconsistency sheaf](../objects/inconsistency-sheaf.md) $\mathcal{F}_U^{(\top)}$ in place of $\mathcal{F}_U^{(t)}$ throughout) gives the second component. Joint equality gives joint MLD-equivalence. $\square$

## Reading

For *consistent* settlings the second component is trivially zero and the proposition reduces to the truth-only [aperiodic-regime classification](aperiodic-regime-classification.md). For *inconsistent* settlings the second component contributes genuine extra distinguishing power: two settlings can have the same truth-order classifying invariant but differ in the pattern of inconsistency-cell production, and the bigraded invariant separates them.

This realizes the bigraded structure of [bigraded settling cohomology](../objects/bigraded-settling-cohomology.md) as more than a formal refinement: in the paraconsistent setting it sharpens the classification.
