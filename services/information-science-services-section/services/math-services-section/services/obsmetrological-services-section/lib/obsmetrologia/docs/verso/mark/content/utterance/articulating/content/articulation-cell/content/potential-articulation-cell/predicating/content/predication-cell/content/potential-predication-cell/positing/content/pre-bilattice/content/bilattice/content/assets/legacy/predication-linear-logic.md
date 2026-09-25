---

introduces: logic
description: "A substructural logic where premises are resources consumed by use, with tensor (⊗) and linear implication (⊸) as the fundamental adjoint pair."
aliases: [linear logics]
specialization: substructural-logic
multiplicative-connectives: [tensor, par]
additive-connectives: [with, plus]
exponential-modalities: [bang, why-not]
fundamental-adjunction: "⊗ ⊣ ⊸"
algebraic-semantics: residuated-lattice
categorical-semantics: star-autonomous-category
structural-rules-dropped: [contraction, weakening]
bilattice-connection: "tensor = ⊙ = extends; ⊸ = ⇒ = restricts"
bilattice-via: chu-space
introduced-by: girard-1987
connection-to-bilattices: jakl-2025
resources-tracked: epistemic-state
date-created: 2026-03-30
---

Linear logic (Girard 1987) is a logic where premises are resources: using a premise consumes it. In classical logic, a hypothesis can be used zero, one, or many times. In linear logic, each hypothesis is used exactly once unless explicitly marked as reusable.

The fundamental connectives are:

- **Tensor** ($\otimes$): multiplicative conjunction. $A \otimes B$ means "I have both $A$ and $B$ as resources." Producing $A \otimes B$ requires producing both.
- **Linear implication** ($\multimap$): $A \multimap B$ means "consuming one $A$ produces one $B$."
- **Par** ($\parr$): multiplicative disjunction. Dual to tensor.
- **Bang** ($!A$): "as many copies of $A$ as needed." Recovers classical logic's unlimited use.

Tensor and linear implication form an adjunction: $\otimes \dashv \multimap$. This is the fundamental adjunction of linear logic, analogous to the [residuation](../../algebra/objects/residuated-lattice.md) $a \cdot b \leq c$ iff $b \leq a \to c$ in a residuated lattice.

Jakl (2025) proved the Chu construction $\mathrm{Chu}(H, 0)$ over a Heyting algebra $H$ is the [twist construction](../../../../../../residuated-lattice/content/twist-product/twist-product.md) that produces [bilattices](../../algebra/objects/bilattice.md). Under this identification, tensor in linear logic corresponds to fusion ($\odot$) in the twist product, and linear implication corresponds to the twist-product implication ($\Rightarrow$). Every bilattice-valued predicate system is therefore a model of linear logic where the tracked resources are epistemic states.
