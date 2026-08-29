---
title: "Flow\u2013Nucleus Adjunction"
id: flow-nucleus-adjunction
role: structure
status: plan
derived_from:
- acts/context-flow
- acts/context-nucleus
- acts/context-adjunction-witness
proof_refs: []
---


# Flow–Nucleus Adjunction

Adjunction data between context flow (left adjoint) and context nucleus (right
adjoint) with unit/counit and triangle identities.

## Definition
- Left adjoint: flow functor on [Context](./context.md).
- Right adjoint: nucleus functor on [Context](./context.md).
- Unit/counit: earned by [Context Adjunction Witness](./context-adjunction-witness.md).

## Invariants
- Triangle identities hold (flow followed by nucleus/unit is identity up to
  earned equivalence; likewise for counit).
- Functoriality: flow/nucleus respect composition/identity of contexts.

## Proof
- Derived from: [Context Flow](./context-flow.md),
  [Context Nucleus](./context-nucleus.md), and
  [Context Adjunction Witness](./context-adjunction-witness.md).
- Shows that: flow and nucleus form an adjoint pair with unit/counit satisfying
  triangle laws.
