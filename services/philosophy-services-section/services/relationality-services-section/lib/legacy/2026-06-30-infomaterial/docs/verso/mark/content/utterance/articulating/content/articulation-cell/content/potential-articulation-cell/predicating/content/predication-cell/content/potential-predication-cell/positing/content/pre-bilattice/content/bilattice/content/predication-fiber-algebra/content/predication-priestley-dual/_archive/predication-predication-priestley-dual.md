---
kind: definition
type: dual-representation
depends-on: [spatiotemporal-knowledge-presheaf, predication-fiber-algebra, twist-product, jung-rivieccio-duality, knowledge-order]
---

# knowledge presheaf Priestley dual

Given a [spatiotemporal knowledge presheaf](spatiotemporal-knowledge-presheaf.md) $v$ over $(\mathbf{L}, \mathcal{C}, E, \lambda)$, at each settling step $\tau < \lambda$ and each [predicate](../concepts/predicate.md) $p \in \mathcal{C}$ the valuation $v_\tau(p) \in A_p = \mathbf{L}^{\bowtie E \times E}$ has a **Priestley dual**

$$\widehat{v_\tau(p)},$$

a [paired Priestley space](paired-priestley-space.md) obtained by applying $\mathrm{Spec}$ to each coordinate of the [twist product](twist-product.md). The family $\widehat{v} = (\widehat{v_\tau(p)})_{p, \tau}$ is the **dual representation** of $v$.

## Fiberwise duality

For each fixed $p, \tau$, the correspondence $v_\tau(p) \mapsto \widehat{v_\tau(p)}$ is the object-level component of the [Jung–Rivieccio duality](../theorems/jung-rivieccio-duality.md) applied to the [predication fiber algebra](predication-fiber-algebra.md) $A_p$. It extends to [bilattice-homomorphism](../morphisms/bilattice-homomorphism.md) morphisms on $A_p$ accordingly. Fully [$\mathcal{C}$-closed](../concepts/predicate-category-naturality.md) knowledge presheaves additionally satisfy a dual $\mathcal{C}$-coherence whose full statement is outside the present layer.

## Interpretation

Under the duality, accumulation of evidence in the [knowledge order](../concepts/knowledge-order.md) $\leq_k$ on the primal side corresponds to filter-tightening on the Priestley dual side. "Knowledge grows" is dual to "possibility space shrinks" — the standard Stone-dual perspective.
