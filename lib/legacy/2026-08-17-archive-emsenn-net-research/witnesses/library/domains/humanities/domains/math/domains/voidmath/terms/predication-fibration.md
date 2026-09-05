---
name: "Predication fibration"
description: "The cloven Grothendieck fibration whose fibers are predication fiber algebras and whose reindexing along each predicate-category generator acts cellwise by the manipulation of the entity-pair index that generator specifies. The fibrational layer of the predication framework."
symbol: "p"
date-created: 2026-04-28
---

A **predication fibration** is a cloven Grothendieck fibration

$$p : \mathcal{E} \twoheadrightarrow \mathcal{C}$$

over a [predicate category](predicate-category.md) $\mathcal{C}$, whose fibers are [predication fiber algebras](predication-fiber-algebra.md) and whose reindexing along each of the four generator classes acts cellwise by the manipulation of the entity-pair index $E \times E$ specified by that generator. It is the *fibrational layer* of the framework — the structure that ties predicates (objects of $\mathcal{C}$) to the values held at their cells (elements of the fibers $\mathcal{E}_p \cong A_p$) in a way that makes substitution and reindexing well-behaved.

Three conditions characterize a predication fibration over base parameters $(\mathbf{L}, \mathcal{C}, E)$ — a residuated lattice, a small predicate category with finite limits, and an entity set:

**(A1) Fiber uniformity.** For every $q \in \mathcal{C}$, the fiber $\mathcal{E}_q := p^{-1}(q)$ is canonically isomorphic to the [predication fiber algebra](predication-fiber-algebra.md) $A_q := \mathbf{L}^{\bowtie\,E\times E}$, viewed as a thin category via its $\leq_k$-poset.

**(A2) Generator action.** For each of the four [predicate-category](predicate-category.md) generator classes — specialization, converse, subject-projection, object-projection — the reindexing functor $f^* : \mathcal{E}_p \to \mathcal{E}_q$ for $f : q \to p$ acts on fiber elements by the cellwise reindexing specified by that generator's manipulation of the entity-pair index.

**(A3) Fiber structure preservation.** For every $f$ in $\mathcal{C}$, the reindexing $f^*$ is a bilattice-residuated homomorphism: it preserves the [bilattice](bilattice.md) operations $\wedge_t, \vee_t, \wedge_k, \vee_k, \sim$ and the residuated operations $\odot$ ([twist-product](twist-product.md) fusion) and $\Rightarrow$ (right residual), pointwise.

## Equivalent formulations

A cloven fibration over $\mathcal{C}$ corresponds bijectively (by Grothendieck transposition) to a pseudo-functor $\mathcal{C}^{\mathrm{op}} \to \mathbf{Cat}$. For predication fibrations, this pseudo-functor lands in $\mathbf{DBiLat}(\mathbf{L})$, the 2-category of distributive bilattices over $\mathbf{L}$. The transpose of a predication fibration is a *predication fiber functor*.

By the Emmenegger fibration 2-comonad result, cloven fibrations over $\mathcal{C}$ are exactly pseudo-coalgebras for the lax-idempotent 2-comonad $\mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$. A predication fibration is therefore equivalently *a pseudo-$\mathbb{N}$-coalgebra satisfying (A1)–(A3)*. Pseudo-coalgebra rather than strict coalgebra reflects the non-strict composition of generators in the predicate category.

## The 2-category of predication fibrations

The full sub-2-category of $\mathbf{Cat}/\mathcal{C}$ on predication fibrations, denoted $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$, has cloven-fibration morphisms respecting (A1)–(A3) as 1-cells and natural transformations of fibration morphisms as 2-cells. This 2-category is the ambient structure for the closure 2-monad whose pseudo-algebras are [predication hyperdoctrines](predication-hyperdoctrine.md).

## In the layer stack

The predication fibration is one layer in a property-like stack:

1. The [predicate category](predicate-category.md) gives the indexing base.
2. **The predication fibration** adds the cloven-fibration structure that ties predicates to their fiber algebras with well-behaved reindexing.
3. The [predication hyperdoctrine](predication-hyperdoctrine.md) adds parallel adjoint quantifier systems.

Each layer is *property-like* (Kelly–Lack): present-or-not, no choice involved, unique up to unique iso when present.

## See also

- [Predicate category](predicate-category.md) — the indexing base.
- [Predication fiber algebra](predication-fiber-algebra.md) — the structure of each fiber.
- [Predication hyperdoctrine](predication-hyperdoctrine.md) — the next layer up.
- [Predication](predication.md) — the framework these layers articulate.
