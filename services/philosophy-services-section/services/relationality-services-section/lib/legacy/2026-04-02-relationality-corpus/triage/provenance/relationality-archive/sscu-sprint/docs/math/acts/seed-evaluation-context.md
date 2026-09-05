---

name: seed-evaluation-context
act: SeedEvaluationContext
top: HeadTrace
bottom: StepTrace
summary: '*Step Trace* propagates reductions but leaves their framing unspecified. Forcing *Head Trace* to witness *Step Trace* yields ***Seed Evaluation Context*** (`SeedEvaluationContext`).'
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

*Step Trace* propagates reductions but leaves their framing unspecified.  Forcing *Head Trace* to witness *Step Trace* yields ***Seed Evaluation Context*** ([SeedEvaluationContext](seed-evaluation-context.md)).

The head observing the step trace captures the first evaluation frame, so this earns *Seed Evaluation Context*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
