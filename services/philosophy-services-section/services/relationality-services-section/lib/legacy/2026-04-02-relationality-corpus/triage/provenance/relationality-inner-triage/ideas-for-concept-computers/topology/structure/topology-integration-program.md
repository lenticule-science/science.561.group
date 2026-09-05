---

name: topology-integration-program
kind: structure
layer: program
derived_from:
- machine/structure/wiring-plan
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
---

Integrates topology/placement constraints (strata, coverage) across programs.
Validates and distributes placement metadata to consumers.

## Behaviour
- Ingest topology recognitions; validate coverage/discipline filters.
- Distribute placement/ordering constraints to dependent programs.
- Emit [`FailureCarrier`](docs/machine/structure/failure-carrier.md) on invalid
  constraints.

## Invariants
- Topology constraints respect earned tower/sheaf rules.
- Distributed metadata is traceable and policy-controlled.
- Failures are recorded as failure carriers.

## Proof
Refines [WiringPlan](docs/machine/structure/wiring-plan.md) by specialising to
topology constraint wiring, preserving kernel failure semantics.
