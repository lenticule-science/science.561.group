---
title: Potential Articulation Cell
description: The corner of articulating's codomain where the subject is filled and the object is not. Every articulation produces it first: Obsmetrologia.Articulating.Cell.articulate_corner.
date-created: 2026-06-19
date-modified: 2026-09-27
keywords: ["potential-articulation-cell", "articulation-cell", "articulating", "token", "claim", "slot", "witness", "four-cell-partition", "potential"]
---

## What this node is

The **potential** articulation cell is the corner of the
[articulation-cell](../../articulation-cell.md) partition where the **subject is
filled and the object is not**: the utterance's own
[token](../../../../../contents/token/token.md) stands as subject, and its
[claim](../../../../../contents/claim/claim.md) has nothing yet to relate it to.

## What articulating always produces

To **articulate** an utterance (`Obsmetrologia.Articulating.Cell.articulate`) is
to put the utterance's own token in the subject slot and leave the object slot
empty. That is the only cell a bare articulation ever produces
(`Obsmetrologia.Articulating.Cell.articulate_corner`), at every floor of the
recursion.

With a subject in hand the cell has something to say something *of*: it is the
corner from which [predicating](predicating/predicating.md) proceeds, seeding the
reflexive predication cell ⟨token, claim, token⟩ from the token it carries.

## Position in the progression

**Engaging** a potential cell with a token in the object slot
(`Obsmetrologia.Articulating.Cell.engage`) reaches
[stable](../stable-articulation-cell/stable-articulation-cell.md)
(`Obsmetrologia.Articulating.Cell.engage_articulate_corner`). Potential → stable
is the whole of articulating's own progression; neither
[absurd](../absurd-articulation-cell/absurd-articulation-cell.md) nor
[active](../active-articulation-cell/active-articulation-cell.md) lies on it.

Articulation reads nothing as true, false or both; value enters only at positing, where the four corners are read as values.

## Orientation

Read [stable](../stable-articulation-cell/stable-articulation-cell.md) for where
engaging continues and the [articulation-cell](../../articulation-cell.md) for the
whole partition. The morphism that generates the cell is
[articulating](../../../../articulating.md); the morphism that proceeds from this
corner is [predicating](predicating/predicating.md).
