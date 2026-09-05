---
title: Fixing Flow
act: FixFlow
index: 176
top: StabilizeTrace
bottom: Flow
summary: >-
  A flow exists, yet we must capture the invariants it leaves untouched.
  *Stabilize Trace* witnessing *Flow* produces ***Fix Flow*** (`FixFlow`).
strata:
  - geometry
phase: free
keywords:
  - act
---

## Interpretation

A flow exists, yet we must capture the invariants it leaves untouched.  *Stabilize Trace* witnessing *Flow* produces ***Fix Flow*** ([FixFlow](./0176-fix-flow.md)).

Applying the flow to a stabilized trace uses only earned terms and records precisely those traces that remain invariant, so *Fix Flow* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
