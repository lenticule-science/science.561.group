---
title: Articulation Cell
description: The object of articulating's codomain: an utterance with a witness slot on each of its two hands. A hand is articulated when its slot holds a witness, and the four corners (absurd, potential, active, stable) are the four patterns of which hands are articulated. Articulating itself only reaches potential or stable.
date-created: 2026-06-19
date-modified: 2026-09-27
keywords: ["articulation-cell", "articulating", "utterance", "token", "claim", "slot", "witness", "four-cell-partition", "potential", "active", "absurd", "stable", "codomain"]
tags: ["stable"]
---

## What this node is

An **articulation cell** is the object [articulating](../../articulating.md)
produces: what an [utterance](../../../utterance.md) becomes once articulating
acts on it. Where the utterance is the ordered pair of a
[token](../../../contents/token/token.md) and a
[claim](../../../contents/claim/claim.md), the articulation cell,
`Obsmetrologia.Articulating.Cell`, is that pair together with a **slot** on each
hand: the list of witnesses that hand has been articulated by. A hand is
articulated when its slot holds a witness.

## Slots, not bits

Each hand carries a slot of witnesses (`tokenSlot`, `claimSlot`), not a bare
Boolean. A slot only grows; nothing is ever removed from it, so a cell keeps
every witness it was given, and two tokens on the token hand are not the same as
one even though both read as articulated. The Boolean pair
(`Articulating.Cell.fourCorner`) is read off the slots.

## The four corners

Because the utterance has two hands, a cell has two independent statuses, and
two binary statuses give exactly **four corners**: one hand would give two, three
would give eight.

| Corner | token hand | claim hand | reached |
| --- | --- | --- | --- |
| [absurd](content/absurd-articulation-cell/absurd-articulation-cell.md) | not articulated | not articulated | the un-articulated position; never articulating's output |
| [potential](content/potential-articulation-cell/potential-articulation-cell.md) | articulated | not articulated | what articulating always produces |
| [active](content/active-articulation-cell/active-articulation-cell.md) | not articulated | articulated | never articulating's output |
| [stable](content/stable-articulation-cell/stable-articulation-cell.md) | articulated | articulated | what engaging an articulated cell produces |

**Articulating places the token.** To articulate an utterance is to put its own
token in the token slot and leave the claim slot empty, so the articulated cell
is always **potential**, never absurd. **Engaging** a potential cell with a
witness on the claim hand reaches **stable**. Only these two corners are ever
articulating's output (`Articulating.cell_corner`); **absurd** and **active**
are reached only downstream of articulating
(`Articulating.cell_corner_ne_absurd`, `Articulating.cell_corner_ne_active`).

Articulation reads nothing as true, false or both. Polarity and evidence enter only at [positing](content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/positing.md), where value and its two orders are admitted and the same four points are read as values.

## Orientation

Read the four corners under [`content/`](content), [articulating](../../articulating.md)
for the morphism whose codomain this is, and [utterance](../../../utterance.md) for
the domain it is built from.
