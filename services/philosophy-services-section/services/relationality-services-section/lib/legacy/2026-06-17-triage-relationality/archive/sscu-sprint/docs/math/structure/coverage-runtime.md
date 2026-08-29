---
title: Coverage Runtime Type
role: structure
derived_from: machine/structure/coverage-runtime
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



SDK-facing projection of the kernel [Coverage Runtime Carrier](../../../machine/structure/coverage-runtime.md)
exposing stable fields and failure signalling for programs.

## Definition
- Fields:
  - `covers`: persistent map of cover identifiers to cover arrows.
  - `restrict`: stable API for invoking restriction with deterministic results or
    typed failure responses.
  - `overlaps`: read-only view of cached overlaps and their freshness tokens.
  - `matches`: stream/log of [Matching Family](../../../math/structure/matching-family.md)
    witnesses available for gluing operators.
- Access patterns: all mutations go through transaction tokens; read operations
  are monotone and monotonic snapshots can be taken for program-layer reasoning.

## Invariants
- Backwards compatibility: field names and failure codes remain active across
  kernel revisions.
- Safety: `restrict` returns either updated sections or explicit
  [FailureCarrier](../../../machine/structure/failure-carrier.md) payloads, never
  silent drops.
- Observability: snapshots expose provenance for auditing coverage propagation.

## Proof
- Derived from: [Coverage Runtime Carrier](../../../machine/structure/coverage-runtime.md)
  by freezing field names, failure channels, and access patterns for SDK use.
- Shows that: programs can orchestrate cover refinement, restriction, and
  matching/gluing without referencing machine internals directly.
