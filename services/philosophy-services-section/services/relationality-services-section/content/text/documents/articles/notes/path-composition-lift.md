---
title: Path Composition Lift
id: path-composition-lift
role: operator
status: plan
derived_from: math/operator/path-compose
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Parameterized lift of [Path Compose](./path-compose.md)
that fixes interval discretizations, metrics, or step bounds so concatenation is
programmable inside calculus flows.

## Definition
- Parameters: subdivision of the unit interval, tolerance for reparameterization,
  and a chosen metric on contexts so path concatenation remains well-formed.
- Inputs: two parameterized paths (as parameterized sections/curves) with
  aligned endpoints and compatible step counts.
- Outputs: a parameterized composite path following the concatenation then
  resampling to the fixed subdivision.
- Behaviour: reindexes both inputs to the shared subdivision, concatenates, then
  contracts via homotopies encoded in the upstream math operator.

## Invariants
- Endpoint preservation: start/endpoints match those of the operands.
- Subdivision stability: resampling respects monotonicity and does not create
  spurious backtracking.
- Compatibility: composition commutes with restriction to subcovers and with
  path reversal when available.

## Proof
- Derived from: [Path Compose](./path-compose.md) by
  fixing computational parameters for intervals and metrics.
- Shows that: the abstract homotopical composition can be executed in calculus
  settings where discretization and reparameterization are explicit.
