---
name: settlement
description: "The object that settling generates: over a base (L, C, E, λ), a family v = (v_τ)_{τ < λ} of predication-valuations satisfying settling-monotonicity. The orbit of a settling-endofunctor from an initial valuation. The four-object grammar names this object 'settlement' — archive vocabulary 'predication-settling' conflates regimes."
symbol: "(v_τ)_{τ<λ}"
realizes: [settling-monotonicity, settling-continuity, settling-quiescence, evidence, knowledge-order, truth-order]
depends-on: [predication-valuation, settling-monotonicity, settling-bound, residuated-lattice, predicate-category, entity-set]
derives-from: docs/dev/scraps/predication-settling.md
---

# Settlement

Fix a base `(L, C, E, λ)` — a residuated lattice `L`, a predicate-category `C`, an entity set `E`, and a settling-bound `λ` (an ordinal).

A **settlement** over `(L, C, E, λ)` is a family

$$v \;=\; (v_\tau)_{\tau < \lambda}$$

in which each `v_τ` is a predication-valuation (a function assigning to each predicate `p` a value `v_τ(p) ∈ A_p` in the predication-fiber-algebra), and the family satisfies the **settling-monotonicity** condition: for all `σ ≤ τ < λ` and every `p`,

$$v_\sigma(p) \;\leq_k\; v_\tau(p)$$

pointwise in `A_p`.

## What it IS

A settlement is the **orbit** of a settling-endofunctor `F_U` starting from some initial valuation `v_0`:

$$v \;=\; \bigl(F_U^\tau(v_0)\bigr)_{\tau < \lambda}.$$

At each successor step, `F_U` applies the closure-2-monad (saturating under derivable consequences) and then merges in the next external evidence from the increment-sequence `(u_τ)_{τ<λ}`. At each limit step (when settling is continuous), the value is the directed knowledge-order join of values at preceding steps.

The settlement therefore packages four pieces of structure into one indexed family:

1. The initial valuation `v_0`.
2. The closure-operator `cl = (cl_p)_p` driving inflation.
3. The increment-sequence `(u_τ)_τ` driving external evidence injection.
4. The settling-bound `λ` capping the index.

## Why "settlement" — terminology correction

The archive vocabulary was `predication-settling`. That name conflates two distinct regimes: "predication" (the object at predicating tier — what predicating generates) and "settling" (the morphism at settling tier — what produces this object). In the four-object grammar, the orbit produced by settling is the regime-correct object **settlement**.

Each of the four primitive morphisms generates one named object at its own regime:

- articulating generates **articulation** (at aperiodic-articulation-category).
- predicating generates **predication** (at transfinite-predication-category).
- positing generates **posit** (at scott-continuous-posit-category).
- settling generates **settlement** (at finite-settlement-algebra) — this $thing.

The archive's `predication-settling` mixed an upstream object name with the downstream morphism name. Translate it to `settlement` in current grammar.

## Lives at settling tier — and only fully here

A settlement is the *settled* form of an orbit: a settling that has reached quiescence at some `τ*` and remains identical to its `τ*`-value through the rest of `λ`. In the strict-finite regime (`κ < ω`), every settlement quiesces in finitely many steps and is a finished, computable object.

In higher regimes, the *orbit shape* exists but quiescence may not be reached within the regime's ordinal bound:

- **Scott-continuous regime** (`κ = ω`): the orbit is a posit at scott-continuous-posit-category. Quiescence at ω.
- **Transfinite-bounded regime** (`ω < κ < ω₁`): the orbit is a predication at transfinite-predication-category. Quiescence at some countable ordinal.
- **Aperiodic regime** (`κ ≥ ω₁`): the orbit is an articulation at aperiodic-articulation-category. No countable quiescence; the orbit is genuinely aperiodic.

The four-regime tower is exactly the stratification of orbits by *when settling quiesces*. A `settlement` is what an orbit becomes once it has reached `κ < ω` — the strict-finite endpoint of the stratification.

## Cross-tier identity

Operationally, a single ongoing orbit spans all four tiers:

| Tier | What the orbit IS at this tier |
|---|---|
| articulating | the open articulation — no closure guaranteed |
| predicating | the indexed family of predication-valuations |
| positing | the closure-rule-system + increment-sequence that drives it |
| settling | the settlement — the settled identity of the orbit |

So while the **object** named `settlement` lives at settling tier, the underlying *orbit* it identifies spans the chain. Lower regimes' orbits are not yet settlements; they become settlements when they finish.

## Worked example: a strict-finite settlement

Take `L = 2` (Boolean), `C` a single-predicate category with `p`, `E = {a, b}`, `λ = 3`. Initial `v_0(p)(a, b) = ⊥`. Increment-sequence: `u_1(p)(a, b) = t`, `u_2(p)(a, b) = ⊥`. Closure: identity.

- Step 0: `v_0(p)(a, b) = ⊥`.
- Step 1: `v_1 = cl(v_0 ∨_k u_1) = id(⊥ ∨_k t) = t`.
- Step 2: `v_2 = cl(v_1 ∨_k u_2) = id(t ∨_k ⊥) = t`.

Quiescence at `τ* = 1`. Closure ordinal `κ = 1 < ω`. This is a finite-step settlement with carrier value `t` (told positive) at cell `(a, p, b)`.

## Worked example: a higher-regime orbit (not yet a settlement)

Same base, but increment-sequence supplies `u_n(p)(a_n, b_n) = t` for new entity pairs `(a_n, b_n)` at each step `n`, indefinitely. Closure: identity.

- Each `v_n` has more cells set to `t` than its predecessor.
- The orbit grows monotonically but never quiesces (every step adds new content).
- Closure ordinal `κ = ω` (Scott-continuous).
- This is a **posit**, not a settlement: the orbit is at scott-continuous-posit-category, not at finite-settlement-algebra.

The orbit becomes a settlement only if `E` is finite and the increments eventually stop introducing new entities — at that point closure reduces to finite-step.

## Derivation source

Adapted from `predication-categories/objects/predication-settling.md`, preserved verbatim at `docs/dev/scraps/predication-settling.md`. The archive name `predication-settling` is translated to `settlement` per the four-object grammar; the archive frontmatter declares `realizes` of six downstream concepts (settling-monotonicity, settling-continuity, settling-quiescence, evidence, knowledge-order, truth-order) — all six are pulled and placed at the appropriate tier.
