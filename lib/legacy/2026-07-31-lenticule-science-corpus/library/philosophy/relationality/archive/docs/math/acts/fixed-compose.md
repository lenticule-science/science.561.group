---
title: Fixed Composition
act: FixedCompose
top: ComposeMorph
bottom: FixedMorphism
summary: Compose morphisms between fixed recognitions by restricting `ComposeMorph` to the fixed ones.
tags:
- act
layer: act
status: plan
---

We need composition of fixed morphisms.  `ComposeMorph = (Morph Morph)` composes
structure-preserving maps, and restricting it to
[FixedMorphism](fixed-morphism.md) yields composition internal to the fixed profile:
`(ComposeMorph FixedMorphism)` earns ***FixedCompose***.

`ComposeMorph` already composes global morphisms.  Composing only those in
`FixedMorphism` ensures the structure is preserved under the fixed-profile dynamics
(flow, nucleus, and shuffle), providing
the composition law for fixed functors.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
