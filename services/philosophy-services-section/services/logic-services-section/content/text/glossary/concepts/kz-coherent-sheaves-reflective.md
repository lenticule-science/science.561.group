---
kind: theorem
status: proved
depends-on: [kz-coherent-sheaf, bitopological-settling-site, four-regime-dichotomy]
type: theorem
title: KZ-coherent sheaves form a reflective abelian subcategory
description: $\mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^, J)$ is a reflective abelian subcategory of $\mathrm{Sh}(\mathbf{T}^, J)$ with enough injectives.
---

# KZ-coherent sheaves form a reflective abelian subcategory

$\mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ is a reflective abelian subcategory of $\mathrm{Sh}(\mathbf{T}^*, J)$ with enough injectives. In [the strict and Scott-continuous regimes](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md), the inclusion $\mathrm{Sh}^{\mathrm{KZ}} \hookrightarrow \mathrm{Sh}$ is an equivalence.

## Proof

**Reflectivity.** The [KZ-coherence condition](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/kz-coherent-sheaf/kz-coherent-sheaf.md) equalizes the two section maps $F(f), F(f')$ for every KZ 2-cell $f \Rightarrow f'$. Sheafifying the equalizer presheaf — itself a presheaf because equalizers in $\mathbf{Ab}$ are computed pointwise — produces the KZ-coherent reflection of $F$. The reflection functor $r : \mathrm{Sh} \to \mathrm{Sh}^{\mathrm{KZ}}$ is left adjoint to the inclusion, with unit the universal map $F \to r(F)$.

**Abelian.** Inherited from $\mathrm{Sh}(\mathbf{T}^*, J)$ pointwise: a kernel/cokernel of a morphism between KZ-coherent sheaves is again KZ-coherent (the KZ-coherence is preserved under pointwise abelian operations).

**Enough injectives.** Injective objects in $\mathrm{Sh}$ that satisfy KZ-coherence are injective in $\mathrm{Sh}^{\mathrm{KZ}}$. The reflection of an injective need not be injective in general, but for any $F \in \mathrm{Sh}^{\mathrm{KZ}}$ one can embed $F$ into an injective $I$ of $\mathrm{Sh}$ and reflect: $r(I)$ is then injective in $\mathrm{Sh}^{\mathrm{KZ}}$, and $F \hookrightarrow r(I)$ is an embedding by adjunction.

**strict and Scott-continuous regimes equivalence.** All KZ 2-cells in $\mathbf{T}(\mathcal{C}, \lambda)$ are identity in the strict and Scott-continuous regimes (the [temporal 2-category](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) collapses to a 1-category in A, and 2-cells trivialize at the $\omega$-limit in B). The KZ-coherence condition is therefore vacuous, and the inclusion $\mathrm{Sh}^{\mathrm{KZ}} \hookrightarrow \mathrm{Sh}$ is an equivalence. $\square$
