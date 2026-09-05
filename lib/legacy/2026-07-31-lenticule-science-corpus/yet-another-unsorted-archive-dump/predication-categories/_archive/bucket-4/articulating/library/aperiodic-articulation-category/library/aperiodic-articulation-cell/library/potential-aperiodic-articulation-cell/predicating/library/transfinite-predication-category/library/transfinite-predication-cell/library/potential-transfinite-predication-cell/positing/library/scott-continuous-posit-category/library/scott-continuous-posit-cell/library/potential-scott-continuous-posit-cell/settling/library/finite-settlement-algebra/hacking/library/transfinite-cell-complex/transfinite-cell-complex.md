---
name: transfinite-cell-complex
description: "A regular CW-complex-style structure with cell set indexed by a countable ordinal up to ω_1. The dimension of each individual cell is finite/countable; the transfinite content is in the cardinality and indexing of the cell set. The framework needed for the aperiodic regime of the bitopological-settling-site."
kind: cell-complex
symbol: "X"
cell-set-cardinality: "ω_1-cofinal"
individual-cell-dimension: "finite (or countable)"
directed-colimit-presentation: "X = colim_{F ⊆_fin} X|_F"
depends-on: [bitopological-settling-site, paired-priestley-space, anderson-putnam-direct-limit]
derives-from: docs/dev/scraps/transfinite-cell-complex.md
---

# Transfinite cell complex

A **transfinite cell complex** is a regular CW-complex-style structure with **cell set indexed by a countable ordinal up to `ω_1`**.

The dimension of each individual cell is finite (or countable); the transfinite content is in the **cardinality and indexing** of the cell set, not in cells of transfinite dimension.

## Why this framework is needed

The substrate's **aperiodic regime** requires this. The paired-Priestley fibers of the bitopological-settling-site at the aperiodic regime have `ω_1`-cofinal clopen lattices. The standard finite-CW Curry framework (used by Ghrist–Lopez–North–Riess 2025 for graph-cellular sheaves) doesn't directly apply.

The **transfinite extension** assembles finite sub-complexes via directed colimits — a transfinite cell complex is, by construction, expressible as

$$X \;=\; \mathrm{colim}_{F \subseteq_{\mathrm{fin}} X} X|_F,$$

the directed colimit over all finite sub-complexes.

## Definition

A **transfinite cell complex** `X` consists of:

- A **cell index set** `Σ`, indexed by a countable ordinal `≤ ω_1`. Each `σ ∈ Σ` is a cell.
- A **dimension function** `dim: Σ → N` (or `Σ → ω`). Each cell has finite (or at most countable) dimension.
- An **attaching structure**: for each cell `σ` of dimension `n`, an attaching map `∂σ → X^{n-1}` where `X^{n-1}` is the union of cells of dimension `≤ n-1`.
- **Regularity**: each attaching map is a homeomorphism onto its image.

The data is the same as a standard CW complex per-cell — what changes is the **cardinality** of the cell set.

## Directed colimit presentation

The substantive **new structural feature**: the directed colimit presentation `X = colim_{F ⊆_fin} X|_F` induces an **inverse limit on stalks** and a **directed colimit on cosheaves**.

For a Q-enriched cellular sheaf `F` on `X`:

- **Stalk at a cell `σ`**: `F(σ) = lim_{F ⊆ F'} F|_{F'}(σ)` — inverse limit over finite sub-complexes containing `σ`.
- **Cosheaf evaluation**: dual direction, directed colimit.

The Q-enriched cellular sheaf on `X` is **determined by — and uniquely reconstructible from — its restrictions to finite sub-complexes**. This is the structural fact that makes transfinite cellular sheaves tractable.

## Use in cohomological framework #3

The substrate's cohomological framework #3 uses Q-enriched cellular sheaves on the clopen lattice of paired-Priestley fibers. For the aperiodic regime, those lattices are `ω_1`-cofinal — they need transfinite cell complex structure to support cellular sheaves at all.

So this $thing is the structural foundation that makes cohomological framework #3 work in the aperiodic regime. Without it, the framework restricts to lower-regime cases only.

## Position

`finite-settlement-algebra/hacking/library/transfinite-cell-complex/`. Settling tier — the transfinite cell-complex foundation for aperiodic-regime cohomology.

## Derivation source

Adapted from `predication-categories/objects/transfinite-cell-complex.md`, preserved at `docs/dev/scraps/`.
