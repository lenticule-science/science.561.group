---
title: Potential Articulation Cell
description: The corner of articulating's codomain where the token hand is articulated and the claim hand is not. Every articulation produces it first: Obsmetrologia.Articulating.Cell.articulate_corner.
date-created: 2026-06-19
date-modified: 2026-09-27
keywords: ["potential-articulation-cell", "articulation-cell", "articulating", "token", "claim", "slot", "witness", "four-cell-partition", "potential"]
---

## What this node is

The **potential** articulation cell is the corner of the
[articulation-cell](../../articulation-cell.md) partition where the **token
slot holds a witness and the claim slot does not**: `(token: articulated, claim:
not articulated)`. The [token](../../../../../contents/token/token.md) has been
witnessed; the [claim](../../../../../contents/claim/claim.md) remains free.

## What articulating always produces

To **articulate** an utterance (`Obsmetrologia.Articulating.Cell.articulate`) is
to place the utterance's own token in the token slot and leave the claim slot
empty. That is the only cell a bare articulation ever produces
(`Obsmetrologia.Articulating.Cell.articulate_corner`), at every floor of the
recursion. The token hand goes first because articulating's one operation
witnesses it first.

With a witnessed token in hand the cell has something to say something *of*:
it is the corner from which [predicating](predicating/predicating.md) proceeds,
seeding the predication cell from the token it carries.

## Position in the progression

**Engaging** a potential cell with a witness on the claim hand
(`Obsmetrologia.Articulating.Cell.engage`) reaches
[stable](../stable-articulation-cell/stable-articulation-cell.md)
(`Obsmetrologia.Articulating.Cell.engage_articulate_corner`). Potential → stable
is the whole of articulating's own progression; neither
[absurd](../absurd-articulation-cell/absurd-articulation-cell.md) nor
[active](../active-articulation-cell/active-articulation-cell.md) lies on it.

Articulation reads nothing as true, false or both; polarity and evidence enter only at positing, where the four corners are read as values.

## Orientation

Read [stable](../stable-articulation-cell/stable-articulation-cell.md) for where
engaging continues and the [articulation-cell](../../articulation-cell.md) for the
whole partition. The morphism that generates the cell is
[articulating](../../../../articulating.md); the morphism that proceeds from this
corner is [predicating](predicating/predicating.md).
