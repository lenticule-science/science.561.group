---
title: Save Persistent Context
keywords:
  - storage
  - context
layer: internal-theorem
status: plan
claims:
  - type: operator
    judgement: "save_context : PersistentContextCarrier → (PersistentContext, BaselineRemainder, PersistentRecognitionCarrier)"
depends-on:
  - math/structure/persistent-context-carrier
  - math/structure/persistent-recognition
  - acts/baseline-limit
description: that packages a persistent context with its baseline remainder and fixed recognitions.
---
# Save Persistent Context

## Statement

There exists an operator

```text
save_context : PersistentContextCarrier → (PersistentContext, BaselineRemainder, PersistentRecognitionCarrier)
```

that packages a persistent context with its baseline remainder and fixed
recognitions.

## Definition by acts

- Takes a context in `PersistentContextCarrier` and extracts its baseline remainder
  via [`baseline-limit`](./baseline-limit.md).
- Collects fixed recognitions from `PersistentRecognitionCarrier`.
- Emits the triple `(PersistentContext, BaselineRemainder, PersistentRecognitionCarrier)`.

## Uniqueness

Because `PersistentContextCarrier`/`PersistentRecognitionCarrier` and the baseline are
fixed by the earning acts, any operator respecting these yields the same triple
up to nucleus equivalence; thus `save_context` is unique in the earned sense.
