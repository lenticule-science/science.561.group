---

introduces: function
description: "Cascades boolean-element evidence into a parallel is-boolean-true-result fiber, preserving the structured channels that carry each contribution. Reading is-boolean-true-result at a subject gives the witnessing of whether and why the subject is boolean-true."
defines: is-boolean-true
references: ../terms/boolean-algebra.md
date-created: 2026-04-11
boolean-element:
  specialization: is-boolean-true-result
---

`is-boolean-true` cascades every [boolean-element](../objects/boolean-algebra.md) claim in the substrate into a parallel `is-boolean-true-result` fiber with the same value, preserving the structured channels that carry each contribution. Reading the result fiber at a subject is the act of asking "is this resource boolean-true?" — the answer is the witnessing configuration of channels at that point.

## Operation

The frontmatter declares one specialization morphism through nested mapping syntax: the top-level mapping `boolean-element:` is interpreted as a claim with `boolean-element` as subject, producing $(\text{boolean-element},\ \text{specialization},\ \text{is-boolean-true-result})$. By Theorem 2 of [the adjoint structure of predication paper](../texts/from-lattices-to-residuated-lattices.md), specialization is a bilattice homomorphism: every claim in the boolean-element fiber derives a claim at the same $(\text{subject}, \text{structured-object})$ point in the is-boolean-true-result fiber, with the same bilattice value.

The cascade is standing. Every boolean-element message that flows through the substrate populates the is-boolean-true-result fiber automatically — there is no separate "invocation" step.

## Reading the result

To find out whether a resource $X$ is boolean-true, walk the substrate's response geometry for claims matching $(X, \text{is-boolean-true-result}, *)$. Each match is one witnessing channel — its structured object traces back through the morphism cascade to the original message claims that established the boolean evidence. The set of channels at the subject is the answer: each channel records one path of evidence, and the caller reads them as the witnessing configuration rather than collapsing them into a primitive label.

## Composition with `boolean-and`

[`boolean-and`](./boolean-and.md) builds new boolean-element channels by fusing pairs of existing ones at the same subject. Those derived channels are themselves boolean-element claims, so the `is-boolean-true` cascade picks them up and propagates them into is-boolean-true-result. The two functions compose: `boolean-and` enriches the boolean-element fiber, and `is-boolean-true` mirrors that enrichment into the result fiber.
