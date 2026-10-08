---
name: predication-cell
description: A triple (e1, q, e2) with a bilattice value — the elementary unit of predication in the FARS substrate.
title: predication-cell
---

A triple $(e_1, q, e_2) \in E \times \mathrm{Ob}(\mathcal{C}) \times E$ together with a [bilattice-value](../../bilattice/bilattice-value.md) $v \in \mathbf{FOUR}$ drawn from the fiber $\mathcal{E}_q(e_1, e_2)$ of the [predication-fibration](predication-fibration.md).

- $e_1 \in E$: the subject [entity](entity.md).
- $q \in \mathrm{Ob}(\mathcal{C})$: the predicate — a [transformer](transformer.md).
- $e_2 \in E$: the object [entity](entity.md).
- $v \in \mathbf{FOUR}$: the [bilattice-value](../../bilattice/bilattice-value.md) assigned by the fiber.

In the FARS encoding: `q: e₂` in file $e_1$ asserts $(e_1, q, e_2)$ at [true](teaching/explanations/true.md).
Absence leaves the cell at [mystery](../../bilattice/mystery/mystery.md).
[False](teaching/explanations/false.md) and [contradiction](teaching/explanations/contradiction.md) arise from the bilattice algebra, not from direct assertion.

A predication-cell is itself an entity when reified as a file — enabling predications about predications.
