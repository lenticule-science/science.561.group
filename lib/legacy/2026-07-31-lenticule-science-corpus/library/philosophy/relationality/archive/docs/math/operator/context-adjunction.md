---
title: Context Adjunction
id: context-adjunction
role: operator
status: plan
derived_from:
- acts/context-adjunction-witness
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Context Adjunction

Adjunction between context flow and context nucleus, earned by
`ContextAdjunctionWitness` and `DynamicResiduation`.

## Statement

Natural bijection for contexts `C, D`:

```
Hom(flow(C), D) ≅ Hom(C, nucleus(D))
```

## Proof

Sketch: `DynamicResiduation` provides the hom-redistribution; `ContextFlow` and
`ContextNucleus` are the endofunctors. The bijection yields the adjunction,
with unit/counit witnessing the monad/comonad induced by the adjunction.
