---
title: Completing Trace
act: CompleteTrace
top: StartTrace
bottom: AdvanceTrace
summary: '*Continue Trace* alone does not record the full trace object. Forcing *Start Trace* to witness *Advance Trace* binds the initial step with its progression, yielding ***Complete Trace*** (`CompleteTrace`).'
tags:
- act
layer: act
status: plan
---

## Interpretation

*Continue Trace* alone does not record the full trace object.  Forcing *Start Trace* to witness *Advance Trace* binds the initial step with its progression, yielding ***Complete Trace*** ([CompleteTrace](./complete-trace.md)).

Both components are available; composing them records the entire act of initiating and advancing, so `(StartTrace AdvanceTrace)` earns *Complete Trace*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
