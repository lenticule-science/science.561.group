---
name: q-enriched-sheaf-hom
description: "The internal Hom of Q-enriched sheaves on a Grothendieck site. The sheaf-of-Q-functors-from-F-to-G; right adjoint to the tensor product. With the tensor, gives the Q-enriched sheaf category a closed symmetric monoidal structure."
kind: internal-hom
symbol: "Hom(F, G)"
on-site: "Grothendieck site (T, J)"
defined-as: "sheafification of pointwise Q-functor hom Hom_{Q-Cat_cwl}(F(σ), G(σ))"
left-adjoint: q-enriched-sheaf-tensor
depends-on: [quantale-enriched-sheaf, q-enriched-sheaf-tensor, bitopological-settling-site]
derives-from: docs/dev/scraps/q-enriched-sheaf-hom.md
---

# Q-enriched sheaf internal Hom

The **internal Hom of Q-enriched sheaves** `Hom(F, G)` on a Grothendieck site `(T, J)` — the sheaf-of-Q-functors-from-`F`-to-`G`, right adjoint to the tensor product.

Together with the tensor, this gives the Q-enriched sheaf category a closed symmetric monoidal structure.

## Definition

For Q-enriched presheaves `F, G : T^op → Q-Cat_cwl`, the **internal Hom presheaf** `Hom_p(F, G)` is defined cell-wise:

$$\mathcal{H}\!om_{\mathrm{p}}(F, G)(\sigma) \;:=\; \mathrm{hom}_{\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}}\bigl(F(\sigma),\, G(\sigma)\bigr) \qquad \text{for each } \sigma \in \mathbf{T}.$$

The presheaf-Hom is the pointwise Q-functor hom-object. Restriction maps act by precomposition: for `f: σ' → σ`, `Hom_p(F, G)(f)(φ) := G(f) ∘ φ ∘ F(f)^{-1}` (the standard internal-hom transposition).

## Sheafification

The pointwise internal Hom `Hom_p(F, G)` is a presheaf; sheafification gives the **Q-enriched sheaf internal Hom**:

$$\mathcal{H}\!om(F, G) \;:=\; \mathrm{Sheafify}(\mathcal{H}\!om_{\mathrm{p}}(F, G)).$$

Sheafification of internal-Hom presheaves exists (Q-enriched sheaves form a reflective subcategory of presheaves).

## Closed monoidal adjunction

The **adjunction** with the tensor product (sibling $thing `q-enriched-sheaf-tensor`):

$$\mathrm{Hom}(F \otimes G, H) \;\cong\; \mathrm{Hom}(F, \mathcal{H}\!om(G, H)).$$

This is the defining property of internal Hom in a closed monoidal category. The hom-set on the left (morphisms in the Q-enriched sheaf category from `F ⊗ G` to `H`) corresponds naturally to the hom-set on the right (morphisms from `F` to the internal Hom from `G` to `H`).

## What internal Hom enables

The internal Hom is structurally important for:

- **`RHom`-complexes** — `RHom(F, G)` for derived-category cohomology computations.
- **Duality** — `F^∨ := Hom(F, 1_Q)` is the **dual sheaf**; under appropriate conditions, `F^{∨∨} ≅ F` (reflexivity).
- **Cohomology with coefficients in `Hom`** — `H^n(T, Hom(F, G))` is the substrate's `Ext^n(F, G)` analogue.
- **Six-functor extensions** — pullback, pushforward, and the projection-formula isomorphisms all factor through internal Hom.

## Position

`finite-settlement-algebra/hacking/library/q-enriched-sheaf-hom/`. Settling tier — the internal Hom of the Q-enriched sheaf category, sibling of `q-enriched-sheaf-tensor`.

## Derivation source

Adapted from `predication-categories/objects/q-enriched-sheaf-hom.md`, preserved at `docs/dev/scraps/`.
