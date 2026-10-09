---
id: domain
description: "The set of allowed inputs to a function or relation — where the mapping starts."
aliases: [source]
is-a: set
component-of: function, binary-relation
paired-with: codomain
date-created: 2025-12-26
date-modified: 2026-03-29
title: Set theory terms domain
---

The domain of a [function](../../../../research/2026/07/31/terms/function.md) $f : A \to B$ is the [set](../../../../../../glossary/terms/set.md) A — the collection of all allowed inputs. Every [element](../../../../../../glossary/terms/element.md) of the domain must be assigned an output. A function is not permitted to leave any input unaccounted for. This totality requirement is part of what makes a function a function.

Specifying a function requires specifying three things: its domain, its [codomain](../../../../research/2026/07/31/lenticule-import/_archive/codomain.md), and the assignment rule. Two functions with the same rule but different domains are different functions. "Square each natural number" and "square each real number" are distinct functions, even where they agree, because the domain of the first is $\mathbb{N}$ and the domain of the second is $\mathbb{R}$.

The domain of a [binary relation](../../../../../../glossary/terms/binary-relation.md) $R \subseteq A \times B$ is the set A — the set from which the first components of the [ordered pairs](../../../../../../glossary/terms/ordered-pair.md) are drawn. Unlike a function, a relation does not require every element of A to appear in some pair.

In a [category](../../../../research/2026/07/31/lenticule-import/categories/domains/ordinary-categories/terms/category.md), the domain of a morphism $f : A \to B$ is the source object A. Every morphism has a domain and a codomain. Composition $g \circ f$ requires the codomain of $f$ to equal the domain of $g$ — this matching condition is what makes composition possible.
