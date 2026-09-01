---

title: Fixed Morphism
act: FixedMorphism
top: Morph
bottom: FixedProfileRecognitions
summary: Restrict structure-preserving maps to the fixed recognitions by composing `Morph` with `FixedProfileRecognitions`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

To treat the fixed profile as a category we need morphisms preserving the fixed
structure.  [Morph](morph.md) records structure-preserving maps between
recognitions, and [FixedProfileRecognitions](fixed-profile-recognitions.md)
restricts recognitions to fixed ones, so we let the morph act witness the
profile:
`(Morph FixedProfileRecognitions)` earns ***FixedMorphism***.

`Morph` already preserves meets, joins, and implication, and restricting it via
the fixed recognitions ensures the resulting morphisms respect the same flow,
nucleus, and shape properties.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
