---
type: theorem
status: sketch
depends-on: [verdier-duality-bitopological-site, q-enriched-sheaf-closed-monoidal-structure, q-enriched-sheaf-hom, quantale-enriched-sheaf]
---

# Verdier–Hom compatibility (Q-enriched)

**Conjecture (Verdier-Hom compatibility).** *For Q-enriched sheaves $F, G$ on the bitopological settling site:*

$$\mathbb D(\mathcal H om(F, G)) \;\simeq_q\; \mathcal H om(\mathbb D(G), \mathbb D(F)).$$

*The order swap on the right ($G$ before $F$) is characteristic — Verdier duality is contravariant in the inputs of internal Hom, matching the classical abelian-setting precedent.*

## What's needed

The compatibility relates two of the corpus's three established functors ($\mathcal H om$ from [closed monoidal structure](../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-sheaf-closed-monoidal-structure.md), $\mathbb D$ from [Verdier duality](verdier-duality-bitopological-site.md)). The Q-enriched analog requires:

1. **Computing $\mathbb D$ of an internal Hom cellwise.** Internal Hom of sheaves is the pointwise Hom (proved in the closed-monoidal-structure theorem); $\mathbb D$ is the Curry equivalence's image on the cosheaf side. Whether $\mathbb D$ commutes with stalk-wise Hom (with the contravariant order swap) needs verification at the per-fiber Curry level.

2. **The order-swap structural argument.** The classical Verdier–Hom contravariance comes from $\mathcal H om(F, G) = G \otimes F^\vee$ (where $F^\vee$ is the linear dual), and $\mathbb D$ of a tensor swaps factors. The Q-enriched analog requires defining the right dual notion in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$.
