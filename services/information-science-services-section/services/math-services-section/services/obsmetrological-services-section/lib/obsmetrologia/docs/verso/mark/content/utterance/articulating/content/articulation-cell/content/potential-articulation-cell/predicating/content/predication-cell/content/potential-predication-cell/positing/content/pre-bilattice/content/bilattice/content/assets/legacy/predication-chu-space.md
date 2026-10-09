---

introduces: semantic-framework
description: "A triple (A, r, X) of a set of states, a set of attributes, and an evaluation function r: A × X → L, generalizing formal contexts and connecting to linear logic."
aliases: [Chu space, Chu spaces, Chu construction]
specialization: formal-context
made-of: [states, attributes, evaluation-function]
category-of: star-autonomous-category
models: linear-logic
isomorphic-to-twist-product-when: "Chu(H, 0) over Heyting algebra H"
generalizes: formal-context
introduced-by: barr-1979
developed-by: pratt-1999
bilattice-connection: jakl-2025
date-created: 2026-03-30
---

A Chu space (Barr 1979, developed by Pratt 1999) over a value set $L$ is a triple $(A, r, X)$ where $A$ is a set of states (or objects), $X$ is a set of attributes (or observations), and $r: A \times X \to L$ is an evaluation function.

Pratt (1999) proved that a [formal context](./formal-context.md) $(G, M, I)$ is a Chu space over $\{0, 1\}$, with $G$ as states, $M$ as attributes, and $I$ as evaluation. Many-valued formal contexts are Chu spaces over the value set $L$.

Chu spaces form a $*$-autonomous category — the categorical structure underlying [linear logic](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/linear-logic.md). Tensor in linear logic corresponds to the tensor product of Chu spaces.

Jakl (2025) proved the key connection: the Chu construction $\mathrm{Chu}(H, 0)$ over a Heyting algebra $H$ is exactly the [twist construction](../../../../../../residuated-lattice/content/twist-product/twist-product.md) that produces [bilattices](../../algebra/objects/bilattice.md). Under this identification:

- Tensor ($\otimes$) in linear logic = fusion ($\odot$) in the twist product = extending
- Linear implication ($\multimap$) = twist-product implication ($\Rightarrow$) = restricting

This means every bilattice-valued formal context is simultaneously a Chu space, a model of linear logic, and a [concept lattice](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/concept-lattice.md) with [Lambek calculus](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/lambek-calculus.md) structure.
