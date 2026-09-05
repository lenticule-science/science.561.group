---
name: q-enriched-sheaf-tensor
description: "The tensor product of Q-enriched sheaves on a Grothendieck site: pointwise tensor of stalks in Q-Cat_cwl followed by sheafification. With internal Hom gives Q-enriched sheaf category a closed symmetric monoidal structure — the monoidal piece of the six-functor package for settling cohomology."
kind: monoidal-product
symbol: "F ⊗ G"
on-site: "Grothendieck site (T, J)"
defined-as: "sheafification of pointwise tensor F(σ) ⊗_Q G(σ)"
right-adjoint: q-enriched-sheaf-hom
depends-on: [quantale-enriched-sheaf, bitopological-settling-site]
derives-from: docs/dev/scraps/q-enriched-sheaf-tensor.md
---

# Q-enriched sheaf tensor product

The **tensor product of Q-enriched sheaves** `F ⊗ G` on a Grothendieck site `(T, J)` — the pointwise tensor of stalks in `Q-Cat_cwl` followed by sheafification.

Together with the internal Hom, this gives the Q-enriched sheaf category a **closed symmetric monoidal structure** — the monoidal piece of the six-functor package for settling-cohomology.

## Construction

Fix a commutative unital quantale `Q` and a Grothendieck site `(T, J)`. The category `Q-Cat_cwl` of complete weighted lattices and Q-functors is symmetric monoidal closed (Stubbe 2005), with tensor product `⊗_Q`.

For Q-enriched presheaves `F, G : T^op → Q-Cat_cwl`, the **pointwise tensor presheaf** `F ⊗_p G` is defined cell-wise:

$$(F \otimes_{\mathrm{p}} G)(\sigma) \;:=\; F(\sigma) \otimes_{\mathsf{Q}} G(\sigma) \qquad \text{for each } \sigma \in \mathbf{T}.$$

The restriction maps act componentwise: for `f: σ' → σ`, `(F ⊗_p G)(f) = F(f) ⊗ G(f)`.

## Sheafification

The pointwise tensor `F ⊗_p G` is a presheaf but not necessarily a sheaf — it may fail descent. The **Q-enriched sheaf tensor** `F ⊗ G` is the sheafification:

$$F \otimes G \;:=\; \mathrm{Sheafify}(F \otimes_{\mathrm{p}} G).$$

Sheafification is the left adjoint to the inclusion `Q-EnrichedSheaves ↪ Q-EnrichedPresheaves`. For Q-enriched presheaves, sheafification exists (the inclusion is reflective by standard categorical-logic arguments).

## Closed monoidal structure

`F ⊗ G` is the **left adjoint** to internal Hom (sibling $thing `q-enriched-sheaf-hom`):

$$\mathrm{Hom}(F \otimes G, H) \;\cong\; \mathrm{Hom}(F, \mathcal{H}\!om(G, H)).$$

This is the closed-monoidal-category adjunction. With `⊗` and `Hom`, the Q-enriched sheaf category becomes **closed symmetric monoidal**.

## Why this matters for settling cohomology

The closed-monoidal structure on Q-enriched sheaves is what supports:

- **Cup products** in cohomology — `H^p(F) ⊗ H^q(G) → H^{p+q}(F ⊗ G)`.
- **Sheaf-Hom complexes** — computing `RHom(F, G)` and its cohomology.
- **Six-functor formalism** — the substrate's cohomological framework #4 (Lawvere-Laplacian on Grothendieck site) uses this monoidal structure as its operational foundation.

Without `⊗`, the cohomology lacks multiplicative structure; pairings between cohomology classes don't exist.

## Position

`finite-settlement-algebra/hacking/library/q-enriched-sheaf-tensor/`. Settling tier — the monoidal piece of the Q-enriched sheaf category's six-functor structure.

## Derivation source

Adapted from `predication-categories/objects/q-enriched-sheaf-tensor.md`, preserved at `docs/dev/scraps/`.
