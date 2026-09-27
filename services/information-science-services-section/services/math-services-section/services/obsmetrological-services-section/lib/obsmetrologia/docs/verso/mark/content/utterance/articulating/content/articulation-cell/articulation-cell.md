---
title: Articulation Cell
description: The object of articulating's codomain: an utterance with a slot for each position of the predication it opens, subject and object. A position is filled when its slot holds a token, and the four corners (absurd, potential, active, stable) are the four patterns of which positions are filled. Articulating itself only reaches potential or stable.
date-created: 2026-06-19
date-modified: 2026-09-27
keywords: ["articulation-cell", "articulating", "utterance", "token", "claim", "slot", "witness", "four-cell-partition", "potential", "active", "absurd", "stable", "codomain"]
tags: ["stable"]
---

## What this node is

An **articulation cell** is the object [articulating](../../articulating.md)
produces. Articulating opens the space of possible predications, and a predication
has two positions, a **subject** and an **object**; the
[claim](../../../contents/claim/claim.md) is the relation between them, not a third
position. The articulation cell, `Obsmetrologia.Articulating.Cell`, is an
[utterance](../../../utterance.md) together with a **slot** for each position:
the list of [token](../../../contents/token/token.md) witnesses that fill it. A
position is filled when its slot holds a witness.

## Slots, not bits

Each position carries a slot of witnesses (`subjectSlot`, `objectSlot`), not a bare
Boolean. A slot only grows; nothing is ever removed from it, so a cell keeps every
witness it was given, and two tokens in one slot are not the same as one even
though both read as filled. The Boolean pair (`Articulating.Cell.fourCorner`) is
read off the slots.

## The four corners

Two positions, each filled or empty, give exactly **four corners**: one position
would give two, three would give eight.

| Corner | subject | object | reached |
| --- | --- | --- | --- |
| [absurd](content/absurd-articulation-cell/absurd-articulation-cell.md) | empty | empty | the un-articulated position; never articulating's output |
| [potential](content/potential-articulation-cell/potential-articulation-cell.md) | filled | empty | what articulating always produces |
| [active](content/active-articulation-cell/active-articulation-cell.md) | empty | filled | never articulating's output |
| [stable](content/stable-articulation-cell/stable-articulation-cell.md) | filled | filled | what engaging an articulated cell produces |

**Articulating fills the subject.** To articulate an utterance is to put its own
token in the subject slot and leave the object slot empty, so the articulated cell
is always **potential**, never absurd. **Engaging** puts a token in the object slot
and reaches **stable**; in the articulating recursion, an utterance articulated over
another is engaged with the token of the utterance beneath it, which becomes its
object. Only these two corners are ever articulating's output
(`Articulating.cell_corner`); **absurd** and **active** are reached only downstream
(`Articulating.cell_corner_ne_absurd`, `Articulating.cell_corner_ne_active`).

Articulation reads nothing as true, false or both. Value, and with it evidence for and against, enters only at [positing](content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/positing.md), where the same four points are read as values.

## Orientation

Read the four corners under [`content/`](content), [articulating](../../articulating.md)
for the morphism whose codomain this is, and [utterance](../../../utterance.md) for
the domain it is built from.
