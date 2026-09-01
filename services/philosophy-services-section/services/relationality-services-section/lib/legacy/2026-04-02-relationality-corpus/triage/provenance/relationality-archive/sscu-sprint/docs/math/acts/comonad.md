---

name: comonad
act: Comonad
top: ComonadCounit
bottom: ComonadComultiply
summary: Package the fixed flow functor, counit, and comultiplication into a comonad on the profile.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

The fixed flow functor together with its counit and comultiplication forms a
comonad, so we collect the laws in a single act:
`(ComonadCounit ComonadComultiply)` earns
***Comonad***.

The coassociativity and counit laws follow from the flow compatibility and
persistence properties already recorded (e.g. `IterativePersistence`,
`FixFlow`, `EnsureFixedPoint`).  `ComonadCounit` and
`ComonadComultiply` are the structure maps; `Comonad` names the
resulting co-KZ-style comonad.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
