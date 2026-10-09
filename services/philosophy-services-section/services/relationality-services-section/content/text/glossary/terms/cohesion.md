---
name: Cohesion
description: "How local relational behavior and global relational structure translate without loss: the adjoint quadruple shape ⊣ discrete ⊣ codiscrete ⊣ global of Lawvere's axiomatic cohesion, with necessity and possibility as its middle pair, and, at the smallest scale, coherence as a genuinely higher-dimensional condition on inclusions."
aliases: [geometric cohesion, cohesive chain, minimal cohesion, shape, discrete, codiscrete, global]
---
**Cohesion** is how local relational behavior and global relational structure translate into each other without loss. When many relational units coexist, each must be viewable at every level of connectivity, and passing between those levels must be governed rather than arbitrary.

## The cohesive chain

Four operations form a chain of adjunctions, shape ⊣ discrete ⊣ codiscrete ⊣ global, the quadruple characteristic of Lawvere's axiomatic cohesion (cohesive toposes):

- **Shape** sees overall form, how things are glued together; it preserves colimits.
- **Discrete** sees maximal separation, each element standing alone; it preserves finite limits.
- **Codiscrete** sees maximal connection, every element bonded to every other; it preserves finite colimits.
- **Global** sees what survives external observation; it preserves limits.

Necessity and possibility are the middle pair of the chain, and composing them gives the dynamics of [flow](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/flow.md). Each operation preserves the stabilization already earned, so viewing a configuration at one level of connectivity determines its appearance at every other; residuation governs the interplay of doing-then-stabilizing and stabilizing-then-doing, and the chain is the ground for stratified geometry and for the filters that carve [profiles](profile.md).

## Minimal cohesion

At the smallest scale, coherence is not a zero-dimensional condition, things either included or not, but a two-dimensional one. The minimal coherent relational unit is a higher inductive type with three constructors: a base point, a one-dimensional path from the point to itself (inclusion as continuous identification), and a two-dimensional path from that inclusion to itself (coherence as a condition on inclusions). Not only can one include, the acts of including are themselves coherently identified; the transitivity a partial order states as a fact is here a path. Building up from it gives the relational unit (adding a relating path and its coherence), relational closure (the sustained mediation between relating and inclusion) and the relational boundary (exclusion and relational negation), each a higher inductive type at a higher dimension. The unit is formalized in Cubical Agda ([`relational-dynamics-cubical.agda`](../../../../../../../information-science-services-section/services/math-services-section/lib/experiments/relational-dynamics-cubical.agda)); Lean has no higher inductive types, and the Heyting-algebra treatment collapses this higher-dimensional content into lattice operations.

Cohesion is not yet formalized in Obsmetrologia. The argument by which relationality reaches it, from multirelational coherence to the integrated field, is [Movement IV](../concepts/movements-geometric-cohesion.md).

## Related

- [Profile](profile.md)
- [Flow](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/flow.md)
- [Relational physics](relational-physics.md)
