---
name: paraconsistent-settling-associated-sheaf
kind: sheaf
description: "A variant of the settling-associated-sheaf that tracks BOTH newly-t and newly-f cells (the paraconsistent extension), with no consistency/totality structure. Lies between the bare Ab-valued F_U (positive only) and the d-frame-valued F_U (both sides plus relations). Used by the regime d-frame cohomology theorems."
symbol: "F_U^(k) or F_U^par"
on-site: bitopological-settling-site
valued-in: Ab × Ab (paired Abelian-group sheaves)
relationship-to-F_U: "F_U^(k) = F_U^(+) ⊕ F_U^(-) where F_U^(+) is the standard sheaf and F_U^(-) tracks newly-f cells"
minted-from: theorem-context — referenced by 4+ regime d-frame cohomology theorems (strict, scott-continuous, transfinite-bounded, aperiodic d-frame variants) and the settling-cohomology-vanishes-above-degree-1 theorem; no own archive scrap.
---

# Paraconsistent settling-associated sheaf

A **variant** of the settling-associated-sheaf `F_U` that tracks BOTH newly-`t` cells and newly-`f` cells, without the consistency/totality relations of the d-frame-valued sheaf.

The paraconsistent sheaf sits **between** the bare and the d-frame variants:

| Sheaf | Values | What's tracked |
|---|---|---|
| `F_U` (bare) | `Ab` | newly-`t` cells only |
| `F_U^(k)` (paraconsistent) | `Ab × Ab` | newly-`t` AND newly-`f` cells separately |
| `F_U` (d-frame-valued) | `dFrm` | both sides PLUS consistency/totality relations |

## Construction

Fix a settlement `(E, c)` with increment-sequence `U`. At each site object `(q, τ, U)`:

$$\mathcal{F}_U^{(k)}(q, \tau, U) \;:=\; \mathcal{F}_U^{(+)}(q, \tau, U) \;\oplus\; \mathcal{F}_U^{(-)}(q, \tau, U),$$

where:

- **`F_U^(+)(q, τ, U) := Z⟨Δ^+_τ(q) ∩ U⟩`** — free Abelian group on newly-`t` cells (this IS the bare `F_U`).
- **`F_U^(-)(q, τ, U) := Z⟨Δ^-_τ(q) ∩ U⟩`** — free Abelian group on newly-`f` cells.

The two are **direct-summed**, not interlinked. There's no formal consistency/totality relation between them at the sheaf level — that's what the d-frame-valued sheaf adds.

## Why have both sides separately

The bare `F_U` loses information about negative-side cells (`f` and `⊤` partly). The paraconsistent sheaf captures the missing data:

- `t`-only cells: contribute to `F_U^(+)` only.
- `f`-only cells: contribute to `F_U^(-)` only.
- `⊤` cells (both): contribute to BOTH `F_U^(+)` and `F_U^(-)` at the stage where each component first appears.
- `⊥` cells: contribute to neither.

This is the **paraconsistent** structure: contradictory cells (`⊤`) get recorded as having both positive AND negative evidence, not collapsed to one side.

## Why a "Sheaf" not a "pair of sheaves"

`F_U^(k) = F_U^(+) ⊕ F_U^(-)` is a single `Ab`-valued sheaf, not literally a pair. The direct sum is taken in the abelian category `Ab`, giving an `Ab`-valued sheaf with rank `|Δ^+_τ| + |Δ^-_τ|` at each section.

This convention lets the regime d-frame cohomology theorems compute `H^n(T*, F_U^(k))` as ordinary Ab-cohomology, then apply the shadow comparison to relate to d-frame data.

## Role in regime d-frame cohomology

All four regime d-frame cohomology theorems (strict, Scott-continuous, transfinite-bounded, aperiodic) use the paraconsistent sheaf:

- `H^n_dFrm(T*, F_U)` is computed by computing `H^n(T*, F_U^(k))` (`Ab`-side) AND additionally tracking the consistency/totality structure (the d-frame side).
- The shadow comparison (`d-frame-cohomology-comparison` theorem) makes the relationship precise.

So the paraconsistent sheaf is the **`Ab`-side avatar** of the d-frame cohomology computations — the part that classical homological algebra can compute directly.

## Position

`finite-settlement-algebra/hacking/library/paraconsistent-settling-associated-sheaf/`. Settling tier — variant of the settling-associated-sheaf with paraconsistent two-side tracking.

## Derivation source

**Minted from theorem context.** Referenced by 4+ regime d-frame cohomology theorems (strict, Scott-continuous, transfinite-bounded, aperiodic) and by settling-cohomology-vanishes-above-degree-1; no own archive scrap. Content reconstructed from how those theorems use the variant.
