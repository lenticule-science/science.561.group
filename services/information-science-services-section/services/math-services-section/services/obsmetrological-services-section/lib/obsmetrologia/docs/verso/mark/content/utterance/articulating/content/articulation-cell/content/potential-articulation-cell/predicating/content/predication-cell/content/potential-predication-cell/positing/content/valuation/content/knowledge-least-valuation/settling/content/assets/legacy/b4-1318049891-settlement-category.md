---
name: settlement-category
description: "The category Settle(L, C, E, λ) whose objects are settlements over fixed parameters and whose morphisms are pointwise-stepwise ≤_k-preorder maps. Hom-sets are singletons or empty. The right setting for stating ≤_k-completeness and initial/terminal objects of settlements — NOT the moduli 2-category."
symbol: "Settle"
depends-on: [settlement, knowledge-order]
derives-from: docs/dev/scraps/predication-settling-category.md
---

# Settlement category

`Settle(L, C, E, λ)` — the category whose objects are settlements over fixed parameters `(L, C, E, λ)` and whose morphisms are pointwise-stepwise `≤_k`-preorder maps.

A morphism `v → v'` exists iff for every `τ < λ` and every predicate `p`,

$$v_\tau(p) \;\leq_k\; v'_\tau(p)$$

pointwise in `A_p`. Hom-sets are therefore **singletons or empty**.

## Properties

The hom-set being thin (singleton or empty) means `Settle` is a **preorder category**. Composition and identity are forced; the category structure is determined by the preorder on objects.

- **Initial object**: the settlement `v⁰` with `v⁰_τ(p) = ⊥` for all `τ, p` — the constant-bottom settlement. Every settlement is `≤_k`-above it pointwise-stepwise.
- **Terminal object**: the settlement `v^⊤` with `v^⊤_τ(p) = ⊤` for all `τ, p` — the constant-top settlement. Every settlement is `≤_k`-below it.

The initial and terminal objects exist for any `(L, C, E, λ)` and witness `Settle`'s `≤_k`-completeness.

## Completeness theorem

The archive theorem `predication-settling-category-completeness` (not yet pulled) states that `Settle(L, C, E, λ)` has all `≤_k`-suprema and `≤_k`-infima pointwise-stepwise: for any family `{v^α}_α` of settlements,

$$(\sup_\alpha v^\alpha)_\tau(p) \;:=\; \bigvee_k \{v^\alpha_\tau(p)\}, \qquad (\inf_\alpha v^\alpha)_\tau(p) \;:=\; \bigwedge_k \{v^\alpha_\tau(p)\}.$$

This makes `Settle` a complete lattice — equivalently, a 0-categorical "settling lattice."

## Caveat: NOT the moduli 2-category

`Settle`'s preorder morphisms are **strictly weaker** than `settling-morphism`s (which carry an ordinal shift, demand state equality, and require settling-endofunctor commutation). The settling-morphisms are the 1-cells of a 2-category whose biequivalences are `mutually-locally-derivable` equivalence — that 2-category is the moduli-quotient setting.

So:

- `Settle` is the right setting for stating **`≤_k`-completeness** and **initial/terminal objects** and the closure-as-monad presentation. The mathematical infrastructure here is thin (preorder + completeness) but load-bearing for these basic claims.
- `Settle` is **not** the right setting for **moduli classification**, which lives in the 2-category. Cross-regime classification (e.g., the aperiodic classifying invariant) needs the moduli 2-category's biequivalences, not `Settle`'s preorder.

See the archive narrative `equivalence-hierarchy` for the full picture of how the preorder, the 2-category, and MLD-equivalence layer.

## Terminology note

The archive name was `predication-settling-category`, conflating "predication" (predicating-tier object) with "settling" (settling-tier morphism). In current grammar, this is the category whose objects are **settlements**, hence `settlement-category`. See sibling $thing `settlement` for the underlying object.

## Position

`finite-settlement-algebra/hacking/library/settlement-category/`. Settling tier.

## Derivation source

Adapted from `predication-categories/objects/predication-settling-category.md`, preserved verbatim at `docs/dev/scraps/predication-settling-category.md`.
