---
title: Coverage Runtime Type
id: coverage-runtime
role: structure
status: plan
proof_refs: []
derives-from: machine/structure/coverage-runtime
description: SDK-facing projection of the kernel Coverage Runtime Carrier exposing stable fields and failure signalling for programs.
---



SDK-facing projection of the kernel [Coverage Runtime Carrier](./coverage-runtime.md)
exposing stable fields and failure signalling for programs.

## Definition
- Fields:
  - `covers`: persistent map of cover identifiers to cover arrows.
  - `restrict`: stable API for invoking restriction with deterministic results or
    typed failure responses.
  - `overlaps`: read-only view of cached overlaps and their freshness tokens.
  - `matches`: stream/log of [Matching Family](./matching-family.md)
    witnesses available for gluing operators.
- Access patterns: all mutations go through transaction tokens; read operations
  are monotone and monotonic snapshots can be taken for program-layer reasoning.

## Invariants
- Backwards compatibility: field names and failure codes remain stable across
  kernel revisions.
- Safety: `restrict` returns either updated sections or explicit
  [FailureCarrier](./failure-carrier.md) payloads, never
  silent drops.
- Observability: snapshots expose provenance for auditing coverage propagation.

## Proof
- Derived from: [Coverage Runtime Carrier](./coverage-runtime.md)
  by freezing field names, failure channels, and access patterns for SDK use.
- Shows that: programs can orchestrate cover refinement, restriction, and
  matching/gluing without referencing machine internals directly.

## Earlier material

SDK-facing projection of the kernel [Coverage Runtime Carrier](coverage-runtime.md)
exposing stable fields and failure signalling for programs.

## Invariants
- Backwards compatibility: field names and failure codes remain active across
  kernel revisions.
- Safety: `restrict` returns either updated sections or explicit
  [FailureCarrier](failure-carrier.md) payloads, never
  silent drops.
- Observability: snapshots expose provenance for auditing coverage propagation.
