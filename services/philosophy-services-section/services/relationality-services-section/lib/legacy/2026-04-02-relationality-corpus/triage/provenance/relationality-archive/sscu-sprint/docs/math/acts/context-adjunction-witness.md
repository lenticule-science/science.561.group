---

name: context-adjunction-witness
act: ContextAdjunctionWitness
slug: context-adjunction-witness
top: ContextFlow
bottom: ContextNucleus
summary: Witness the adjunction between the context flow and nucleus by letting the flow observe the nucleus.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

An adjunction between two functors is witnessed by a residuation isomorphism
between hom-sets.  `DynamicResiduation` expresses this relationship for
the context flow and nucleus, and we package it explicitly by composing the flow
with the nucleus:
`(ContextFlow ContextNucleus)` earns
***ContextAdjunctionWitness***.

The act states that maps out of a flowed context correspond to maps into a
closed context in the recognitional sense, exhibiting the adjunction
`ContextFlow ⊣ ContextNucleus`.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
