---
title: Stable Articulation Cell
description: The corner of articulating's codomain where both hands are articulated. What engaging an articulated cell reaches: the terminus of articulating's own progression.
date-created: 2026-06-19
date-modified: 2026-09-27
keywords: ["stable-articulation-cell", "articulation-cell", "articulating", "token", "claim", "slot", "witness", "four-cell-partition", "terminus"]
tags: ["stable"]
---

## What this node is

The **stable** articulation cell is the corner of the
[articulation-cell](../../articulation-cell.md) partition where **both hands'
slots hold a witness**: `(token: articulated, claim: articulated)`. Both the
[token](../../../../../contents/token/token.md) and the
[claim](../../../../../contents/claim/claim.md) have been witnessed.

## Terminus of articulating's own progression

**Engaging** a potential cell with a witness on the claim hand
(`Obsmetrologia.Articulating.Cell.engage`) reaches stable directly
(`Obsmetrologia.Articulating.Cell.engage_articulate_corner`). Articulating's own
progression is exactly
[potential](../potential-articulation-cell/potential-articulation-cell.md) →
stable. Stable is the only corner besides potential that
`Obsmetrologia.Articulating.cell` ever returns (`Obsmetrologia.Articulating.cell_corner`).
With both hands articulated there is no hand left to articulate, and because the
slots only grow, the cell keeps both witnesses
(`Obsmetrologia.Articulating.Cell.mem_claimSlot_engage`).

Articulation reads nothing as true, false or both; polarity and evidence enter only at positing, where the four corners are read as values.

## Orientation

Read [potential](../potential-articulation-cell/potential-articulation-cell.md) for
the step engaging continues from and the
[articulation-cell](../../articulation-cell.md) for the partition entire. The
morphism that generates the cell is [articulating](../../../../articulating.md).
