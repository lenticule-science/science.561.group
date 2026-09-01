---
name: predication-fibration
description: "A cloven Grothendieck fibration p: E → C^op over the predicate-category C, with fibers E_q ≅ A_q (the predication-fiber-algebras), the four predicate-category generators acting as cellwise reindexings, and reindexings preserving the bilattice-residuated structure pointwise. The Grothendieck-construction packaging of the predication-fiber-functor; positing's operationally-active fibration structure."
depends-on: [residuated-lattice, predicate-category, entity-set, predication-fiber-algebra, predication-fiber-functor]
derives-from: lab/answers/2026-05-28-active-predication-next-invariants.md
---

# Predication fibration

Fix base parameters `(L, C, E)` with `L` an integral commutative residuated-lattice, `C` a small predicate-category with finite limits, and `E` an entity-set. A **predication fibration** over `(L, C, E)` is a cloven Grothendieck fibration

$$p : \mathcal{E} \twoheadrightarrow \mathcal{C}^{\mathrm{op}}$$

satisfying three axioms.

## The three axioms

**(A1) Fiber uniformity.** For every `q ∈ C`, the fiber

$$\mathcal{E}_q \;:=\; p^{-1}(q) \;\cong\; A_q \;=\; \mathbf{L}^{\bowtie\, E \times E}$$

— canonically isomorphic to the predication-fiber-algebra at `q`, viewed as a thin category via its `≤_k`-poset. Every cell `(q, v ∈ A_q)` becomes an object of the total category `E`; the fiber sits inside `E` as the slice over `q`.

**(A2) Generator action.** For each of the four predicate-category generator classes, the reindexing functor `f*: E_p → E_q` for `f: q → p` acts on fiber elements by the specified cellwise reindexing:

| Generator class | Reindexing `f*(v)(s, o)` |
|---|---|
| Specialization (with `ι_f: dom(q) ↪ dom(p)`) | `v(s, o)` if `(s, o) ∈ dom(q)`, else `⊥` |
| Converse | `v(o, s)` |
| Subject-projection | `v(s, s)` |
| Object-projection | `v(o, o)` |

These are the cellwise reindexings of `predication-fiber-functor` packaged into Cartesian lifts.

**(A3) Fiber structure preservation.** For every `f` in `C`, the reindexing `f*` is a **bilattice-residuated homomorphism**: it preserves all of `∧_t, ∨_t, ∧_k, ∨_k, ~` AND the residuated operations `⊙` (twist-product-fusion) and `⇒` (twist-product-right-residual). All preservation is pointwise on the entity-pair index.

## Why this lives inside scott-continuous-posit-category — the derivation

The placement at `scott-continuous-posit-category/library/predication-fibration/` — as a direct (non-hacked) term of the generated category — rather than at predicating tier follows from a structural-operational analysis combined with the **generator rule** and the **derived-term observation**: the fibration is an *object of* the scott-continuous-posit-category once positing has opened that regime, not an admitted-from-outside structure.

The fibration's data — fiber-algebras + reindexings — is predicating-tier (each fiber-algebra is a predicating-tier object; each reindexing is a predicate-category bilattice-homomorphism). The data presentation as a functor is `predication-fiber-functor`, at predicating tier.

What differs is the operational ROLE of the data:

- **Predicating** uses fiber-algebras pointwise (evidence-injection at one cell, one predicate). The bundle structure tying fibers together via reindexings is NOT needed by predicating's primitive operation. Predicating doesn't traverse `C`'s morphisms; it stays at one `q`.

- **Positing's closure-rules use the reindexings essentially.** A rule whose antecedent mentions predicate `q` and consequent mentions predicate `p` must use `f*: A_p → A_q` for `f: q → p` to fire across fibers coherently. The fibration's Cartesian-lift structure (cleavage, functorial reindexings) is what makes multi-predicate rule-firing well-defined.

So the **first morphism** down the chain whose primitive operation INTRINSICALLY requires the Grothendieck-packaged fibration is positing.

The **generator rule** (memory `project_generator_rule`) then fixes the precise sub-placement: anything regime-related lives INSIDE the regime's generated category, not at the generator-morphism's direct library. Posit-related stuff lives in `scott-continuous-posit-category/`, not in `positing/library/`. The predication-fibration is posit-related (positing's operation produces it as an object of the regime), so it lives inside the generated category.

The **derived-term observation** (captain's correction, 2026-05-28): the fibration is an *object of* the scott-continuous-posit-category — a typed derived term, not an admitted-from-outside one. So it lives at `library/predication-fibration/` (direct library) rather than `hacking/library/predication-fibration/` (admitted library). The fibration is genuinely a regime-internal object, derived by positing opening the regime.

The full derivation is in `lab/answers/2026-05-28-active-predication-next-invariants.md`.

## Grothendieck construction equivalence

The fundamental theorem (Bénabou, Grothendieck): cloven Grothendieck fibrations over `C` correspond bijectively (up to canonical equivalence) to pseudo-functors `C^op → Cat`. The pseudo-functor form is the `predication-fiber-functor` `F: C^op → DBiLat(L)`; the fibration form is `p: E → C^op`.

The total category `E` is the Grothendieck construction `∫ F`:

- **Objects**: pairs `(q, v)` with `q ∈ C` and `v ∈ F(q) = A_q`.
- **Morphisms** `(q, v) → (p, w)`: pairs `(f: q → p, F(f)(w) ≤_k v)` — a morphism in `C` paired with a witness that the reindexed value `F(f)(w)` is `≤_k v` in the source fiber.

The **cleavage** is the choice of which Cartesian lifts the fibration uses. Substrate practice uses **canonical cleavages** (the obvious ones derived from the cellwise reindexings) — this makes the reindexing functorial-on-the-nose rather than only pseudo-functorial.

## Hyperdoctrine extension

A predication-fibration that additionally satisfies the (B1)–(B4) hyperdoctrinal conditions is a **predication-hyperdoctrine** — see sibling $thing `predication-hyperdoctrine` at this same `scott-continuous-posit-category/library/`. By Kelly–Lack's property-like theorem, (B1)–(B4) are *properties* of the fibration, not extra structure: any predication-fibration either verifies them and becomes a hyperdoctrine, or doesn't.

The hyperdoctrine adds quantifier adjoints `∃_f^k ⊣ f* ⊣ ∀_f^k` and `∃_f^t ⊣ f* ⊣ ∀_f^t` along every `f` in `C`, plus Frobenius reciprocity for `∧_k` and `∧_t`, plus Beck-Chevalley coherence over pullback squares in `C`, plus comprehension yielding the two derived equalities (classical and paraconsistent).

So at positing tier, the fibration is the base structure; the hyperdoctrine is the fibration with quantification available. Both live here.

## Closure-2-monad action

The closure-2-monad `Cl: PrFib(L, C, E) → PrFib(L, C, E)` acts on the **2-category of predication-fibrations**. This is the categorical setting where `Cl` operates; the predication-fibration is the input type of `Cl`.

`Cl(E)` is another predication-fibration (one with `cl_q` applied to each fiber). The settling-endofunctor

$$F_U(\mathcal{E})_\tau \;:=\; \mathrm{Cl}(\mathcal{E}) \vee_k u_\tau$$

then composes the closure step with the increment-merge step at each settling step.

So the fibration is the **operational data type** that flows through the settling chain:

1. Positing's closure-rules act on the fibration.
2. Closure-2-monad's `Cl` produces a new fibration (with closure applied per-fiber).
3. Settling-endofunctor's `F_U` iterates, with each iteration knowledge-joining with a new increment.
4. The settling orbit is a sequence of fibrations; the limit (when it exists) is the settled fibration.

## Two-KZ disentangling

The 2-category `PrFib(C)` itself carries a Gray–Street fibration 2-monad `M` whose algebras are "things which are fibrations." This is **distinct** from the closure 2-monad `Cl` on the same 2-category whose algebras are "things which are `C`-closed under their internal closure-rule-system." See `closure-2-monad` for the disentangling.

A predication-fibration with both `M`- and `Cl`-algebra status is a **fully `C`-closed settlement**.

## Worked example: the trivial fibration

Take `C` a single-object category (one predicate `p` with only `id_p`). Then `E` has one fiber `E_p = A_p`. The fibration is trivial: there are no non-identity reindexings, no Cartesian lifts beyond identities. `E ≅ A_p` as a category.

In this case the fibration adds NOTHING beyond the fiber-algebra — there is no multi-predicate structure. Positing has nothing to fire across (no predicates to relate). This is the degenerate case; multi-predicate fibrations are the substantive ones.

## Position

`…scott-continuous-posit-category/library/predication-fibration/`. INSIDE the scott-continuous-posit-category (the regime category positing generates), at its direct `library/` — a derived term of the category, not an admitted one. The path tells: predication-fibration IS an object of the scott-continuous-posit-category, derived once positing opens the regime, per the generator rule + derived-term observation.

## Derivation source

The body inherits from the existing stale-path predication-fibration content (originally at `…stable-articulation-cell/predicating/.../library/predication-fibration/`, now moved to this position). The placement at positing tier is derived in `lab/answers/2026-05-28-active-predication-next-invariants.md`. The matching predicating-tier precursor is `predication-fiber-functor` (sibling at `transfinite-predication-category/hacking/library/`).
