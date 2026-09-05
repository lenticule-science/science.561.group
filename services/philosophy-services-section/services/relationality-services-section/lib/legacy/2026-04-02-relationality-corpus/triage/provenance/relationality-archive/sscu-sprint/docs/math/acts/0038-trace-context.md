---
name: 0038-trace-context
act: TraceContext
index: 38
top: ContextualizeTrace
bottom: RecognizeContext
summary: >-
  Having recognized contexts, we still lack the trace that records how
  arbitrary traces become contexts. *Contextualize Trace* must therefore
  witness *Recognize Context*, yielding ***Trace Context*** (`TraceContext`).
strata:
  - trace
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Having recognized contexts, we still lack the trace that records how arbitrary traces become contexts.  *Contextualize Trace* must therefore witness *Recognize Context*, yielding ***Trace Context*** ([TraceContext](0038-trace-context.md)).

This act threads recognized contexts back through the trace: `(ContextualizeTrace RecognizeContext)` represents the named trace observing the recognition.  The resulting composite is the promised *Trace Context*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
