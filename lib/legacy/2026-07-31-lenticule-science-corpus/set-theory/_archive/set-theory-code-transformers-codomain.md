---

description: "The set of possible outputs of a function or relation — where the mapping lands."
defines: codomain
aliases: [target]
is-a: set
component-of: function, binary-relation
paired-with: domain
contains: image
date-created: 2025-12-26
date-modified: 2026-03-29
---

The codomain of a [function](../../../morphisms/function.md) $f: A \to B$ is the [set](../objects/set.md) $B$ — the collection of possible outputs. It is the set that the function maps *into*, though it need not map *onto*: not every [element](teaching/explanations/element.md) of the codomain is required to actually appear as an output. The elements of $B$ that do appear as outputs form the image (or range) of $f$, which may be a proper subset of $B$.

The distinction between codomain and image is one of the most commonly confused points in elementary mathematics. The function $f(x) = x^2$ with [domain](./domain.md) $\mathbb{R}$ maps every real number to a nonnegative real number. If the codomain is declared as $\mathbb{R}$, then $f: \mathbb{R} \to \mathbb{R}$ is not surjective — negative numbers are in the codomain but are never hit. If the codomain is declared as $[0, \infty)$, then $g: \mathbb{R} \to [0, \infty)$ with the same rule is surjective — every nonnegative number is the square of something. These are different functions, even though they assign the same output to every input, because they have different codomains. Surjectivity — whether the image fills the codomain — depends on the codomain, and the codomain is a choice, not a consequence of the rule.

This is why specifying a function requires three things: domain, codomain, and assignment rule. The codomain is part of the function's identity, just as much as the domain is. A function $f: A \to B$ and a function $g: A \to C$ with $B \neq C$ are different functions even if they happen to give the same output for every input (which can happen when the image is a subset of both $B$ and $C$).

The codomain of a [binary relation](../objects/binary-relation.md) $R \subseteq A \times B$ is the set $B$ from which the second components of the [ordered pairs](../objects/ordered-pair.md) are drawn.

In a [category](../../categories/theories/ordinary-categories/objects/category.md), the codomain of a morphism $f: A \to B$ is the target object $B$. Composition $g \circ f$ is defined only when the codomain of $f$ matches the domain of $g$: the output of the first morphism must land in the input set of the second. This matching condition is the basic compositional constraint of category theory, and it generalizes the elementary fact that to chain functions together, the output of one must be a valid input to the next.
