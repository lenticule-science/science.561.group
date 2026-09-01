---
title: Aperiodic Extension
id: aperiodic-extension
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Extends an aperiodic germ to the largest aperiodic window consistent with
discipline.

## Definition
- Inputs: an [Aperiodic Germ](./aperiodic-germ.md).
- Output: extended [Hypertensor Section](./hypertensor-section.md)
  covering maximal aperiodic region.
- Behaviour: apply flow/nucleus to grow the germ while preserving aperiodicity
  and admissibility.

## Invariants
- Maximality: extension reaches largest admissible aperiodic domain.
- Stability: remains aperiodic and sheaf-compatible.

## Proof
- Uses: germ, flow, and nucleus to extend.
- Produces: extended section.
- Shows that: aperiodic regions can be maximally extended from a germ.
