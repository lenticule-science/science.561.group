---
name: predication fibration
description: "A cloven Grothendieck fibration p: E → C over (L, C, E) satisfying fiber uniformity (each fiber is canonically the predication-fiber-algebra at the base predicate), generator action (the four canonical predicate-category morphisms act on fibers by cellwise reindexing), and fiber structure preservation (reindexing is a bilattice-residuated homomorphism). The packaging of per-predicate fiber algebras into a single fibered category. Its Grothendieck transpose is the predication-fiber-functor."
closure-2-monad: predication-fibration
---

Fix base parameters $(\mathbf{L}, \mathcal{C}, E)$ with $\mathbf{L}$ an integral commutative [residuated-lattice](residuated-lattice.md), $\mathcal{C}$ a small [predicate-category](predicate-category.md) with finite limits, and $E$ an [entity-set](entity-set.md). A **predication fibration** over $(\mathbf{L}, \mathcal{C}, E)$ is a cloven Grothendieck fibration

$$p : \mathcal{E} \twoheadrightarrow \mathcal{C}$$

satisfying:

**(A1) Fiber uniformity.** For every $q \in \mathcal{C}$, the fiber $\mathcal{E}_q := p^{-1}(q)$ is canonically isomorphic to the [predication-fiber-algebra](predication-fiber-algebra.md) $A_q := \mathbf{L}^{\bowtie\, E \times E}$, viewed as a thin category via its $\leq_k$-poset.

**(A2) Generator action.** For each of the four predicate-category generator classes — [predicate-specialization](../transformers/predicate-specialization.md), [predicate-converse](../transformers/predicate-converse.md), [predicate-subject-projection](../transformers/predicate-subject-projection.md), [predicate-object-projection](../transformers/predicate-object-projection.md) — the reindexing functor $f^* : \mathcal{E}_p \to \mathcal{E}_q$ for $f : q \to p$ acts on fiber elements by the specified cellwise reindexing.

**(A3) Fiber structure preservation.** For every $f$ in $\mathcal{C}$, the reindexing $f^*$ is a bilattice-residuated homomorphism: it preserves $\wedge_t, \vee_t, \wedge_k, \vee_k$, [negation](../transformers/negating.md) $\sim$, [twist-product-fusion](../transformers/fusing-by-twist-product.md) $\odot$, and [twist-product-right-residual](../transformers/residuating-right-by-twist-product.md) $\Rightarrow$ pointwise.

The [predication-fiber-functor](../transformers/predication-fiber-functor.md) $F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$ is the Grothendieck transpose of a predication fibration: cloven fibrations correspond bijectively to pseudo-functors $\mathcal{C}^{\mathrm{op}} \to \mathbf{Cat}$, and $F$ is this pseudo-functor restricted to land in $\mathbf{DBiLat}(\mathbf{L})$.
