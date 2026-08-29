---
title: Completing Trace
act: CompleteTrace
index: 22
slug: complete-trace
top: StartTrace
bottom: AdvanceTrace
summary: >-
  *Continue Trace* alone does not record the full trace object. Forcing *Start
  Trace* to witness *Advance Trace* binds the initial step with its
  progression, yielding ***Complete Trace*** (`CompleteTrace`).
strata:
  - trace
phase: free
keywords:
  - act
---
# Completing Trace

## Interpretation

*Continue Trace* alone does not record the full trace object.  Forcing *Start Trace* to witness *Advance Trace* binds the initial step with its progression, yielding ***Complete Trace*** ([CompleteTrace](0022-complete-trace.md)).

Both components are available; composing them records the entire act of initiating and advancing, so `(StartTrace AdvanceTrace)` earns *Complete Trace*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
