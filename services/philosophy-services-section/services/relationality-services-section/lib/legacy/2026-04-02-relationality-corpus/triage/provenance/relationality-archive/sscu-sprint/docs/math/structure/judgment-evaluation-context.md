---
name: judgment-evaluation-context
role: structure
derived_from:
- acts/seed-evaluation-context
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
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
