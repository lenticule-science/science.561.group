---

title: Comonad Counit
act: ComonadCounit
slug: comonad-counit
top: FixedFlowProfile
bottom: FixedIdentity
summary: Extract the present state from the flow by composing it with the identity, giving the comonad counit.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

The counit of a comonad extracts the current state from a co-extended structure.
For the fixed flow, we obtain this by letting the flow act toward the identity:
`(FixedFlowProfile FixedIdentity)` earns
***ComonadCounit***.

[FixedFlowProfile](fixed-flow-profile.md) propagates recognitions
forward, and [FixedIdentity](fixed-identity.md) stands for the trivial “no
further context” step.  Their composition records the projection
`(epsilon)_X : G(X) → X`.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
