---
id: identity-morphism
description: "The do-nothing morphism on an object — neutral element for composition, required to exist by the axioms of a category."
aliases: [identity morphisms, identity arrow]
on: object
neutral-for: composition
axiom-of: category
set-analog: identity-function
order-analog: reflexivity
builds: isomorphism
date-created: 2025-12-26
date-modified: 2026-03-29
---

The identity morphism $\mathrm{id}_A : A \to A$ is the [morphism](./morphism.md) on an [object](./object.md) A that acts as the neutral element for [composition](./composition.md). Composing with the identity before or after any morphism leaves it unchanged:

$$f \circ \mathrm{id}_A = f \qquad \mathrm{id}_B \circ f = f$$

for every morphism $f : A \to B$.

Every [category](./category.md) is required to have an identity morphism for every object. This is one of the two axioms of a category, alongside associativity of composition. Without identity morphisms, there would be no notion of "doing nothing" — no baseline against which other morphisms can be measured. The identity morphism is to composition what zero is to addition or one is to multiplication.

What the identity morphism looks like depends on the category. In Set, the identity morphism on a [set](../../sets/terms/set.md) A is the identity [function](../../../terms/function.md) $x \mapsto x$. In a group viewed as a one-object category, the identity morphism is the group identity element. In a [partial order](../../order/terms/partial-order.md), the identity morphism on a is the [reflexivity](../../order/terms/reflexive.md) assertion $a \leq a$.

Identity morphisms are what make [isomorphisms](./isomorphism.md) definable. A morphism $f : A \to B$ is an isomorphism exactly when there exists $g : B \to A$ such that both composites $g \circ f$ and $f \circ g$ equal the respective identity morphisms. "Round trip equals doing nothing" can only be stated if "doing nothing" has a name — and the identity morphism is that name.

Identity morphisms are unique. If $e : A \to A$ satisfies $f \circ e = f$ for all $f$ out of A, then $e = \mathrm{id}_A$. The proof: $e = \mathrm{id}_A \circ e = \mathrm{id}_A$, using the identity law for $\mathrm{id}_A$ on the left. Uniqueness means each object has exactly one identity morphism, not just at least one.
