---
title: Flow Context
id: flow-context
role: operator
status: plan
derived_from:
- acts/context-flow
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



The **Flow Context** operator evolves a [Context](docs/math/structure/context.md)
along the earned profile flow.

## Definition
- Input: a context recognition.
- Output: a context recognition advanced along the profile flow.
- Behaviour: applies the flow profile induced by
  [`acts/context-flow`](docs/math/acts/context-flow.md) to carry contexts
  forward without leaving the earned context carrier.

## Proof
By construction from [`acts/context-flow`](docs/math/acts/context-flow.md), this
operator is the earned flow on contexts. It preserves the admissible structure
of contexts while advancing them along the induced profile flow.
