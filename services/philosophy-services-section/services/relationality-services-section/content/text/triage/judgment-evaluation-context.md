---
title: Judgment Evaluation Context
id: judgment-evaluation-context
role: structure
status: plan
derived_from:
- acts/seed-evaluation-context
proof_refs: []
---



Evaluation frames for the judgment calculus, earned by `SeedEvaluationContext`
and `BuildEvaluationContext`.

## Components

- Carrier `EvalCtx` of frames with a single hole.
- Neutral frame `empty` from `SeedEvaluationContext`.
- Frame extension along the trace from `BuildEvaluationContext`.

## Proof

Sketch: generate frames by iterating `BuildEvaluationContext` from `empty`;
frames extend contexts along the trace with a unique hole.
