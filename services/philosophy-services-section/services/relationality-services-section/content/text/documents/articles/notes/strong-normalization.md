---
title: Strong Normalization
id: strong-normalization
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: acts/normalize-strongly
description: The earned acts normalization, step-trace, and normalize-strongly jointly earn that every well-founded reduction trace collapses to normal form.
---



## Statement

The earned acts [`normalization`](./normalization.md),
[`step-trace`](./step-trace.md), and
[`normalize-strongly`](./normalize-strongly.md) jointly earn that every
well-founded reduction trace collapses to normal form.

## Proof sketch

`Normalization` applied to `StepTrace` collapses any infinite tail; the act
`NormalizeStrongly` records that collapse explicitly, so every admissible
reduction terminates.

## Uniqueness

Because the normalization acts fix the reduction relation and its collapse,
this strong-normalization property is unique in the earned sense.

## Proof
- Derived from: [Normalize Strongly](./normalize-strongly.md).
- Inputs: stabilization of reduction traces via [Trace Renewal](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/trace-renewal.md).
- Shows that: every admissible reduction trace collapses to normal form.
