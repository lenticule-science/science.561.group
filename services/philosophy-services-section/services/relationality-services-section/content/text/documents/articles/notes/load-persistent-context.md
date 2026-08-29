---
title: Load Persistent Context
keywords:
  - storage
  - context
layer: internal-theorem
status: plan
depends_on:
  - math/structure/persistent-context-carrier
  - math/structure/persistent-recognition
  - acts/retrace-context
  - acts/renew-context
claims:
  - type: operator
    judgement: load_context : (PersistentContext, BaselineRemainder, PersistentRecognitionCarrier) ⇀ PersistentContextCarrier
---
# Load Persistent Context

## Statement

There exists an operator

```text
load_context : (PersistentContext, BaselineRemainder, PersistentRecognitionCarrier) ⇀ PersistentContextCarrier
```

that replays a stored persistent context (and its fixed recognitions) to yield
an earned persistent context up to nucleus equivalence.

## Definition by acts

- Uses [`retrace-context`](./retrace-context.md) to replay the stored
  context on a trace.
- Uses [`renew-context`](./renew-context.md) to reintroduce the baseline
  remainder.
- Reattaches fixed recognitions from `PersistentRecognitionCarrier`.

## Uniqueness

Because the inputs are earned carriers and the replay/renew acts fix the
behaviour, any operator respecting these produces a nucleus-equivalent
persistent context; thus `load_context` is unique in the earned sense.
