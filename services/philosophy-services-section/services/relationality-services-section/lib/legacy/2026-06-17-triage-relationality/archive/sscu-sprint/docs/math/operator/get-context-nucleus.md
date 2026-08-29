---
title: Get Context Nucleus
role: operator
derived_from:
- acts/context-nucleus
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



The **Get Context Nucleus** operator maps a
[Context](docs/math/structure/context.md) to its nucleus-equivalence class,
identifying variations that are nucleus-stable.

## Definition
- Input: a context recognition.
- Output: a context recognition representing its nucleus class.
- Behaviour: applies the nucleus induced by
  [`acts/context-nucleus`](docs/math/acts/context-nucleus.md) to identify
  contexts equivalent under nucleus-stable trace shuffles.

## Proof
By construction from [`acts/context-nucleus`](docs/math/acts/context-nucleus.md),
this operator computes the nucleus on contexts. It maps each context to its
nucleus class, eliminating variations that do not change the earned nucleus
invariant while remaining in the context carrier.
