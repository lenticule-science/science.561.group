---
title: Recognition Operator
keywords:
  - recognition
  - operator
  - normalization
  - policy
layer: internal-theorem
status: plan
depends_on:
  - theorem/internal/recognition-carrier-structure
  - theorem/internal/normalization-reducibility
  - theorem/internal/policy-stack
  - theorem/internal/trace-infrastructure
  - acts/recognize-observation
  - acts/recognize-judgement-triad
  - acts/recognize-context
---

Fix the earned structure [Recognition Carrier Structure](recognition-carrier-structure.md) and the normalization results from [Normalization and Reducibility](normalization-reducibility.md).

For each recognition act `φ ∈ {RecognizeObservation, RecognizeJudgementTriad, RecognizeContext}` and each policy regime `π` (from [Policy Stack](policy-stack.md)), there exists a partial operator

```text
Recognize_{φ,π} : State ⇀ RecognitionCarrier
```

with the following earned properties whenever `Recognize_{φ,π}(r) = x` is defined:

1. **Soundness.** `π_state(x) = r`.
  The trace `π_trace(x)` is an admissible derivation of the judgement “`φ` holds of `(r, π_payload(x))` under policy `π`”, and normalization places `r` in the same equivalence class as the state carried by the trace.

2. **Idempotence on carriers.** Re-applying `Recognize_{φ,π}` to `r` yields `y` with `π_payload(y) = π_payload(x)` and `ExtendsTrace(x, y)` and/or `RefinesPolicy(x, y)`.

3. **Policy monotonicity.** If `π_policy(y)` refines `π` and `Recognize_{φ,π_policy(y)}(r)` is defined, then `Recognize_{φ,π}(r)` is also defined with the same payload.

This operator is the unique earned map from `State` to `RecognitionCarrier` consistent with the recognition acts, normalization, the trace infrastructure, and the policy order.
