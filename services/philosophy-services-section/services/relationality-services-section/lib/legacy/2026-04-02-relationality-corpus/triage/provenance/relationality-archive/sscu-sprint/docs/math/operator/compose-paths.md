---
name: compose-paths
role: operator
derived_from: machine/operator/path-compose-runtime
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



SDK-level function that invokes the kernel [Path Compose Runtime](../../../machine/operator/path-compose-runtime.md)
operator against the [Coverage Runtime Type](../type/coverage-runtime.md).

## Definition
- Inputs: two SDK path handles with aligned endpoints and a
  [Coverage Runtime Type](../type/coverage-runtime.md) instance providing covers
  and restriction APIs.
- Outputs: a composed path handle or a structured failure mirroring
  [FailureCarrier](../../../machine/structure/failure-carrier.md).
- Behaviour: validates endpoint and cover alignment, forwards to the kernel
  operator, and surfaces provenance/log tokens for downstream sheaf gluing.

## Preconditions
- Client holds read/write access to the supplied coverage runtime instance.
- Paths have been normalized to the same discretization parameters.

## Postconditions
- On success, the composed path handle is registered in the runtime `matches`
  log; on failure, no runtime mutation occurs except a failure entry.
- Returned handles reference stable SDK types without leaking kernel details.

## Proof
- Derived from: [Path Compose Runtime](../../../machine/operator/path-compose-runtime.md)
  by exposing its call signature and failure contracts as a stable SDK function.
- Shows that: programs can compose paths through the coverage runtime without
  bypassing computer-layer abstractions.
