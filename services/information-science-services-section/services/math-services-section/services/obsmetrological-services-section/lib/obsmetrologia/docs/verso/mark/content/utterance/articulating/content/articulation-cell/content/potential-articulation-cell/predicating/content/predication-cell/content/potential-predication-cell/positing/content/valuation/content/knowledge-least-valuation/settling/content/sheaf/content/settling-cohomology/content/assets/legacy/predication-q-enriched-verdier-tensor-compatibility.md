---
type: theorem
status: sketch
depends-on: [verdier-duality-bitopological-site, q-enriched-sheaf-closed-monoidal-structure, q-enriched-sheaf-tensor, quantale-enriched-sheaf]
---

# Verdier–tensor compatibility (Q-enriched)

**Conjecture (Verdier-tensor compatibility).** *For Q-enriched sheaves $F, G$ on the bitopological settling site:*

$$\mathbb D(F \otimes G) \;\simeq_q\; \mathbb D(F) \otimes \mathbb D(G)$$

*up to fuzziness $q$ inheriting from the Verdier fuzziness profile $q^{\mathrm{glob}}$. In the strict case ($q = 1$, Boolean d-frame data), this would be a strict isomorphism.*

## What's needed

The compatibility relates two of the corpus's three established functors ($\otimes$ from [closed monoidal structure](../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-sheaf-closed-monoidal-structure.md), $\mathbb D$ from [Verdier duality](verdier-duality-bitopological-site.md)). It is a standard derived-categorical compatibility in classical settings; the Q-enriched analog requires:

1. **Computing $\mathbb D$ of a tensor product cellwise.** $\mathbb D$ is constructed via the Curry equivalence; tensor is constructed pointwise on stalks then sheafified. Whether $\mathbb D$'s Curry construction commutes with stalk-wise tensor needs to be checked at the per-fiber Curry level.

2. **Tracking fuzziness through the composition.** $\mathbb D(F)$ has fuzziness $q^{\mathrm{glob}}(F)$; tensor of fuzzy-equivalent objects gives fuzziness bounded by the meet. Verdier of a tensor product, vs tensor of two Verdiers, may have different fuzziness profiles — the precise comparison is the substantive content.
