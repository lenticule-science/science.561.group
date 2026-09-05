---
name: settling-monotonicity
description: "The condition on a settle-indexed family v = (v_τ)_{τ<λ} of predication-valuations that values grow monotonically in the knowledge order: σ ≤ τ implies v_σ(p) ≤_k v_τ(p) pointwise in A_p, for every predicate p. The precondition that makes a family of valuations a settlement; the operational guarantee that settling never retracts information."
depends-on: [predication-valuation, settling-bound, knowledge-order]
derives-from: docs/dev/scraps/settling-monotonicity.md
---

# Settling-monotonicity

The condition on a family `v = (v_τ)_{τ < λ}` of predication-valuations over a settling-bound `λ`: for all `σ ≤ τ < λ` and every predicate `p`,

$$v_\sigma(p) \;\leq_k\; v_\tau(p)$$

pointwise in the predication-fiber-algebra `A_p`, where `≤_k` is the knowledge order on `A_p`.

Equivalently, evaluating cellwise: for every cell `(s, p, o) ∈ Φ`,

$$v_\sigma(p)(s, o) \;\leq_k\; v_\tau(p)(s, o) \quad \in L^\bowtie.$$

## What this means cellwise

The knowledge order on a twist product `L^⋈` is `⟨a, b⟩ ≤_k ⟨a', b'⟩` iff `a ≤_L a'` AND `b ≤_L b'`. So settling-monotonicity at the cell level says **both** positive and negative evidence components grow weakly over time.

For `L = 2` (Boolean), `L^⋈ = FOUR`, and the knowledge-order growth diagram is:

```
        ⊤
       / \
      t   f
       \ /
        ⊥
```

A cell's value can move from `⊥` to `t` (positive evidence arrives), from `⊥` to `f` (negative arrives), from `⊥` to `⊤` (both), from `t` to `⊤` (negative joins existing positive), from `f` to `⊤` (positive joins existing negative). It cannot move from `t` to `⊥`, from `t` to `f`, from `⊤` to anything else, etc. Once evidence is held, it is not retracted; once contradiction is recorded, it persists.

## Three operational guarantees

Settling-monotonicity is what makes three substrate behaviors safe.

**(1) No information retraction.** Evidence accumulated up to step `τ` is preserved through every subsequent step. The substrate's `v` is therefore a monotonically-growing record, not a mutable state. Every `v_τ` is `≤_k`-above every `v_σ` for `σ < τ`.

**(2) Conflicts accumulate as `⊤`, not as crash.** Suppose `v_σ(p)(s, o) = t` (positive evidence at step `σ`) and a later step adds negative evidence to the same cell. Without settling-monotonicity, one might overwrite `t` with `f`, losing the positive evidence and producing inconsistency-by-amnesia. With settling-monotonicity, the negative evidence joins via `∨_k`: `t ∨_k f = ⊤`. The cell now records "both" — the contradiction is captured as a value, not as a system error.

This is the formal signature of *paraconsistent* reasoning. Settling-monotonicity is what makes paraconsistency operational.

**(3) Distributed merge convergence.** If two replicas of the same substrate independently extend a valuation in different ways, monotonicity lets them merge correctly by knowledge-join: `(v_τ ∨_k v'_τ)(p)(s, o) := v_τ(p)(s, o) ∨_k v'_τ(p)(s, o)`. The merged valuation is `≤_k`-above both inputs and is correct under monotonicity. Without monotonicity, merges could create inconsistency by introducing values neither replica saw.

This is the formal signature of CRDT-style distributed monotone semilattices. Settling-monotonicity is what makes the substrate a distributed paraconsistent semilattice rather than a single-source-of-truth database.

## The precondition for settlement

A `λ`-indexed family of predication-valuations is a **settlement** iff it satisfies settling-monotonicity. Without it, the family is just an arbitrary `λ`-indexed sequence; with it, the family is the orbit of a closure-driven settling.

Equivalently: the settlement object IS a settling-monotone family. Settling-monotonicity is not an extra requirement laid on top of a generic family — it's the definitional condition that makes "family of valuations" into "settlement."

## Relationship to closure-drivenness

A closure-driven settlement satisfies

$$v_{\tau+1}(p) \;=\; \mathrm{cl}_p\bigl(v_\tau(p) \vee_k u_{\tau+1}(p)\bigr).$$

This formula automatically gives settling-monotonicity, because:

1. `v_τ(p) ≤_k v_τ(p) ∨_k u_{τ+1}(p)` (the `≤_k`-join is `≤_k`-above each operand).
2. `v_τ(p) ∨_k u_{τ+1}(p) ≤_k cl_p(v_τ(p) ∨_k u_{τ+1}(p))` (closure is inflationary).

Combining: `v_τ(p) ≤_k v_{τ+1}(p)`. So closure-drivenness ⟹ settling-monotonicity on successor steps. For limit ordinals, settling-continuity (the directed-join condition) plus closure-monotonicity gives `v_μ(p) ≥_k v_σ(p)` for all `σ < μ`.

So a closure-driven family is automatically settling-monotone. Settling-monotonicity is therefore the condition that **picks out closure-driven orbits among all `λ`-indexed families** — together with continuity, it characterizes settlements.

## Worked example: monotone vs non-monotone families

Take `L = 2`, single predicate `p`, single cell `(a, p, b)`.

**Monotone (settlement):** `v = (⊥, t, ⊤, ⊤, ⊤, …)`.
- Step 0: ⊥ (nothing).
- Step 1: t (positive arrives). `⊥ ≤_k t` ✓.
- Step 2: ⊤ (negative joins). `t ≤_k ⊤` ✓.
- Steps 3+: ⊤ (quiescent). ✓.

This is a valid settlement.

**Non-monotone (NOT a settlement):** `v = (⊥, t, f, ⊤, ⊤, …)`.
- Step 1 to step 2: `t ≤_k f`? **No** — `t` and `f` are knowledge-incomparable. The family violates settling-monotonicity at the `τ = 1 → τ = 2` transition.

This is a valid `λ`-indexed family but is not a settlement. It cannot have arisen from any closure-driven process because step 2 retracts the positive evidence (which closure cannot do — closure is inflationary in `≤_k`).

## Position

`settling/hacking/library/settling-monotonicity/`. A condition on the orbit produced by settling; placed at settling tier because monotonicity IS the structural guarantee settling makes about its orbits.

## Derivation source

Adapted from `predication-categories/concepts/settling-monotonicity.md`, preserved at `docs/dev/scraps/`. The archive note is brief; the substantive content (cell-level reading, the three operational guarantees, the closure-drivenness implication) is filled in here against the four-object grammar.
