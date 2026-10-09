---
title: Directed Space Compiler Program
kind: structure
layer: program
status: someday
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
derives-from:
  - machine/structure/wiring-plan
description: Compiles directed spaces, flows, and stratified sites for runtime and analytics consumers.
---

Compiles directed spaces, flows, and stratified sites for runtime and analytics
consumers. Wires directed-homotopy and stratified-site recognitions into
validated topology bundles.

## Behaviour
- Ingest strata definitions and coverage rules; validate directed morphisms.
- Compute flow/nucleus coherence and tower consistency; emit diagnostics.
- Export site bundles with traceability and topology metadata.
- Emit [`FailureCarrier`](../failure-carrier.md) on
  coherence or coverage violations.

## Invariants
- Flow and nucleus commute for each published stratum.
- Coverage families remain closed under pullback/composition.
- Exports are traceable to earned acts/specs.

## Proof
Refines the machine [WiringPlan](../wiring-plan.md) by
specialising wiring to directed-space compilation while preserving kernel
failure semantics.
