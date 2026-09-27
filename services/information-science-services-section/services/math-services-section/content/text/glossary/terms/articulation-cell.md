---
name: Articulation Cell
description: "Articulating's codomain: an utterance together with, on each of its two hands, the witnesses that hand has been articulated by. Which hands are articulated gives exactly four corners: absurd, potential, active, stable."
aliases: [articulation cells, corner, corners, four corners, absurd, potential, active, stable]
---
An **articulation cell** is an [utterance](utterance.md) together with, on each of its two hands, the [witnesses](witness.md) that hand has been articulated by: a token slot and a claim slot ([`Articulation/Articulating/Cell.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Articulation/Articulating/Cell.lean)). A hand is articulated when its slot holds a witness. Slots only grow and nothing is removed, so a cell keeps every witness it was given.

The two statuses give exactly four **corners** (`Articulating.Corner.card_eq_four`, proved, not postulated):

| Corner | token hand | claim hand |
|---|---|---|
| absurd | not articulated | not articulated |
| potential | articulated | not articulated |
| active | not articulated | articulated |
| stable | articulated | articulated |

These are articulation's names for its corners. Articulation reads nothing as true or false. At [positing](positing.md), which introduces value and its two orders, the same four points become values, and there the truth order reads them with Belnap's names ([`Positing/FourCorner.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Positing/FourCorner.lean)).

**How cells move.** Articulating puts the utterance's own token in the token slot, so a freshly articulated cell is potential. Engaging adds a witness to the claim slot, reaching stable. Merging two cells joins their slots. *Absurd* and *active* are never articulating's output: absurd is the position a cell would hold before any articulation reaches it, and active, the claim hand articulated without the token hand, is reached only downstream.

## Related

- [Articulating](articulating.md)
- [Witness](witness.md)
- [Positing](positing.md)
- [Predication cell](predication-cell.md)
