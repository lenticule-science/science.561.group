---
title: Topology Integration Program
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
# Topology Integration Program

Integrates topology/placement constraints (strata, coverage) across programs.
Validates and distributes placement metadata to consumers.

## Behaviour
- Ingest topology recognitions; validate coverage/discipline filters.
- Distribute placement/ordering constraints to dependent programs.
- Emit [`FailureCarrier`](../../../../../documents/articles/notes/failure-carrier.md) on invalid
  constraints.

## Invariants
- Topology constraints respect earned tower/sheaf rules.
- Distributed metadata is traceable and policy-controlled.
- Failures are recorded as failure carriers.

## Proof
Refines [WiringPlan](../../../../../documents/articles/notes/wiring-plan.md) by specialising to
topology constraint wiring, preserving kernel failure semantics.
