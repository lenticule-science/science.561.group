---
title: Directed Space Compiler Program
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
# Directed Space Compiler Program

Compiles directed spaces, flows, and stratified sites for runtime and analytics
consumers. Wires directed-homotopy and stratified-site recognitions into
validated topology bundles.

## Behaviour
- Ingest strata definitions and coverage rules; validate directed morphisms.
- Compute flow/nucleus coherence and tower consistency; emit diagnostics.
- Export site bundles with traceability and topology metadata.
- Emit [`FailureCarrier`](docs/machine/structure/failure-carrier.md) on
  coherence or coverage violations.

## Invariants
- Flow and nucleus commute for each published stratum.
- Coverage families remain closed under pullback/composition.
- Exports are traceable to earned acts/specs.

## Proof
Refines the machine [WiringPlan](docs/machine/structure/wiring-plan.md) by
specialising wiring to directed-space compilation while preserving kernel
failure semantics.
