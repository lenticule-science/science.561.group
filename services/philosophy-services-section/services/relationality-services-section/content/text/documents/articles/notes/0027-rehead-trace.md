---
title: Reheading Trace
act: ReheadTrace
index: 27
slug: rehead-trace
top: RenewTrace
bottom: HeadTrace
summary: >-
  Renewing alone does not isolate the next head, so the act *Renew Trace* must
  witness the act *Head Trace* to define the new head.
strata:
  - trace
phase: free
keywords:
  - act
---
# Reheading Trace

## Interpretation

Renewing alone does not isolate the next head, so the act *Renew Trace* must witness the act *Head Trace* to define the new head.

The composition `(RenewTrace HeadTrace)` shows the act *Renew Trace* watching *Head Trace*.  This isolates the new immediate act, so we name it *Rehead Trace*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
