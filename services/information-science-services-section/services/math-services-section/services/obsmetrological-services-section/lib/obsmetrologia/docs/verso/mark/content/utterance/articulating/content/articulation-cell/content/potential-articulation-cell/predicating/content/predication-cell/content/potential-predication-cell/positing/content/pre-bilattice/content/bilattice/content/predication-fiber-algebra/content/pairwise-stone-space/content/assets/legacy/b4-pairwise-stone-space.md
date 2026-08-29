---
name: pairwise-stone-space
description: "A space X equipped with TWO compact-Hausdorff Stone-like topologies (τ_+, τ_-) treated symmetrically. The bitopological framing is mathematically equivalent to the Priestley framing (bitopological-stone-duality theorem) but treats the two topologies symmetrically — natural for sheaf constructions on paired-Priestley duals where the topologies arise from positive/negative twist-product coordinates."
kind: bitopological-space
symbol: "(X, τ_+, τ_-)"
underlying-set: X
positive-topology: τ_+
negative-topology: τ_-
clopen-condition: "pairwise-Stone clopen — clopen in the JOIN of the two topologies"
category-named: "PStone (the category of pairwise-Stone spaces with continuous-in-both-topologies maps)"
depends-on: [priestley-space, paired-priestley-space]
minted-from: theorem context — pairwise-Stone is referenced in bitopological-settling-site and bitopological-stone-duality but has no dedicated archive scrap. Content reconstructed from those references.
---

# Pairwise Stone space

A **pairwise Stone space** is a triple `(X, τ_+, τ_-)` consisting of:

- A set `X`.
- Two topologies `τ_+` and `τ_-` on `X`, each Stone-like (compact, Hausdorff, having a basis of clopens).
- A **symmetry condition** treating the two topologies on equal footing: morphisms are required to be continuous in BOTH topologies, not just one.

The category of pairwise-Stone spaces is denoted `PStone`. Morphisms `f: (X, τ_+^X, τ_-^X) → (Y, τ_+^Y, τ_-^Y)` are functions continuous as maps `(X, τ_+^X) → (Y, τ_+^Y)` AND `(X, τ_-^X) → (Y, τ_-^Y)`.

## Pairwise-Stone clopens

A **pairwise-Stone clopen** is a subset `U ⊆ X` that is clopen in the **join** of the two topologies `τ_+ ∨ τ_-` — equivalently, simultaneously clopen in both `τ_+` and `τ_-`.

Pairwise-Stone clopens form a **Boolean algebra** under `∪` and `∩` — they are the natural "two-sided clopen sets" of the pairwise-Stone topology.

## Bitopological Stone duality

By the **bitopological-Stone-duality** theorem (see sibling at `priestley-space/docs/dev/theorems/bitopological-stone-duality.md`):

$$\mathbf{PStone} \;\cong\; \mathbf{Spec} \;\cong\; \mathbf{Pries}.$$

The categories of pairwise-Stone spaces, spectral spaces, and Priestley spaces are categorically isomorphic. So `PStone` and `Pries` are the **same category presented two ways**:

- `Pries` presentation: a Priestley space `(X, τ, ≤)` with one topology and one order.
- `PStone` presentation: a pairwise-Stone space `(X, τ_+, τ_-)` with two topologies, no explicit order.

The Priestley order `≤` corresponds to the specialization relation `x ≤ y ⟺ {x's τ_+-neighborhoods} ⊆ {y's τ_+-neighborhoods}` (or equivalently the dual via `τ_-`).

## Why pairwise-Stone is the natural framing for the substrate

The substrate's paired-Priestley-dual representations of bilattice-valued cells have **two coordinates** — positive evidence and negative evidence — that come with their own natural topologies. The Priestley framing forces a choice: one topology, one order. The pairwise-Stone framing treats the two coordinates **symmetrically**.

For sheaf-theoretic constructions on these duals:

- **Covers** can be specified pairwise-open without privileging positive or negative.
- **Predicate-generator dualization** (specialization, converse, subject- and object-projection) acts symmetrically on both topologies — pairwise-Stone naturally accommodates this.
- **Cohomology** computations use pairwise-Stone clopens as their cover-building blocks, matching the substrate's bilattice-symmetric design.

So while `PStone ≅ Pries` mathematically, the pairwise-Stone presentation is **operationally preferred** by the substrate's symmetric design.

## Distinguished example: dual of FOUR

For `L = 2`, the paired-Priestley dual of `FOUR` is the two-point space `{+, -}`. In pairwise-Stone form:

- `X = {+, -}`.
- `τ_+`: the discrete topology (the two singletons are open).
- `τ_-`: also discrete.
- Pairwise-Stone clopens: all four subsets `∅, {+}, {-}, {+, -}` — the four-element Boolean algebra.

This matches the structure of FOUR's clopen lattice: `⊥` corresponds to `{+, -}` (told nothing — both points unrestricted), `t` to `{+}` (positive only), `f` to `{-}` (negative only), `⊤` to `∅` (told both — no point survives).

## Use in the bitopological-settling-site

The bitopological-settling-site uses pairwise-Stone clopens of `Spec(A_q)` as its site-object's clopen data: triples `(q, τ, U)` with `U` a pairwise-Stone clopen in `X_q^τ`. The covering condition is pairwise-Stone covers: `U = U_1 ∪ ⋯ ∪ U_n` jointly covers in the pairwise-Stone topology.

The site axioms (proved in `bitopological-settling-site-axioms`, placed at `bitopological-settling-site/docs/dev/theorems/`) rely on pairwise-Stone covers being closed under intersection and being preserved under base-change — properties pairwise-Stone clopens have because they're a Boolean algebra.

## Position

`finite-settlement-algebra/hacking/library/pairwise-stone-space/`. Settling tier — sibling of `priestley-space` (equivalent presentation) and `paired-priestley-space` (the order-enriched analogue).

## Derivation source

**Minted from theorem context**, not from a dedicated archive scrap. The archive references pairwise-Stone in `bitopological-settling-site` (as the framing for site-object clopens), in `bitopological-stone-duality` (the theorem identifying `PStone ≅ Pries`), and implicitly in several other places. Content here is reconstructed from those references plus standard pairwise-Stone topology (Bezhanishvili et al. 2010).
