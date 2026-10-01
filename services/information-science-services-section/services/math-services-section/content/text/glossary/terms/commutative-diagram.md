---
name: "Commutative Diagram"
description: "A commutative diagram is a diagram of [objects](./object.md) and [morphisms](./morphism.md) in which all directed paths between the same two objects compose to the same [morphism](./morphism.md)."
aliases:
  - "commutative diagram"
  - "commutative diagrams"
  - "commuting diagram"
date-created: 2025-12-26
tags: []
---

A commutative diagram is a diagram of [objects](./object.md) and [morphisms](./morphism.md) in which all directed paths between the same two objects compose to the same [morphism](./morphism.md).

If a diagram contains two paths from A to C — say f: A → B followed by g: B → C, and also h: A → C directly — then the diagram commutes when g ∘ f = h. The visual layout encodes an equation: any two routes through the diagram that start and end at the same objects must give the same composite.

Commutative diagrams are the primary language of category theory. Definitions, theorems, and constructions are stated as requirements that certain diagrams commute. The definition of a [natural transformation](./natural-transformation.md) requires that a square commutes for every [morphism](./morphism.md) in the source category. The definition of a limit requires a universal commutative cone. The [sheaf condition](./sheaf-condition.md) is expressed as an equalizer diagram that must commute.

The power of diagrammatic reasoning is that it makes the structure of an argument visible. Rather than tracking chains of equalities in formulas, the mathematician draws a diagram and checks that it commutes — reducing algebraic complexity to a spatial pattern.

In higher category theory, strict commutativity is relaxed: diagrams commute up to specified higher [morphisms](./morphism.md) (2-[morphisms](./morphism.md) witnessing the commutativity, 3-[morphisms](./morphism.md) witnessing their coherence, and so on).
