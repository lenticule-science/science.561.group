---

description: "The set of allowed inputs to a function or relation — where the mapping starts."
defines: domain
aliases: [source]
is-a: set
component-of: function, binary-relation
paired-with: codomain
date-created: 2025-12-26
date-modified: 2026-03-29
---

The domain of a [function](../../../morphisms/function.md) $f: A \to B$ is the [set](../objects/set.md) $A$ — the collection of all allowed inputs. Every [element](teaching/explanations/element.md) of the domain must be assigned exactly one output. A function is not permitted to leave any input unaccounted for. This totality requirement — that $f$ be defined on every element of its domain — is part of what distinguishes a function from a partial function or a relation.

The domain is not a byproduct of the function's rule; it is part of the function's specification. Two functions with the same formula but different domains are different functions. The function $f(x) = x^2$ with domain $\mathbb{N}$ (the natural numbers) is a different function from $g(x) = x^2$ with domain $\mathbb{R}$ (the real numbers), even though they agree on every input where both are defined. They have different domains, and therefore different properties: $f$ is a function from $\mathbb{N}$ to $\mathbb{N}$, while $g$ is a function from $\mathbb{R}$ to $\mathbb{R}$. The first can never take a negative input; the second can.

Specifying a function completely requires three things: its domain, its [codomain](./codomain.md), and the assignment rule. Leaving out the domain is like leaving out the subject of a sentence — the function is not fully determined. In practice, when mathematicians write "$f(x) = \sqrt{x}$" without specifying a domain, they implicitly mean the largest set on which the rule makes sense (the nonnegative reals, in this case). But this convention hides a choice, and in rigorous work the domain must be stated.

The domain of a [binary relation](../objects/binary-relation.md) $R \subseteq A \times B$ is the set $A$ from which the first components of the [ordered pairs](../objects/ordered-pair.md) are drawn. Unlike a function, a relation does not require every element of $A$ to participate — some elements of $A$ may not appear in any pair.

In a [category](../../categories/theories/ordinary-categories/objects/category.md), the domain of a morphism $f: A \to B$ is the source object $A$. Every morphism has a domain and a codomain. Composition $g \circ f$ is defined only when the codomain of $f$ equals the domain of $g$ — this matching condition is the basic constraint that governs which morphisms can be chained together, and it is the categorical analogue of the requirement that a function's output land in the next function's input set.

## Image and surjectivity

The **image** (or *range*) of $f$ is $\mathrm{im}(f) = \{f(a) \mid a \in A\} \subseteq B$ — the actual set of outputs. The codomain says where $f$ is *allowed* to land; the image says where it *does* land. Always $\mathrm{im}(f) \subseteq \mathrm{cod}(f)$, with equality iff $f$ is surjective.
