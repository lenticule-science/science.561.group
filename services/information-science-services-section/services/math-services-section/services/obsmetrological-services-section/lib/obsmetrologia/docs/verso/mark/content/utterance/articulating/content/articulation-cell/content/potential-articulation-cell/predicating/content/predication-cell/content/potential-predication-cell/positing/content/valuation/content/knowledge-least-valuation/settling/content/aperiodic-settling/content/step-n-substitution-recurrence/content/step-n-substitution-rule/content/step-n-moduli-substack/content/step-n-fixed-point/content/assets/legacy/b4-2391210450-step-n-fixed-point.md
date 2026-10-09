---
name: step-n-fixed-point
description: "The colimit of the ascending chain M^(2) → M^(3) → ... under the step-shift morphism. The corpus's candidate renormalization-group fixed point at infinite step depth — a 2-stack whose objects are step-∞ substitution rules with unbounded recurrence depth."
kind: stack-colimit
symbol: "M^(∞)"
defined-as: "M^(∞) := colim_{n → ∞} M^(n)"
depends-on: [settlement, cohomological-equivalence]
derives-from: docs/dev/scraps/step-n-fixed-point.md
---

# Step-n fixed-point object

The **colimit** of the ascending chain `M^(2) → M^(3) → ⋯` of step-n moduli substacks under the step-shift morphism. The corpus's candidate **renormalization-group fixed point** at infinite step depth.

## Definition

By the step-shift functoriality theorem, the family `{M^(n)}_{n ≥ 2}` of step-n moduli substacks with step-shift `σ`-morphisms forms an ascending chain in the 2-category of stacks. The colimit:

$$\mathscr{M}^{(\infty)} \;:=\; \mathrm{colim}_{n \to \infty}\, \mathscr{M}^{(n)}$$

is a **2-stack** whose objects are equivalence classes of **"step-∞ substitution rules"** — closure-rules whose recurrence depth is unbounded.

## What "step-n" means

A **step-n substitution rule** is a closure-rule whose firing pattern repeats with a substitution depth of `n`. Concretely:

- **Step-2 rule**: the rule fires in cycles of length 2 — apply it, the state changes, apply it again, the state changes back (or to a periodic-2 pattern).
- **Step-3 rule**: cycles of length 3.
- **Step-n rule**: cycles of length `n`.

For each `n`, the moduli substack `M^(n)` parameterizes step-n substitution rules up to MLD-equivalence. The **step-shift morphism** `σ: M^(n) → M^(n+1)` embeds step-n rules into step-(n+1) rules (a step-n rule is trivially a step-(n+1) rule by adding one degenerate level).

## Why the colimit is a "renormalization-group fixed point"

In renormalization-group language: the step-shift `σ: M^(n) → M^(n+1)` is a **scaling operation** — it scales the substitution depth by one. The colimit `M^(∞)` is the **fixed point of repeated scaling** — the stack of substitution rules invariant under arbitrary step-shifts.

Operationally: a substitution rule in `M^(∞)` cannot be reduced to a step-n rule for any finite `n` — its recurrence depth is unbounded. These are the **genuinely aperiodic** substitution rules, the ones whose substitution patterns don't reduce to finite-depth cycles.

## Aperiodic-regime classification

The fixed-point object `M^(∞)` plays a structural role in the aperiodic-regime classification:

- **Strict-finite regime** substitution rules: finite-depth, in some `M^(n)` for small `n`.
- **Scott-continuous regime**: step-`ω` rules — closure-ordinal `κ = ω` corresponds to step-depth that quiesces at level `ω`. Live in a specific limit-point of the chain.
- **Transfinite-bounded regime**: step-`κ` for `ω < κ < ω₁`. Higher in the chain.
- **Aperiodic regime**: step-`∞` rules, genuinely in `M^(∞)`.

The MLD-classes of aperiodic-regime settlements correspond to points of `M^(∞)`.

## Why this is settling-tier despite being articulating-relevant

The step-n moduli substacks are the **substrate's** machinery for classifying settled forms of substitution rules. The fixed-point `M^(∞)` is the colimit of these stacks. It's settling-tier because:

- The moduli structure is on **settled** rule-classes (each `M^(n)` parameterizes settled patterns).
- The 2-stack categorical machinery is part of the settling-tier cohomological/moduli apparatus.

Aperiodic-regime rules end up in `M^(∞)` (the colimit) but the stack itself is constructed at settling tier as the colimit of settling-tier moduli substacks.

## Position

`finite-settlement-algebra/hacking/library/step-n-fixed-point/`. Settling tier — the renormalization-group fixed-point stack at infinite step depth.

## Derivation source

Adapted from `predication-categories/objects/step-n-fixed-point.md`, preserved at `docs/dev/scraps/`.
