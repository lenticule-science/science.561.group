---
type: definition
class: internal-hom
symbol: "\\mathcal{H}om(F, G)"
depends-on: [quantale-enriched-sheaf, q-enriched-sheaf-tensor, bitopological-settling-site]
---

# Q-enriched sheaf internal Hom

The **internal Hom of $\mathsf{Q}$-enriched sheaves** $\mathcal{H}om(F, G)$ on a Grothendieck site $(\mathbf{T}, J)$ — the sheaf-of-Q-functors-from-$F$-to-$G$, right adjoint to [tensor product](q-enriched-sheaf-tensor.md). Together with the tensor, this gives the [Q-enriched sheaf category](quantale-enriched-sheaf.md) a closed symmetric monoidal structure.

## Definition

For Q-enriched presheaves $F, G : \mathbf{T}^{\mathrm{op}} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$, the **internal Hom presheaf** $\mathcal{H}om_{\mathrm{p}}(F, G)$ is defined cell-wise:

$$\mathcal{H}om_{\mathrm{p}}(F, G)(\sigma) \;:=\; \mathrm{hom}_{\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}}\bigl(F(\sigma),\, G(\sigma)\bigr) \qquad \text{for each } \sigma \in \mathbf{T}.$$

The right side is the internal Hom in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ — the Q-category of Q-functors from $F(\sigma)$ to $G(\sigma)$ with weighted Q-hom, which exists by the closed-monoidal structure of $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ (Stubbe 2005).

The presheaf restrictions are induced by precomposition / postcomposition with the per-sheaf restrictions of $F$ and $G$.

The **internal Hom of Q-enriched sheaves** $\mathcal{H}om(F, G)$ is the *sheafification* of $\mathcal{H}om_{\mathrm{p}}(F, G)$:

$$\mathcal{H}om(F, G) \;:=\; \mathrm{sheafify}_J(\mathcal{H}om_{\mathrm{p}}(F, G)).$$

For sheaf $F$ and sheaf $G$, the internal Hom is automatically a sheaf without sheafification when $\mathbf{T}$ has a sufficient supply of equalizers — the Q-Cat_cwl-valued Hom commutes with limits in its second argument, so $\mathcal{H}om_{\mathrm{p}}(F, G)$ inherits the sheaf condition from $G$.

## Specialization to d-frame-valued sheaves

For the d-frame value category, each d-frame internal Hom $\mathrm{hom}((L_+, L_-, \mathrm{con}, \mathrm{tot}), (L'_+, L'_-, \mathrm{con}', \mathrm{tot}'))$ is the d-frame whose components are the per-component frame internal Hom (Heyting-style implication on Boolean components for predication categories' typical setting), with consistency and totality relations adjusted to track which Hom-pairs respect the relation structure.

Concretely: a d-frame morphism $\phi : (L_+, L_-, \mathrm{con}, \mathrm{tot}) \to (L'_+, L'_-, \mathrm{con}', \mathrm{tot}')$ consists of frame morphisms $\phi_+, \phi_-$ that preserve consistency and totality. The internal Hom collects all such d-frame morphisms as a d-frame in its own right, with structure inherited from the codomain.

## Cellular internal Hom

For a fibered cellular site, the internal Hom decomposes per fiber:

$$\mathcal{H}om(F, G)|_{\mathbf{T}_b} \;=\; \mathcal{H}om\bigl(F|_{\mathbf{T}_b},\, G|_{\mathbf{T}_b}\bigr).$$

Per-fiber computation uses the [CW-complex theorem](../theorems/q-enriched-curry-cw-complex.md) framework for finite-cellular fibers, the [transfinite-CW theorem](../theorems/q-enriched-curry-transfinite-cw.md) for transfinite-cellular ones.

## Adjunction with tensor

The substantive structural result — verified in the [closed-monoidal structure theorem](../theorems/q-enriched-sheaf-closed-monoidal-structure.md) — is the adjunction

$$\mathrm{Hom}_{\mathrm{Sh}}(F \otimes G,\, H) \;\cong\; \mathrm{Hom}_{\mathrm{Sh}}(F,\, \mathcal{H}om(G, H))$$

for Q-enriched sheaves $F, G, H$. This is the closed-monoidal structure on the Q-enriched sheaf category.

## Relation to the existing sheaf-functoriality

The corpus's existing [sheaf functoriality on the bitopological site](../theorems/sheaf-functoriality-on-bitopological-site.md) gives the inverse-image / direct-image adjunction $(\Phi^*, \Phi_*)$ for hyperdoctrine morphisms. The internal Hom interacts with this via the **projection formula** (open work in the six-functor formalism question):

$$\Phi_*(F) \otimes G \;\cong\; \Phi_*(F \otimes \Phi^*(G))$$

for hyperdoctrine morphisms $\Phi$. Establishing this is part of the [direct/inverse image piece](q-enriched-sheaf-direct-inverse-image.md) of the six-functor formalism — the sub-task that uses the monoidal piece established here.

## Position in predication categories

The internal-Hom companion to the [tensor product](q-enriched-sheaf-tensor.md). Together with the existing Verdier duality, this gives three of the six functors of the [six-functor package](../questions/six-functor-formalism-for-settling-cohomology.md) for settling cohomology. The remaining four functors are open.
