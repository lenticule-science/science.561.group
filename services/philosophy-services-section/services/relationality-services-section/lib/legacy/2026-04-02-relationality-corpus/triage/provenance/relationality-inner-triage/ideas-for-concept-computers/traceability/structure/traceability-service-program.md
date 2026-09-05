---

name: traceability-service-program
kind: structure
layer: program
derived_from:
- machine/structure/wiring-plan
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
---

Provides APIs to query and update traceability DAGs, linking operations to
earned acts/specs.

## Behaviour
- Ingest traceability queries/updates; validate auth and policy.
- Resolve DAG nodes/edges; serve references to programs/services.
- Emit [`FailureCarrier`](docs/machine/structure/failure-carrier.md) on invalid
  queries or policy violations.

## Invariants
- Traceability data remains consistent and tamper-evident.
- Access is policy-controlled and auditable.
- Failures use failure carriers with provenance.

## Proof
Refines [WiringPlan](docs/machine/structure/wiring-plan.md) by specialising to
traceability wiring, preserving kernel semantics and failure handling.
