---
title: Noninterference Theorem
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Theorem-level structure asserting that information-flow constraints enforce
noninterference between high and low channels/ports.

## Definition
- Premise: labelled channels/ports and an
  [Information Flow Constraint](info-flow-constraint.md) validated by
  [Check Noninterference](../operator/check-noninterference.md).
- Claim: low-observable outputs are independent of high inputs.

## Invariants
- Security: no illicit flow from high to low.
- Compositional: holds under composition of compliant channel networks.

## Proof
- Uses: constraint validation to show observational equivalence for low outputs
  regardless of high inputs.
- Shows that: the policy enforces noninterference at the math level, aligning
  with security requirements for runtime.
