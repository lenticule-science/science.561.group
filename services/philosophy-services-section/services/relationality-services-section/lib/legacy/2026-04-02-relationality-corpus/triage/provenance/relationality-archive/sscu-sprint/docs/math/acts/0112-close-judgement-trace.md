---

name: 0112-close-judgement-trace
act: CloseJudgementTrace
index: 112
top: TraceReentryClosure
bottom: EquateJudgementObservation
summary: >-
  Even after alignment, we must close the entire judgement trace under this
  equivalence. *Trace Reentry Closure* witnessing *Equate Judgement
  Observation* yields ***Close Judgement Trace*** (`CloseJudgementTrace`).
strata:
  - judgement
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Even after alignment, we must close the entire judgement trace under this equivalence.  *Trace Reentry Closure* witnessing *Equate Judgement Observation* yields ***Close Judgement Trace*** ([CloseJudgementTrace](0112-close-judgement-trace.md)).

The composition closes the trace and uses only earned recognitions, so *Close Judgement Trace* follows.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
