---

name: data-catalog-program
kind: structure
layer: program
derived_from:
- machine/structure/wiring-plan
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
---

Orchestrates cataloguing of snapshots, contexts, lineage, and usage. Wires
storage, audit, and traceability recognitions into a catalog service.

## Behaviour
- Ingest snapshot metadata and validate against storage specs.
- Build lineage graphs from audit/traceability recognitions.
- Serve search/API with policy checks; emit telemetry.
- Emit [`FailureCarrier`](docs/machine/structure/failure-carrier.md) on schema
  mismatch or policy violation.

## Invariants
- Metadata matches actual snapshots.
- Lineage is consistent with audit/traceability records.
- Access is policy-controlled and traceable.

## Proof
Refines the machine [WiringPlan](docs/machine/structure/wiring-plan.md) by
specialising wiring to catalog recognitions and lineage construction, keeping
kernel failure semantics.
