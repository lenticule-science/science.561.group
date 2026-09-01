---

name: reach
act: Reach
top: Flow
bottom: StabilizeInvariant
summary: '*Flow* iterations describe which states become reachable from a seed. *Flow* witnessing *Stabilize Invariant* yields ***Reach*** (`Reach`).'
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

*Flow* iterations describe which states become reachable from a seed.  *Flow* witnessing *Stabilize Invariant* yields ***Reach*** ([Reach](reach.md)).

Composing the flow with invariant states records the reachability closure, so *Reach* is valid.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
