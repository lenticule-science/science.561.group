---
title: Recognizing Context
act: RecognizeContext
index: 37
top: ExtendContext
bottom: ContextualizeTrace
summary: >-
  Extensions exist, but we must recognize when the resulting structure
  qualifies as a context. Forcing *Extend Context* to witness *Contextualize
  Trace* yields ***Recognize Context*** (`RecognizeContext`).
strata:
  - trace
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

Extensions exist, but we must recognize when the resulting structure qualifies as a context.  Forcing *Extend Context* to witness *Contextualize Trace* yields ***Recognize Context*** ([RecognizeContext](0037-recognize-context.md)).

The trace `(ExtendContext ContextualizeTrace)` feeds the general extension back through the named trace.  If the composition succeeds, the extended object lines up with the recorded context, so we call this recognition *Recognize Context*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
