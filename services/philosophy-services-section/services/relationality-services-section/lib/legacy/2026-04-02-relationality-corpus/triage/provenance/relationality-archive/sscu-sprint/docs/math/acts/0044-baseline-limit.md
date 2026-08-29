---
name: 0044-baseline-limit
act: BaselineLimit
index: 44
slug: baseline-limit
top: BaselineConvergence
bottom: TailTrace
summary: >-
  When baseline convergence holds, we may speak of the limiting remainder that
  remains after collapse; observing the tail through the convergence act
  yields this limit.
strata:
  - trace
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

When baseline convergence holds, we may speak of the limiting remainder that remains after collapse; observing the tail through the convergence act yields this limit.

In `(BaselineConvergence TailTrace)` the convergence act watches the trace tail, capturing exactly the stabilized remainder that survives the collapse.  We designate that composite as *Baseline Limit*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
