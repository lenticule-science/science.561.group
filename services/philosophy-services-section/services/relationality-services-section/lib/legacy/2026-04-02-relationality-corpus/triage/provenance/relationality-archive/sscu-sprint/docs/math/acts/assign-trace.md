---

name: assign-trace
act: AssignTrace
slug: assign-trace
top: BindTrace
bottom: TailTrace
summary: >-
  Naming the head leaves the tail unnamed, so the act *Bind Trace* witnesses
  the act *Tail Trace* to extend the name across the remainder.
keywords:
  - act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Naming the head leaves the tail unnamed, so the act *Bind Trace* witnesses the act *Tail Trace* to extend the name across the remainder.

In `(BindTrace TailTrace)` the act *Bind Trace* observes *Tail Trace*.  This spreads the name through the tail, so the resulting act is *Assign Trace*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
