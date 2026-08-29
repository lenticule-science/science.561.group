---
name: settlement-preorder-morphism
description: "The same-base weak morphism class between settlements. For v, v' over (L, C, E, λ), a preorder morphism v → v' exists iff v_τ(p) ≤_k v'_τ(p) pointwise for every predicate p and every τ. Hom-sets are singletons or empty. The morphism class of settlement-category."
depends-on: [settlement, knowledge-order]
derives-from: docs/dev/scraps/predication-settling-preorder-morphism.md
---

# Settlement preorder-morphism

The same-base **preorder relation** between settlements. For settlements `v, v'` over a common base `(L, C, E, λ)`, a preorder-morphism `v → v'` exists iff

$$v_\tau(p) \;\leq_k\; v'_\tau(p) \qquad \text{for every } p \in C, \;\tau < \lambda,$$

pointwise in the predication-fiber-algebra `A_p`.

When such a relation holds, the morphism is **unique** — all morphisms between any given pair are identified. Hom-sets are therefore **singletons or empty**, determined by the pointwise knowledge order.

## What the relation captures

`v → v'` is a witness that `v` is `≤_k`-below `v'` at every step and every predicate. It says: the orbit `v'` carries at least as much evidence as `v` does, at every settling step and at every cell.

This is the **weakest meaningful equivalence relation** on same-base settlements: it ignores the inferential dynamics (closure-rule-system, increment-sequence) and looks only at the static `≤_k`-ordering of state at each step.

## Role: morphism class of settlement-category

Preorder-morphisms are the morphism class of the **settlement-category** `Settle(L, C, E, λ)`. Objects: settlements over the fixed base. Morphisms: preorder-morphisms as above.

`Settle` is **preorder-enriched** (hom-sets singletons or empty), making it a thin category — equivalently a poset on settlements.

Structural results stated for `Settle` use these morphisms:

- **`≤_k`-completeness** (archive theorem `predication-settling-category-completeness`): for any family `{v^α}_α`, the suprema and infima exist pointwise-stepwise.
- **Initial and terminal objects** (archive theorem `predication-settling-category-initial-terminal`): the constant-`⊥` settlement is initial; the constant-`⊤` settlement is terminal.

These are exactly the basic order-theoretic structure of `Settle` — completeness and extremes.

## Comparison with the other morphism classes

| Notion | Strictness | What it tracks |
|---|---|---|
| `settlement-preorder-morphism` (this $thing) | weakest | static `≤_k`-ordering |
| `settlement-morphism` | strongest same-base | state equality + ordinal shift + endofunctor commutation |
| `settlement-base-morphism` | cross-base | `≤_k`-inequality + base-change data |

The preorder-morphism is the `≤_k`-witness only. The settlement-morphism additionally requires equality (with ordinal shift) AND inferential coherence (via `F_U`-commutation). So:

- Every invertible settlement-morphism induces a preorder-morphism (take δ = 0; state equality implies `≤_k`).
- A preorder-morphism need NOT extend to a settlement-morphism: just because `v ≤_k v'` doesn't mean `v'` was produced by `v`'s closure-rule-system (or any related dynamics).

The preorder-morphism is the *hom-set collapse* of the same-base specialization of the base-morphism — it forgets the bilattice-hom family data and keeps only the existence-of-inequality.

## Why this matters operationally

Substrate work needs THREE morphism notions at three strengths:

- **Weak (preorder-morphism)**: for `≤_k`-completeness arguments, for comparing settlements as ordered states.
- **Medium (settlement-morphism)**: for moduli classification, for MLD equivalence, for inferential identification.
- **Strong (base-morphism)**: for parametric variation, for cross-base comparisons.

Each captures a different equivalence relation; each is structurally important for different questions.

## Worked example: a preorder-morphism that isn't a settlement-morphism

Take `L = 2`, single predicate `p`, single cell `(a, p, b)`, `λ = 3`.

- `v = (⊥, t, t)` — closure-rule-system fires at step 1, gives `t`.
- `v' = (⊥, ⊤, ⊤)` — closure-rule-system fires at step 1 with stronger increment, gives `⊤`.

`v_τ(p)(a, b) ≤_k v'_τ(p)(a, b)` at every `τ` (since `⊥ ≤_k ⊥`, `t ≤_k ⊤`, `t ≤_k ⊤`). So preorder-morphism `v → v'` exists.

But settlement-morphism requires either ordinal shift + equality OR endofunctor commutation. Here `v_1 = t ≠ ⊤ = v'_1` even with `δ = 0`, so no equality at any shift. And the closure-rule-systems are different (different increments). So no settlement-morphism.

This shows preorder-morphism is genuinely weaker.

## Position

`settling/hacking/library/settlement-preorder-morphism/`. Settling tier — preorder-morphism class for settlement-category.

## Derivation source

Adapted from `predication-categories/morphisms/predication-settling-preorder-morphism.md`, preserved at `docs/dev/scraps/`. Renamed from `predication-settling-preorder-morphism` per the four-object grammar.
