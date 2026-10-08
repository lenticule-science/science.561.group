---
kind: theorem
status: proved
depends-on: [modal-necessity-operator, world-set, bilattice-accessibility-relation, four-bilattice, twist-product-right-residual]
title: Modal non-normality
description: does not hold in general for the modal necessity operator $\BoxR$ on the four-element bilattice $\mathbf{FOUR}$.
---

# Modal non-normality

The classical normality axiom

$$\Box_R(\phi \to \psi) \to (\Box_R \phi \to \Box_R \psi)$$

does not hold in general for the [modal necessity operator](../../documents/articles/notes/undated/modal-necessity-operator.md) $\Box_R$ on the [four-element bilattice](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/objects/four-bilattice.md) $\mathbf{FOUR}$.

## Proof

Take $|W| = 1$ with single world $w_0$ and [accessibility relation](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md) $R(w_0, w_0) = \bot$. Interpret propositional variables $\phi, \psi$ by $u^\phi_{w_0} = \bot$ and $u^\psi_{w_0} = \mathbf{f}$ (fiber-algebra valuations, treated here as single-cell). Compute, using the strong implication $\to$ on $\mathbf{L}^\bowtie$ (the [twist-product right residual](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/morphisms/twist-product-right-residual.md) $\Rightarrow$ per-cell):

$$u^{\phi \to \psi}_{w_0} = \bot \to \mathbf{f} = \bot,$$

$$(\Box_R u^\phi)_{w_0} = \bot \to \bot = \mathbf{t}, \qquad (\Box_R u^\psi)_{w_0} = \bot \to \mathbf{f} = \bot,$$

$$(\Box_R u^{\phi \to \psi})_{w_0} = \bot \to \bot = \mathbf{t},$$

$$u^{\Box\phi \to \Box\psi}_{w_0} = \mathbf{t} \to \bot = \bot.$$

The normality formula then evaluates to $\mathbf{t} \to \bot = \bot \notin \{\mathbf{t}, \top\}$. $\square$

## Remark

This non-normality reflects the paraconsistent nature of the bilattice modal logic and is central to the structural difference between knowledge presheaf modalities and classical Kripke modalities.
