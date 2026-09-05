---
kind: definition
realizes: [predicate-category-naturality]
type: fibration
depends-on: [predicate-category, predication-fiber-algebra, predication-fiber-functor, residuated-lattice, entity-set, predicate-specialization, predicate-converse, predicate-subject-projection, predicate-object-projection, twist-product-fusion, twist-product-right-residual, negation, emmenegger-fibration-comonad]
---

# Predication fibration

Fix base parameters $(\mathbf{L}, \mathcal{C}, E)$ with $\mathbf{L}$ an integral commutative [residuated lattice](residuated-lattice.md), $\mathcal{C}$ a small [predicate category](predicate-category.md) with finite limits, and $E$ an [entity set](entity-set.md). A **predication fibration** over $(\mathbf{L}, \mathcal{C}, E)$ is a cloven Grothendieck fibration

$$p : \mathcal{E} \twoheadrightarrow \mathcal{C}$$

satisfying:

**(A1) Fiber uniformity.** For every $q \in \mathcal{C}$, the fiber $\mathcal{E}_q := p^{-1}(q)$ is canonically isomorphic to the [predication fiber algebra](predication-fiber-algebra.md) $A_q := \mathbf{L}^{\bowtie E \times E}$, viewed as a thin category via its $\leq_k$-poset.

**(A2) Generator action.** For each of the four [predicate-category](predicate-category.md) generator classes — [specialization](../morphisms/predicate-specialization.md), [converse](../morphisms/predicate-converse.md), [subject-projection](../morphisms/predicate-subject-projection.md), [object-projection](../morphisms/predicate-object-projection.md) — the reindexing functor $f^* : \mathcal{E}_p \to \mathcal{E}_q$ for $f : q \to p$ acts on fiber elements by the specified cellwise reindexing.

**(A3) Fiber structure preservation.** For every $f$ in $\mathcal{C}$, the reindexing $f^*$ is a bilattice-residuated homomorphism: it preserves $\wedge_t, \vee_t, \wedge_k, \vee_k$, [negation](../morphisms/negation.md) $\sim$, [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$, and [twist-product right residual](../morphisms/twist-product-right-residual.md) $\Rightarrow$ pointwise.

## Equivalent formulation as $\mathbb{N}$-coalgebra

By the [Emmenegger fibration 2-comonad](../theorems/emmenegger-fibration-comonad.md) result, cloven fibrations over $\mathcal{C}$ are exactly pseudo-coalgebras for the lax-idempotent 2-comonad $\mathbb{N}$ on $\mathbf{Cat}/\mathcal{C}$. The above definition is equivalently: *a predication fibration is a pseudo-$\mathbb{N}$-coalgebra satisfying (A1)–(A3).* Being a pseudo-coalgebra rather than a strict coalgebra matches the non-strict composition of generators in the predicate category.

## Grothendieck transpose

The [predication fiber functor](../theorems/predication-fiber-functor.md) $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ is the Grothendieck transpose of a predication fibration: cloven fibrations correspond bijectively to pseudo-functors $\mathcal{C}^{\mathrm{op}} \to \mathbf{Cat}$, and $F$ is this pseudo-functor restricted to land in $\mathbf{DBiLat}(\mathbf{L}) \hookrightarrow \mathbf{Cat}$.

## The 2-category of predication fibrations

The full sub-2-category of $\mathbf{Cat}/\mathcal{C}$ on predication fibrations, denoted $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$, has cloven-fibration morphisms respecting (A1)–(A3) as 1-cells and natural transformations of fibration morphisms as 2-cells. This 2-category is the ambient structure for the [closure 2-monad](closure-2-monad.md).
