---
title: World Sum and Product
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Constructs combined relational worlds either by disjoint sum (multi-scenario)
or synchronous product (combined geometry/logical structure).

## Definition
- Inputs: two [Relational Worlds](../structure/relational-world.md) with
  compatible [World Morphisms](../structure/world-morphism.md) into a target
  universe if needed.
- Outputs: a new relational world:
  - Sum: disjoint union of carriers/geometry/topos, preserving each component.
  - Product: product geometry/topos with synchronized flow/nucleus.
- Behaviour: forms categorical sum/product in the category of relational
  worlds and world morphisms.

## Invariants
- Preservation: embeddings into the sum/product are world morphisms.
- Compatibility: flow/nucleus and logical structure preserved componentwise.
- Universality: satisfies sum/product universal properties in the world
  category.

## Proof
- Uses: [Relational World](../structure/relational-world.md) structure and
  [World Morphism](../structure/world-morphism.md) to define categorical
  constructions.
- Produces: [Relational World](../structure/relational-world.md) realising sum
  or product with inherited invariants.
- Shows that: multi-world combinations respect earned geometry and logic.
