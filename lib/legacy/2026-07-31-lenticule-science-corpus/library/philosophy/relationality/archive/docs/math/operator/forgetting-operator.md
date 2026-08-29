---
title: Forgetting Operator
id: forgetting-operator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Forgetting Operator

Performs controlled loss of detail: projects recognitions onto persistent
profiles and drops ephemeral parts.

## Definition
- Inputs: [Temporal Recognizers](../structure/temporal-recognizer.md) and
  [Persistent Recognition Carrier](../structure/persistent-recognition.md).
- Output: pruned [Temporal Recognizers](../structure/temporal-recognizer.md)
  retaining only persistent components.
- Behaviour: identify non-persistent details, discard them, and stabilise the
  remaining recognitions.

## Invariants
- Safety: persistent/core recognitions are preserved.
- Monotonic loss: forgetting only removes detail; never adds information.

## Proof
- Uses: temporal recognizers and persistent carriers to decide what to keep.
- Produces: pruned temporal recognizers.
- Shows that: forgetting can be formalised as projection onto persistent
  profiles.
