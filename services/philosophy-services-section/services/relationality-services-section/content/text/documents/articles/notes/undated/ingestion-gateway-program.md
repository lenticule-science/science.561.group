---
title: Ingestion Gateway Program
kind: structure
layer: program
status: someday
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
derives-from:
  - machine/structure/wiring-plan
description: Gateway program for ingesting external data into the relational machine.
---

Gateway program for ingesting external data into the relational machine. It
normalises, validates, and routes intake through policy and topology checks.

## Behaviour
- Accept input streams; normalise payloads to recognition carriers.
- Apply policy/intake rules; reject or enrich with traceability.
- Route valid recognitions to downstream modules via wiring plan.
- Emit [`FailureCarrier`](../failure-carrier.md) on invalid
  schema, policy violation, or routing error.

## Invariants
- All ingested data is validated, policy-compliant, and traceable.
- Routing respects topology and wiring constraints.
- Failures are reported as failure carriers.

## Proof
Refines [WiringPlan](../wiring-plan.md) by specialising to
ingestion wiring and intake checks, preserving kernel failure semantics.
