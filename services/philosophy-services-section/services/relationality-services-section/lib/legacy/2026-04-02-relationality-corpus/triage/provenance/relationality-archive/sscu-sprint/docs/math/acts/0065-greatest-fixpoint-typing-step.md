---
name: 0065-greatest-fixpoint-typing-step
act: GreatestFixpointTypingStep
index: 65
top: TraceContext
bottom: GreatestFixpointTypeSeed
summary: >-
  As before, this guarantee must persist along the entire trace. Thus *Trace
  Context* witnesses *Greatest Fixpoint Type Seed* to produce ***Greatest
  Fixpoint Typing Step*** (`GreatestFixpointTypingStep`).
strata:
  - term
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

As before, this guarantee must persist along the entire trace.  Thus *Trace Context* witnesses *Greatest Fixpoint Type Seed* to produce ***Greatest Fixpoint Typing Step*** ([GreatestFixpointTypingStep](0065-greatest-fixpoint-typing-step.md)).

The composition threads the maximal guarantee through the trace, forcing *Greatest Fixpoint Typing Step*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
