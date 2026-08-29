---
name: 0080-step-recognition
act: StepRecognition
index: 80
slug: step-recognition
top: BuildEvaluationContext
bottom: Reduce
summary: >-
  To attach reductions to evaluation frames, the act *Build Evaluation
  Context* witnesses the act *Reduce*.
strata:
  - observation
phase: free
keywords:
  - act
part-of: relational-computer
computer-system-type: primitive
---

## Interpretation

To attach reductions to evaluation frames, the act *Build Evaluation Context* witnesses the act *Reduce*.

In `(BuildEvaluationContext Reduce)` the evaluation context observes the reduction, so this act rightly earns the name *Step Recognition*.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
