---
name: predication fiber functor
description: "The functor F: C^op → DBiLat(L) that takes each predicate p to its predication-fiber-algebra A_p and each predicate-category morphism f: q → p to the induced bilattice-homomorphism f*: A_p → A_q. The functor that turns the predicate-category into a fibration of distributive bilattices."
---

The functor

$$F : \mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}(\mathbf{L})$$

that assigns to each [predicate](../../prose/teaching/explanations/predicate.md) $p \in \mathcal{C}$ its [predication-fiber-algebra](../structures/predication-fiber-algebra.md) $A_p := \mathbf{L}^{\bowtie\, E \times E}$, and to each morphism $f : q \to p$ in the [predicate category](../structures/predicate-category.md) $\mathcal{C}$ the induced [bilattice-homomorphism](bilattice-homomorphism.md) $f^* : A_p \to A_q$ — the cellwise reindexing acting by the four canonical generator classes:

- For [predicate-specialization](predicate-specialization.md) $f : q \to p$ with $\iota_f : \mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p)$: $f^*(v)(s, o) = v(s, o)$ on $\mathrm{dom}(q)$, $\bot$ outside.
- For [predicate-converse](predicate-converse.md) $f : p^c \to p$: $f^*(v)(s, o) = v(o, s)$.
- For [predicate-subject-projection](predicate-subject-projection.md) $f : q \to p$: $f^*(v)(s, o) = v(s, s)$.
- For [predicate-object-projection](predicate-object-projection.md) $f : q \to p$: $f^*(v)(s, o) = v(o, o)$.

$F$ is contravariant in $\mathcal{C}$ (morphisms in $\mathcal{C}$ become reindexing maps in the opposite direction on fibers). Its Grothendieck transpose is the [predication-fibration](../structures/predication-fibration.md).
