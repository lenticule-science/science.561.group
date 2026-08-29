---
id: relational-operation
description: "A RelationalOperation is an Operation internal to the relational universe R: an endofunction on R's carrier that is itself an entity in R. The three acts (generative, concurrent, sequential) and the two nuclei are the canonical instances."
defines: RelationalOperation
grounding: math/generative-act.md
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  carrier: relational-universe
  endofunction: relational-universe-morphism
output: relational-universe-morphism
ast:
  self-referential-endofunction:
    - carrier
    - endofunction:
        - carrier
        - carrier
---

# Relational Operation

## What this is

A **RelationalOperation** is an [Operation](operation.md) whose carrier is (a part of) the relational universe R = Sh(T, J).
It maps R, or a fiber of R, or a class of objects of R, within itself.

The canonical instances are the three acts and the two nuclei:

| Operation | Carrier | Arity | Source |
|---|---|---|---|
| Nucleus σ_t | Fiber H_t | 1 | [relational-history-saturation-nucleus](../math/relational-history-saturation-nucleus.md) |
| Nucleus Δ_t | Fiber H_t | 1 | [relational-history-transfer-nucleus](../math/relational-history-transfer-nucleus.md) |
| Sequential act G_s | R | 1 | [sequential-act](../math/sequential-act.md) |
| Concurrent act ⊛ | R × R | 2 | [concurrent-act](../math/concurrent-act.md) |
| Generative act U_G | P(Obj(R)) | 1 | [generative-act](../math/generative-act.md) |

Each of these maps a carrier within itself.
None of them are morphisms between different objects — they are all endofunctions on their respective carriers.

## Condition 6

The [RelationsSystem](relations-system.md) closure condition 6 requires that generative operations are named objects in the universe — the system can reason about its own operations.
This means RelationalOperations are themselves entities in R: they have identity, they are referenceable, and they can be composed and inspected.

## Open questions

