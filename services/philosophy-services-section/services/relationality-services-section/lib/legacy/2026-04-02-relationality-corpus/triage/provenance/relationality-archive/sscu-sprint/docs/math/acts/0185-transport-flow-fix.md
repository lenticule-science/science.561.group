---

name: 0185-transport-flow-fix
act: TransportFlowFix
index: 185
top: Morph
bottom: FixFlow
summary: >-
  Morphs preserve flow-fixed recognitions. *Morph* witnessing *Fix Flow*
  yields ***Transport *Flow* Fix*** (`TransportFlowFix`).
strata:
  - geometry
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Morphs preserve flow-fixed recognitions.  *Morph* witnessing *Fix Flow* yields ***Transport *Flow* Fix*** ([TransportFlowFix](0185-transport-flow-fix.md)).

Composing these recognitions records f(F(x)) = F'(f(x)), proving transported invariance.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
