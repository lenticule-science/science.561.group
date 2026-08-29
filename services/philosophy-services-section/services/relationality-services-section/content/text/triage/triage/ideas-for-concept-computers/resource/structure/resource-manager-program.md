---
title: Resource Manager Program
kind: structure
layer: program
status: someday
derived_from:
- machine/structure/wiring-plan
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
---
# Resource Manager Program

Manages allocation and lifecycle of computational resources (compute/storage)
under policy and topology constraints.

## Behaviour
- Accept resource requests; validate policy and placement.
- Allocate/deallocate resources; update recognitions; emit telemetry.
- Emit [`FailureCarrier`](../../../../../documents/articles/notes/failure-carrier.md) on policy
  or placement violations.

## Invariants
- Allocations respect policy, topology, and traceability.
- State changes are auditable and reversible.
- Failures are recorded as failure carriers.

## Proof
Refines [WiringPlan](../../../../../documents/articles/notes/wiring-plan.md) by specialising to
resource allocation wiring, preserving kernel failure semantics.
