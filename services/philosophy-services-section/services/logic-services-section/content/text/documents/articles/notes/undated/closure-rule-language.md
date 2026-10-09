---
name: closure-rule-language
description: "The formal language in which closure-rules are written. First-order, positive in cell values, single ∀-block over entities, with primitives inherited from the parameter base (L, C, E, λ)."
depends-on: [closure-rule, predication-fiber-algebra, predicate-category, entity-set, knowledge-order, residuated-lattice]
derives-from: docs/dev/scraps/closure-rule-language.md
title: closure-rule-language
---

# Closure-rule language

The formal language in which closure-rules are written: **first-order, positive in the cell values, single `∀`-block over entities**, with primitives inherited from the parameter base `(L, C, E, λ)`.

## Atomic formulas

Two kinds of atom appear in antecedents:

**1. Cell atoms** — `v(q)(s_1, s_2) ≥_k V` for `q ∈ C`, entity terms `s_1, s_2`, and a value `V ∈ L^⋈` in the predication-fiber-algebra. The atom asserts a `≥_k`-lower-bound on the cell value at `(s_1, s_2, q)`.

**2. Signature atoms** — literals in the inherited signature:

- From `E`: whatever relations the entity set carries (e.g., `<` when `E` is well-ordered; equality with constants `c ∈ E`).
- From `C`: the four-generator structure (specialization, converse, subject- and object-projection class membership).
- From `L`: residuated-lattice relations on values.

## Antecedent shape

A **positive Boolean combination** (conjunction and disjunction; no negation) of atoms, optionally preceded by a **single block** `∀x_1 ⋯ ∀x_n` of universal quantifiers over entity variables.

The positivity constraint is what keeps closure operators monotone in `≤_k`. The single-`∀`-block constraint controls quantifier depth — it is what distinguishes regime classes.

## Language fragments and regime classes

The **fragment** of this language used in a closure-rule-system determines the regime class of the generated closure operator:

- **Finite-only atoms** (`n = 0`, no `∀` block) → strict regime (`κ < ω`).
- **Finite `∀` block over finite-content** → Scott-continuous (`κ = ω`).
- **`∀` over infinite `E`** → transfinite-bounded (`ω < κ < ω₁`).
- **`∀` plus infinitary connectives** → aperiodic (`κ ≥ ω₁`).

The four-regime tower IS the stratification of the closure-rule-language by quantifier and connective complexity.

## Position

`scott-continuous-posit-category/hacking/library/closure-rule-language/`. Placed at positing tier as the language in which posits (closure-rules) are written. The fragment that lives here cleanly is the Scott-continuous fragment; higher fragments belong at higher regime categories.

## Derivation source

Adapted from `predication-categories/concepts/closure-rule-language.md`, preserved at `docs/dev/scraps/closure-rule-language.md`.
