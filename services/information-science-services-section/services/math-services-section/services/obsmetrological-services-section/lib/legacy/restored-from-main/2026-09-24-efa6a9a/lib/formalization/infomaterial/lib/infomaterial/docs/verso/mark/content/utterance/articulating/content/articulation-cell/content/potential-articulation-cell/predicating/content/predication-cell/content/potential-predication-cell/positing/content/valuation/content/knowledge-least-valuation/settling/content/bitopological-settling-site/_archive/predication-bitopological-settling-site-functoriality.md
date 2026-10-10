---
type: theorem
status: proved
depends-on: [bitopological-settling-site, predication-settling-base-morphism, jung-rivieccio-duality, bitopological-stone-duality]
---

# The bitopological settling site is 2-functorial in predication hyperdoctrines

Every morphism $\Phi : \mathcal{E}_1 \to \mathcal{E}_2$ of [predication hyperdoctrines](../objects/predication-hyperdoctrine.md) over common base parameters $(\mathbf{L}, \mathcal{C}, E)$ and matching [settling bound](../objects/settling-bound.md) $\lambda$ induces a *site morphism*

$$\Phi^* : (\mathbf{T}^*_2, J_2) \to (\mathbf{T}^*_1, J_1) \;\;\;\text{between [bitopological settling sites](../objects/bitopological-settling-site.md).}$$

The assignment $\mathcal{E} \mapsto (\mathbf{T}^*_{\mathcal{E}}, J_{\mathcal{E}})$ extends to a 2-functor from the 2-category of predication hyperdoctrines to the 2-category of sites — site morphisms as 1-cells, natural transformations of cover-preserving functors as 2-cells.

## Proof

A site morphism is a functor preserving covers; by the basis status of $J$, this is equivalent to sending pairwise-Stone covers to pairwise-Stone covers.

The hyperdoctrine morphism $\Phi$ sends each fiber $A_{2, q}$ to $A_{1, q}$ by a [bilattice homomorphism](../morphisms/bilattice-homomorphism.md). Dualizing via [Jung–Rivieccio duality](jung-rivieccio-duality.md), at each $(q, \tau)$ we obtain a Priestley-space morphism $\Phi^*_{q, \tau} : X_{1, q}^\tau \to X_{2, q}^\tau$. Priestley-space morphisms send pairwise-Stone clopens to pairwise-Stone clopens — by [bitopological Stone duality](bitopological-stone-duality.md), the Priestley structure determines the bitopological structure — and they preserve pairwise-Stone covers because the preimage-of-union-equals-union-of-preimages identity holds.

Define $\Phi^* : \mathbf{T}^*_{2,\mathrm{site}} \to \mathbf{T}^*_{1,\mathrm{site}}$ on objects by $(q, \tau, U) \mapsto (q, \tau, (\Phi^*_{q, \tau})^{-1}(U))$ and on morphisms by induced preimage. Functoriality and cover preservation are direct.

For 2-functoriality: composition of hyperdoctrine morphisms corresponds to composition of Priestley-space morphisms (dualization is a 2-functor) and hence to composition of site morphisms. 2-cells of hyperdoctrine morphisms lift by naturality of the dualization. $\square$

## Note on direction reversal

The site morphism $\Phi^*$ runs in the *opposite* direction to $\Phi$: a hyperdoctrine morphism $\mathcal{E}_1 \to \mathcal{E}_2$ produces a site morphism $(\mathbf{T}^*_2, J_2) \to (\mathbf{T}^*_1, J_1)$, by the same variance flip that takes algebra-side morphisms to spectrum-side morphisms in Stone-style dualities.
