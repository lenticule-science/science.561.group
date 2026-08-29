---
title: Canonical Representative Operator
id: canonical-representative-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Canonical Representative Operator

Given a recognition class, produce the most stable nucleus representative—a
normal form.

## Definition
- Inputs: recognition (possibly an equivalence class under nucleus).
- Output: canonical representative (e.g., minimal/most stable element) in the
  [Recognition Carrier](./recognition.md).
- Behaviour: apply nucleus and simplification rules to collapse redundancies.

## Invariants
- Idempotent: applying twice yields the same representative.
- Uniqueness: representatives are unique up to earned equivalence.

## Proof
- Uses: recognition lattice and nucleus to collapse to normal form.
- Produces: canonical recognition.
- Shows that: normal forms exist for earned recognition classes.
