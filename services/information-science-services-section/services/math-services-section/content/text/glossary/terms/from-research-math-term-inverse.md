---
name: "Inverse"
date-created: 2026-03-29
---

Requires

- composition
- identity-morphism

An inverse is something that undoes another thing. If you do f and then do its inverse, you end up back where you started.

In arithmetic, the inverse of adding 3 is subtracting 3. The inverse of multiplying by 2 is dividing by 2. In both cases, composing the operation with its inverse gives you the identity — nothing changes.

In category theory, a [morphism](morphism.md) f: A → B has an inverse g: B → A when g ∘ f = id_A and f ∘ g = id_B. A morphism with an inverse is an [isomorphism](../../documents/articles/research/2026/07/31/lenticule-import/domains/objects/domains/categories/domains/ordinary-categories/terms/isomorphism.md) — it says A and B are structurally the same, just viewed differently.

Inverse is a stricter notion than [duality](duality.md). Dual things mirror each other across a structure. Inverse things cancel each other within the same structure. Bounce rate and engagement rate are inverses — they add up to 100%, so knowing one gives you the other exactly. Marginal cost and willingness to pay are duals — they occupy mirror positions in the market, but they don&rsquo;t cancel each other.

Not everything has an inverse. Most morphisms in most categories do not. A function that sends two inputs to the same output cannot be undone — you cannot recover which input produced the output. The existence of inverses is a special property, and structures where every element has an inverse (like groups) are more constrained than structures where only some do.

When this library uses `inverse-of` as a frontmatter predicate, it means the subject and object compose to the whole — A + B = 100%, or A undoes B. It is mathematical complementation, not just opposition.
