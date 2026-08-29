---
title: "Dynamic Sufficiency"
date-created: 2026-03-02T00:00:00
type: term
keywords:
  - Relationality
defines:
  - "Dynamic Sufficiency"
---

Dynamic sufficiency extends [residuated sufficiency](../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-03/terms/index.md) to account for temporal evolution.

Static residuated sufficiency asks whether two structures satisfy the residuation law at a single epoch. Dynamic sufficiency asks whether that satisfaction persists as the structures evolve. The question becomes: if I propagate a recognition forward through [Flow](../../slop/relationality/ai-generated-relationality/relationality-slop-2026-03-03/terms/flow.md), does it remain residuated-sufficient with respect to its counterpart?

Formally, the directed sufficiency relation under a temporal operator Flow is:

Includes(Together(Flow(a), b), c) if and only if Includes(b, Induces(Flow(a), c))

Flow here acts as a KZ comonad — it propagates recognitions forward across redshift while preserving the residuation structure. When this directed residuation holds, the inference system is dynamically sufficient: its claims remain internally consistent as the cosmological field evolves.

A dynamic imbalance function g(z, Δz) tracks whether sufficiency changes smoothly across redshift intervals. Smooth monotonic decline indicates stabilization. Persistent peaks indicate dynamic inconsistency — places where the temporal propagation of inference breaks down.

See [Dynamic Sufficiency in Cosmological Inference](../texts/dynamic-sufficiency-in-cosmological-inference.md) and [Reflexive Disequilibrium](./reflexive-disequilibrium.md).
