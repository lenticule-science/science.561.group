---
title: Government Decisions Measurement Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program represents government decisions, policies, and impacts as recognitions so they can be traced and measured across domains.
---

This program represents government decisions, policies, and impacts as
recognitions so they can be traced and measured across domains.

## Behaviour

- Capture decisions (laws, regulations, budgets, permits), standing policies,
  vote records, and implementations as recognitions with provenance.
- Link decisions to affected recognitions (parcels, species, communities,
  institutions, budgets, contracts, health metrics) so downstream impacts can
  be traced.
- Attach measurement channels: implementation metrics (timeliness, completeness
  costs), outcome metrics (ecology, health, housing, emissions, mobility,
  safety), and process metrics (participation, transparency, appeals).

## Intended operators

- Evaluate a decision by gathering measurements and traceability.
- Compare decisions across topics/places/times.
- Trace impact from an observed change back to decisions and implementations.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
