---
title: Dialetheia Recognition
id: dialetheia-recognition
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Recognises stable coexisting contradictions in a belief base.
---



Recognises stable coexisting contradictions in a belief base.

## Definition
- Inputs: a [Belief Base](./belief-base.md).
- Output: recognition indicating presence of contradictions that persist under
  inference (paraconsistent truths).
- Behaviour: detect pairs of recognitions `p` and `¬p` both supported in the
  base; mark them as dialetheias.

## Invariants
- Persistence: dialetheias remain unless revision removes one side.
- Compatibility: integrates with recognition logic without triviality.

## Proof
- Uses: [Belief Base](./belief-base.md) and the recognition lattice.
- Produces: [Recognition Carrier](./recognition.md) element
  marking contradictions.
- Shows that: paraconsistent coexistence can be recognised explicitly.
