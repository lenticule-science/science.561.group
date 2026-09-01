---
kind: theorem
status: proved
depends-on: [bitopological-settling-site, bitopological-settling-site-functoriality, kz-coherent-sheaf, knowledge-presheaf-morphism]
---

# Sheaf functoriality on the bitopological settling site

A morphism $\Phi : \mathcal{E}_1 \to \mathcal{E}_2$ of [predication hyperdoctrines](../objects/predication-hyperdoctrine.md) over common $(\mathbf{L}, \mathcal{C}, E, \lambda)$ induces:

- An **inverse-image functor** $\Phi^* : \mathrm{Sh}(\mathbf{T}^*_2, J_2) \to \mathrm{Sh}(\mathbf{T}^*_1, J_1)$ by precomposition with the site morphism of [bitopological-settling-site functoriality](bitopological-settling-site-functoriality.md).
- A **direct-image functor** $\Phi_* : \mathrm{Sh}(\mathbf{T}^*_1, J_1) \to \mathrm{Sh}(\mathbf{T}^*_2, J_2)$ right adjoint to $\Phi^*$.
- Both functors restrict to the [KZ-coherent](../concepts/kz-coherent-sheaf.md) subcategories.

## Proof

*Inverse-image.* Precomposition is well-defined on presheaves; on sheaves it is composition with the site functor of [bitopological-settling-site functoriality](bitopological-settling-site-functoriality.md) followed by sheafification, both preserving the sheaf condition because the site functor preserves covers.

*Direct-image.* The right adjoint exists by the adjoint functor theorem in Grothendieck topoi; explicit construction in [@kashiwara-schapira2006] §17.6.

*KZ-coherence preservation.* The underlying site morphism is 2-functorial — KZ 2-cells on $\mathbf{T}^*_1$ correspond to KZ 2-cells on $\mathbf{T}^*_2$ — so both $\Phi^*$ and $\Phi_*$ preserve KZ-coherence. $\square$

## Geometric morphism

The pair $\Phi^* \dashv \Phi_*$ is a *geometric morphism* of Grothendieck topoi when $\Phi^*$ preserves finite limits, which follows from the underlying site morphism being left-exact at the fiber level — Priestley-space morphisms preserve finite limits. This is the input to standard Leray spectral sequence machinery used in the cohomological classification.

## Settling-refinement specialization

For the specific case of settling refinement — keeping the predication hyperdoctrine fixed and restricting to a settling sub-range $\lambda' \subseteq \lambda$ — the proposition specializes to a pair $(j^*, j_*)$ of restriction/extension functors with $j^* \mathcal{F}_U = \mathcal{F}_U|_{\lambda'}$, the restriction of the [settling-associated sheaf](../objects/settling-associated-sheaf.md) to the sub-range. The direct-limit argument for the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) uses this for the sequence $\lambda' = [0, \tau]$ as $\tau \to \kappa$.
