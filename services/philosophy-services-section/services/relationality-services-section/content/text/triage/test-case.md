---
title: Test Case
id: test-case
role: structure
status: plan
derived_from: math/structure/trace
proof_refs: []
---



Finite traces/contexts/program fragments built using the earned evaluation
state and step operators. Each test case is a valid relational program
fragment.

## Definition
- Carrier: a finite [Trace Carrier](../math/structure/trace.md)
  fragment with associated contexts/program steps to execute for validation.
- Fields: initial context/state, sequence of steps, expected observations or
  equivalences.

## Invariants
- Well-formed: steps are admissible under earned evaluation semantics.
- Finite: bounded length to admit execution/verification.
- Deterministic expectation: expected outcomes are defined up to earned
  equivalence.

## Proof
- Derived from: [Trace Carrier](../math/structure/trace.md), using its
  sequencing to define test traces.
- Shows that: defining tests as finite trace fragments yields executable test
  cases aligned with earned evaluation semantics.
