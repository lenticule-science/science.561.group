---
name: dynamic-sufficiency
type: concept
status: sketch
---

Dynamic sufficiency extends static residuated sufficiency ([Induces](induces.md)) to account for temporal evolution.

Static residuated sufficiency asks whether two structures satisfy the residuation law at a single epoch. Dynamic sufficiency asks whether that satisfaction persists as the structures evolve. If a recognition is propagated forward through [Flow](flow.md), does it remain residuated-sufficient with respect to its counterpart?

## The directed law

$$\text{Includes}(\text{Together}(\text{Flow}(a), b), c) \iff \text{Includes}(b, \text{Induces}(\text{Flow}(a), c))$$

Flow acts as a KZ comonad — propagating recognitions forward across redshift (or whatever the temporal axis is) while preserving the residuation structure. When the directed residuation holds, the inference system is *dynamically sufficient*: its claims remain internally consistent as the field evolves.

## Imbalance tracking

A dynamic imbalance function $g(z, \Delta z)$ tracks whether sufficiency changes smoothly across temporal intervals. Smooth monotonic decline indicates stabilization. Persistent peaks indicate dynamic inconsistency — places where the temporal propagation of inference breaks down.
