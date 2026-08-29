---
title: Compute Section Normal Form
id: compute-section-normal-form
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Compute Section Normal Form

Computes the canonical normal form of a hypertensor section.

## Definition
- Inputs: a [Hypertensor Section](./hypertensor-section.md).
- Output: its [Section Normal Form](./section-normal-form.md).
- Behaviour: apply nucleus collapses and simplification rules until fixed; emit
  canonical representative.

## Invariants
- Idempotent and unique up to earned equivalence.
- Deterministic given the section.

## Proof
- Uses: nucleus and simplification rules.
- Produces: normal form.
- Shows that: normalization terminates and yields a canonical form.
