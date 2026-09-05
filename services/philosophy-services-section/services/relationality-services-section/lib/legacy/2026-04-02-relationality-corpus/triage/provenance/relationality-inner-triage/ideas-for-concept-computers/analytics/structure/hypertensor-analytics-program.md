---

name: hypertensor-analytics-program
kind: structure
layer: program
derived_from:
- machine/structure/wiring-plan
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
---

Runs analytics over quasicrystalline hypertensors: substitution dynamics,
pattern catalogues, and measurements (entropy, densities).

## Behaviour
- Maintain window/section carriers; apply substitution and flow/nucleus
  operators; schedule inflations.
- Index patterns; detect aperiodicity/relative-denseness issues.
- Compute measurements via measurement algebra; emit telemetry and exports.
- Emit [`FailureCarrier`](docs/machine/structure/failure-carrier.md) on
  coherence or measurement failures.

## Invariants
- Flow/nucleus commutation within tolerance.
- Pattern catalogue canonical; duplicates trigger alerts.
- Exports reference the exact substitution stage and traceability node.

## Proof
Refines the machine [WiringPlan](docs/machine/structure/wiring-plan.md) by
specialising to hypertensor analytics wiring, preserving failure semantics.
