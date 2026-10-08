---
title: Attention Filter
id: attention-filter
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Restricts epistemic states to those currently attended to by an agent.
---



Restricts epistemic states to those currently attended to by an agent.

## Definition
- Inputs: an [Epistemic Profile](../../../../../../../../content/text/documents/articles/notes/epistemic-profile.md) and an
  attention focus (implicit or earned from context).
- Output: filtered [Epistemic Profile](../../../../../../../../content/text/documents/articles/notes/epistemic-profile.md)
  containing only attended recognitions.
- Behaviour: apply an attention predicate to the epistemic recognitions.

## Invariants
- Monotone: attention filtering narrows possibilities.
- Compositional: sequential filters intersect attention sets.

## Proof
- Uses: [Epistemic Profile](../../../../../../../../content/text/documents/articles/notes/epistemic-profile.md).
- Produces: filtered [Epistemic Profile](../../../../../../../../content/text/documents/articles/notes/epistemic-profile.md).
- Shows that: attention can be modelled as a restriction on epistemic state.
