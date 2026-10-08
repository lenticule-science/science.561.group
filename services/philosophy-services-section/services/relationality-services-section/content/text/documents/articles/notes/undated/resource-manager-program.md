---
title: Resource Manager Program
kind: structure
layer: program
status: someday
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
derives-from:
  - machine/structure/wiring-plan
description: Manages allocation and lifecycle of computational resources (compute/storage) under policy and topology constraints.
---

Manages allocation and lifecycle of computational resources (compute/storage)
under policy and topology constraints.

## Behaviour
- Accept resource requests; validate policy and placement.
- Allocate/deallocate resources; update recognitions; emit telemetry.
- Emit [`FailureCarrier`](../failure-carrier.md) on policy
  or placement violations.

## Invariants
- Allocations respect policy, topology, and traceability.
- State changes are auditable and reversible.
- Failures are recorded as failure carriers.

## Proof
Refines [WiringPlan](../wiring-plan.md) by specialising to
resource allocation wiring, preserving kernel failure semantics.
