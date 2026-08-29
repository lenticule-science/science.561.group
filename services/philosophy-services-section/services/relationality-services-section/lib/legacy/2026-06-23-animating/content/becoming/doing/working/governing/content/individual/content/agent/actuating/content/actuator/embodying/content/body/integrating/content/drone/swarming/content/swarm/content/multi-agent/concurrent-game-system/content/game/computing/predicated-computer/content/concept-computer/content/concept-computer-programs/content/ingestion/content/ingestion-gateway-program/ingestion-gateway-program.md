---
title: Ingestion Gateway Program
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
# Ingestion Gateway Program

Gateway program for ingesting external data into the relational machine. It
normalises, validates, and routes intake through policy and topology checks.

## Behaviour
- Accept input streams; normalise payloads to recognition carriers.
- Apply policy/intake rules; reject or enrich with traceability.
- Route valid recognitions to downstream modules via wiring plan.
- Emit [`FailureCarrier`](docs/machine/structure/failure-carrier.md) on invalid
  schema, policy violation, or routing error.

## Invariants
- All ingested data is validated, policy-compliant, and traceable.
- Routing respects topology and wiring constraints.
- Failures are reported as failure carriers.

## Proof
Refines [WiringPlan](docs/machine/structure/wiring-plan.md) by specialising to
ingestion wiring and intake checks, preserving kernel failure semantics.
