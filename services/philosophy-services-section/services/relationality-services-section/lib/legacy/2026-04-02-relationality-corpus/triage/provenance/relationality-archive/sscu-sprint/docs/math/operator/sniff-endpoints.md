---
name: sniff-endpoints
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



Discovers and validates exposed endpoints/ports in a computer wiring plan.

## Definition
- Inputs: [Wiring Plan](../structure/wiring-plan.md) and ambient
  [Policy Regime](../structure/policy-regime.md).
- Outputs: annotated wiring plan with endpoint metadata, or
  [Failure Algebra](../structure/failure-algebra.md) element on invalid/unknown
  endpoints.
- Behaviour: traverses the plan to identify source/sink ports, validates their
  types/policies, and annotates them; emits failure for mismatches or missing
  bindings.

## Invariants
- Read-only: does not alter plan topology beyond annotations.
- Typing/policy enforced; failures surfaced explicitly.

## Proof
- Uses: [Recognition](recognition-api.md) of endpoint port metadata against the
  policy regime to decide validity.
- Shows that: identifying and validating endpoints is a read-only analysis of
  the wiring plan, producing annotations or failures without altering topology.
