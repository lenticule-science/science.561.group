---
type: definition
class: monoidal-product
symbol: "F \\otimes G"
depends-on: [quantale-enriched-sheaf, bitopological-settling-site]
---

# Q-enriched sheaf tensor product

The **tensor product of $\mathsf{Q}$-enriched sheaves** $F \otimes G$ on a Grothendieck site $(\mathbf{T}, J)$ — the pointwise tensor of stalks in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ followed by sheafification. Together with the [internal Hom](q-enriched-sheaf-hom.md), this gives the [Q-enriched sheaf category](quantale-enriched-sheaf.md) a closed symmetric monoidal structure — the **monoidal piece** of the six-functor package for settling cohomology.

## Definition

Fix a commutative unital quantale $\mathsf{Q}$ and a Grothendieck site $(\mathbf{T}, J)$. The category $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ of complete weighted lattices and Q-functors is symmetric monoidal closed (Stubbe 2005), with tensor product $\otimes_{\mathsf{Q}}$ characterized by the universal property of bi-Q-functors out of the product.

For Q-enriched presheaves $F, G : \mathbf{T}^{\mathrm{op}} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$, the **pointwise tensor presheaf** $F \otimes_{\mathrm{p}} G$ is defined cell-wise:

$$(F \otimes_{\mathrm{p}} G)(\sigma) \;:=\; F(\sigma) \otimes_{\mathsf{Q}} G(\sigma) \qquad \text{for each } \sigma \in \mathbf{T},$$

with restrictions $f_\sigma^\tau \otimes g_\sigma^\tau$ (tensor of the per-sheaf restriction Q-functors).

The **tensor product of Q-enriched sheaves** $F \otimes G$ is the *sheafification* of $F \otimes_{\mathrm{p}} G$ — the universal Q-enriched sheaf with a Q-functor map from the pointwise presheaf:

$$F \otimes G \;:=\; \mathrm{sheafify}_J(F \otimes_{\mathrm{p}} G).$$

## Sheafification in the Q-enriched setting

The sheafification functor $\mathrm{sheafify}_J : \mathrm{PSh}(\mathbf{T}; \mathsf{Q}) \to \mathrm{Sh}(\mathbf{T}, J; \mathsf{Q})$ is left adjoint to the inclusion $\mathrm{Sh} \hookrightarrow \mathrm{PSh}$. In $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$, sheafification exists by the standard Grothendieck construction adapted to the enriched setting (filtered-colimit-friendly category, equalizer-ready value category — both verified for $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ in Stubbe 2005 and Lopez 2024).

The composition $F \otimes G = \mathrm{sheafify}_J \circ (- \otimes_{\mathrm{p}} -)$ is left adjoint in each variable to the appropriate Hom — the closed-monoidal structure verified by the [closed-monoidal structure theorem](../theorems/q-enriched-sheaf-closed-monoidal-structure.md).

## Specialization to d-frame-valued sheaves

For the [d-frame value category](d-frame.md), each d-frame stalk has tensor product structure inherited from the underlying frames: $(L_+, L_-, \mathrm{con}, \mathrm{tot}) \otimes (L'_+, L'_-, \mathrm{con}', \mathrm{tot}') = (L_+ \otimes L'_+, L_- \otimes L'_-, \mathrm{con} \otimes \mathrm{con}', \mathrm{tot} \otimes \mathrm{tot}')$ with componentwise frame tensor and the natural product on the relations.

The d-frame sheaf tensor product specializes the Q-enriched tensor: at each stalk $(q, \tau, U)$, the tensor $\mathbb{F}_v \otimes \mathbb{F}_{v'}$ has d-frame value the tensor of the per-settling d-frames. The sheafification step ensures the result is a sheaf on the bitopological settling site.

## Cellular tensor

For the [bitopological settling site](bitopological-settling-site.md) viewed as a fibered cellular site, the tensor decomposes per fiber:

$$(F \otimes G)|_{\mathbf{T}_b} \;=\; F|_{\mathbf{T}_b} \otimes G|_{\mathbf{T}_b}$$

— the per-fiber tensor of cellular Q-enriched sheaves. For finite-cellular fibers, this is computed via the [CW-complex theorem](../theorems/q-enriched-curry-cw-complex.md)'s framework; for transfinite-cellular fibers, via the [transfinite-CW theorem](../theorems/q-enriched-curry-transfinite-cw.md). The tensor commutes with the fiber-cellular machinery.

## Position in predication categories

This is the **monoidal product** of the [closed monoidal structure](../theorems/q-enriched-sheaf-closed-monoidal-structure.md) on Q-enriched sheaves — one of two pieces (with [internal Hom](q-enriched-sheaf-hom.md)) constituting the *monoidal piece* of the [six-functor formalism](../questions/six-functor-formalism-for-settling-cohomology.md) for settling cohomology.

The closed-monoidal structure theorem establishes the adjunction; together with the existing [Verdier duality](../theorems/verdier-duality-bitopological-site.md) ($\mathbb{D}$), the corpus has three of the six functors. The remaining direct/inverse image pair ($f^*, f_*, f^!, f_!$) is open work.
