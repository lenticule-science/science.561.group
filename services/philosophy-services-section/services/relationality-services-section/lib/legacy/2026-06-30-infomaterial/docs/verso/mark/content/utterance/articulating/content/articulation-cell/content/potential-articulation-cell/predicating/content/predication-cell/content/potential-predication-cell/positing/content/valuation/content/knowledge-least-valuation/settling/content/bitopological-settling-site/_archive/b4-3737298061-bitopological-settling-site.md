---
name: bitopological-settling-site
description: "The Grothendieck site on which settling cohomology lives. Assembled from the dual predication-hyperdoctrine's fiberwise paired-Priestley spaces over the contravariant predicate-category and covariant settling direction. Objects: (q, τ, U) triples; morphisms: compatible base-changes plus pairwise-Stone clopen inclusions."
symbol: "(T*, J)"
depends-on: [dual-predication-hyperdoctrine, dualized-closure-2-comonad, paired-priestley-space, predicate-category, settling-bound]
derives-from: docs/dev/scraps/bitopological-settling-site.md
---

# Bitopological settling site

The Grothendieck **site on which the settling cohomology lives**. Assembled from the dual predication-hyperdoctrine's fiberwise paired Priestley spaces, indexed by the contravariant predicate-category direction and the covariant settling direction.

## Underlying category `T*_site`

Fix a predication-hyperdoctrine `E` over `(L, C, E)` with settling-bound `λ` and increment-sequence `U = (u_τ)_{τ<λ}`. Write

$$X_q^\tau \;:=\; \mathrm{Spec}(A_q)$$

for the paired Priestley space associated to the predication-fiber-algebra at settling stage `τ`.

The site uses the **pairwise-Stone framing** of the bitopological structure on `X_q^τ`. A pairwise-Stone clopen is a subset `U ⊆ X_q^τ` that is clopen in the join of the `+`- and `−`-component topologies. Pairwise-Stone clopens form a Boolean algebra (bitopological Stone duality: `PStone ≅ Pries`).

**Objects** of `T*_site`: triples

$$(q,\, \tau,\, U)$$

with `q ∈ C^op`, `τ < λ` an ordinal, and `U` a pairwise-Stone clopen in `X_q^τ`.

**Morphisms** `(q', τ', U') → (q, τ, U)`: triples `(f, h, j)` where:

- `f: q → q'` is a `C`-morphism (a predicate-category morphism, contravariant direction).
- `h: τ → τ'` is a `λ^op`-morphism (equivalently `τ' ≥ τ`; covariant settling direction).
- `j: U' ↪ (f × h)*(U)` is an inclusion of pairwise-Stone clopens.

Here `(f × h)*: X_q^τ → X_{q'}^{τ'}` is the composite of:

1. The dualized predicate generator along `f` (from the dualized closure-2-comonad's generator-dualization table).
2. The dualized settling advancement along `h` (from the dualized temporal 2-category).

## Two index directions

The site has two index directions that operate independently:

| Direction | Indexed by | Variance |
|---|---|---|
| Predicate-axis | `C^op` (the predicate-category) | contravariant |
| Settling-axis | `λ^op` (the reversed settling-bound) | covariant in `(τ, U)`, contravariant in morphism direction |

The product structure is captured in the triple `(q, τ, U)`. Both directions are required for the cohomological framework — cohomology computes "across predicates" (via the predicate-axis) and "across time" (via the settling-axis) simultaneously.

## Coverage `J`

A morphism `{(q_i, τ_i, U_i) → (q, τ, U)}_i` is a **cover** if it satisfies the **pairwise-Stone covering condition**:

- The images of `(f_i × h_i)*(U_i)` jointly cover `U` in the pairwise-Stone topology.
- The covering is closed under intersection: a finite intersection of clopens in the cover is again in the cover.

This gives `T*_site` the structure of a Grothendieck site (small full subcategory of a topos, with a coverage).

## Why this lives at settling tier

The site is the categorical setting where **settlement cohomology is computed**. The cohomology of a settling-associated-sheaf is `H^n(T*_{≤σ}, F_U)` — derived functors of bounded global sections on the site, restricted to a bounded sub-site `T*_{≤σ}`.

The whole apparatus is settling-tier: the Priestley-side of settlements (via dual-predication-hyperdoctrine), the temporal index (via settling-bound), the sheaves (settling-associated-sheaf). Everything lives at finite-settlement-algebra/hacking/library/.

## Husainov acyclicity

The site `T*_site` satisfies **Husainov acyclicity** (archive theorem `husainov-acyclicity`): the topology has sufficiently many acyclic covers that derived functor cohomology can be computed by Čech cohomology on those covers. This is the technical input that makes settling-cohomology computable.

The acyclicity is what gives the cohomological framework its operational tractability: rather than computing derived functors abstractly, one Čech-computes on Husainov-acyclic covers.

## Position

`finite-settlement-algebra/hacking/library/bitopological-settling-site/`. Settling tier — the site on which settling-cohomology lives.

## Derivation source

Adapted from `predication-categories/objects/bitopological-settling-site.md`, preserved at `docs/dev/scraps/`.
