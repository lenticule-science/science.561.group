---

name: testing-harness-program
kind: structure
layer: program
derived_from:
- machine/structure/wiring-plan
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
---

Executes tests against the kernel and program-layer services, wiring evaluation,
storage, and policy checks into repeatable test runs.

## Behaviour
- Load test recognitions (expected behaviours, fixtures).
- Execute runbooks under policy/topology constraints; compare outputs.
- Emit success recognitions or [`FailureCarrier`](docs/machine/structure/failure-carrier.md) on test failure.

## Invariants
- Tests run against earned structures/operators only.
- Results are traceable and reproducible.
- Failures include origin and violated recognitions.

## Proof
Refines [WiringPlan](docs/machine/structure/wiring-plan.md) by specialising to
test execution wiring, preserving kernel semantics and failure handling.
