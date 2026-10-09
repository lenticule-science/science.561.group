---
name: closure-ordinal
description: "For a settling endofunctor F_U starting from initial state E_0, the least ordinal τ such that F_U^(τ+1)(E_0) = F_U^τ(E_0). The ordinal at which settling reaches quiescence; the parameter that stratifies the four-regime tower into one band per primitive morphism."
symbol: "κ"
depends-on: [settling-endofunctor, settlement]
derives-from: docs/dev/scraps/closure-ordinal.md
---

# Closure-ordinal

For a settling-endofunctor `F_U` starting from initial state `E_0`, the **closure-ordinal**

$$\kappa(F_U, \mathcal{E}_0) \;:=\; \min\bigl\{\, \tau \,:\, F_U^{\tau+1}(\mathcal{E}_0) = F_U^\tau(\mathcal{E}_0) \,\bigr\}$$

is the least ordinal at which the orbit `(F_U^τ(E_0))_τ` reaches a fixed point of `F_U`. If no such ordinal exists in the ambient universe, `κ = ∞`.

The closure-ordinal is the **structural rank** of the orbit: it counts how much transfinite iteration the orbit takes to quiesce. Once `τ ≥ κ`, the orbit is constant — `F_U` has nothing more to add.

## Existence: Knaster–Tarski bound

For a fixed ambient universe, the closure-ordinal is bounded above by the successor cardinal of the 2-category's object class:

$$\kappa(F_U, \mathcal{E}_0) \;\leq\; |\mathbf{PrFib}|^+.$$

This follows from Knaster–Tarski (monotone operators on complete lattices have least fixed points) plus transfinite induction. The orbit is `≤_k`-monotone in `≤_k` (by settling-monotonicity), the ambient 2-category is bounded, and a monotone map on a bounded poset must stabilize at some ordinal `≤` the poset's height.

So the closure-ordinal exists for any settling-endofunctor on a bounded substrate. The interesting question is not "does `κ` exist?" but "where does `κ` land in the four-regime tower?"

## The four-regime tower IS the closure-ordinal stratification

The four-regime tower IS the four bands of closure-ordinals, one per primitive morphism:

| Morphism | Generated category | Closure-ordinal band |
|---|---|---|
| articulating | aperiodic-articulation-category | `κ ≥ ω₁` |
| predicating | transfinite-predication-category | `ω < κ < ω₁` |
| positing | scott-continuous-posit-category | `κ = ω` |
| settling | finite-settlement-algebra | `κ < ω` |

Each closure-ordinal lands in exactly one band. The bands are disjoint and exhaustive (every ordinal is either strict-finite, `ω`, strict-transfinite-bounded, or `≥ ω₁`).

So the four regimes are not just metaphorical naming — they are precisely the four bands of closure-ordinals that the four morphisms naturally produce. The stratification is exhaustive: every settling produces exactly one band's closure-ordinal, and the regime label IS the band.

## Determining `κ` from the closure-rule-language

The closure-rule-language fragment used by the closure-rule-system determines the **band of `κ`** the orbit lands in:

| Rule-language fragment | Closure-ordinal `κ` |
|---|---|
| finite-only atoms, no `∀`-block | `κ < ω` |
| finite `∀`-block over finite content | `κ = ω` |
| `∀` over infinite `E` | `ω < κ < ω₁` |
| `∀` + infinitary connectives | `κ ≥ ω₁` |

So one can read off the regime BEFORE running the orbit: the fragment of the language used by the closure-rule-system fixes which band `κ` falls into. The exact value of `κ` within the band depends on the specific rules and increments, but the band is determined by the language fragment.

## Operational consequences of regime band

**Strict-finite (`κ < ω`)**: the orbit is computable in finitely many steps. Closure can be implemented as a fixed-point loop that terminates. Most real-time substrate work lives here.

**Scott-continuous (`κ = ω`)**: the orbit takes `ω` steps but each step is finite. Closure is computable as a streaming process: produce step `n` for any specific `n`, and the limit value `v_ω` is the directed-join of all `v_n`. Distributed implementations (CRDTs) live here.

**Transfinite-bounded (`ω < κ < ω₁`)**: the orbit takes some countable ordinal of steps. Concrete computation requires explicit ordinal arithmetic. Theorems about the orbit can be stated but step-by-step simulation eventually outruns any specific timeline.

**Aperiodic (`κ ≥ ω₁`)**: no countable computation reaches `κ`. The orbit is only ever known by its first countable prefix; cohomological invariants (Priestley dual + sheaves) become the operational way to characterize the orbit's content.

## Relation to settling-bound

The settling-bound `λ` is the typed cap on the orbit's index. The closure-ordinal `κ` is where the orbit naturally quiesces. The relation:

- `κ < λ`: orbit quiesces well inside the bound; the settlement object captures the full settled orbit.
- `κ = λ`: orbit quiesces exactly at the bound.
- `κ > λ`: orbit hits the bound without quiescing; the settlement object captures only a *truncation* of the natural orbit.

For application work: pick `λ ≥ κ`. For aperiodic work where `κ ≥ ω₁` and no settable `λ` is bigger: pick `λ = ω₁` and treat the orbit as partially-observed.

## Worked example: closure-ordinals of concrete orbits

**`κ = 0`**: `E_0` is already a fixed point of `F_U`. The orbit is constant `E_0, E_0, E_0, …`. Trivial settlement.

**`κ = 1`**: `F_U(E_0) ≠ E_0` but `F_U^2(E_0) = F_U(E_0)`. The orbit quiesces after one application. Example: a single closure-rule fires once on the initial state and produces a state that no rules further apply to.

**`κ = n < ω`**: `F_U^n(E_0)` is the first fixed point in the orbit. Example: a chain of `n` rules each firing once.

**`κ = ω`**: every finite step produces non-trivial new content, but the directed-join at the `ω`-limit is a fixed point. Example: `F_U` adds one cell per step; after `ω` steps all relevant cells are saturated.

**`κ = ω + 1`**: the `ω`-limit is not a fixed point — applying `F_U` once more is non-trivial — but the next step quiesces. Example: a rule that fires only on the `ω`-limit's content, producing one more change before stability.

## Position

`finite-settlement-algebra/hacking/library/closure-ordinal/`. Settling tier — closure-ordinals are most operationally relevant in the strict-finite regime where the orbit can be fully run. The concept is transverse to all four regimes (every regime has closure-ordinals in its band), but its operational locus is settling.

## Derivation source

Adapted from `predication-categories/objects/closure-ordinal.md`, preserved at `docs/dev/scraps/`. The archive frontmatter declares `depends-on: [settling-endofunctor, settlement, settling-coalgebra-structure]`; the third dependency (settling-coalgebra-structure) is a downstream archive item not yet pulled.
