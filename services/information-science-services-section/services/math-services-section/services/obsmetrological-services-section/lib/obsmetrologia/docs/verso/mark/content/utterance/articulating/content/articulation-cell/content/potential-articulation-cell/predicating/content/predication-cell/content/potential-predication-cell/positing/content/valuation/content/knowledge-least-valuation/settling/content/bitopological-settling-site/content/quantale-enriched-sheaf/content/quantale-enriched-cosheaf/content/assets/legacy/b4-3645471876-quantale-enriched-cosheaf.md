---
name: quantale-enriched-cosheaf
kind: cosheaf
description: "The cosheaf-dual of a Q-enriched sheaf on a Grothendieck site. A covariant functor F̌: T → Q-Cat_cwl satisfying the dual descent condition (coequalizer instead of equalizer). Connected to the sheaf side via Q-enriched Curry equivalence under appropriate hypotheses."
symbol: "F̌"
on-site: "Grothendieck site (T, J)"
valued-in: "Q-Cat_cwl"
variance: covariant (sheaves are contravariant)
descent-condition: coequalizer (sheaves use equalizer)
related-by-curry-equivalence: quantale-enriched-sheaf
minted-from: theorem-context — referenced by q-enriched-curry-finite-graph, q-enriched-curry-cw-complex, q-enriched-curry-transfinite-cw, q-enriched-curry-grothendieck-site, lawvere-laplacian-grothendieck-sites, and many cosheaf-related references with no own archive scrap.
---

# Q-enriched cosheaf on a Grothendieck site

The **cosheaf-dual** of a Q-enriched sheaf. A covariant functor

$$\check{\mathcal{F}} \;:\; \mathbf{T} \to \mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$$

satisfying the **dual descent condition** (coequalizer instead of equalizer):

$$\coprod_{i, j} \check{\mathcal{F}}(\sigma_i \times_\sigma \sigma_j) \;\rightrightarrows\; \coprod_i \check{\mathcal{F}}(\sigma_i) \to \check{\mathcal{F}}(\sigma)$$

is a coequalizer in `Q-Cat_cwl` for every cover `{σ_i → σ}_i`.

## Why cosheaves matter

The dual to sheaves serves two structural purposes:

**1. Homology side.** Sheaf cohomology computes `H^n(F)`; cosheaf homology computes `H_n(F̌)`. Many substrate invariants admit both presentations (Verdier-dual on the bitopological-settling-site), and the cosheaf side is often computationally more accessible.

**2. Curry-equivalence partner.** Cellular sheaves and cellular cosheaves on a regular CW complex are **equivalent categories** under the **Curry equivalence**:

$$\mathbf{Sh}_{\mathrm{Q}}(X) \;\simeq\; \mathbf{coSh}_{\mathrm{Q}}(X)$$

The equivalence sends a sheaf `F` to its **stalk-cosheaf** `F̌` defined by `F̌(σ) := F(σ)` with reversed restrictions (restrictions become extensions). The equivalence is the substrate's foundation for treating sheaf-side and cosheaf-side computations as interchangeable.

## Curry equivalence chain

The substrate's Q-enriched Curry equivalence is established in a sequence of increasingly general theorems (Q-enriched-curry-finite-graph, cw-complex, transfinite-cw, grothendieck-site, all placed at this category's docs/dev/theorems/):

| Theorem | Domain |
|---|---|
| q-enriched-curry-2-cell | 2-cell base case (foundational, no scrap) |
| q-enriched-curry-2-cell-fuzzy | fuzzy 2-cell (foundational, no scrap) |
| q-enriched-curry-finite-graph | arbitrary finite graphs |
| q-enriched-curry-2-dim-degree-0 | 2-dim degree-0 case (foundational, no scrap) |
| q-enriched-curry-cw-complex | general regular CW complexes |
| q-enriched-curry-transfinite-cw | transfinite cell complexes (ω₁-cofinal) |
| q-enriched-curry-grothendieck-site | Grothendieck sites with cellular fibers (bitopological-settling-site) |

Each theorem extends the prior one, building up to a Curry equivalence on the substrate's actual operating setting.

## Cellular cosheaves vs sheaves

For a regular CW complex `X` with cell set `Σ`:

| Structure | Per-cell | Restrictions |
|---|---|---|
| **Sheaf** F | `F(σ) ∈ Q-Cat_cwl` | `F(σ) → F(σ')` for `σ' ⊂ σ` (face going UP) |
| **Cosheaf** F̌ | `F̌(σ) ∈ Q-Cat_cwl` | `F̌(σ') → F̌(σ)` for `σ' ⊂ σ` (face going DOWN) |

Same per-cell data, opposite direction of restrictions. Curry equivalence identifies the two structures.

## Position

`finite-settlement-algebra/hacking/library/quantale-enriched-sheaf/library/quantale-enriched-cosheaf/`. Settling tier — sibling of `quantale-enriched-sheaf` (the contravariant version). Placed inside the sheaf's `library/` since the cosheaf is the Curry-dual of the sheaf — same Q-enriched data, opposite variance.

## Derivation source

**Minted from theorem context.** Referenced by every theorem in the Q-enriched Curry chain (q-enriched-curry-finite-graph, cw-complex, transfinite-cw, grothendieck-site), by lawvere-laplacian-grothendieck-sites, by Verdier-duality references, with no own archive scrap. Reconstructed from those references plus standard cellular-cosheaf theory.
