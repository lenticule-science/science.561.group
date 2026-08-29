---
id: relation
description: "A relation between two sets A and B: a subset of A × B, equivalently a morphism A × B → Ω into the subobject classifier of the ambient category. The primitive mathematical object from which all named relations in the system are constructed."
defines: Relation
component-of: relational-universe
fiber-of: relational-universe
base: relational-history-site
element-of: entity
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  domain: relational-universe
  codomain: relational-universe
output: relational-universe-morphism
ast:
  subobject-of-product:
    - domain
    - codomain:
        - morphism-into-omega
---

# Relation

## What this is

A **Relation** between objects A and B is a subobject of A × B in the ambient category — equivalently, a morphism A × B → Ω into the subobject classifier Ω.

This is the standard mathematical definition. In Set: a subset R ⊆ A × B, with (a, b) ∈ R meaning "a stands in relation R to b." In a Heyting algebra H_t: a relation on propositions is an element of H_t × H_t → H_t, the internal hom. In a sheaf topos Sh(T, J): a relation is a natural transformation between the represented functors, or a subobject of the product sheaf.

A relation is not a label, a tag, or a category membership declaration. It is a mathematical object with a domain, a codomain, and an extension (the set of pairs that satisfy it).

## Why this file exists

Every named relation in the system — `grounding:`, `extends:`, `component-of:`, etc. — is a specific instance of this primitive. The DAG of entity dependencies bottoms out here. Without a primitive Relation entity, every relation-defining entity has a dangling reference: it `extends: Relation` but there is no entity that grounds what Relation means at the base level.

This file is that base. It carries no FARS-specific content. It states the mathematical primitive that the FARS Relation concept ([flatfile-agential-resource-system-relation](../../../../../../../engineering-science-services-section/services/technology-science-services-section/content/text/glossary/terms/flatfile-agential-resource-system-relation.md)) is built on top of.

## Open questions

- Whether Ω in the ambient sheaf topos Sh(T, J) coincides with the fiber Heyting algebras H_t in the appropriate sense — i.e., whether the internal relations in Sh(T,J) reduce to Heyting-algebra relations fiberwise. The fiberwise reduction is expected from the local nature of sheaf conditions but has not been derived in the math locale.
