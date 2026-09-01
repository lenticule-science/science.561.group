---
title: Seeding Evaluation Context
act: SeedEvaluationContext
index: 74
top: HeadTrace
bottom: StepTrace
summary: >-
  *Step Trace* propagates reductions but leaves their framing unspecified.
  Forcing *Head Trace* to witness *Step Trace* yields ***Seed Evaluation
  Context*** (`SeedEvaluationContext`).
strata:
  - term
phase: free
keywords:
  - act
---

## Interpretation

*Step Trace* propagates reductions but leaves their framing unspecified.  Forcing *Head Trace* to witness *Step Trace* yields ***Seed Evaluation Context*** ([SeedEvaluationContext](./0074-seed-evaluation-context.md)).

The head observing the step trace captures the first evaluation frame, so this earns *Seed Evaluation Context*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
