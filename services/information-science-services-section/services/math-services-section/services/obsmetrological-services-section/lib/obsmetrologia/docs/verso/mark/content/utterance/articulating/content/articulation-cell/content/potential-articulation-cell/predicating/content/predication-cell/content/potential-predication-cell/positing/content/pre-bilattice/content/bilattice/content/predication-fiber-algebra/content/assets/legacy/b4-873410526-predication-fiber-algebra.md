---
name: predication-fiber-algebra
description: "For a fixed residuated lattice L and entity set E, the pointwise twist product on the entity-pair index at each predicate: A_p := L^⋈^(E×E). An element is a function E × E → L × L giving the value at each cell with predicate fixed at p. The codomain of the predication-fiber-functor; the value-space of every predication-valuation."
symbol: "A_p"
realizes: [knowledge-order, truth-order, evidence]
depends-on: [twist-product, entity-set, residuated-lattice]
derives-from: docs/dev/scraps/predication-fiber-algebra.md
---

# Predication fiber algebra

Fix a residuated lattice `L` and an entity set `E`. For each predicate `p`, the **predication-fiber-algebra** at `p` is

$$A_p \;:=\; \mathbf{L}^{\bowtie\, E \times E}.$$

An element of `A_p` is a function

$$v : E \times E \to L \times L,$$

assigning to each ordered entity-pair `(s, o)` a value `v(s, o) ∈ L^⋈`. Reading `v(s, o) = ⟨a_+, a_-⟩`, the first coordinate is positive evidence and the second is negative — the same evidence interpretation the value algebra carries point-by-point on twist products.

## Pointwise structure

All five bilattice operations on `L^⋈` lift to `A_p` **pointwise on the entity-pair index**:

$$
(v \wedge_k v')(s, o) := v(s, o) \wedge_k v'(s, o), \qquad
(v \vee_k v')(s, o) := v(s, o) \vee_k v'(s, o),
$$

$$
(v \wedge_t v')(s, o) := v(s, o) \wedge_t v'(s, o), \qquad
(v \vee_t v')(s, o) := v(s, o) \vee_t v'(s, o),
$$

$$
({\sim} v)(s, o) := {\sim}\, v(s, o).
$$

When `L` is distributive, so is `A_p` — distributivity transfers pointwise. When `L` is residuated, the twist-product fusion `⊙` and right-residual `⇒` also lift pointwise.

The induced orders on `A_p` are the pointwise orders:

$$v \leq_k v' \;\iff\; \forall (s, o).\; v(s, o) \leq_k v'(s, o), \qquad v \leq_t v' \;\iff\; \forall (s, o).\; v(s, o) \leq_t v'(s, o).$$

## Per-predicate abstract identity

Crucial structural fact: as an **abstract algebra**, `A_p` is the SAME for every predicate `p`. The subscript only records which predicate's values are being held; the algebra itself depends only on `(L, E)`. Two predicates `p` and `q` have fiber algebras `A_p` and `A_q` that are *isomorphic as bilattices*, related by the identity isomorphism on the carrier `L^⋈^(E×E)`.

What distinguishes them is the role they play in the predication-fiber-functor `F: C^op → BiLat(L)`:

$$F(p) = A_p, \qquad F(f: q \to p) = f^* : A_p \to A_q.$$

The reindexing `f*` for a predicate-category morphism `f` is a NON-TRIVIAL bilattice homomorphism: it implements the morphism class's action (restriction for specialization, swap for converse, diagonal collapse for projections). So while `A_p ≅ A_q` abstractly, their *relationship* under `f*` is regime-specific structure that the fiber-functor records.

## Why "fiber"

The terminology comes from the Grothendieck construction. The predicate-category `C` is the **base**; over each `p ∈ Π = Ob(C)` sits the **fiber** `A_p`. The collection `{A_p : p ∈ Π}` together with the reindexings `{f* : A_p → A_q}` is the fiber **bundle**. The predication-fibration is the total category packaging all fibers and reindexings into one fibered object.

So a predication-fiber-algebra is one fiber at one specific predicate. The whole bundle is the predication-fiber-functor's image.

## Position in the substrate stack

The predication-fiber-algebra sits at a specific structural level:

- **Below** the predication-fiber-functor (which assembles per-predicate algebras into a functor `C^op → BiLat(L)`).
- **Below** the predication-fibration (which Grothendieck-constructs the fiber-functor into a total fibered category).
- **Below** the predication-hyperdoctrine (which equips the fibration with quantifier adjoints + Frobenius + Beck-Chevalley + comprehension).
- **Above** the bilattice (since each `A_p` is a `(E × E)`-fold pointwise bilattice).
- **Above** the residuated lattice `L` (since each `A_p` uses `L^⋈`).

## The value-space of every predication-valuation

A predication-valuation `v` assigns to each predicate `p` an element of `A_p`. The predication-fiber-algebra is therefore the **value-space** that predication-valuations land in. Every settlement `v = (v_τ)_{τ<λ}` produces, at each step `τ` and each predicate `p`, an element `v_τ(p) ∈ A_p`.

So the four-tiered chain takes its substrate value-space from this $thing:

| Tier | What lives in `A_p` |
|---|---|
| articulating | unbounded-orbit valuations at predicate `p` |
| predicating | individual `v(p)` for one valuation |
| positing | the `≥_k`-lower-bound `V` in a closure-rule consequent `v'(p)(t_1, t_2) ≥_k V` |
| settling | the orbit `v_τ(p)` over `τ < λ` |

Every regime tier uses `A_p` as its value-space; the distinction between tiers is in how `A_p` is being indexed, accumulated, or closed.

## Worked example: `A_p` for `L = 2`, `E = {a, b}`

Take `L = 2`. Then `L^⋈ = FOUR = {⊥, t, f, ⊤}`. Take `E = {a, b}` (two entities). The entity-pair index is `E × E = {(a,a), (a,b), (b,a), (b,b)}` — four cells.

An element `v ∈ A_p = FOUR^(E×E)` is a function from these four cells to `FOUR` — equivalently, a 4-tuple `(v(a,a), v(a,b), v(b,a), v(b,b)) ∈ FOUR^4`. There are `4^4 = 256` such functions; `A_p` has 256 elements.

Pointwise operations: if `v = (⊥, t, f, ⊤)` and `v' = (t, ⊥, t, ⊥)`, then

- `v ∨_k v' = (⊥ ∨_k t, t ∨_k ⊥, f ∨_k t, ⊤ ∨_k ⊥) = (t, t, ⊤, ⊤)` — knowledge-order accumulation everywhere.
- `~v = (⊥, f, t, ⊤)` — negation swaps `t ↔ f`, fixes `⊥`, fixes `⊤`.

This 256-element bilattice is the concrete value-space at one predicate in the smallest non-trivial substrate setting. A predication-valuation assigns one of these 256 values at each of the predicates in `Π`.

## Position

`transfinite-predication-category/hacking/library/predication-fiber-algebra/`. Predicating tier — where each predicate's cell-values collectively live.

## Derivation source

Adapted from `predication-categories/objects/predication-fiber-algebra.md`, preserved verbatim at `docs/dev/scraps/`.
