---
name: 0041-reflex-step-iterate
act: ReflexStepIterate
index: 41
top: ReflexStepShape
bottom: CompleteTrace
summary: >-
  One reflex step is not enough; we must see its action unfold along the
  entire trace by iterating the shape against the whole record.
strata:
  - trace
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

One reflex step is not enough; we must see its action unfold along the entire trace by iterating the shape against the whole record.

The trace `(ReflexStepShape CompleteTrace)` places the step shape in the witness role for *Complete Trace*.  This records the repeated action of the shape across every point of the trace, so we call the composite *Reflex Step Iterate*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
