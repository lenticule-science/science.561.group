---
title: Fixed Composition
act: FixedCompose
slug: fixed-compose
top: ComposeMorph
bottom: FixedMorphism
summary: >-
  Compose φ-compatible morphisms by restricting `ComposeMorph` to the fixed
  ones.
tags:
  - act
---
# Fixed Composition

We need composition of fixed morphisms.  `ComposeMorph = (Morph Morph)` composes
structure-preserving maps, and restricting it to
[FixedMorphism](fixed-morphism.md) yields φ-compatible composition:
`(ComposeMorph FixedMorphism)` earns ***FixedCompose***.

`ComposeMorph` already composes global morphisms.  Composing only those in
`FixedMorphism` ensures the structure is preserved under φ-stability, providing
the composition law for fixed functors.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
