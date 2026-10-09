---
title: Closing Trace Reentry
act: TraceReentryClosure
top: CompleteTrace
bottom: ReenterObservation
summary: '*Reenter Observation* must close the entire trace. Letting *Complete Trace* witness *Reenter Observation* yields ***Trace Reentry Closure*** (`TraceReentryClosure`).'
tags:
- act
layer: act
status: plan
description: "*Reenter Observation* must close the entire trace. Letting *Complete Trace* witness *Reenter Observation* yields ***Trace Reentry Closure*** (`TraceReentryClosure`)."
---

## Interpretation

*Reenter Observation* must close the entire trace.  Letting *Complete Trace* witness *Reenter Observation* yields ***Trace Reentry Closure*** ([TraceReentryClosure](./trace-reentry-closure.md)).

The composition closes the trace under the reentry act, so *Trace Reentry Closure* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
