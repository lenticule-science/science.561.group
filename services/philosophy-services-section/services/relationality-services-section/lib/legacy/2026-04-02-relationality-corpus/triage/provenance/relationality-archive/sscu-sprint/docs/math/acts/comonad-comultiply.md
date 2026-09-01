---

name: comonad-comultiply
act: ComonadComultiply
top: FixedFlowProfile
bottom: FixedFlowProfile
summary: Duplicate the flow co-structure by composing the flow with itself, yielding the comultiplication.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

Comultiplication duplicates context: from one flow we obtain a “flowed flow” by
letting the flow observe itself:
`(FixedFlowProfile FixedFlowProfile)` earns
***ComonadComultiply***.

Applying the flow twice corresponds to extending the co-context one more
step, so the act records `(delta)_X : G(X) → G(G(X))`.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
