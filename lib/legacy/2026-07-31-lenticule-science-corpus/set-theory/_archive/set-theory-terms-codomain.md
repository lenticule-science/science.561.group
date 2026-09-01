---
id: codomain
description: "The set of possible outputs of a function or relation — where the mapping lands."
aliases: [target]
is-a: set
component-of: function, binary-relation
paired-with: domain
contains: image
date-created: 2025-12-26
date-modified: 2026-03-29
---

The codomain of a [function](../../terms/function.md) $f : A \to B$ is the [set](./set.md) B — the collection of possible outputs. Not every [element](./element.md) of the codomain need actually appear as an output. Those that do form the image (or range) of f. A function is surjective when its image equals its entire codomain — every possible output is actually hit.

The codomain is part of the function's specification, not a consequence of its rule. The function $f(x) = x^2$ viewed as $f : \mathbb{R} \to \mathbb{R}$ has codomain $\mathbb{R}$ and is not surjective (negative numbers are never outputs). The same rule viewed as $g : \mathbb{R} \to [0, \infty)$ has a smaller codomain and is surjective. These are different functions because they have different codomains, even though they assign the same output to every input.

The codomain of a [binary relation](./binary-relation.md) $R \subseteq A \times B$ is the set B — the set from which the second components of the [ordered pairs](./ordered-pair.md) are drawn.

In a [category](../categories/domains/ordinary-categories/terms/category.md), the codomain of a morphism $f : A \to B$ is the target object B. Composition requires the codomain of the first morphism to match the [domain](./domain.md) of the second: $g \circ f$ is defined only when the codomain of $f$ equals the domain of $g$. This matching condition is the basic constraint on which morphisms can be chained together.
