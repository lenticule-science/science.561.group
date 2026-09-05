---
title: Stochastic Analytics Program
id: markov-analytics-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---



Runs analytics based on relational Stochastic dynamics. It wires measurement,
policy, and topology recognitions to compute transition metrics and forecasts.

## Behaviour
- Ingest Stochastic state/transition recognitions as
  [Computer Recognition](./computer-recognition.md).
- Compute metrics (steady-state, mixing, entropy) via measurement algebra.
- Emit analytics results with traceability; emit [Computer Failure](./computer-failure.md)
  on invalid inputs or violated constraints.

## Invariants
- Metrics are computed only over earned Stochastic recognitions.
- Outputs are traceable to inputs; policy/topology respected.
- Failures are [`FailureCarrier`](./failure-carrier.md).

## Proof
Refines the documentation interpreter by specialising to Stochastic analytics wiring while
preserving kernel semantics and failure paths.
