---
name: Articulation Cell
description: "Articulating's codomain: an utterance together with, on each side, the witnesses that side has been articulated by. Whether each slot is empty gives exactly four corners — absurd, potential, active, stable — and a cell's corner is its four-valued reading."
aliases: [articulation cells, corner, corners, four corners, absurd, potential, active, stable]
---
An **articulation cell** is an [utterance](utterance.md) together with, on each side, the [witnesses](witness.md) that side has been articulated by: a token slot and a claim slot ([`Articulation/Articulating/Cell.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Articulation/Articulating/Cell.lean)). A side's status is whether its slot is empty. Slots only grow and nothing is removed, so a cell's evidence is lossless.

The two statuses give exactly four **corners** (`Articulating.Corner.card_eq_four`, proved, not postulated):

| Corner | token | claim | reading |
|---|---|---|---|
| absurd | no | no | neither side told: the un-articulated position |
| potential | yes | no | told true: token articulated, claim not |
| active | no | yes | told false: claim articulated, token not |
| stable | yes | yes | told both: both sides articulated |

A cell's corner is its four-valued reading: the articulation phase of a cell, read as a four-corner, is its bilattice reading ([`FourCorner.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Articulation/Articulating/FourCorner.lean)). The corner names are house names for the knowledge order; they are not the truth order's true and false.

**How cells move.** Articulating puts the utterance's own token in the token slot, so a freshly articulated cell is potential. Engaging adds a witness to the claim slot, reaching stable. Merging two cells joins their slots. *Absurd* and *active* are never articulating's output: absurd is the position a cell would hold before any articulation reaches it, and active is reached only downstream, by the value algebra (negation, converse).

In the relationality derivation the corners are met in order. Relating tells one side, not-relating the other, and the witness testifies to both at once, which is the stable corner. The void, two copies of nothing folded together, is the absurd corner: no evidence either way.

## Related

- [Articulating](articulating.md)
- [Witness](witness.md)
- [Bilattice](bilattice.md)
- [Predication cell](predication-cell.md)
