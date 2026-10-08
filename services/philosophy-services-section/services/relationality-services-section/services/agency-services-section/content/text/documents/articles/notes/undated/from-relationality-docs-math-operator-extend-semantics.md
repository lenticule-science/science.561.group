---
title: Extend Semantics
id: extend-semantics
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Applies controlled extensions to a computer wiring plan’s semantics (e.g., adding new annotations or derived edges) under explicit policy/trace constraints.
---



Applies controlled extensions to a computer wiring plan’s semantics (e.g.,
adding new annotations or derived edges) under explicit policy/trace
constraints.

## Definition
- Inputs: [Wiring Plan](../../../../../../../../content/text/documents/articles/notes/wiring-plan.md), [Evaluation State](../../../../../../../../content/text/documents/articles/notes/evaluation-state.md),
  current [Policy Regime](../../../../../../../../content/text/documents/articles/notes/policy-regime.md), and [Trace Carrier](../../../../../../../../content/text/documents/articles/notes/undated/trace.md).
- Outputs: updated wiring plan or [Failure Algebra](../../../../../../../../content/text/documents/articles/notes/failure-algebra.md) element.
- Behaviour:
  1. Validate proposed extensions (annotations, derived edges) against the
     wiring plan typing rules and policy constraints.
  2. For each extension, check acyclicity and port-type compatibility; reject
     those that violate constraints, recording failure with trace provenance.
  3. Acceptable extensions are added to the wiring plan with audit tags; the
     evaluation state’s ready queue is updated if new edges enable tasks.

## Invariants
- No arbitrary operator insertion; only permitted extensions/annotations.
- Acyclicity and typing preserved; failures on violation.
- Changes are explicit and auditable (trace-tagged).

## Proof
- Uses: wiring plan typing/acyclicity rules and policy regime constraints to
  filter extensions.
- Shows that: applying only admissible extensions preserves wiring plan
  invariants; violations are reported via the failure algebra without altering
  the plan.
