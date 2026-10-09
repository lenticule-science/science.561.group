---
name: twist-modal-translation
description: "To each formula φ in the modal language over L^⋈, the translation ν(φ) = (ν_1(φ), ν_2(φ)) assigns a pair of classical-bimodal-language formulas, where ν_1 extracts the positive-evidence component and ν_2 the negative-evidence component. Recursively defined for modal connectives."
kind: translation
symbol: "ν"
source-language: modal language over L^⋈ (bilattice-modal)
target-language: pair of classical bimodal-language formulas
defined-componentwise-as: "ν(φ) = (ν_1(φ), ν_2(φ))"
component-meanings:
  ν_1: extracts positive-evidence component
  ν_2: extracts negative-evidence component
depends-on: [twist-product, four-bilattice, bilattice-accessibility-relation, evidence]
derives-from: docs/dev/scraps/twist-modal-translation.md
---

# Twist modal translation

To each formula `φ` in the **modal language over `L^⋈`**, assign a pair

$$\nu(\phi) \;=\; \bigl(\nu_1(\phi),\, \nu_2(\phi)\bigr)$$

of classical-bimodal-language formulas, where `ν_1` extracts the positive-evidence component and `ν_2` extracts the negative-evidence component.

## Recursive definition

For atomic formulas, the translation reads off the twist-product coordinates:

- `ν(p)(w) := (p_+(w), p_-(w))` — for atomic predicate `p` at world `w`, the positive and negative components.

For Boolean connectives:

- `ν(φ ∧ ψ)`: pointwise conjunction in classical bimodal sense — `(ν_1(φ) ∧ ν_1(ψ), ν_2(φ) ∨ ν_2(ψ))` (positive evidence accumulates by `∧`; negative by `∨`).
- `ν(φ ∨ ψ)`: dual to `∧`.

For modal connectives (necessity `□_R`, possibility `♢_R`):

- `ν(□_R φ) := (□^cl_{R_+} ν_1(φ), ♢^cl_{R_-} ν_2(φ))` — necessity translates to classical necessity on the positive side, possibility on the negative side.
- `ν(♢_R φ) := (♢^cl_{R_+} ν_1(φ), □^cl_{R_-} ν_2(φ))` — dual.

Here `R_+` and `R_-` are the positive and negative components of the bilattice-accessibility-relation `R`, treated as classical Kripke accessibility relations.

For negation:

- `ν(~φ) := (ν_2(φ), ν_1(φ))` — negation swaps positive and negative.

## What the translation accomplishes

The translation **reduces bilattice-modal reasoning to classical-bimodal reasoning**. Reasoning in `L^⋈` (with its four-valued logic and bilattice modal operators) is delegated to two parallel classical modal reasoners — one for positive, one for negative.

This means:

- **Classical proof tools apply**: SAT solvers, modal-logic tableaux, classical-completeness theorems all work on `ν_1` and `ν_2` separately.
- **Bilattice-specific facts are derived classically**: the bilattice's structural facts about `t`, `f`, `⊥`, `⊤` correspond to classical facts about `(p_+, p_-)`-pair combinations.

## Worked example: `□_R` on a contradiction-cell

Take an atomic formula `p` with `p(w) = ⊤` at some world `w` (both positive and negative evidence). Then `ν(p)(w) = (1, 1)` (positive: `p_+(w) = 1`; negative: `p_-(w) = 1`).

For `□_R p`: 

- `ν_1(□_R p)(w) = □^cl_{R_+} p_+ (w)` = "in every `R_+`-accessible world, `p_+` holds." Since `p_+(w) = 1`, this can hold across the modal frame.
- `ν_2(□_R p)(w) = ♢^cl_{R_-} p_-(w)` = "in some `R_-`-accessible world, `p_-` holds." Since `p_-(w) = 1`, this holds at `w` itself.

So `□_R p` at this world translates to a positive-necessity that has classical content, plus a negative-possibility that records the negative evidence.

## Position

`transfinite-predication-category/hacking/library/twist-modal-translation/`. Predicating tier — the translation that reduces bilattice-modal reasoning to classical-bimodal reasoning, defined on the twist-product modal language.

## Derivation source

Adapted from `predication-categories/objects/twist-modal-translation.md`, preserved at `docs/dev/scraps/`.
