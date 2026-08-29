---
title: Compute Attracting Basin
id: compute-attracting-basin
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Compute Attracting Basin

Computes the basin of recognitions converging to a fixed shape.

## Definition
- Inputs: an attractor recognition/shape, flow rules, and nucleus.
- Output: [Recognition Attracting Basin](./attracting-basin.md)
  containing recognitions that converge to the attractor.
- Behaviour: iterate flow/nucleus from candidate states; include those that
  converge to the target.

## Invariants
- Correctness: basin includes all and only recognitions converging to target.
- Stability: basin closed under flow/nucleus toward attractor.

## Proof
- Uses: flow dynamics and nucleus convergence.
- Produces: attracting basin.
- Shows that: basins are computable from attractors.
