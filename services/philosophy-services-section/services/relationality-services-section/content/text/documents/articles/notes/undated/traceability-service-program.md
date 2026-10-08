---
title: Traceability Service Program
kind: structure
layer: program
status: someday
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
derives-from:
  - machine/structure/wiring-plan
description: Provides APIs to query and update traceability DAGs, linking operations to earned acts/specs.
---

Provides APIs to query and update traceability DAGs, linking operations to
earned acts/specs.

## Behaviour
- Ingest traceability queries/updates; validate auth and policy.
- Resolve DAG nodes/edges; serve references to programs/services.
- Emit [`FailureCarrier`](../failure-carrier.md) on invalid
  queries or policy violations.

## Invariants
- Traceability data remains consistent and tamper-evident.
- Access is policy-controlled and auditable.
- Failures use failure carriers with provenance.

## Proof
Refines [WiringPlan](../wiring-plan.md) by specialising to
traceability wiring, preserving kernel semantics and failure handling.
