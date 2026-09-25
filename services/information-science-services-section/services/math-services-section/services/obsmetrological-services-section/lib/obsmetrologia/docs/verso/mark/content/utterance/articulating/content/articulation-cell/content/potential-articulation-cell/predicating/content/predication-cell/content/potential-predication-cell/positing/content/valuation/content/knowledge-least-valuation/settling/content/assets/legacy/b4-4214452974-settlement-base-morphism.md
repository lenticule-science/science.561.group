---
name: settlement-base-morphism
description: "The cross-base morphism class between settlements at different parameter bases. φ: v → v' consists of (ℓ, e, π, φ_λ) — a residuated-lattice hom, an entity-set function, a predicate-category functor preserving generators, an order-preserving map between settling-bounds — plus a bilattice-hom family φ_{p, τ}: A_p → A'_{π(p)} satisfying φ_{p, τ}(v_τ(p)) ≤_k v'_{φ_λ(τ)}(π(p))."
symbol: "φ"
depends-on: [settlement, residuated-lattice, entity-set, predicate-category, settling-bound, predication-fiber-algebra, bilattice-homomorphism, knowledge-order]
derives-from: docs/dev/scraps/predication-settling-base-morphism.md
---

# Settlement base-morphism

Let `v, v'` be settlements over `(L, C, E, λ)` and `(L', C', E', λ')` **respectively** (different bases). A **settlement base-morphism** `φ: v → v'` is the cross-base morphism class — the one that varies the parameters themselves, not just the orbit within fixed parameters.

`φ` consists of FIVE components:

1. **`ℓ: L → L'`** — a homomorphism of integral commutative residuated-lattices.
2. **`e: E → E'`** — a function between entity-sets.
3. **`π: C → C'`** — a functor between predicate-categories, preserving generator classes (specialization, converse, subject-projection, object-projection).
4. **`φ_λ: λ → λ'`** — an order-preserving map between settling-bounds.
5. **`φ = (φ_{p, τ})`** — a family of bilattice-homomorphisms `φ_{p, τ}: A_p → A'_{π(p)}`, each induced by `ℓ^⋈` and `e × e`, such that

$$\phi_{p, \tau}\bigl(v_\tau(p)\bigr) \;\leq_k\; v'_{\phi_\lambda(\tau)}\bigl(\pi(p)\bigr)$$

for all `p, τ`.

## Two layers of data

The base-morphism splits into two layers:

**Layer 1 (parameter-base):** `(ℓ, e, π, φ_λ)` — a morphism in the **parameter-base-category** `B` (a category whose objects are tuples `(L, C, E, λ)` and morphisms are tuples of the above kinds). This is the "varying the base" structure.

**Layer 2 (fiber lift):** `(φ_{p, τ})` — the cellwise lift to fiber-algebras, induced by `ℓ^⋈` (the residuated-lattice hom lifted to the twist-product) and `e × e` (the entity-function lifted to entity-pairs). This is the "value-level realization" of the base-change.

The two layers must be **coherent**: the bilattice-hom family must respect the base-change in `(ℓ, e, π, φ_λ)`.

## The `≤_k`-inequality constraint

The orbit-level constraint `φ_{p, τ}(v_τ(p)) ≤_k v'_{φ_λ(τ)}(π(p))` says: the morphism sends `v`'s state to something `≤_k`-below `v'`'s corresponding state. The state-equality is RELAXED to `≤_k`-inequality — base-morphisms can be lossy.

This is what makes base-morphisms **the cross-base notion** as opposed to a stronger same-base equivalence. They allow value-decreases as one moves to a coarser or different parameter base.

## Comparison with same-base morphism classes

Three morphism notions between settlements:

| Notion | Base | Constraint | Strictness |
|---|---|---|---|
| `settlement-preorder-morphism` | same | `v_τ(p) ≤_k v'_τ(p)` pointwise | weak |
| `settlement-morphism` | same | state equality + ordinal shift + endofunctor commutation | strong |
| `settlement-base-morphism` (this $thing) | **varies** | bilattice-hom + `≤_k`-inequality | cross-base |

Same-base morphisms relate settlements over fixed parameters; base-morphisms relate settlements at different parameter choices. Base-morphisms are the structural setting for **parametric comparisons** — how does a settlement change as one varies `L`, `E`, `C`, or `λ`?

## Total category over `B`

Settlement base-morphisms are the **1-cells of the total category over the parameter-base-category `B`**. Objects: settlements (each parameterized by some base point in `B`). Morphisms: base-morphisms relating settlements at potentially different base points.

This total category is the largest category one can build with settlements as objects. Restricting to same-base morphisms gives the (much smaller) settlement-category. Restricting to invertible same-base morphisms gives the moduli 2-category.

## Position

`settling/hacking/library/settlement-base-morphism/`. Settling tier — cross-base morphism class between settlements. Sibling of `settlement-morphism` (same-base strong) and `settlement-preorder-morphism` (same-base weak).

## Derivation source

Adapted from `predication-categories/morphisms/predication-settling-base-morphism.md`, preserved at `docs/dev/scraps/predication-settling-base-morphism.md`. Renamed from `predication-settling-base-morphism` to `settlement-base-morphism` per the four-object grammar.
