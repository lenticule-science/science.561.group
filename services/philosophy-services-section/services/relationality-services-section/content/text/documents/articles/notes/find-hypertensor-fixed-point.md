---
title: Find Hypertensor Fixed Point
id: find-hypertensor-fixed-point
role: operator
status: plan
derived_from:
- acts/ensure-fixed-point
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



The **Find Hypertensor Fixed Point** operator computes a fixed point of a
composed hypertensor dynamics endomorphism.

## Definition
- Input: a composite of hypertensor endomorphisms.
- Output: a fixed endomorphism/section representing a stationary state.
- Behaviour: applies fixed-point machinery to the endomorphism monoid to find a
  stabilised element.

## Invariants
- Fixed point is nucleus-equivalent to any other earned fixed point under the
  same dynamics.
- Respects sheaf structure and tower/modal constraints.

## Proof
By `acts/ensure-fixed-point`, fixed points exist for the earned endomorphism
compositions under the given conditions. This operator packages that fixed-point
computation over the hypertensor sheaf.
