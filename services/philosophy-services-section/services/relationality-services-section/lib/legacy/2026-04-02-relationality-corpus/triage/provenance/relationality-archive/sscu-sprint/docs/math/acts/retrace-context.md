---

name: retrace-context
act: RetraceContext
top: RecognizeContext
bottom: ContextualizeTrace
summary: A recognized context should resolve back into a trace. Consequently, *Recognize Context* witnesses *Contextualize Trace* to produce ***Retrace Context*** (`RetraceContext`).
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

A recognized context should resolve back into a trace.  Consequently, *Recognize Context* witnesses *Contextualize Trace* to produce ***Retrace Context*** ([RetraceContext](retrace-context.md)).

The act mirrors *Trace Context* and records the converse direction, so *Retrace Context* is forced.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
