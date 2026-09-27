---
title: Stable Articulation Cell
description: The corner of articulating's codomain where the subject and the object are both filled: a complete predication. What engaging an articulated cell reaches, the terminus of articulating's own progression.
date-created: 2026-06-19
date-modified: 2026-09-27
keywords: ["stable-articulation-cell", "articulation-cell", "articulating", "token", "claim", "slot", "witness", "four-cell-partition", "terminus"]
tags: ["stable"]
---

## What this node is

The **stable** articulation cell is the corner of the
[articulation-cell](../../articulation-cell.md) partition where **the subject and
the object are both filled**: a complete predication, a
[claim](../../../../../contents/claim/claim.md) relating one
[token](../../../../../contents/token/token.md) to another.

## Terminus of articulating's own progression

**Engaging** a potential cell with a token in the object slot
(`Obsmetrologia.Articulating.Cell.engage`) reaches stable directly
(`Obsmetrologia.Articulating.Cell.engage_articulate_corner`). In the articulating
recursion this is what articulating an utterance over another does: the token of
the utterance beneath becomes the object. Articulating's own progression is exactly
[potential](../potential-articulation-cell/potential-articulation-cell.md) →
stable, and stable is the only corner besides potential that
`Obsmetrologia.Articulating.cell` ever returns (`Obsmetrologia.Articulating.cell_corner`).
With both positions filled there is no position left to fill, and because slots only
grow, the cell keeps its witnesses (`Obsmetrologia.Articulating.Cell.mem_objectSlot_engage`).
A relation between two different tokens is at this corner by construction; that is
completeness of the predication, not told-both.

Articulation reads nothing as true, false or both; value enters only at positing, where the four corners are read as values.

## Orientation

Read [potential](../potential-articulation-cell/potential-articulation-cell.md) for
the step engaging continues from and the
[articulation-cell](../../articulation-cell.md) for the partition entire. The
morphism that generates the cell is [articulating](../../../../articulating.md).
