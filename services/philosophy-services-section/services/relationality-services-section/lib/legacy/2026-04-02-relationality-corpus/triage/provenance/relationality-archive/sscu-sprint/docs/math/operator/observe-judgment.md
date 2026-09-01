---
name: observe-judgment
role: operator
derived_from:
- acts/observe-judgement
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



The **Observe Judgment** operator witnesses judgment classifications through the
observation layer.

## Definition
- Input: a judgment triad with witnesses.
- Output: a judgment triad whose witnesses are observable.
- Behaviour: applies the observe-judgment act to ensure witnesses are visible
  through the fixed observation layer.

## Invariants
- Witnesses are consistent with stabilized observation.
- Judgments remain within the triad carrier.

## Proof
Derived from [`acts/observe-judgement`](docs/math/acts/observe-judgement.md),
which ensures observed witnesses match the stabilized judgment classification.
