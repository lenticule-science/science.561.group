---
title: Judgement Equivalence
id: judgement-equivalence
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Judgement Equivalence

The judgemental lift of observation equivalence: typing contexts respect CIU
behaviour via judgement equivalence.

## Definition
- Inputs/Outputs: typing judgements within the earned [Judgment Triad](../structure/judgment-triad.md).
- Behaviour: two judgements are equivalent when their observations are
  contextually indistinguishable via [Observation Equivalence](observation-equivalence.md)
  and typing contexts respect that equivalence.

## Invariants
- Contextual indistinguishability extended to typing judgements.
- Witnessed by normalized/witness acts.

## Proof
- Uses: [Observation Equivalence](observation-equivalence.md) as the base CIU
  relation on observations.
- Shows that: lifting observation equivalence to judgements yields typing
  equivalence respecting contextual indistinguishability.
