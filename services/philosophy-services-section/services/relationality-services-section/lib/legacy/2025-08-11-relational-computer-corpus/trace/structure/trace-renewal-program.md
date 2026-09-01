---

name: trace-renewal-program
layer: program
derived_from:
- machine/structure/wiring-plan
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
---

Maintains and renews traces over time: rolling windows, pruning, and
re-attestation of recognitions.

## Behaviour
- Identify traces needing renewal; validate policy and topology scopes.
- Re-attest recognitions, prune obsolete links, and persist updated trace
  snapshots.
- Emit [`FailureCarrier`](docs/machine/structure/failure-carrier.md) on
  inconsistencies or policy violations.

## Invariants
- Renewed traces remain consistent and traceable to acts/specs.
- Policy and placement constraints are respected.
- Failures are captured as failure carriers.

## Proof
Refines [WiringPlan](docs/machine/structure/wiring-plan.md) by specialising to
trace renewal wiring, preserving kernel semantics and failure handling.
