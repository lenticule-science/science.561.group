---
title: World Sum and Product
id: world-sum-product
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# World Sum and Product

Constructs combined relational worlds either by disjoint sum (multi-scenario)
or synchronous product (combined geometry/logical structure).

## Definition
- Inputs: two [Relational Worlds](./relational-world.md) with
  compatible [World Morphisms](./world-morphism.md) into a target
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
- Uses: [Relational World](./relational-world.md) structure and
  [World Morphism](./world-morphism.md) to define categorical
  constructions.
- Produces: [Relational World](./relational-world.md) realising sum
  or product with inherited invariants.
- Shows that: multi-world combinations respect earned geometry and logic.
