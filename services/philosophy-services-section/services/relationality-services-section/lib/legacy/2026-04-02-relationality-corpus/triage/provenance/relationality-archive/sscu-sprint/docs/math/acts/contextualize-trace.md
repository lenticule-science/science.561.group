---

name: contextualize-trace
act: ContextualizeTrace
slug: contextualize-trace
top: AssignTrace
bottom: CompleteTrace
summary: A named trace requires a record that couples the naming with the whole trace. Forcing *Assign Trace* to witness *Complete Trace* yields the act ***Contextualize Trace*** (`ContextualizeTrace`).
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

A named trace requires a record that couples the naming with the whole trace.  Forcing *Assign Trace* to witness *Complete Trace* yields the act ***Contextualize Trace*** ([ContextualizeTrace](contextualize-trace.md)).

*Assign Trace* and *Complete Trace* have been earned, so their composition records the full named trace structure: `(AssignTrace CompleteTrace)` states that the assignment encloses the entire trace, which is exactly what *Contextualize Trace* must express.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
