---
name: computer-failure
role: structure
derived_from: machine/structure/failure-carrier
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: typed failures exposed at the computer layer, derived from the machine [Failure Carrier](../machine/structure/failure-carrier.md).
- Fields (concrete at the computer layer):
  - `failure_id` (string/UUID): unique identifier for this failure event.
  - `kind` (enum string): one of `input-missing`, `type-mismatch`, `reduction-undefined`, `policy-violation`, `integrity-failure`, or implementation-defined subcodes.
  - `origin` (object `{operator, step_id, plan_ref}`): where the failure arose.
  - `inputs_digest` (string/SHA-256 hex): digest over the offending inputs.
  - `diagnostics` (array of strings/objects): human/machine-readable hints.
  - `timestamp` (string, ISO-8601 UTC): when the failure was emitted.
- Purpose: surface machine failures to programs/SDKs in a stable, inspectable format with enough metadata for audit and replay.

## Invariants
- Failure kinds, origins, and diagnostics mirror machine failures; no additional failure semantics are introduced.
- Integrity: `inputs_digest` must match the bound inputs at the time of failure.
- Propagates through computer operators as alternate outputs; no state mutation beyond failure slot population.

## Proof
- Derived from: [Machine Failure Carrier](../machine/structure/failure-carrier.md).
- Shows that: carrying failures at the computer layer preserves machine diagnostics while enabling program-level handling.
