---
title: Dialetheia Recognition
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
aliases:
  - dialetheia-recognition
description: Recognises stable coexisting contradictions in a belief base.
---



Recognises stable coexisting contradictions in a belief base.

## Definition
- Inputs: a [Belief Base](../../../../../../../relationality-services-section/content/text/documents/articles/notes/belief-base.md).
- Output: recognition indicating presence of contradictions that persist under
  inference (paraconsistent truths).
- Behaviour: detect pairs of recognitions `p` and `¬p` both supported in the
  base; mark them as dialetheias.

## Invariants
- Persistence: dialetheias remain unless revision removes one side.
- Compatibility: integrates with recognition logic without triviality.

## Proof
- Uses: [Belief Base](../../../../../../../relationality-services-section/content/text/documents/articles/notes/belief-base.md) and the recognition lattice.
- Produces: [Recognition Carrier](../../../../structure/recognition.md) element
  marking contradictions.
- Shows that: paraconsistent coexistence can be recognised explicitly.
