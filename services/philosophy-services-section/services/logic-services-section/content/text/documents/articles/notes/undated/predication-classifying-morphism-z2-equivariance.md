---
type: theorem
status: proved
depends-on: [combined-cohomology-classifying-morphism, internal-z2-gauge, equivariant-settling-cohomology, bigraded-settling-cohomology]
title: Classifying morphism $\mathbb{Z}/2$-equivariance
description: The combined cohomology classifying morphism (and its bigraded refinement) is $\mathbb{Z}/2$-equivariant for the internal $\mathbb{Z}/2$-gauge action induced by bilattice negation.
---

# Classifying morphism $\mathbb{Z}/2$-equivariance

The [combined cohomology classifying morphism](../../research/2026/07/31/lenticule-import/morphisms/combined-cohomology-classifying-morphism.md) (and its [bigraded](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md) refinement) is $\mathbb{Z}/2$-equivariant for the [internal $\mathbb{Z}/2$-gauge](../../research/2026/07/31/lenticule-import/from-predicate-category/teaching/explanations/internal-z2-gauge.md) action induced by bilattice negation.

The action discussed here is the *external* gauge action on the cohomology target — what gauge does to classes in $H^1$. This is distinct from the *intrinsic* gauge action on a single settling's automorphism group analyzed in [visible-automorphism sources](../../../../glossary/concepts/visible-automorphism-sources.md): that action's cellwise reindexing is the identity on $E \times E$ (gauge fixes cell positions and acts only on values), so gauge that stabilizes a settling sits in $N(v)$ and never contributes to $\mathrm{Aut}^{\mathrm{vis}}(v)$. The two are consistent: gauge fixes cell positions (intrinsic) while permuting the value labels carried by those cells (external).

The action splits as:

- **Trivial on the $\top$-summand.** The inconsistency-sheaf $\mathcal{F}_U^{(\top)}$ is gauge-fixed because $\top$ is a $\sim$-fixed bilattice value.
- **Sign-flipping on the $t$-summand.** The truth-side settling-associated sheaf $\mathcal{F}_U^{(t)}$ is gauge-acted on by the $\mathbf{t} \leftrightarrow \mathbf{f}$ swap: a $\mathbf{t}$-firing maps to an $\mathbf{f}$-firing, which under $\mathbf{t}$-designation reads as a negated contribution.

## Proof

The internal $\mathbb{Z}/2$-gauge $\sim$ on each [predication fiber algebra](../../research/2026/07/31/lenticule-import/objects/predication-fiber-algebra.md) acts on the classifying invariants via the [equivariant settling cohomology](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/equivariant-settling-cohomology.md) refinement:

- $\sim$ fixes $\bot, \top$ pointwise — so $\mathcal{F}_U^{(\top)}$, which tracks $\top$-cells alone, is gauge-fixed. The $\mathbb{Z}/2$-action on the $\top$-summand of the bigraded invariant is trivial.
- $\sim$ swaps $\mathbf{t}, \mathbf{f}$ — so $\mathcal{F}_U^{(t)}$, which tracks $\mathbf{t}$-cells, is gauge-acted on by sending $\mathbf{t}$-cells to $\mathbf{f}$-cells. Under the convention that $\mathcal{F}_U^{(t)}$ counts only $\mathbf{t}$-cells (not $\mathbf{f}$-cells), the gauge action sends a $\mathbf{t}$-firing class $e_\mu \in H^1$ to its negation $-e_\mu$ — a sign-flip on the $\mathbf{t}$-summand.

Combining: the [combined classifying morphism](../../research/2026/07/31/lenticule-import/morphisms/combined-cohomology-classifying-morphism.md) is $\mathbb{Z}/2$-equivariant with the indicated action splitting. $\square$
