---
title: Deployment & Upgrade Program
kind: structure
layer: program
status: someday
uses:
- machine/structure/snapshot
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
derives-from:
  - machine/structure/wiring-plan
description: Wires kernel operators into an acyclic plan for deploying, upgrading, and rolling back modules while preserving earned invariants.
---

Wires kernel operators into an acyclic plan for deploying, upgrading, and
rolling back modules while preserving earned invariants.

## Behaviour
- Validate artifacts and policies before rollout; capture pre-upgrade snapshots.
- Drain traffic, roll out new versions, resync state; monitor telemetry.
- Validate topology constraints; run smoke tests; log traceability.
- Emit [`FailureCarrier`](../failure-carrier.md) on policy,
  telemetry, or integrity failures.

## Invariants
- No rollout without passing tests/policies and traceability reference.
- Snapshots enable rollback; topology constraints are respected.
- Telemetry confirms SLOs throughout the rollout.

## Proof
Refines the machine [WiringPlan](../wiring-plan.md) by
specialising wiring to deployment tasks over snapshots and policy recognitions,
preserving failure semantics and acyclicity.
