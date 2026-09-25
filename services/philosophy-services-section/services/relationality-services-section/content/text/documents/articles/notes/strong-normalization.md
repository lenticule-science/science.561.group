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

## Earlier material

The earned acts [`normalization`](../../../../../../logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/category/topos-theory/library/quasicrystalline-hypertensor-topos/acts/normalization.md),
[`step-trace`](step-trace.md), and
[`normalize-strongly`](normalize-strongly.md) jointly earn that every
well-founded reduction trace collapses to normal form.

## Proof
- Derived from: [Normalize Strongly](normalize-strongly.md).
- Inputs: stabilization of reduction traces via [Trace Renewal](../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/documents/articles/notes/trace-renewal.md).
- Shows that: every admissible reduction trace collapses to normal form.
