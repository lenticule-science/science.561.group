---
title: Gate Recognition
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Recognitions that unlock access to a subprofile or modal layer.

## Definition
- Elements: recognitions in the [Recognition Carrier](recognition.md)
  that satisfy constraints of a [Norm Regime](norm-regime.md) or modal gate.
- Role: eligibility tokens for entering restricted disciplines/modal layers.

## Invariants
- Soundness: only admissible recognitions are gates.
- Stability: gates remain valid under allowed flow/nucleus within the gate’s
  context.

## Proof
- Uses: recognition carrier and norm regime to define gating predicate.
- Shows that: access control can be expressed recognitionally.
