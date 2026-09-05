---
name: step-n-substitution-recurrence
description: "A structural parameter n ≥ 2 that recurs across multiple substrate levels — substitution-recurrence depth, substitution-alphabet size, Anderson-Putnam cohomology rank, minimal polynomial degree, rule-language fragment depth, bilattice internal structure. The corpus's internal step-n hierarchy: the same n controls all these structural quantities."
kind: structural-parameter
symbol: "n"
parameter-range: "n ≥ 2"
co-incrementing-levels:
  - "substitution recurrence depth"
  - "substitution alphabet size"
  - "Anderson-Putnam cohomology rank"
  - "minimal polynomial degree of growth rate"
  - "rule-language fragment Π_{n-1}"
  - "bilattice internal structure"
depends-on: [closure-rule-system, closure-rule-language, four-bilattice, aperiodic-classifying-invariant]
derives-from: docs/dev/scraps/step-n-substitution-recurrence.md
---

# Step-n substitution recurrence

A structural parameter `n ≥ 2` that appears throughout the substrate when looking at substitution-dynamics-flavored content. The same `n` controls multiple seemingly-independent structural quantities, which all increment together — the substrate has an internal **step-n hierarchy** that recurs across structural levels.

## The co-incrementing observation

For a substitution closure-rule of "step depth" `n`:

| Level | Quantity at step-`n` |
|---|---|
| Substitution recurrence | `n`-term recurrence (`a_k = a_{k-1} + ⋯` with `n` prior-term dependencies) |
| Substitution alphabet | `n` letters in the substitution alphabet |
| Cohomological rank (post-quotient) | rank-`n` Anderson–Putnam invariant |
| Minimal polynomial degree of growth rate | degree-`n` algebraic number (Pisot-type) |
| Rule-language fragment | `Π_{n-1}` or similar (look-back-`n` structure expressible at depth `n-1`) |
| Bilattice-structure correspondence | `n` aligns with bilattice's `n`-element internal structure (axes / non-bottom values / full values) |

The pattern: choose a step-`n` substitution; ALL six quantities increment to `n` simultaneously. This is a structural fact about how substitution-shaped settlements distribute their data.

## Worked example: step-2 substitution

The Fibonacci substitution `ω(a) = ab`, `ω(b) = a` is step-`n = 2`:

- **Recurrence**: 2-term Fibonacci (`F_k = F_{k-1} + F_{k-2}`).
- **Alphabet**: `{a, b}` — 2 letters.
- **Cohomology rank**: `Ȟ^0(Ω_ω) = Z^2` (rank 2 from the Anderson–Putnam direct limit).
- **Growth rate**: golden ratio `φ`, an algebraic number of degree 2 (root of `x² − x − 1`).
- **Rule-language fragment**: `Π_1` (one universal quantifier block looking back one step).
- **Bilattice**: FOUR has internal structure compatible with the 2-letter alphabet via the 2-axis (truth + knowledge) structure.

All six quantities equal 2. The pattern is exact for the Fibonacci case.

## Worked example: step-3 substitution

A step-3 substitution (e.g., `ω(a) = abc`, `ω(b) = ab`, `ω(c) = a`) gives:

- 3-term recurrence (Tribonacci).
- 3-letter alphabet.
- Cohomology rank 3.
- Cubic-degree growth rate (root of `x³ − x² − x − 1`).
- `Π_2` rule-language fragment.
- 3-internal-structure correspondence in the bilattice (less canonical at this stage).

All six again co-increment to 3.

## Why this matters

The co-incrementing isn't coincidence — it reflects a **structural identity** in how substitution settlements distribute their data across:

1. The CLOSURE-RULE level (alphabet size, recurrence depth).
2. The SETTLEMENT-DYNAMICS level (orbit growth rate).
3. The COHOMOLOGICAL-INVARIANT level (rank of `Ȟ^0`).
4. The RULE-LANGUAGE level (quantifier depth).

The substrate's substitution-dynamics theory has built-in coherence: choosing a step-`n` system makes ALL these choices simultaneously.

## Position

`finite-settlement-algebra/hacking/library/step-n-substitution-recurrence/`. Settling tier — structural parameter of the substitution-shaped settlement family.

## Derivation source

Adapted from `predication-categories/concepts/step-n-substitution-recurrence.md`, preserved at `docs/dev/scraps/`. The worked examples (Fibonacci as step-2, Tribonacci as step-3) are elaborations consistent with the archive's table.
