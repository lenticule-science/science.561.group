---
title: Obligation Operator
id: obligation-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Given a norm regime and a recognition, produce the obligation it imposes.
---



Given a norm regime and a recognition, produce the obligation it imposes.

## Definition
- Inputs: [Norm Regime](./norm-regime.md) and a recognition in the
  [Recognition Carrier](./recognition.md).
- Output: recognition representing the minimal action/condition required to
  avoid violation.
- Behaviour: map each recognition to the closest admissible recognition under
  the regime (interior/closure depending on discipline/filter).

## Invariants
- Soundness: satisfying the obligation implies compliance with the regime.
- Minimality: obligation is least among admissible recognitions above the input.
- Monotonicity: strengthening the regime tightens obligations.

## Proof
- Uses: [Norm Regime](./norm-regime.md) as policy and
  [Recognition Carrier](./recognition.md) as domain/codomain.
- Shows that: obligations can be expressed as recognition-level operators
  consistent with the lattice/logic structure.

## Earlier material

## Definition
- Inputs: [Norm Regime](norm-regime.md) and a recognition in the
  [Recognition Carrier](../../../structure/recognition.md).
- Output: recognition representing the minimal action/condition required to
  avoid violation.
- Behaviour: map each recognition to the closest admissible recognition under
  the regime (interior/closure depending on discipline/filter).

## Proof
- Uses: [Norm Regime](norm-regime.md) as policy and
  [Recognition Carrier](../../../structure/recognition.md) as domain/codomain.
- Shows that: obligations can be expressed as recognition-level operators
  consistent with the lattice/logic structure.
