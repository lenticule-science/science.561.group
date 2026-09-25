---
title: Observe Judgment
id: observe-judgment
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from:
  - acts/observe-judgement
description: The Observe Judgment operator witnesses judgment classifications through the observation layer.
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
Derived from [`acts/observe-judgement`](./observe-judgement.md),
which ensures observed witnesses match the stabilized judgment classification.

## Earlier material

## Proof
Derived from [`acts/observe-judgement`](observe-judgement.md),
which ensures observed witnesses match the stabilized judgment classification.
