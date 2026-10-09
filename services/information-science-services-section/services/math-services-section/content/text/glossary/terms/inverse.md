---
name: "Inverse"
description: "An inverse is something that undoes another thing. If you do f and then do its inverse, you end up back where you started."
date-created: 2026-03-29
requires: [composition, identity-morphism]
restricts: duality
---

An inverse is something that undoes another thing. If you do f and then do its inverse, you end up back where you started.

In arithmetic, the inverse of adding 3 is subtracting 3. The inverse of multiplying by 2 is dividing by 2. In both cases, composing the operation with its inverse gives you the identity — nothing changes.

In category theory, a [morphism](./morphism.md) f: A → B has an inverse g: B → A when g ∘ f = id_A and f ∘ g = id_B. A morphism with an inverse is an [isomorphism](./isomorphism.md) — it says A and B are structurally the same, just viewed differently.

Inverse is a stricter notion than [duality](./duality.md). Dual things mirror each other across a structure. Inverse things cancel each other within the same structure. Compositional inverses undo functions or morphisms; additive and multiplicative inverses cancel under their respective operations. Quantities that add to a fixed total, such as two percentages summing to 100%, are complements rather than inverses in the usual mathematical sense.

Not everything has an inverse. Most morphisms in most categories do not. A function that sends two inputs to the same output cannot be undone — you cannot recover which input produced the output. The existence of inverses is a special property, and structures where every element has an inverse (like groups) are more constrained than structures where only some do.

When this library uses `inverse-of` as a frontmatter predicate, it means that the subject undoes the object under a named composition law. Fixed-total pairs belong under a separate `complement-of` relation.
