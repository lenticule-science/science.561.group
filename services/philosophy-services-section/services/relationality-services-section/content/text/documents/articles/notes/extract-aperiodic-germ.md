---
title: Extract Aperiodic Germ
id: extract-aperiodic-germ
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Extracts a minimal aperiodic window that can generate a global section.

## Definition
- Inputs: a [Hypertensor Section](./hypertensor-section.md) with
  aperiodic features.
- Output: [Aperiodic Germ](./aperiodic-germ.md).
- Behaviour: search for minimal windows exhibiting aperiodicity sufficient for
  reconstruction; validate via sheaf gluing.

## Invariants
- Minimality: produced germ cannot be shrunk further.
- Reconstruction: germ extends to the original section via sheaf/coverage rules.

## Proof
- Uses: section/window coverage and aperiodicity checks.
- Produces: minimal germ.
- Shows that: aperiodic seeds can be extracted for reconstruction.
