---
name: extend-semantics
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Applies controlled extensions to a computer wiring plan’s semantics (e.g.,
adding new annotations or derived edges) under explicit policy/trace
constraints.

## Definition
- Inputs: [Wiring Plan](../structure/wiring-plan.md), [Evaluation State](../structure/evaluation-state.md),
  current [Policy Regime](../structure/policy-regime.md), and [Trace Carrier](../structure/trace.md).
- Outputs: updated wiring plan or [Failure Algebra](../structure/failure-algebra.md) element.
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
