---
title: Get Context Nucleus
id: get-context-nucleus
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from:
  - acts/context-nucleus
description: The Get Context Nucleus operator maps a Context to its nucleus-equivalence class, identifying variations that are nucleus-stable.
---



The **Get Context Nucleus** operator maps a
[Context](./context.md) to its nucleus-equivalence class,
identifying variations that are nucleus-stable.

## Definition
- Input: a context recognition.
- Output: a context recognition representing its nucleus class.
- Behaviour: applies the nucleus induced by
  [`acts/context-nucleus`](./context-nucleus.md) to identify
  contexts equivalent under nucleus-stable trace shuffles.

## Proof
By construction from [`acts/context-nucleus`](./context-nucleus.md),
this operator computes the nucleus on contexts. It maps each context to its
nucleus class, eliminating variations that do not change the earned nucleus
invariant while remaining in the context carrier.

## Earlier material

The **Get Context Nucleus** operator maps a
[Context](../../../triage/docs/math/structure/context.md) to its nucleus-equivalence class,
identifying variations that are nucleus-stable.

## Definition
- Input: a context recognition.
- Output: a context recognition representing its nucleus class.
- Behaviour: applies the nucleus induced by
  [`acts/context-nucleus`](context-nucleus.md) to identify
  contexts equivalent under nucleus-stable trace shuffles.
