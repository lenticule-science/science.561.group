---
type: question
status: open
explores:
  - teaching/explanations/effect.md
  - teaching/explanations/capability.md
  - teaching/explanations/function.md
see-also:
  - references/moggi1991.md
  - references/wadler1992.md
  - references/miller2006.md
---

# At what granularity should the effect system track effects?

The subtheory's [effect](teaching/explanations/effect.md) concept presents an effect as a typed annotation on the function arrow, drawing on Moggi's monadic discipline (per [Moggi 1991](references/moggi1991.md)) and Wadler's effect-row presentation (per [Wadler 1992](references/wadler1992.md)). The presentation is open over the *granularity* at which effects are tracked: per-effect-row, per-region, per-capability, or hybrid.

## Statement

> What is the *substrate-level structural fact* that fixes the granularity at which the effect system tracks effects, and how does the granularity choice interact with the [capability](teaching/explanations/capability.md) discipline?

## Partial decomposition

The question splits into:

- **(P1) Per-effect-row granularity.** Effects are tracked as rows of named effects on the arrow type: `Int -> [Read, Write] Int`. The discipline is Wadler-Thiemann-style; the substrate's witness records the effect set per call. Strengths: simple type-level reasoning. Weaknesses: cannot distinguish *which file* a `Write` writes to; cannot express *bounded* effects.
- **(P2) Per-region granularity.** Effects are tracked per declared region: `Int -> [Read@r1, Write@r2] Int`. Regions are first-class; effects are scoped to their regions; region inference (Tofte-Talpin) computes the minimum-region annotation. Strengths: scope discipline aligns with the substrate's scope discipline. Weaknesses: region inference is heavier than HM type inference.
- **(P3) Per-capability granularity.** Effects are tracked by capability: a function's effect is *exactly* the closure of capabilities it can exercise (per [Miller 2006](references/miller2006.md)). Strengths: aligns directly with [capability-non-amplification](../theorems/capability-non-amplification.md) and the substrate's modal-restriction discipline; effect = capability-set is structurally the same fact at two registers. Weaknesses: requires the engineer to think in capability terms throughout, including for "innocuous" effects (logging, timestamping).
- **(P4) Hybrid.** Effects are tracked at multiple granularities: a coarse per-row classification at the arrow level (for type inference) and a fine per-capability annotation at the implementation level (for authority discipline). The two granularities are reconciled by a derivation rule: row-effect $e$ is admitted iff some capability admits $e$.

## What is established

- The per-effect-row presentation (P1) is the lowest-cost discipline for type inference and is what the existing [effect](teaching/explanations/effect.md) note describes by default.
- The per-capability presentation (P3) is structurally aligned with [capability-non-amplification](../theorems/capability-non-amplification.md): both read as the same modal-restriction discipline.
- The hybrid presentation (P4) is what the [roc example](../examples/roc.md)'s platform-passing model approximates in working practice (a coarse `Effect a` row with platform capabilities providing fine authority).

## What remains open

- Which granularity the subtheory commits to (and whether the commitment is uniform or per-runtime).
- Whether the effect-row $\to$ capability-set derivation rule (P4) is a structural identity or a contingent design choice.
- How the granularity choice interacts with [federation-convergence](../../../theorems/federation-convergence.md): two substrates federating with different granularities must agree on what each side's effect annotations *mean*.
